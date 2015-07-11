From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 09:27:38 +0200
Subject: [Buildroot] [git commit] postgresql: init script: wait till server
	has started
Message-ID: <20150711072829.C2743805F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7d515d00e5d36e1260da3768178d2364db1ef90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds "-w" option to init script to wait till the database server
has fully started and accepts connections before continuing.

Prevents other applications that depend on PostgreSQL from
failing to start, if the database server is not ready yet.
Times out after 60 seconds by default.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/S50postgresql |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
index 86a8d83..a895bcf 100644
--- a/package/postgresql/S50postgresql
+++ b/package/postgresql/S50postgresql
@@ -13,7 +13,7 @@ fi
 
 start() {
 	echo -n "Starting postgresql: "
-	su - postgres -c '/usr/bin/pg_ctl start -D /var/lib/pgsql -l logfile'
+	su - postgres -c '/usr/bin/pg_ctl start -w -D /var/lib/pgsql -l logfile'
 	echo "OK"
 }
 stop() {
