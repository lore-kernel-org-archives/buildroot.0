From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 15:08:30 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: don't force jobs when
	BR2_JLEVEL is empty
Message-ID: <20131004130856.4E9D39B831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b3bc153ad78615d71a307998d432e79d5d32cf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the "BR2_JLEVEL" variable is empty use "make" without
the "-j" option, because to be able to use top-level parallel
make we must not force the number of jobs in sub-make.

Example:
	make BR2_JLEVEL= -j8

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
