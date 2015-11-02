From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 15:24:57 +0100
Subject: [Buildroot] [git commit] valgrind: enable tls support
Message-ID: <20151102142924.35E01819BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31a3f4bd54e12b8d6de286ab8fb6d9651990e2f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with example program from [1] with qemu_x86_64.

[1] http://valgrind.10908.n7.nabble.com/Thread-local-storage-TLS-support-td40815.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/valgrind/valgrind.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 75d542a..5849b49 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -9,9 +9,15 @@ VALGRIND_SITE = http://valgrind.org/downloads
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
-VALGRIND_CONF_OPTS = --disable-tls --disable-ubsan
+VALGRIND_CONF_OPTS = --disable-ubsan
 VALGRIND_INSTALL_STAGING = YES
 
+ifeq ($(BR2_GCC_ENABLE_TLS),y)
+VALGRIND_CONF_OPTS += --enable-tls
+else
+VALGRIND_CONF_OPTS += --disable-tls
+endif
+
 # When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
 # -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture,
 # it forcibly adds -march=mips64. This causes Valgrind to be built
