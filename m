From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 28 Oct 2014 17:05:02 +0000
Subject: [Buildroot] [PATCH] lame: Disable for Aarch64 and MIPS when
	building with debug symbols
Message-ID: <1414515902-3153-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building lame with debug symbols needs the following macros to be
defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
If BR2_ENABLE_DEBUG is selected, then we have to disable lame for
Aarch64 and MIPS because these architectures don't have those macros
defined.

Fixes:
	http://autobuild.buildroot.net/results/721/721dff299b204b1d3ccc0846009eb17faa2d29eb/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lame/Config.in |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/lame/Config.in b/package/lame/Config.in
index 2b144a0..c2cf979 100644
--- a/package/lame/Config.in
+++ b/package/lame/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_LAME
 	bool "lame"
+	# Building lame with debug symbols needs the following macros to be
+	# defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
+	# If BR2_ENABLE_DEBUG is selected, then we have to disable lame for
+	# Aarch64 and MIPS because these architectures don't have those
+	# macros defined.
+	depends on !(BR2_ENABLE_DEBUG && (BR2_aarch64 || BR2_mips || \
+		BR2_mipsel || BR2_mips64 || BR2_mips64el))
 	help
 	  LAME is a high quality MPEG Audio Layer III (MP3) encoder.
 
-- 
1.7.1
