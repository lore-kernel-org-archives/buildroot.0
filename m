From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 25 May 2015 19:20:26 +0200
Subject: [Buildroot] [PATCH] postgresql: init script: wait till server has
	started
In-Reply-To: <1432574426-17098-1-git-send-email-bos@je-eigen-domein.nl>
References: <1432574426-17098-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1432574426-17098-2-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds "-w" option to init script to wait till the database server
has fully started and accepts connections before continuing.

Prevents other applications that depend on PostgreSQL from
failing to start, if the database server is not ready yet.
Times out after 60 seconds by default.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/postgresql/S50postgresql | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.1.4
