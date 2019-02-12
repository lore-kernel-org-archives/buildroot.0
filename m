From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 12 Feb 2019 08:36:30 -0600
Subject: [Buildroot] [PATCH] package/sqlcipher: force libopenssl
Message-ID: <1549982190-34082-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v3.2.0 has a bug in the configure step which causes it to fail when being
built against libressl. As libopenssl is selected as the default, the
autobuilders have not uncovered this failure. The issue has been confirmed
in LTS 2018.02.10 (probably broken prior to that as well) and is not
related to the Openssl bump to 1.1.x.

Thread with more details
http://lists.busybox.net/pipermail/buildroot/2019-February/243133.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Ideally a package bump should occur prior to fixing this compatibility
issue.

Please challenge my assumption about the autobuilder, I believe it is
correct based on my understanding and looking at genrandconfig.
---
 package/sqlcipher/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index 332754b..b26bc77 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SQLCIPHER
 	depends on !BR2_PACKAGE_SQLITE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  SQLCipher is an SQLite extension that provides 256 bits AES
 	  encryption of database files. Note that it is a fork of
-- 
1.9.1
