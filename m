Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38CBF33809
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 07:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D88261421;
	Tue, 17 Mar 2026 07:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgWvrcQks9u5; Tue, 17 Mar 2026 07:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A25A61456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773733782;
	bh=QHt3sw48D0tgSDV8CU207D1bH4kWiexy/dyp8Bh9hjk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QNDeJJVrke/KaEZXTZh1ZQyEsssG4oxjYngvk0uR/7Bm0p4zSi9W7LAUpYd8kGqAe
	 SHsNyVEcW08u6ed85nLDuSJkUXp1j+M2BM1FdinSOhAZ9dq/MpEOdEcpqFeI+/icMP
	 I6dxwj7UZsmTDhlqdE42j6jo5r/EvfX71P+kIApcQZPBnbNZR2CSR7b48bqZx5XiTQ
	 3BepJvWNvXJLolpNGRZgexfabP7821G3B7dRomPkjMaXW3K2O8L71Qg2V+TJwXzjMx
	 jgVbxJ9q7l3hpoNXlI8qA1R9wkPUkwPb9tN87ZCCgOxsUTNo+g4oIhmum5yof+uL2V
	 E6ZJZbCYN/mJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A25A61456;
	Tue, 17 Mar 2026 07:49:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BC2F3BE
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 07:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31BDC40BA7
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 07:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikmDxMPyUTzh for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 07:49:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 651A94004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 651A94004D
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 651A94004D
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 07:49:39 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-829abaaa92bso3517423b3a.1
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 00:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773733778; x=1774338578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J7liIWebpdQdu9FlSV+vEAAwfjfAmjZJME47doEu9U8=;
 b=Y1rvYEFH9ewrHaAO+wc/0K0GUOYPVozCGUukPvPmjopQVNkdZYhMZzC0lfCwiU0kj4
 FfMBdAfywEaNlHsXJzCNxByofh4y6gC9EZbuFhlFJvEmMqaIRarTWgRc4UM2tBuqoP9p
 Dd9n/uhYS804eGnOhQR0mmhmMBVvT2kUAcLYBbd6JPHLPC5g2+aCKYfc5UNck48DJhdj
 IF5NG6T0eCDMEYhzwZS0+42SYNWLmHVDXEA4izp81JpIMN9cO2E1yrnvjEu+68j5tw7i
 ZJf+66bpXYJyYprqYtZJWNlE6+mi2WuQaEcBRtgfB6ZyTEsBI7YF2IGBXY+b47B2HF9E
 ykfg==
X-Gm-Message-State: AOJu0YyXgmPpDiLTuvbmqbrZxaXFn/jnjEfX7Xtj1UbSDPdflay9FG+D
 KIsrNpZRi9Fs551YrLOkiwQ69jzOUjR+zgEppMg4GdYumnlEkvhOykerqogsvw==
X-Gm-Gg: ATEYQzxwAawQdEXxPihGunXPP/y4UxP7hv3q94e719khb334KE8itTURwcCWKXU9RKH
 vxENJyZePPtC2kniu3DWZ01/fdRleAVVDTie7hKYBK9JyfzQ8sWZ9bOB8Vcd13VxGzeHqCHTzGp
 xGIuPU/hOFRzDWLPWMLwspqeWBBQ+DR6sjWwrt7MgzV/HvI3vMkiJJw0o4VdpMfeM8iBcmj29A5
 YZHN5cysrY4/CQaFIuxiPHLq0MOuzdvDivrkqr3QDw6fGagGvxR0PeltFMTSCug3jb31ddXDZI5
 xsB/FwFVrezMtpBlWjHUW5tCVqJVxu02lZAdkL5g49GQwOkjCQXhoD798j+AgOCdeeXkOrTOqCy
 pz5lTop9R//czVVZv6hnGc0YTIgIt6hLd9eq8qFEDX3vEVGLQ+fVHw/NibhoHfXVnu7cSKAYhWH
 1mi5Br0Kxm4OuXoYT3usrmgPHAisshZIS4zFnr7eh8K+SSXw==
X-Received: by 2002:a05:6a00:2986:b0:827:4343:4c1 with SMTP id
 d2e1a72fcca58-82a19875917mr14583799b3a.29.1773733777758; 
 Tue, 17 Mar 2026 00:49:37 -0700 (PDT)
Received: from fedora ([2409:40e5:1052:9a56:3b6f:933a:89fd:e530])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a07365090sm15445636b3a.46.2026.03.17.00.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 00:49:37 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Tue, 17 Mar 2026 13:19:19 +0530
Message-ID: <20260317074923.981623-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773733778; x=1774338578; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J7liIWebpdQdu9FlSV+vEAAwfjfAmjZJME47doEu9U8=;
 b=E77sRix5EB53DupGFPO3mahw9WAdMeYGfAk/uGdTBWfWBNQNqyqUfqHcQQDzQTEN/b
 slyRT2mE/XdhEl9KCXucnm5nfzYGy/K7aPgAT7tv8J2/E5oMcpwsQGXoXqH8NvsJF7h7
 Ghp6AnoyyNaSzhDTETRPjhzzD9LN0NVVBrdcqwKwhcaf6l8w6Lk87TllkEjvDzmGUaJ2
 O+HhMRY8Z8VhUX5LfvDflEQ3aywBtZPypY+y1A89eODJiCsL89OyQH1ll0dKVGLrYgIx
 iPhCYCr1U6Ed3KO8ucEa7CAkqMdAK2Jfc4dcMYN10DQUe1bP30O2TSdQiKb/rBB/TcLW
 vwkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E77sRix5
Subject: [Buildroot] [PATCH] package/pkg-generic: add support for
 uninstalling packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot currently does not track which files are installed by each
package in output/staging, output/target, output/host, and
output/images directories. This makes it impossible to cleanly remove
a package without performing a full rebuild.

This commit adds:

1. A new Python script (support/scripts/pkg-uninstall.py) that reads
   manifest files (.files-list*.txt) tracking package file installations
   and removes all files belonging to a specified package from a given
   directory.

   The script handles:
   - Regular files and symlinks (both to files and directories)
   - Broken symlinks
   - Empty directory cleanup (deepest first)
   - Safe removal that prevents deletion outside the base directory
   - Graceful handling of missing manifests

2. A new 'make <pkg>-uninstall' target in pkg-generic.mk that:
   - Displays an "Uninstalling" message
   - Removes the package's install stamp files
   - Calls pkg-uninstall.py for each output directory:
     * TARGET_DIR (target rootfs)
     * STAGING_DIR (staging for libraries/headers)
     * HOST_DIR (host tools)
     * BINARIES_DIR (images like kernel/bootloader)
   - Updates size tracking baselines for each directory
   - Cleans up the manifest files after uninstallation

Usage:
  make <package-name>-uninstall

This enables selective package removal without requiring a complete
rebuild of the entire system.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/pkg-generic.mk           | 26 +++++++++++-
 support/scripts/pkg-uninstall.py | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100755 support/scripts/pkg-uninstall.py

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd440e4062..db058b86a3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1043,6 +1043,29 @@ $(1)-all-legal-info:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-lega
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
+$(1)-uninstall: PKG=$(2)
+$(1)-uninstall:
+	@$$(call MESSAGE,"Uninstalling")
+	# Remove stamps first (fault-tolerant ordering)
+	rm -f $$($(2)_TARGET_INSTALL)
+	rm -f $$($(2)_TARGET_INSTALL_STAGING)
+	rm -f $$($(2)_TARGET_INSTALL_TARGET)
+	rm -f $$($(2)_TARGET_INSTALL_IMAGES)
+	rm -f $$($(2)_TARGET_INSTALL_HOST)
+	# Uninstall files from all locations
+	$$(Q)support/scripts/pkg-uninstall.py -p $$($(2)_NAME) -d $$(TARGET_DIR) -l $$($(2)_DIR)/.files-list.txt
+	$$(Q)support/scripts/pkg-uninstall.py -p $$($(2)_NAME) -d $$(STAGING_DIR) -l $$($(2)_DIR)/.files-list-staging.txt
+	$$(Q)support/scripts/pkg-uninstall.py -p $$($(2)_NAME) -d $$(HOST_DIR) -l $$($(2)_DIR)/.files-list-host.txt
+	$$(Q)support/scripts/pkg-uninstall.py -p $$($(2)_NAME) -d $$(BINARIES_DIR) -l $$($(2)_DIR)/.files-list-images.txt
+	# Update baselines to reflect post-uninstall state
+	@$$(call pkg_size_before,$$(TARGET_DIR))
+	@$$(call pkg_size_before,$$(STAGING_DIR),-staging)
+	@$$(call pkg_size_before,$$(HOST_DIR),-host)
+	@$$(call pkg_size_before,$$(BINARIES_DIR),-images)
+	# Clean up manifests
+	rm -f $$($(2)_DIR)/.files-list.txt $$($(2)_DIR)/.files-list-staging.txt $$($(2)_DIR)/.files-list-host.txt $$($(2)_DIR)/.files-list-images.txt
+
+
 $(1)-clean-for-reinstall:
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 			rm -f $$($(2)_TARGET_RSYNC)
@@ -1304,7 +1327,8 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-system-dependency,$$($(2)_SOURCE))
 	$(1)-show-depends \
 	$(1)-show-info \
 	$(1)-show-version \
-	$(1)-source
+	$(1)-source \
+	$(1)-uninstall
 
 ifneq ($$($(2)_SOURCE),)
 ifeq ($$($(2)_SITE),)
diff --git a/support/scripts/pkg-uninstall.py b/support/scripts/pkg-uninstall.py
new file mode 100755
index 0000000000..3ef3f7bd7c
--- /dev/null
+++ b/support/scripts/pkg-uninstall.py
@@ -0,0 +1,71 @@
+#!/usr/bin/env python3
+
+import sys
+import os
+import argparse
+
+def main():
+    parser = argparse.ArgumentParser(description="Cleanly uninstall a package's files")
+    parser.add_argument("-p", "--package", required=True, help="Package name")
+    parser.add_argument("-d", "--dir", required=True, help="Base directory (e.g. output/target)")
+    parser.add_argument("-l", "--list", required=True, help="Path to .files-list.txt")
+    
+    args = parser.parse_args()
+    
+    if not os.path.exists(args.list):
+        # We don't error out because a package might not install files in all locations
+        # (e.g. no staging or no images), but we print a notice for debugging.
+        print(f"Notice: Manifest not found, skipping: {args.list}")
+        return
+        
+    with open(args.list, "r") as f:
+        lines = f.readlines()
+        
+    directories = set()
+    
+    # Remove files
+    for line in lines:
+        line = line.strip()
+        if not line:
+            continue
+            
+        parts = line.split(",", 1)
+        if len(parts) != 2:
+            continue
+            
+        pkg, rel_path = parts
+        if pkg != args.package:
+            continue
+            
+        if rel_path.startswith("./"):
+            rel_path = rel_path[2:]
+            
+        full_path = os.path.join(args.dir, rel_path)
+        
+        if os.path.lexists(full_path) and (not os.path.isdir(full_path) or os.path.islink(full_path)):
+            try:
+                os.remove(full_path)
+                print(f"Removed: {full_path}")
+                directories.add(os.path.dirname(full_path))
+            except OSError as e:
+                print(f"Failed to remove {full_path}: {e}", file=sys.stderr)
+        elif not os.path.lexists(full_path):
+            # If it doesn't exist, we still might want to clean up its parent dir
+            directories.add(os.path.dirname(full_path))
+                
+    # Remove empty directories, deeper first
+    sorted_dirs = sorted(list(directories), key=len, reverse=True)
+    for d in sorted_dirs:
+        # Don't try to remove the base dir or outside it
+        if not d or d == args.dir or not os.path.abspath(d).startswith(os.path.abspath(args.dir)):
+            continue
+        try:
+            # Atomic attempt to remove directory if empty
+            os.rmdir(d)
+            print(f"Removed empty dir: {d}")
+        except OSError:
+            # Directory not empty or other error, safe to ignore
+            pass
+
+if __name__ == "__main__":
+    main()
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
