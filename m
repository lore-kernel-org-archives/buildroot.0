From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Jul 2013 09:52:14 -0300
Subject: [Buildroot] [PATCH 8/9] blackfin: set GNU_TARGET_NAME accordingly
In-Reply-To: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1374324735-2286-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Blackfin for FDPIC targets uses *-linux-*, however for FLAT targets it
needs *-uclinux-* in order for gcc to build properly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index a23eb41..acbc453 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -23,6 +23,11 @@ MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-buildroot-linux-$(LIBC)$(ABI)
 
+# Blackfin FLAT needs uclinux
+ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
+GNU_TARGET_NAME=$(ARCH)-buildroot-uclinux-$(LIBC)$(ABI)
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 LIBC=uclibc
 else
-- 
1.8.1.5
