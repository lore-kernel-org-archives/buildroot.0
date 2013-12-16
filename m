From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 12:36:49 +0100
Subject: [Buildroot] [git commit] oprofile: fix install for avr32
Message-ID: <20131216114040.13E289C004@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e2d0ad03d638a92b3349ea8cbbf847e6b7ce518
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no perf_events support in the kernel for avr32. The oprofile
package makefile hard codes the list of binaries to install. Unfortunately,
this hard-coded list contains pe_profiling/operf, which is only built when
perf_events support is available.

Fixes autobuild failures such as the following.

  http://autobuild.buildroot.net/results/492/492659bc252395a62e62e6005ed0e86e582dcada/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oprofile/oprofile.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 186e30c..07a8ec9 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -16,7 +16,12 @@ OPROFILE_CONF_OPT = \
 OPROFILE_AUTORECONF = YES
 OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
 OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
-OPROFILE_BINARIES += utils/op-check-perfevents pe_profiling/operf libabi/opimport
+OPROFILE_BINARIES += utils/op-check-perfevents libabi/opimport
+
+# No perf_events support in kernel for avr32
+ifneq ($(BR2_avr32),y)
+OPROFILE_BINARIES += pe_profiling/operf
+endif
 
 ifeq ($(BR2_i386),y)
 OPROFILE_ARCH = i386
