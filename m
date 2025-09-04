Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CD6CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4A4807F2;
	Thu,  4 Sep 2025 16:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuFpq3UB7zLB; Thu,  4 Sep 2025 16:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22BB48083F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22BB48083F;
	Thu,  4 Sep 2025 16:14:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04826106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F2CE80793
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gDaX1CcbRhB for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 929848079A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 929848079A
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90DE487F44; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 18809021cc690ab58255556ff8ef026c98c65194
X-Git-Newrev: 89f5bf04064105f7745223cd7082b2448fc26005
X-Patchwork-Hint: ignore
Message-Id: <20250904161349.90DE487F44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 utils/bump-stable-kernel-versions: new tool
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7348523031729307490=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7348523031729307490==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=89f5bf04064105f7745223cd7082b2448fc26005
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This tool helps to update Linux stable releases.

The script uses the versions found in linux/linux.hash. For each of the
versions it downloads the related hash list and tries to find an updated
stable release. If found it updates all related files and hashes.

Signed-off-by: Gero Schwäricke <gero.schwaericke@grandcentrix.net>
[Arnout: commonalize the sed expression for linux and linux-headers]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit a87b1800b959f5cd2ca871f89668a7c42802448f)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 utils/bump-stable-kernel-versions | 98 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
new file mode 100755
index 0000000000..577a6841c8
--- /dev/null
+++ b/utils/bump-stable-kernel-versions
@@ -0,0 +1,98 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: MIT-0
+# Copyright (C) 2024 by Gero Schwäricke <gero.schwaericke@grandcentrix.net>
+#
+# Permission is hereby granted, free of charge, to any person obtaining a copy of this
+# software and associated documentation files (the "Software"), to deal in the Software
+# without restriction, including without limitation the rights to use, copy, modify,
+# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
+# permit persons to whom the Software is furnished to do so.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
+# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
+# PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
+# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
+# OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+# OTHER DEALINGS IN THE SOFTWARE.
+
+# Check for updates to Linux stable releases. The script uses the versions found in
+# linux/linux.hash. For each of the versions it downloads the related hash list and tries
+# to find an updated stable release. If found it updates all related files and hashes.
+
+set -euo pipefail
+
+latest_version=$(sed -rn 's|^\tdefault "(.+)" if BR2_LINUX_KERNEL_LATEST_VERSION$|\1|p' linux/Config.in)
+latest_release_version=$(echo "${latest_version}" | cut -f 1-2 -d .)
+echo "${latest_version} -> ${latest_release_version}"
+
+updated_releases_list=''
+
+hash_list=
+while read -r line; do
+    # e.g.: # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+    url=$(echo "${line}" | sed -n 's|^# From \(https://www\.kernel\.org/pub/linux/kernel/.*/sha256sums.asc\)|\1|p')
+    # e.g.: sha256  f905f1238ea7a8e85314bacf283302e8097006010d25fcea726d0de0ea5bc9b6  linux-6.8.9.tar.xz
+    old_hash=$(echo "${line}" | sed -rn 's|^sha256 +([0-9a-f]+) +linux-.*$|\1|p')
+    old_version=$(echo "${line}" | sed -rn 's|^sha256 +[0-9a-f]+ +linux-(.+)\.tar\.xz$|\1|p')
+    if [ -n "${url}" ]; then
+        # Line contained a URL: Download hash list and use it.
+        if [ -a "${hash_list}" ]; then
+            rm "${hash_list}"
+        fi
+
+        hash_list=$(basename "${url}")
+        echo ">>> Downloading hash list from ${url}"
+        wget --no-verbose "${url}"
+        gpg --verify "${hash_list}"
+
+        echo "${line}" >> linux/linux.hash.new
+    elif [ -n "${old_version}" ]; then
+        # Line contained a hash entry: Search for newer versions.
+        release_version=$(echo "${old_version}" | cut -f 1-2 -d .) # e.g.: 6.8 instead of 6.8.9
+        # e.g.: 19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
+        new_hash_entry=$(grep "^[0-9a-f]\+ \+linux-${release_version//./\\.}\.[0-9]\+\.tar\.xz$" "${hash_list}" | sort -V --key '2' | tail -1)
+        new_hash=$(echo "${new_hash_entry}" | cut -f 1 -d ' ')
+        new_version=$(echo "${new_hash_entry}" | cut -f 3 -d ' ' | sed -rn 's|linux-(.+)\.tar\.xz|\1|p')
+
+        if [ "$new_version" == "$old_version" ]; then
+            # Same version as before
+            echo ">>> Release ${release_version}.x already on newest version ${new_version}."
+            echo "${line}" >> linux/linux.hash.new
+
+            if [ "${old_hash}" != "${new_hash}" ]; then
+                # Hash changed! This should never happen!
+                echo ">>> Version hash changed for ${release_version}.x!"
+                echo ">>> It was: ${old_hash}"
+                echo ">>> It is:  ${new_hash}"
+                exit 1
+            fi
+        else
+            # Different version: update hash list, default headers, and possibly latest
+            # version.
+            echo ">>> Updating hash for ${release_version}.x in linux/linux.hash"
+            echo "sha256  ${new_hash}  linux-${new_version}.tar.xz" >> linux/linux.hash.new
+
+            echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
+            sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
+                package/linux-headers/Config.in.host linux/Config.in
+
+            updated_releases_list="${updated_releases_list} ${release_version}.x"
+        fi
+    else
+        # Different line: Reset hash list and just copy this line over as is.
+        if [ -a "${hash_list}" ]; then
+            rm "${hash_list}"
+            hash_list=
+        fi
+        echo "${line}" >> linux/linux.hash.new
+    fi
+done < linux/linux.hash
+
+# We were iterating over this file so we could not edit in-place.
+mv linux/linux.hash.new linux/linux.hash
+
+if [ -n "${updated_releases_list}" ]; then
+    echo ">>> Suggested subject: {linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
+else
+    echo '>>> Nothing happened.'
+fi

--===============7348523031729307490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7348523031729307490==--
