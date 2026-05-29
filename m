Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6634ACD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 22:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9418E84B1F;
	Fri, 29 May 2026 22:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITZTzSGAv1yy; Fri, 29 May 2026 22:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8039A84B20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780092167;
	bh=dD47tA/eiwrmEXfVslGbLgOwGyplkVqT1L4uvIzRsE0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R+Lli3xtW/+rZWvnYVYN4r2lhIBgbS5GuyENTfJKI4KMfRoZAILD5QImrnnhll91p
	 qoLJwLM++92sQl0v7VfbamkMGkTywY63TCvxsC+UsI1HbhljpkN/3j4Ctz7GnmXlXV
	 3BHD1UGeSXp+L5ApPR3Tg3Kvcgdyj7nbvu+EhIe+gkqf/ZP9BlkxPOY3+Nilw2mBYM
	 CW+oK9uwlbXQWEJO2qTOeAQsp3RKDnTeNNwtOMGY41wwotE0Q0d2L8MlFUejrFEsK4
	 eizWfHVyDRDyKwmAH9AEBcVYRBt+9Gt0C66dzuRaaJI8GccVj5oveKkmskrCGVUZAe
	 0bSFZGi3Nv+8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8039A84B20;
	Fri, 29 May 2026 22:02:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 781FFF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5953084B12
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4z6JZ0cZckax for <buildroot@buildroot.org>;
 Fri, 29 May 2026 22:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E26684B0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E26684B0C
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E26684B0C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:02:42 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45ef76f0d06so63227f8f.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780092160; x=1780696960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PSB/NP2AotOSkGY42PBYm8BTmpjCpdgCQQumTfjOM9U=;
 b=Q64kvacljLJMv5qxcmykk0xmY6uUmvE7/RqgLKWBYF5sp+BP5n7nKlQj4b7hEuTNAS
 IyNym5fNkFV+EhN+iOmTvhCIh1ih4wCjCbgUNQxYT4RntixAmH2ZxD0IfffB8vpDBtZd
 z/wEC4sCDRzhubybGuzkIbsFI0smGgmQeIi0qc7gxb8IHJJFAj2mRDtRG3K7cmW9GKhB
 UsZMmWG24t00K4UrSWRkwgrfHd2+eO0jGfc2/L3Oq19UY/rIue4b0AGxOdtnLf/jnAzK
 wBFizxnGb5C7ZrYxSHyPPlHv4ezFkcKmKFbUi4Rwj1NmwdfQz0O08anrl6w1DrkKp/TV
 glCg==
X-Gm-Message-State: AOJu0YxTwLdTw//8i52D2nJkT/1SXvSHPT7QNq/s8+W4P8fbTjau29Bd
 r6y5SQbrSHpjaqt2QmkK96leoHC74a8Asmv6rpTg7qqf8IeTF91FLsIRLW4PnJnD0N+pJmefwZh
 t1XLr44s=
X-Gm-Gg: Acq92OFPp2/jJHmj4lcWo2CvOMEVLGoqEWaFlGtQIFrOQ9gY8TthwSQA0oqIpY8qwhr
 uycH8p1cuzr/sX/MuD0cCg8Rkg1AYYXRv47D1N9ge0sT39s3Iw4WGAktHVL67aPzgSsQBDBaGbG
 44MGWItiAT0lXa/XJte9R+IT7xSqD5tcGq5XKYjWLsfkZNaJfgVVl8jPed6qrXy7IbrkOVcpSJB
 R6b5gNvGdPCOa5vmifflClGE+nCLznBaoCB1oCAclpbESlnwHycn5u+aNNK5c9P1odlNz4dcvv2
 vxwZz5wy3ICHaHfODRKZglSaUjJt00x7HFMfhyqPNJOwVl1pe5soIoz6gOiUMfcrG0zTqF/3Dzn
 f631jTDTuopUioIigac9ZYyPnZ5Yd/RTQHgQqVq+YfJIXZQRa0jUtv5d2I4PTPjHDNDSYerdZ1O
 a+Veg/SlGz8PjeFTOjfc+BZ9utzcEpLOhR5/QBW14=
X-Received: by 2002:adf:fad1:0:b0:45e:8526:7dc8 with SMTP id
 ffacd0b85a97d-45ef6b6d483mr2088978f8f.25.1780092160153; 
 Fri, 29 May 2026 15:02:40 -0700 (PDT)
Received: from dragon ([2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef35874b7sm6650806f8f.35.2026.05.29.15.02.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 15:02:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 00:02:18 +0200
Message-ID: <20260529220219.2526204-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780092160; x=1780696960; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=PSB/NP2AotOSkGY42PBYm8BTmpjCpdgCQQumTfjOM9U=;
 b=adDTIAM+LYQQoOjJ1YA9JVZyrUPOxC/oK58+L+RM06kf/RDTvwLlNUfwhoZEgt24hW
 ZNlZ33vChr8NUDUrSwAf2WAcwrbBZVC/gZVb1NMEVHDX/46H5d9KY4NrEs838CC7qbTM
 IB1B/mLwhOoKE4qO2g8xVbWdtM7FrCggRk/lu1gyIMkNbBy0/hAxEjtzlldDB41srKLN
 ZmwMc6ukgl13lYKLmD+sysO1vQyO7EUGRt2HmbZxAKSKIj3DTgkKJAxtzsO4rGI69j9L
 BaStqXq+Uwgxs4/f17BKrLqnVTpfUsBE52xiAHGaXGnZ5LHORvbDN3M//KdhCyVygEul
 5azw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=adDTIAM+
Subject: [Buildroot] [PATCH 1/2] utils/bump-stable-kernel-versions: update
 for split hash file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba,
linux hash files are split between pre- and post-6.17.

Since that commit, the script that automatically updates kernel
versions in Buildroot was broken, as it assumed only a single linux
hash file at a static location. Update the script to find all relevant
files, even if a new split occurs in the future.

In addition, this patch carries additional minor changes:
- Fix some minor shellcheck issues (quoting, test -a -> -e)
- Move from wget to curl, as I had some issue on my home connection
  with the former (possibly ipv6 related or something)

For a very long time, I've been carrying an uncommitted modified
version on my computer, and I hadn't taken the time to upstream it yet,
so here is finally the corresponding patch.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 utils/bump-stable-kernel-versions | 121 ++++++++++++++++--------------
 1 file changed, 65 insertions(+), 56 deletions(-)

diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
index 577a6841c8..6303bf4010 100755
--- a/utils/bump-stable-kernel-versions
+++ b/utils/bump-stable-kernel-versions
@@ -16,7 +16,7 @@
 # OTHER DEALINGS IN THE SOFTWARE.
 
 # Check for updates to Linux stable releases. The script uses the versions found in
-# linux/linux.hash. For each of the versions it downloads the related hash list and tries
+# linux/*/linux.hash. For each of the versions it downloads the related hash list and tries
 # to find an updated stable release. If found it updates all related files and hashes.
 
 set -euo pipefail
@@ -26,70 +26,79 @@ latest_release_version=$(echo "${latest_version}" | cut -f 1-2 -d .)
 echo "${latest_version} -> ${latest_release_version}"
 
 updated_releases_list=''
+updated_versions='Update the latest kernel releases to:'
 
-hash_list=
-while read -r line; do
-    # e.g.: # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-    url=$(echo "${line}" | sed -n 's|^# From \(https://www\.kernel\.org/pub/linux/kernel/.*/sha256sums.asc\)|\1|p')
-    # e.g.: sha256  f905f1238ea7a8e85314bacf283302e8097006010d25fcea726d0de0ea5bc9b6  linux-6.8.9.tar.xz
-    old_hash=$(echo "${line}" | sed -rn 's|^sha256 +([0-9a-f]+) +linux-.*$|\1|p')
-    old_version=$(echo "${line}" | sed -rn 's|^sha256 +[0-9a-f]+ +linux-(.+)\.tar\.xz$|\1|p')
-    if [ -n "${url}" ]; then
-        # Line contained a URL: Download hash list and use it.
-        if [ -a "${hash_list}" ]; then
-            rm "${hash_list}"
-        fi
+update_linux_hash() {
+    HASHFILE="$1"
+    hash_list=
+    while read -r line; do
+        # e.g.: # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+        url=$(echo "${line}" | sed -n 's|^# From \(https://www\.kernel\.org/pub/linux/kernel/.*/sha256sums.asc\)|\1|p')
+        # e.g.: sha256  f905f1238ea7a8e85314bacf283302e8097006010d25fcea726d0de0ea5bc9b6  linux-6.8.9.tar.xz
+        old_hash=$(echo "${line}" | sed -rn 's|^sha256 +([0-9a-f]+) +linux-.*$|\1|p')
+        old_version=$(echo "${line}" | sed -rn 's|^sha256 +[0-9a-f]+ +linux-(.+)\.tar\.xz$|\1|p')
+        if [ -n "${url}" ]; then
+            # Line contained a URL: Download hash list and use it.
+            if [ -e "${hash_list}" ]; then
+                rm "${hash_list}"
+            fi
 
-        hash_list=$(basename "${url}")
-        echo ">>> Downloading hash list from ${url}"
-        wget --no-verbose "${url}"
-        gpg --verify "${hash_list}"
+            hash_list=$(basename "${url}")
+            echo ">>> Downloading hash list from ${url}"
+            curl -q "${url}" > "${hash_list}"
+            gpg --verify "${hash_list}"
 
-        echo "${line}" >> linux/linux.hash.new
-    elif [ -n "${old_version}" ]; then
-        # Line contained a hash entry: Search for newer versions.
-        release_version=$(echo "${old_version}" | cut -f 1-2 -d .) # e.g.: 6.8 instead of 6.8.9
-        # e.g.: 19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
-        new_hash_entry=$(grep "^[0-9a-f]\+ \+linux-${release_version//./\\.}\.[0-9]\+\.tar\.xz$" "${hash_list}" | sort -V --key '2' | tail -1)
-        new_hash=$(echo "${new_hash_entry}" | cut -f 1 -d ' ')
-        new_version=$(echo "${new_hash_entry}" | cut -f 3 -d ' ' | sed -rn 's|linux-(.+)\.tar\.xz|\1|p')
+            echo "${line}" >> "$HASHFILE.new"
+        elif [ -n "${old_version}" ]; then
+            # Line contained a hash entry: Search for newer versions.
+            release_version=$(echo "${old_version}" | cut -f 1-2 -d .) # e.g.: 6.8 instead of 6.8.9
+            # e.g.: 19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
+            new_hash_entry=$(grep "^[0-9a-f]\+ \+linux-${release_version//./\\.}\.[0-9]\+\.tar\.xz$" "${hash_list}" | sort -V --key '2' | tail -1)
+            new_hash=$(echo "${new_hash_entry}" | cut -f 1 -d ' ')
+            new_version=$(echo "${new_hash_entry}" | cut -f 3 -d ' ' | sed -rn 's|linux-(.+)\.tar\.xz|\1|p')
 
-        if [ "$new_version" == "$old_version" ]; then
-            # Same version as before
-            echo ">>> Release ${release_version}.x already on newest version ${new_version}."
-            echo "${line}" >> linux/linux.hash.new
+            if [ "$new_version" == "$old_version" ]; then
+                # Same version as before
+                echo ">>> Release ${release_version}.x already on newest version ${new_version}."
+                echo "${line}" >> "$HASHFILE.new"
 
-            if [ "${old_hash}" != "${new_hash}" ]; then
-                # Hash changed! This should never happen!
-                echo ">>> Version hash changed for ${release_version}.x!"
-                echo ">>> It was: ${old_hash}"
-                echo ">>> It is:  ${new_hash}"
-                exit 1
-            fi
-        else
-            # Different version: update hash list, default headers, and possibly latest
-            # version.
-            echo ">>> Updating hash for ${release_version}.x in linux/linux.hash"
-            echo "sha256  ${new_hash}  linux-${new_version}.tar.xz" >> linux/linux.hash.new
+                if [ "${old_hash}" != "${new_hash}" ]; then
+                    # Hash changed! This should never happen!
+                    echo ">>> Version hash changed for ${release_version}.x!"
+                    echo ">>> It was: ${old_hash}"
+                    echo ">>> It is:  ${new_hash}"
+                    exit 1
+                fi
+            else
+                # Different version: update hash list, default headers, and possibly latest
+                # version.
+                echo ">>> Updating hash for ${release_version}.x in $HASHFILE"
+                echo "sha256  ${new_hash}  linux-${new_version}.tar.xz" >> "$HASHFILE.new"
 
-            echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
-            sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
-                package/linux-headers/Config.in.host linux/Config.in
+                echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
+                sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
+                    package/linux-headers/Config.in.host linux/Config.in
 
-            updated_releases_list="${updated_releases_list} ${release_version}.x"
-        fi
-    else
-        # Different line: Reset hash list and just copy this line over as is.
-        if [ -a "${hash_list}" ]; then
-            rm "${hash_list}"
-            hash_list=
+                updated_releases_list="${updated_releases_list} ${release_version}.x"
+                updated_versions="${updated_versions}\n - ${old_version} -> ${new_version}"
+            fi
+        else
+            # Different line: Reset hash list and just copy this line over as is.
+            if [ -e "${hash_list}" ]; then
+                rm "${hash_list}"
+                hash_list=
+            fi
+            echo "${line}" >> "$HASHFILE.new"
         fi
-        echo "${line}" >> linux/linux.hash.new
-    fi
-done < linux/linux.hash
+    done < "$HASHFILE"
+
+    # We were iterating over this file so we could not edit in-place.
+    mv "$HASHFILE.new" "$HASHFILE"
+}
 
-# We were iterating over this file so we could not edit in-place.
-mv linux/linux.hash.new linux/linux.hash
+while IFS= read -r -d '' hashfile; do
+    update_linux_hash "$hashfile"
+done < <(find linux/ -name '*.hash' -type f -print0)
 
 if [ -n "${updated_releases_list}" ]; then
     echo ">>> Suggested subject: {linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
