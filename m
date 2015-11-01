From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  2 Nov 2015 00:25:26 +0100
Subject: [Buildroot] [PATCH v1] valgrind: enabls tls support
Message-ID: <1446420326-29281-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested with example program from [1] with qemu_x86_64.

[1] http://valgrind.10908.n7.nabble.com/Thread-local-storage-TLS-support-td40815.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/valgrind/valgrind.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index a630125..dc126ca 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -9,12 +9,18 @@ VALGRIND_SITE = http://valgrind.org/downloads
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
-VALGRIND_CONF_OPTS = --disable-tls --disable-ubsan
+VALGRIND_CONF_OPTS = --disable-ubsan
 VALGRIND_INSTALL_STAGING = YES
 
 # patch touching configure.ac
 VALGRIND_AUTORECONF = YES
 
+ifeq ($(BR2_GCC_ENABLE_TLS),y)
+VALGRIND_CONF_OPTS += --enable-tls 
+else
+VALGRIND_CONF_OPTS += --disable-tls
+endif
+
 # When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
 # -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture,
 # it forcibly adds -march=mips64. This causes Valgrind to be built
-- 
2.1.4
