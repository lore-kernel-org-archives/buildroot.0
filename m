From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 23 Nov 2016 00:32:20 -0500
Subject: [Buildroot] [PATCH] pseudo-wrapper: fix console issue
Message-ID: <20161123053220.1845-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pseudo consists in:
* a client (cli),
* a server (daemon) and
* a database managed by this daemon
  which make a relation between inode, filename, type/mode...

Without -f/-d argument, the client forks a process to execv the script
or command given into parameter and waits for its completion. Then
execv spawns the daemon part, but never waits for its termination.

As a consequence, the daemon may still be alive after the completion of
the script (executed by execv).

Under some circumstances (running build in a docker), the daemon (which
may be still alive after the build) is certainly terminated hardly by
init and does not let it the time to properly sync its database.

The database is rendered inconsistant for the next build. In this case,
makedev will complains about the file type/mode, see error below.

makedevs: line xx: node (...)/output/target/dev/console exists but is of wrong type

Because the database did not have the time to sync (ie. /dev/console
record is missing), makedevs tests the existing and real /dev/console
file mode (created by the previous build) which is a regular file to
what should have been reported by pseudo, ie. a character device.
Those two modes are differents and makedevs exits with error.

To solve this issue, this patch make the wrapper controls the life of
the daemon. It spawns the server before running the script inside the
pseudo context ; and kills it after the script has ended to make sure
the server is terminated before the wrapper exits.

CC: Arnout Vandecappelle <arnout@mind.be>
CC: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
CC: J?r?me Pouiller <jezz@sysmic.org>
CC: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/pseudo/pseudo-wrapper | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
index 558f3ea..c6d0d10 100644
--- a/package/pseudo/pseudo-wrapper
+++ b/package/pseudo/pseudo-wrapper
@@ -18,4 +18,16 @@ if [ -n "${BASE_DIR}" ]; then
     export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
 fi
 
-exec "${0%/*}/pseudo" "${@}"
+# spawns server manually...
+"${0%/*}/pseudo" -f &
+pid="$!"
+
+# ... run script/command...
+"${0%/*}/pseudo" "${@}"
+
+# ... terminates server...
+kill -s TERM "$pid"
+# ... and waits for its completion to make sure database is synced before
+# returning.
+wait "$pid"
+exit 0
-- 
2.10.2
