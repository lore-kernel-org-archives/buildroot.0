From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Nov 2016 11:02:18 +0100
Subject: [Buildroot] [PATCH] pseudo-wrapper: fix console issue
In-Reply-To: <20161123053220.1845-1-gael.portay@savoirfairelinux.com>
References: <20161123053220.1845-1-gael.portay@savoirfairelinux.com>
Message-ID: <8f7c859a-7d90-574f-191b-3ffb595b053d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ga?l,

 I hope you don't mind my nitpicking on English :-)

 But I also have three more fundamental gripes, see near the end.

On 23-11-16 06:32, Ga?l PORTAY wrote:
> Pseudo consists in:
                  of

> * a client (cli),
> * a server (daemon) and
> * a database managed by this daemon
>   which make a relation between inode, filename, type/mode...
          makes

> 
> Without -f/-d argument, the client forks a process to execv the script
> or command given into parameter and waits for its completion. Then
                   as arguments
> execv spawns the daemon part, but never waits for its termination.

 This explanation isn't entirely complete, I think. How about:

Without -f/-d argument, the client forks a process, sets LD_PRELOAD, execve's
the command given as argument and waits for its completion. The LD_PRELOAD'ed
library tries to connect to the daemon and spawns it if it isn't running.

Neither the client itself nor the LD_PRELOAD'ed library waits for the daemon to
terminate. As a concequence, the daemon may still be alive after the completion
of the command executed through the client.

> 
> As a consequence, the daemon may still be alive after the completion of
> the script (executed by execv).
> 
> Under some circumstances (running build in a docker), the daemon (which
> may be still alive after the build) is certainly terminated hardly by
                                      is killed with SIGNKILL

 ("terminated hardly" sounds like "hardly terminated" which means it's almost
NOT terminated)

> init and does not let it the time to properly sync its database.
> 
> The database is rendered inconsistant for the next build. In this case,
                                    e
> makedev will complains about the file type/mode, see error below.
  makedevs

> 
> makedevs: line xx: node (...)/output/target/dev/console exists but is of wrong type

 Note that this error was introduced by c85cd189.

> 
> Because the database did not have the time to sync (ie. /dev/console
> record is missing), makedevs tests the existing and real /dev/console
> file mode (created by the previous build) which is a regular file to
> what should have been reported by pseudo, ie. a character device.
> Those two modes are differents and makedevs exits with error.
                      different

> 
> To solve this issue, this patch make the wrapper controls the life of
                                                   control

> the daemon. It spawns the server before running the script inside the
> pseudo context ; and kills it after the script has ended to make sure
                , kills it with SIGTERM after the script has ended, and waits
for the server to exit before the wrapper exits.

> the server is terminated before the wrapper exits.
> 
> CC: Arnout Vandecappelle <arnout@mind.be>
> CC: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
> CC: J?r?me Pouiller <jezz@sysmic.org>
> CC: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/pseudo/pseudo-wrapper | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
> index 558f3ea..c6d0d10 100644
> --- a/package/pseudo/pseudo-wrapper
> +++ b/package/pseudo/pseudo-wrapper

 A few lines up, we set PSEUDO_OPTS="-t0". That is no longer needed now.

> @@ -18,4 +18,16 @@ if [ -n "${BASE_DIR}" ]; then
>      export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
>  fi
>  
> -exec "${0%/*}/pseudo" "${@}"
> +# spawns server manually...
     spawn
> +"${0%/*}/pseudo" -f &
> +pid="$!"

 We should take into account the possibility that spawning the server fails,
otherwise the client will just start a server again. Therefore I think it's
better to start the server with -d and watch the pid from the pid file instead.
Unfortunately, that means we can't use wait()... So for the time being I guess
this is the best thing we can do. Long-term, however, I think we should patch
pseudo to add an option that makes "pseudo -S" to wait until the server is
terminated. That can be done relatively easily by reading from the pseudo.socket
and waiting for SIGPIPE (which it already does, BTW; currently it just stops
reading after the server has sent its confirmation message).

> +
> +# ... run script/command...
> +"${0%/*}/pseudo" "${@}"
> +
> +# ... terminates server...
         terminate

> +kill -s TERM "$pid"

 Instead of killing, use "pseudo -S". It does essentially the same thing but
it's cleaner IMHO.

> +# ... and waits for its completion to make sure database is synced before
             wait
> +# returning.
> +wait "$pid"
> +exit 0
>

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
