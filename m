From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 May 2010 23:31:39 +0200
Subject: [Buildroot] [git commit master] external toolchain: also copy the
	libthread_db.so for gdbserver
Message-ID: <20100528213200.98F40BF683@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1f39e6e2063b9314b7224161d366cc44d5819e9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdbserver dlopen(3)s libthread_db.so at runtime, so there is no
dependency on it (does not appear as being (NEEDED)).

Copy libthread_db.so from external toolchain when gdbserver is enbled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
-- 
1.6.3.3
