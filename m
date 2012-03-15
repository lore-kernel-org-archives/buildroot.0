From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 23:14:36 +0100
Subject: [Buildroot] [git commit] config: improve help text and prompt for
	debugging related options
Message-ID: <20120315221627.8E40F90DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9a346768b1f7fe8da8776795b2795f5573b5555
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The help text for the choice of different stripping levels is removed,
since it is not displayed by menuconfig. Instead, only the per-option
help text is visible, so this text is improved.

[Peter: slightly reworked text]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |   32 ++++++++++++++++++++------------
 1 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/Config.in b/Config.in
index e07e52f..68abb9b 100644
--- a/Config.in
+++ b/Config.in
@@ -206,8 +206,12 @@ config BR2_DEPRECATED
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
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
@@ -240,32 +244,36 @@ endchoice
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
+	  symbols on the target are needed for native debugging, but
+	  not when remote debugging is used.
 
 config BR2_STRIP_sstrip
 	bool "sstrip"
 	select BR2_PACKAGE_SSTRIP_HOST
 	depends on !BR2_ELF2FLT
 	help
-	  sstrip  is a strip that discards more than the normal strip
+	  Binaries and libraries in the target filesystem will be
+	  stripped using the 'sstrip' command, which strips a little
+	  bit more than the traditional 'strip' command. This allows to
+	  save space, mainly by removing debugging symbols. Debugging
+	  symbols on the target are needed for native debugging, but
+	  not when remote debugging is used.
 
 config BR2_STRIP_none
 	bool "none"
 	help
-	  none    do not strip (only for debugging!)
+	  Do not strip binaries and libraries in the target
+	  filesystem.
 endchoice
 
 choice
