From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 10 Sep 2013 09:46:02 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/Makefile.in: add a way to don't
	force jobs in sub-make
In-Reply-To: <1378799164-28645-1-git-send-email-fabio.porcedda@gmail.com>
References: <1378799164-28645-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1378799164-28645-2-git-send-email-fabio.porcedda@gmail.com>
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
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 91ae1b9..6702df4 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -18,7 +18,7 @@ PARALLEL_JOBS:=$(BR2_JLEVEL)
 endif
 
 MAKE1:=$(HOSTMAKE) -j1
-MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
+MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
 
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
-- 
1.8.4
