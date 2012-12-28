From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 21:36:43 +0100
Subject: [Buildroot] [git commit] nettle: add new package
Message-ID: <20121228213150.131349A4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac4e3c02d43708ed1263186b52a791c615d67cce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/nettle/Config.in |    9 +++++++++
 package/nettle/nettle.mk |   12 ++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3d556b2..6c82bab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -363,6 +363,7 @@ source "package/gnutls/Config.in"
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
