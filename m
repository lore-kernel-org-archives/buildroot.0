From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:02:28 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/irqbalance: fix
 sysv startup script (add mkdir /run/irqbalance)
Message-ID: <20210227182007.73746814CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be40ea61cf2da9c20b5813b23c955cebb5f341c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

- add mkdir -p /run/irqbalance to sysv startup script needed to
  create socket /run/irqbalance/irqbalance<pid>.sock

Fixes:

  - Bug 13541 [1]

  daemon.warn /usr/sbin/irqbalance: Daemon couldn't be bound to the file-based socket.

[1] https://bugs.busybox.net/show_bug.cgi?id=13541

Reported-by: Alfredo Pons Menargues <alfredo.pons@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr: only create in start case]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4a95f38f306411ca750a676b81326dc7ec67bcaa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irqbalance/S13irqbalance | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/irqbalance/S13irqbalance b/package/irqbalance/S13irqbalance
index b06a3372e9..f6ed9291be 100644
--- a/package/irqbalance/S13irqbalance
+++ b/package/irqbalance/S13irqbalance
@@ -10,6 +10,8 @@ PID="/var/run/irqbalance.pid"
 case "$1" in
     start)
 	printf "Starting irqbalance: "
+	# for irqbalance socket /run/irqbalance/irqbalance<pid>.sock
+	mkdir -p /run/irqbalance
 	start-stop-daemon -S -q -x $EXEC -- $ARGS
 	if [ $? != 0 ]; then
 	    echo "FAILED"
