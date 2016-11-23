From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 23 Nov 2016 11:13:05 -0500
Subject: [Buildroot] [PATCH v2] pseudo-wrapper: fix console issue
Message-ID: <20161123161305.6465-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pseudo consists of:
* a client (cli),
* a server (daemon) and
* a database managed by this daemon
  which makes a relation between inode, filename, type/mode...

Without -f/-d argument, the client forks a process, sets LD_PRELOAD,
execve's the command given as argument and waits for its completion.
The LD_PRELOAD'ed library tries to connect to the daemon and spawns it
if it isn't running.

Neither the client itself nor the LD_PRELOAD'ed library waits for the
daemon to terminate. As a concequence, the daemon may still be alive
after the completion of the command executed through the client.

Under some circumstances (running build in a docker), the daemon (which
may be still alive after the build) is killed with SIGNKILL, thus it
does not let it the time to properly sync its database.

The database is rendered inconsistent for the next build. In this case,
makedevs will complain about the file type/mode, see error below.

makedevs: line xx: node (...)/output/target/dev/console exists but is of wrong type

Note that this error was introduced by c85cd189.

Because the database did not have the time to sync (ie. /dev/console
record is missing), makedevs tests the existing and real /dev/console
file mode (created by the previous build) which is a regular file to
what should have been reported by pseudo, ie. a character device.
Those two modes are different and makedevs exits with error.

To solve this issue, this patch make the wrapper control the life of
the daemon. It spawns the server before running the script inside the
pseudo context, kills it with SIGTERM after the script has ended, and
waits for the server to exit before the wrapper exits.

CC: Arnout Vandecappelle <arnout@mind.be>
CC: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
CC: J?r?me Pouiller <jezz@sysmic.org>
CC: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/pseudo/pseudo-wrapper | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
index 9c8dbdb..194c88f 100644
--- a/package/pseudo/pseudo-wrapper
+++ b/package/pseudo/pseudo-wrapper
@@ -8,7 +8,6 @@ if [ "${0##*/}" = "fakeroot" ]; then
 fi
 
 export PSEUDO_PREFIX="$(dirname "${0%/*}")"
-export PSEUDO_OPTS="-t0"
 if [ -n "${TARGET_DIR}" ]; then
     export PSEUDO_PASSWD="${TARGET_DIR}"
 fi
@@ -16,4 +15,18 @@ if [ -n "${BASE_DIR}" ]; then
     export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
 fi
 
-exec "${0%/*}/pseudo" "${@}"
+# spawn server manually...
+"${0%/*}/pseudo" -f &
+pid="${!}"
+
+# ... run script/command...
+"${0%/*}/pseudo" "${@}"
+rc="${?}"
+
+# ... terminate server...
+"${0%/*}/pseudo" -S
+
+# ... and wait for its completion to make sure database is synced before
+# returning.
+wait "${pid}"
+exit "${rc}"
-- 
2.10.2
