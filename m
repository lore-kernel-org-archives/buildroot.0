Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632D2C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 12:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB0E7405D3;
	Mon,  3 Oct 2022 12:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB0E7405D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSWS2sgchjai; Mon,  3 Oct 2022 12:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DEE7404B2;
	Mon,  3 Oct 2022 12:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DEE7404B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 100141BF3C2
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 12:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECD6F60BCF
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 12:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD6F60BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kW2WLcHtFVir for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 12:24:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18CC3605A5
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18CC3605A5
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 12:24:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u10so16351243wrq.2
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 05:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=apVh/CeB3e2DCQtNCNn9+4zqYJRM6GNS9++QUtWftjQ=;
 b=szuBsAlFsM3TTgruw6oEu/XrcOHetUQKrsh3w8zv19HBSb/QKDdGRjHAZ/ubQIA2+t
 2jo054bmQLC37/mIMPDQITHxewyM+zwJrkwAWOQIueE3LFbTC0LhuTSBeAm9T5vyNr8N
 a13ta+A9JBS9W6zbBVfHzRVI2wGLE379Q26AGOw5I52wIW6h1tE0JV4JPSKjGu++9Dsp
 B+BolQeRPLUSCoSotKnlbBFCPUQmmQUX5Zbb0Z5XGC3QrX8YHLOdlZnbhW90Fp634ZAq
 HEU88De1/hDVMofFN6zO9VgcNMtKxC00AORzmZvWibS0Sb7I4FMZr3/+I7u0Dlj9xLhK
 BpmQ==
X-Gm-Message-State: ACrzQf2v6xOiQQPtyDZo3P4Va278nBUIfQaQmE6tA7eLs+n4IapFQr7e
 F9rHk/jqhEzefXOAUunNm0fzVs1k34w=
X-Google-Smtp-Source: AMsMyM4AUl65rONmo3l3YxtUn8APF2sJp4r+/IShZKtVZ2CbS3FCE35yPC3f6zHQqz4348/GYJ65EA==
X-Received: by 2002:a5d:5963:0:b0:22a:47ed:f98f with SMTP id
 e35-20020a5d5963000000b0022a47edf98fmr12623698wri.155.1664799870986; 
 Mon, 03 Oct 2022 05:24:30 -0700 (PDT)
Received: from p19180.home ([2a01:cb1c:e35:9600:4170:2ec:443b:608d])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a05600c349600b003b33de17577sm11602141wmq.13.2022.10.03.05.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 05:24:30 -0700 (PDT)
From: Victor Dumas <dumasv.dev@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Oct 2022 14:24:21 +0200
Message-Id: <20221003122421.39868-1-dumasv.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=apVh/CeB3e2DCQtNCNn9+4zqYJRM6GNS9++QUtWftjQ=;
 b=SMlpvn56ju37Uzg42Jb32QFa/keIlv67pCxAreI7q8MRfZBQ+5agYxpKZymDJPKncZ
 q0d5m3ngjzXVP/QIWl1Ypdz+AWTcjnFC+UoX8WkamNTBl3MK61uHY/SPefR6v9m5+O2b
 c3QwoCc6devwNfe0n6moDmIqWfcbxut7Uo5I5DfwYufMkTjH+CIQkluLl96Mzha0zZ1L
 ulDPrddb/LV06sy5Hg40g3xGluj1GpoEmVi8un+/ytwXUCidKXvAbiSLouVoSLrLscEk
 Adqfz/dopYjSxvi8T7VjlfFzALs416yjAH0x9aKvcC+PDhuKHRRTxCkmSG796MvC7WE9
 bPUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SMlpvn56
Subject: [Buildroot] [PATCH] support/scripts/fix-rpath: parallelize patch
 files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: vdumas <dumasv.dev@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: vdumas <dumasv.dev@gmail.com>

Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized, significantly reducing the amount of time it takes to fix all the paths. On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core machine

Signed-off-by: Victor Dumas <dumasv.dev@gmail.com>
---
 support/scripts/fix-rpath | 60 ++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 3e67e770e5..c842da7013 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -58,6 +58,38 @@ HOST_EXCLUDEPATHS="/share/terminfo"
 STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
 TARGET_EXCLUDEPATHS="/lib/firmware"
 
+patch_file() {
+    PATCHELF="${1}"
+    rootdir="${2}"
+    sanitize_extra_args="${3}"
+    file="${4}"
+
+    # check if it's an ELF file
+    rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
+    if test $? -ne 0 ; then
+        return 0
+    fi
+
+    # make files writable if necessary
+    changed=$(chmod -c u+w "${file}")
+
+    # With per-package directory support, most RPATH of host
+    # binaries will point to per-package directories. This won't
+    # work with the --make-rpath-relative ${rootdir} invocation as
+    # the per-package host directory is not within ${rootdir}. So,
+    # we rewrite all RPATHs pointing to per-package directories so
+    # that they point to the global host directry.
+    changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
+    if test "${rpath}" != "${changed_rpath}" ; then
+        ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
+    fi
+
+    # call patchelf to sanitize the rpath
+    ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
+    # restore the original permission
+    test "${changed}" != "" && chmod u-w "${file}"
+}
+
 main() {
     local rootdir
     local tree="${1}"
@@ -125,32 +157,8 @@ main() {
 
     find_args+=( "-type" "f" "-print" )
 
-    while read file ; do
-        # check if it's an ELF file
-        rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
-        if test $? -ne 0 ; then
-            continue
-        fi
-
-        # make files writable if necessary
-        changed=$(chmod -c u+w "${file}")
-
-        # With per-package directory support, most RPATH of host
-        # binaries will point to per-package directories. This won't
-        # work with the --make-rpath-relative ${rootdir} invocation as
-        # the per-package host directory is not within ${rootdir}. So,
-        # we rewrite all RPATHs pointing to per-package directories so
-        # that they point to the global host directry.
-        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
-        if test "${rpath}" != "${changed_rpath}" ; then
-            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
-        fi
-
-        # call patchelf to sanitize the rpath
-        ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
-        # restore the original permission
-        test "${changed}" != "" && chmod u-w "${file}"
-    done < <(find "${rootdir}" ${find_args[@]})
+    export -f patch_file
+    xargs -d '\n' -P $(nproc) -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {} < <(find "${rootdir}" ${find_args[@]})
 
     # Restore patched patchelf utility
     test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
