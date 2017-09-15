From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Sep 2017 16:24:37 +0200
Subject: [Buildroot] [PATCH] chrony: add optional seccomp support
Message-ID: <20170915142437.10131-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

seccomp support has been available since chrony-2.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 3b10c8cbff..e78d4b4857 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -13,7 +13,6 @@ CHRONY_CONF_OPTS = \
 	--host-system=Linux \
 	--host-machine=$(BR2_ARCH) \
 	--prefix=/usr \
-	--without-seccomp \
 	--without-tomcrypt
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
@@ -28,6 +27,13 @@ else
 CHRONY_CONF_OPTS += --without-nss
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CHRONY_CONF_OPTS += --enable-scfilter
+CHRONY_DEPENDENCIES += libseccomp
+else
+CHRONY_CONF_OPTS += --without-seccomp
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 CHRONY_DEPENDENCIES += readline
 else
-- 
2.11.0
