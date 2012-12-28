From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 17:01:08 -0300
Subject: [Buildroot] [PATCH] nettle: add new package
Message-ID: <1356724868-9000-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in        |    1 +
 package/nettle/Config.in |    9 +++++++++
 package/nettle/nettle.mk |   12 ++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/nettle/Config.in
 create mode 100644 package/nettle/nettle.mk

diff --git a/package/Config.in b/package/Config.in
index 6d64e2c..301b52a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libnss/Config.in"
+source "package/nettle/Config.in"
 source "package/ocf-linux/Config.in"
 source "package/openssl/Config.in"
 source "package/polarssl/Config.in"
diff --git a/package/nettle/Config.in b/package/nettle/Config.in
new file mode 100644
index 0000000..5577621
--- /dev/null
+++ b/package/nettle/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NETTLE
+	bool "nettle"
+	select BR2_PACKAGE_GMP
+	help
+	  Nettle is a cryptographic library that is designed to fit easily
+	  in more or less any context: In crypto toolkits for object-oriented
+	  languages, in applications like LSH or GNUPG, or even in kernel space
+
+	  http://www.lysator.liu.se/~nisse/nettle/
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
new file mode 100644
index 0000000..ef7640a
--- /dev/null
+++ b/package/nettle/nettle.mk
@@ -0,0 +1,12 @@
+NETTLE_VERSION = 2.5
+NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
+NETTLE_DEPENDENCIES = gmp
+NETTLE_INSTALL_STAGING = YES
+
+define NETTLE_DITCH_DEBUGGING_CFLAGS
+	$(SED) '/CFLAGS/ s/ -ggdb3//' $(@D)/configure
+endef
+
+NETTLE_POST_EXTRACT_HOOKS += NETTLE_DITCH_DEBUGGING_CFLAGS
+
+$(eval $(autotools-package))
-- 
1.7.8.6
