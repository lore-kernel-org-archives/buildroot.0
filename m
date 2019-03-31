From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 21:13:20 +0200
Subject: [Buildroot] [git commit] package/rpm: drop binutils optional
 dependency
Message-ID: <20190331190945.724A48A645@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1edc86b55f62e592fa901ee0155c420b99d8f5f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to version 4.14.2.1, binutils is not an optional dependency
anymore as bfd.h has been droped in 4.14.0 with
https://github.com/rpm-software-management/rpm/commit/245b5a3b4b6d616adf47361137987e90f8dab22c

So drop it and manage optional elfutils dependency through a
single line (and drop binutils/elfutils comment)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpm/rpm.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 5fd7256618..75a03abf4d 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -12,6 +12,7 @@ RPM_DEPENDENCIES = \
 	host-pkgconf \
 	berkeleydb \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
+	$(if $(BR2_PACKAGE_ELFUTILS),elfutils) \
 	file \
 	popt \
 	$(if $(BR2_PACKAGE_XZ),xz) \
@@ -82,16 +83,6 @@ else
 RPM_CONF_OPTS += --without-selinux
 endif
 
-# For the elfutils and binutils dependencies, there are no
-# configuration options to explicitly enable/disable them.
-ifeq ($(BR2_PACKAGE_ELFUTILS),y)
-RPM_DEPENDENCIES += elfutils
-endif
-
-ifeq ($(BR2_PACKAGE_BINUTILS),y)
-RPM_DEPENDENCIES += binutils
-endif
-
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 RPM_DEPENDENCIES += zstd
 RPM_CONF_OPTS += --enable-zstd
