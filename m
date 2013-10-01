From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  1 Oct 2013 14:55:02 +0200
Subject: [Buildroot] [PATCH v6 3/5] package/Makefile.in: don't force jobs
	when BR2_JLEVEL is empty
In-Reply-To: <1380632104-10421-1-git-send-email-fabio.porcedda@gmail.com>
References: <1380632104-10421-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1380632104-10421-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the "BR2_JLEVEL" variable is empty use "make" without
the "-j" option, because to be able to use top-level parallel
make we must don't force the number of jobs in sub-make.

Example:
	make BR2_JLEVEL= -j8

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 170ad78..d406901 100644
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
