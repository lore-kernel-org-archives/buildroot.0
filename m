From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Nov 2016 19:28:43 +0100
Subject: [Buildroot] [PATCH v3] pseudo-wrapper: fix console issue
In-Reply-To: <20161123173650.1740-1-gael.portay@savoirfairelinux.com>
References: <20161123173650.1740-1-gael.portay@savoirfairelinux.com>
Message-ID: <20161123182843.GA3609@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

On 2016-11-23 12:36 -0500, Ga?l PORTAY spake thusly:
> Pseudo consists of:
> * a client (cli),
> * a server (daemon) and
> * a database managed by this daemon
>   which makes a relation between inode, filename, type/mode...
> 
> Without -f/-d argument, the client forks a process, sets LD_PRELOAD,
> execve's the command given as argument and waits for its completion.
> The LD_PRELOAD'ed library tries to connect to the daemon and spawns it
> if it isn't running.
> 
> Neither the client itself nor the LD_PRELOAD'ed library waits for the
> daemon to terminate. As a consequence, the daemon may still be alive
> after the completion of the command executed through the client.
> 
> Under some circumstances (running build in a docker), the daemon (which
> may be still alive after the build) is killed with SIGKILL, thus it
> does not let it the time to properly sync its database.
> 
> The database is rendered inconsistent for the next build. In this case,
> makedevs will complain about the file type/mode, see error below.
> 
> makedevs: line xx: node (...)/output/target/dev/console exists but is of wrong type
> 
> Note that this error was introduced by c85cd189.
> 
> Because the database did not have the time to sync (ie. /dev/console
> record is missing), makedevs tests the existing and real /dev/console
> file mode (created by the previous build) which is a regular file to
> what should have been reported by pseudo, i.e. a character device.
> Those two modes are different and makedevs exits with error.
> 
> To solve this issue, this patch make the wrapper control the life of
> the daemon. It spawns the server before running the script inside the
> pseudo context, tells it to stop with "pseudo -S", and waits for the
> server to exit before the wrapper exits.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/pseudo/pseudo-wrapper | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
> index 9c8dbdb..194c88f 100644
> --- a/package/pseudo/pseudo-wrapper
> +++ b/package/pseudo/pseudo-wrapper
> @@ -8,7 +8,6 @@ if [ "${0##*/}" = "fakeroot" ]; then
>  fi
>  
>  export PSEUDO_PREFIX="$(dirname "${0%/*}")"
> -export PSEUDO_OPTS="-t0"
>  if [ -n "${TARGET_DIR}" ]; then
>      export PSEUDO_PASSWD="${TARGET_DIR}"
>  fi
> @@ -16,4 +15,18 @@ if [ -n "${BASE_DIR}" ]; then
>      export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
>  fi
>  
> -exec "${0%/*}/pseudo" "${@}"
> +# spawn server manually...
> +"${0%/*}/pseudo" -f &
> +pid="${!}"

There still is a little corner case I'm not too happy about... The above
returns immediately, but we don;t know if the daemon is ready. It may
take a bit of time for it to start compeltely (i.e. reload the DB and
repair its now-internal state)...

> +# ... run script/command...
> +"${0%/*}/pseudo" "${@}"

But then we (almost) immediately start a client, which may try to
connect to the daemon while it is not yet ready, and thus the client may
not detect it yet, and thus wmay spawn his own daemon.

And we'd be back to square one...

Of course, we could run:

    pseudo -d

which is guaranteed to return after the daemon is ready...

> +rc="${?}"
> +
> +# ... terminate server...
> +"${0%/*}/pseudo" -S
> +
> +# ... and wait for its completion to make sure database is synced before
> +# returning.
> +wait "${pid}"

But then we would not have a PID to wait on... :-/

So, the question is: are we sure the client will talk to the daemon that
we spawn?
If the answer is "yes, we're sure", then all is good; id the answer is
"no, we're not sure", then it's a problem...

Thoughts?

Now, my position on all this mess is :

  - we revert back to using fakeroot for 2016.11;

  - long term, we want to definitely switch to using pseudo:
    - it is actively maintained,,
    - it has more features than fakeroot,
    - some of those features are very interesting for us.

Regards,
Yann E. MORIN.

> +exit "${rc}"
> -- 
> 2.10.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
