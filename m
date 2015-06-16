From: Matthew Starr <mstarr@hedonline.com>
Date: Tue, 16 Jun 2015 15:42:28 -0500
Subject: [Buildroot] [PATCH 1/1] system: make /bin/sh symlink use relative
	path
Message-ID: <64CA5C49A43E314D9F7DAE05370E2F7B05F54E71@hed-dc01.hed.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The symlink created by buildroot for /bin/sh is the full path to
a shell.  This does not match what busybox and other Linux
distributions do with using relative path symlinks. When handling
files on the host system this will point to the host system's shell
if present and not the target shell.

This is fixed by changing the /bin/sh symlink to use relative a path
since both files are in the same directory.

This was reported as Bug #8161 at bugs.busybox.net

Signed-off-by: Matthew Starr <mstarr@hedonline.com>
---
 system/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 84cde94..15f0515 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -236,10 +236,10 @@ endchoice # /bin/sh
 
 config BR2_SYSTEM_BIN_SH
 	string
-	default "/bin/busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
-	default "/bin/bash"    if BR2_SYSTEM_BIN_SH_BASH
-	default "/bin/dash"    if BR2_SYSTEM_BIN_SH_DASH
-	default "/bin/zsh"     if BR2_SYSTEM_BIN_SH_ZSH
+	default "busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
+	default "bash"    if BR2_SYSTEM_BIN_SH_BASH
+	default "dash"    if BR2_SYSTEM_BIN_SH_DASH
+	default "zsh"     if BR2_SYSTEM_BIN_SH_ZSH
 
 config BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
-- 
2.1.4
