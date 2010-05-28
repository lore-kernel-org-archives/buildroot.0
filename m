From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 28 May 2010 23:23:20 +0200
Subject: [Buildroot] [PATCH 2/2] external toolchain: also copy the
	libthread_db.so for	gdbserver
In-Reply-To: <20100528212314.1541.49408.stgit@roazhon.bzh.lan>
References: <20100528212314.1541.49408.stgit@roazhon.bzh.lan>
Message-ID: <20100528212320.1541.32398.stgit@roazhon.bzh.lan>
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
 toolchain/external-toolchain/ext-tool.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index e858edb..8daae15 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -264,6 +264,9 @@ endif
 
 ifneq ($(BR2_PTHREADS_NONE),y)
 EXTERNAL_LIBS+=libpthread.so
+ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
+EXTERNAL_LIBS+=libthread_db.so
+endif # gdbserver
 endif # ! no threads
 
 # SYSROOT_DIR selection. We first try the -print-sysroot option,
