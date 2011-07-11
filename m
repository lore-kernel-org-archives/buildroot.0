From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 23:53:25 +0200
Subject: [Buildroot] [PATCH 4/4] config: improve help text and prompt for
	debugging related options
In-Reply-To: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
Message-ID: <44db5c6b1b5a024f990974720e9ac5b34efa4264.1310421076.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The help text for the choice of different stripping levels is removed,
since it is not displayed by menuconfig. Instead, only the per-option
help text is visible, so this text is improved.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |   32 ++++++++++++++++++++------------
 1 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/Config.in b/Config.in
index dfca37b..1c1c2a6 100644
--- a/Config.in
+++ b/Config.in
@@ -174,8 +174,12 @@ config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
 	default y
 	help
-	  Build packages with debugging symbols
-	  enabled
+	  Build packages with debugging symbols enabled. All libraries
+	  and binaries in the 'staging' directory will have debugging
+	  symbols, which allows remote debugging even if libraries and
+	  binaries are stripped on the target. Whether libraries and
+	  binaries are stripped on the target is controlled by the
+	  BR2_STRIP_* options below.
 
 if BR2_ENABLE_DEBUG
 choice
@@ -208,32 +212,36 @@ endchoice
 endif
 
 choice
-	prompt "strip"
+	prompt "strip command for binaries on target"
 	default BR2_STRIP_strip
-	help
-	  Select whether to strip binaries and libraries for the target
-	  or not.
-	  strip   is the normal strip command
-	  sstrip  is a strip that discards more than the normal strip
-	  none    do not strip (only for debugging!)
 
 config BR2_STRIP_strip
 	bool "strip"
 	depends on !BR2_ELF2FLT
 	help
-	  strip   is the normal strip command
+	  Binaries and libraries in the target filesystem will be
+	  stripped using the normal 'strip' command. This allows to
+	  save space, mainly by removing debugging symbols. Debugging
+	  symbols on the target are unneeded on the target when remote
+	  debugging is used.
 
 config BR2_STRIP_sstrip
 	bool "sstrip"
 	select BR2_PACKAGE_SSTRIP_HOST
 	depends on !BR2_ELF2FLT
 	help
-	  sstrip  is a strip that discards more than the normal strip
+	  Binaries and libraries in the target filesystem will be
+	  stripped using the 'sstrip' command, which strips a little
+	  bit more than the traditional 'strip' command. This allows
+	  to save space, mainly by removing debugging
+	  symbols. Debugging symbols on the target are unneeded on the
+	  target when remote debugging is used.
 
 config BR2_STRIP_none
 	bool "none"
 	help
-	  none    do not strip (only for debugging!)
+	  Do not strip binaries and libraries in the target
+	  filesystem.
 endchoice
 
 choice
-- 
1.7.4.1
