From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 15:05:24 +0200
Subject: [Buildroot] [git commit] packages: fix and improve support for
	top-level parallel make
Message-ID: <20150704131113.374248050C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1668e1da390c3320ed7bcf0377ba57ed2280b38d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boost and jack2 packages fail to build when PARALLEL_JOBS is empty
so instead of using an empty PARALLEL_JOBS don't use it in the MAKE
variable when top-level parallel make is being used.

To simplify the use of top-level parallel make, check the MAKEFLAGS
variable to know automatically if the -j option is being used, also use
the "=" operator instead of the ":=" operator because the MAKEFLAGS
variable can be checked only in a "recursively expanded variable".
The "override" keyword must be used in order to change the automatic
variable "MAKE".

When the top-parallel make is being used the sub-make are called without
specifying the "-j" option in order to let GNU make share the job slots
specified in the top make. This is done because GNU make is able
to share the job slots available between each instance of make so if you
want to increase the number of jobs you just need to increase the <jobs>
value in the top make -j<jobs> command.

If we specify the -j<jobs> option in each instance of make, it is less
efficient, e.g. in a processor with 8 cores we specify -j9 in each instance:
the number of processes goes up to 81 because each sub-make can execute
9 processes. The excessive number of processes is not a good thing
because in my tests even -j16 is slower than -j9.
Instead if we don't specify the -j<jobs> option in the sub-make, the top
make share the job slots automatically between each instance, so the
number of process in this examples goes up to 9 that is faster than
using up to 81 processes.

e.g. when the -j3 option is specified only in the top make:

possible state n. 1:
process 1 - <packagea>-build
process 2 - <packagea>-build
process 3 - <packagea>-build

possible state n. 2:
process 1 - <packagea>-extract
process 2 - <packageb>-configure
process 3 - <packagec>-build

possible state n. 3:
process 1 - <packagea>-build make -j1
process 2 - <packageb>-build make -j1
process 3 - <packagec>-build make -j1

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            |    4 ++--
 package/Makefile.in |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 8eb21d4..b1bcf78 100644
--- a/Makefile
+++ b/Makefile
@@ -58,8 +58,8 @@ export HOSTARCH := $(shell uname -m | \
 #
 # Taking into account the above considerations, if you still want to execute
 # this top-level Makefile in parallel comment the ".NOTPARALLEL" line and
-# build using the following command:
-#	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))
+# use the -j<jobs> option when building, e.g:
+#      make -j$((`getconf _NPROCESSORS_ONLN`+1))
 .NOTPARALLEL:
 
 # absolute path
diff --git a/package/Makefile.in b/package/Makefile.in
index c02d31f..2ed7cf7 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -18,7 +18,8 @@ PARALLEL_JOBS := $(BR2_JLEVEL)
 endif
 
 MAKE1 := $(HOSTMAKE) -j1
-MAKE := $(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
+override MAKE = $(HOSTMAKE) \
+	$(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_VENDOR = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
