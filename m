From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 23:07:15 +0200
Subject: [Buildroot] [git commit] package/exim: use libnsl only with glibc
Message-ID: <20150630210754.B3D18803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00e98e69b4a0134823bcc4b626eafb16e77ae4b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only (e)glibc provides libnsl, uclibc provides only a stub, and musl
doesn't implement it at all.

Fixes compilation using this defconfig

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_STATIC_LIBS=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_OPENSSL=y
    BR2_PACKAGE_EXIM=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/exim.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index b852793..8ad0328 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -72,6 +72,14 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 endef
 endif
 
+# only (e)glibc provides libnsl, remove -lnsl for all other toolchains
+# http://bugs.exim.org/show_bug.cgi?id=1564
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
+	$(SED) 's/-lnsl//g' $(@D)/OS/Makefile-Linux
+endef
+endif
+
 define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,CC,$(TARGET_CC))
 	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
