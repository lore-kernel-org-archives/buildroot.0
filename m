From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 28 May 2010 22:05:04 +0200
Subject: [Buildroot] [PATCH] external toolchain: also copy the
	libthread_db.so for	gdbserver
Message-ID: <20100528200504.20810.91282.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

gdbserver dlopen(3)s libthread_db.so at runtime, so there is no
dependency on it (does not appear as being (NEEDED)).

Copy libthread_db.so from external toolchain when gdbserver is enbled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/external-toolchain/ext-tool.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index bb4809c..ae9dfad 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -262,6 +262,10 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 EXTERNAL_LIBS+=libstdc++.so
 endif
 
+ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
+EXTERNAL_LIBS+=libthread_db.so
+endif
+
 # SYSROOT_DIR selection. We first try the -print-sysroot option,
 # available in gcc 4.4.x and in some Codesourcery toolchains. If this
 # option is not available, we fallback to the value of --with-sysroot
