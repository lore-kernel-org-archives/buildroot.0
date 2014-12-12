From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Date: Fri, 12 Dec 2014 21:16:00 +0100
Subject: [Buildroot] [PATCH v5 10/11] autobuild-run: kill all children
	on SIGTERM
In-Reply-To: <1418414696-32584-11-git-send-email-patrickdepinguin@gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
 <1418414696-32584-11-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LV3+LqRZCH143cVED3xxUFvPZqn5g69UVOeOcxSRZ=gAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 12, 2014 at 9:04 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> The autobuild-run spawns the main build process through the timeout
> command. To handle its job correctly, this command creates all children
> in its own process group, different from the process group of
> autobuild-run itself.
> Thus, when autobuild-run is killed and the signal handler kills the
> entire process group, the build processes run through timeout remain
> alive.
>
> To handle this, record the PIDs of the timeout processes in an array
> shared between the main autobuild-run process and its instances. The
> signal handler will iterate over all active processes in this array, and
> kill them explicitly.
>
> If a new timeout process would be started after the signal handler was
> invoked but before the entire process tree is killed, this process could
> remain alive too. To prevent this from occurring, the signal handler now
> starts with terminating all instances.
>
> Lastly, the signal handler would be called for all instances, which is
> not intended, so prevent that by uninstalling the signal handler as a
> first step of the handler itself.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  scripts/autobuild-run | 39 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 3 deletions(-)

Some notes here:

- I forgot to remove the TODO entry in this patch. This could be done
when patches are merged or in a next iteration.

- Thomas Petazzoni previously proposed to get rid of 'timeout' and
handle the timeout in Python logic. I did investigate this path but
the end result is more complex. The solution would look like this:

    1. instead of calling subprocess.call('timeout make ...') from the
instance directly, one would spawn yet another process just for the
subprocess call. Inside this process, one would do
subprocess.call('make').

    2. the new Process would be joined with a timeout (join(timeout))

    3. however, while this join will return when the timeout expires,
the process itself will continue to live.  This is not what we want.
To solve that problem, we have to save the pid of the subprocess call,
share it with the instance that spawned the process using
multiprocessing.Value, and upon timeout, let the instance kill the
spawned subprocess and all its children. Killing the subprocess is not
that hard, but I think one would need to do special things to ensure
all the children are killed too. In fact, the timeout command already
handles all this: it creates a separate process group so that it can
kill the entire process group.

  Looking at these steps, step 4 is more or less what is done in the
current patch that still uses the 'timeout' command, while steps 1 and
2 are new and make the solution unnecessarily complex. Hence I opted
to keep 'timeout'.

Best regards,
Thomas
