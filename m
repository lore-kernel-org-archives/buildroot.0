From: Matthew Weber <matt@thewebers.ws>
Date: Tue, 2 Jan 2018 14:04:49 -0600
Subject: [Buildroot] [PATCH] autobuilder: hung package monitor
In-Reply-To: <20171227231341.04c4b416@windsurf.home>
References: <1514223703-5356-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20171227231341.04c4b416@windsurf.home>
Message-ID: <CAFt09wM81XEqMN9GfL6fWGD+2UDfcFyDdMh2hPxU8tKYh-pOzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain,

On Wed, Dec 27, 2017 at 4:13 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Mon, 25 Dec 2017 11:41:43 -0600, Matt Weber wrote:
> > @@ -143,6 +143,8 @@ import sys
> >  from time import localtime, strftime
> >  from distutils.version import StrictVersion
> >  import platform
> > +from threading import Thread, Event
> > +import time
>
> Where is time being used? We are already some functions from the "time"
> package above.

Removed, I used it early on but it's no longer required in v2.

>
> > +def stop_on_build_hang(build_done_flag, sub_proc, outputdir, log):
> > +    secBetweenCheck = 30
>
> Please don't use camel case names for variables, since we don't use
> such a convention in this script. Even your function is mixing camel
> case naming with lower case + underscore naming.

Bad habit, fixed in v2

>
> > +    maxNumOfChecks = (HUNG_BUILD_TIMEOUT * 60) / secBetweenCheck
> > +    hungTimeout = maxNumOfChecks
>
> This doesn't look very Pythonic to me. What about having a start time
> taken before the loop, calculate the maximum end time, and then do a
> simple comparison ?

Completely reworked in v2.  Thanks for the idea about using mtime, it
was a much cleaner approach

> > +    # Setup hung build monitoring thread
> > +    build_done_flag = Event()
> > +    build_monitor = Thread(target=stop_on_build_hang,
> > +                           args=(build_done_flag, sub, outputdir, log))
> > +    build_monitor.daemon = True
>
> I am not 100% sure of the consequences of this. Are you doing this so
> that the monitor threads are automatically killed when the main thread
> of the autobuild-run program terminates ?

Correct, the main thread owns the lifecycle of the monitor thread when
set as daemon.

>
> Did you test that sending a SIGTERM/SIGINT to autobuild-run continues
> to work properly ?

Yep, verified these work correctly

>
> > +    build_monitor.start()
> > +
> >      kwargs['buildpid'][kwargs['instance']] = sub.pid
> >      ret = sub.wait()
> >      kwargs['buildpid'][kwargs['instance']] = 0
> >
> > -    # 124 is a special error code that indicates we have reached the
> > -    # timeout
> > -    if ret == 124:
> > -        log_write(log, "INFO: build timed out")
> > +    # If build failed, monitor thread would have exited at this point
> > +    if not build_monitor.isAlive():
>
> I'm not sure about the synchronization here. The monitor thread kills
> the sub-process doing the build, and then terminates. So it could very
> well that you reach this .isAlive() test at a moment where the
> sub-process doing the build has been killed by the monitor thread, but
> the monitor thread itself hasn't terminated. So we probably need a
> better synchronization mechanism here, such as a status written by the
> monitor thread before it kills the sub-process.

I've added a second Event value to pass back the status of the thread
killing the hung process.   Now it isn't dependent on the thread
finishing at a specific point and instead uses a value which is set
before the process.wait() in the main thread releases.

Thanks for the review!
Matt
