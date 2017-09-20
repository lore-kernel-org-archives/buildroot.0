From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:31:17 +0200
Subject: [Buildroot] [git commit] chrony: add optional seccomp support
Message-ID: <20170920172852.563A5810B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=883eb058afeaa345886d0bb617f5134ca206cd93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

seccomp support has been available since chrony-2.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 3b10c8c..e78d4b4 100644
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
