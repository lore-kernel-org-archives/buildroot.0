From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:10:22 +0100
Subject: [Buildroot] [git commit] Revert "package/binutils: install
 libiberty for host build"
Message-ID: <20190318210820.5A01B7FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ed3f7d45dae4218430d07fd9bf433868922fa5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7ec7ba54055919d89afc93606794d161505fa2d8, as it
causes build failures of host-gdb:

/usr/bin/ld: /home/buildroot/autobuild/instance-0/output/host/lib/libiberty.a(cplus-dem.o): relocation R_X86_64_PC32 against symbol `_sch_istable' can not be used when making a shared object; recompile with -fPIC
/usr/bin/ld: final link failed: Bad value

Indeed, the host-gdb build picks up the libiberty installed in
$(HOST_DIR) instead of using its own internal version. This needs to
be addressed before we can make host-binutils install libiberty in
$(HOST_DIR).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/binutils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index cfaf0bdeb7..6798356ff2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -84,7 +84,6 @@ HOST_BINUTILS_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--disable-shared \
 	--enable-static \
-	--enable-install-libiberty \
 	--with-sysroot=$(STAGING_DIR) \
 	--enable-poison-system-directories \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
