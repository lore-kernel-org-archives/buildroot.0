From: Matthew Starr <mstarr@hedonline.com>
Date: Tue, 16 Jun 2015 10:41:45 -0500
Subject: [Buildroot] [PATCH 1/1] system: make sh symlink match original
	busybox symlink path
Message-ID: <64CA5C49A43E314D9F7DAE05370E2F7B05F54E6F@hed-dc01.hed.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The symlink created by buildroot for /bin/sh when busybox is used
is the full path to /bin/busybox and does not match the symlink
created by busybox for /bin/sh, which is just busybox.  When handling
files on the host system this will point to the host system's busybox
if present and not the target busybox.

This is fixed by changing the /bin/sh symlink to just be busybox since
both files are in the same directory.

Signed-off-by: Matthew Starr <mstarr@hedonline.com>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 84cde94..5c4ba90 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -236,7 +236,7 @@ endchoice # /bin/sh
 
 config BR2_SYSTEM_BIN_SH
 	string
-	default "/bin/busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
+	default "busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
 	default "/bin/bash"    if BR2_SYSTEM_BIN_SH_BASH
 	default "/bin/dash"    if BR2_SYSTEM_BIN_SH_DASH
 	default "/bin/zsh"     if BR2_SYSTEM_BIN_SH_ZSH
-- 
2.1.4
