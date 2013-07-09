From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  9 Jul 2013 10:47:45 +0200
Subject: [Buildroot] [PATCH 1/4] package/Makefile.in: add a way to don't
	force jobs in sub-make
In-Reply-To: <1373359668-18099-1-git-send-email-fabio.porcedda@gmail.com>
References: <1373359668-18099-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1373359668-18099-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the "BR2_JLEVEL" variable is empty use "make"
without the "-j" option.
To be able to use top-level parallel make we must don't force
the number of jobs in sub-make.

Example:
	make BR2_JLEVEL= -j8

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 405b3e4..486021d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -18,7 +18,7 @@ PARALLEL_JOBS:=$(BR2_JLEVEL)
 endif
 
 MAKE1:=$(HOSTMAKE) -j1
-MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
+MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
 
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-buildroot-linux-$(LIBC)$(ABI)
-- 
1.8.1.4
