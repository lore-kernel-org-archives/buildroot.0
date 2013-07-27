From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:11:41 +0200
Subject: [Buildroot] [git commit] blackfin: set GNU_TARGET_NAME accordingly
Message-ID: <20130727141206.852C29AC92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b32f186cfd2590da133c21dc32842c6bbc681e03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Blackfin for FDPIC targets uses *-linux-*, however for FLAT targets it
needs *-uclinux-* in order for gcc to build properly.

[Thomas: use a TARGET_OS variable instead of redefining
GNU_TARGET_NAME completely]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 95eec52..aed28d5 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -21,7 +21,14 @@ MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
 
 # Compute GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-buildroot-linux-$(LIBC)$(ABI)
+GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
+
+# Blackfin FLAT needs uclinux
+ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
+TARGET_OS=uclinux
+else
+TARGET_OS=linux
+endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 LIBC=uclibc
