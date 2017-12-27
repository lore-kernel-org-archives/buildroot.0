From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 23:13:41 +0100
Subject: [Buildroot] [PATCH] autobuilder: hung package monitor
In-Reply-To: <1514223703-5356-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1514223703-5356-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20171227231341.04c4b416@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Dec 2017 11:41:43 -0600, Matt Weber wrote:
> The current autobuild script uses the timeout
> application to manage a total duration of the
> build.
> 
> This patchset updates the total duration to instead
> follow the build-time.log and monitor for updates to
> determine if a package has hung for at most #mins
> before killing the build and reporting a timeout.
> 
> The new hung timeout is currently set to 60mins.
> 
> This allows infinite sized defconfigs as we get to a lower
> number of autobr failures. With less failures, we start
> to see false timeouts when we hit the MAX_DURATION(8hrs).
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Thanks for working on this! A few comments below.

> ---
>  scripts/autobuild-run | 61 +++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 52 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 2949417..2085da0 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -143,6 +143,8 @@ import sys
>  from time import localtime, strftime
>  from distutils.version import StrictVersion
>  import platform
> +from threading import Thread, Event
> +import time

Where is time being used? We are already some functions from the "time"
package above.

> +def stop_on_build_hang(build_done_flag, sub_proc, outputdir, log):
> +    secBetweenCheck = 30

Please don't use camel case names for variables, since we don't use
such a convention in this script. Even your function is mixing camel
case naming with lower case + underscore naming.

> +    maxNumOfChecks = (HUNG_BUILD_TIMEOUT * 60) / secBetweenCheck
> +    hungTimeout = maxNumOfChecks

This doesn't look very Pythonic to me. What about having a start time
taken before the loop, calculate the maximum end time, and then do a
simple comparison ?

> +    build_time_logfile = os.path.join(outputdir, "build/build-time.log")
> +    while True:
> +        if build_done_flag.is_set():
> +            log_write(log, "DEBUG: monitor thread stopped early")
> +            return
> +        if os.path.exists(build_time_logfile):
> +            time_logfile_h = open(build_time_logfile, "r")
> +            break
> +        build_done_flag.wait(10)
> +
> +    while not build_done_flag.is_set():
> +        line = time_logfile_h.readlines()
> +        if not line:
> +            hungTimeout -= 1
> +        else:
> +            hungTimeout = maxNumOfChecks
> +        if hungTimeout < 0:
> +            if sub_proc.poll() is None:
> +                log_write(log, "DEBUG: killing process hung for %dmin" % HUNG_BUILD_TIMEOUT)
> +                sub_proc.kill()
> +            break
> +        build_done_flag.wait(secBetweenCheck)

This looks a bit complicated. What about monitoring the size of the
build-time.log file instead? While the file doesn't exist, you ignore
and keep trying. You note when the size of the file last changed, and
use that. Or you could even use the mtime of the file perhaps ?

Those solutions avoid the need to open the file and read it.

Something like (totally untested)

	build_time_logfile = os.path.join(outputdir, "build/build-time.log")

	while True:
		if flag.is_set():
			break
		if not os.path.exists(build_time_logfile):
			sleep(30)
			continue
		mtime = datetime.datetime.fromtimestamp(os.stat(build_time_logfile).st_mtime)
		if mtime < datetime.now() - timedelta(minutes=HUNG_BUILD_TIMEOUT):
			# we have reached the timeout !!
			break
		sleep(30)

> +    # Setup hung build monitoring thread
> +    build_done_flag = Event()
> +    build_monitor = Thread(target=stop_on_build_hang,
> +                           args=(build_done_flag, sub, outputdir, log))
> +    build_monitor.daemon = True

I am not 100% sure of the consequences of this. Are you doing this so
that the monitor threads are automatically killed when the main thread
of the autobuild-run program terminates ?

Did you test that sending a SIGTERM/SIGINT to autobuild-run continues
to work properly ?

> +    build_monitor.start()
> +
>      kwargs['buildpid'][kwargs['instance']] = sub.pid
>      ret = sub.wait()
>      kwargs['buildpid'][kwargs['instance']] = 0
>  
> -    # 124 is a special error code that indicates we have reached the
> -    # timeout
> -    if ret == 124:
> -        log_write(log, "INFO: build timed out")
> +    # If build failed, monitor thread would have exited at this point
> +    if not build_monitor.isAlive():

I'm not sure about the synchronization here. The monitor thread kills
the sub-process doing the build, and then terminates. So it could very
well that you reach this .isAlive() test at a moment where the
sub-process doing the build has been killed by the monitor thread, but
the monitor thread itself hasn't terminated. So we probably need a
better synchronization mechanism here, such as a status written by the
monitor thread before it kills the sub-process.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
