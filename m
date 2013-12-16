From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 16 Dec 2013 08:25:18 +0000
Subject: [Buildroot] [PATCH] oprofile: fix install for avr32
Message-ID: <1387182318-21445-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

There is no perf_events support in the kernel for avr32. The oprofile
package makefile hard codes the list of binaries to install. Unfortunately,
this hard-coded list contains pe_profiling/operf, which is only built when
perf_events support is available.

Fixes autobuild failures such as the following.

  http://autobuild.buildroot.net/results/492/492659bc252395a62e62e6005ed0e86e582dcada/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/oprofile/oprofile.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 186e30c..ee94d19 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -16,7 +16,14 @@ OPROFILE_CONF_OPT = \
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
+
+OPROFILE_MAKE = $(MAKE1)
 
 ifeq ($(BR2_i386),y)
 OPROFILE_ARCH = i386
-- 
1.8.3.2
