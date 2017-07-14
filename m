From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2017 14:15:29 -0400
Subject: [Buildroot] [PATCH 07/15] openssh: support libressl.
In-Reply-To: <20170714181537.17479-1-aduskett@gmail.com>
References: <20170714181537.17479-1-aduskett@gmail.com>
Message-ID: <20170714181537.17479-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While at it, fix formatting issues in Config.in

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/openssh/Config.in  | 7 ++++---
 package/openssh/openssh.mk | 9 ++++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 75911402a..28f30cc12 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
 	select BR2_PACKAGE_ZLIB
 	help
-	  A free version of the SSH protocol suite of network connectivity
-	  tools. The standard 'ssh', 'sshd', 'scp', and friends.
+	  A free version of the SSH protocol suite of network
+	  connectivity tools. The standard 'ssh', 'sshd', 'scp', and
+	  friends.
 
 	  http://www.openssh.com/
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 38a32bf54..2a08450c8 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -30,7 +30,14 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 OPENSSH_CONF_OPTS += --without-pie
 endif
 
-OPENSSH_DEPENDENCIES = zlib openssl
+OPENSSH_DEPENDENCIES = zlib
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPENSSH_DEPENDENCIES += openssl
+endif
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+OPENSSH_DEPENDENCIES += libressl
+endif
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 OPENSSH_DEPENDENCIES += cryptodev-linux
-- 
2.13.0
