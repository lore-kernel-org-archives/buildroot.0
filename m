Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F826C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 15:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE8AE40CE7;
	Thu,  6 Oct 2022 15:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE8AE40CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWca4v4gq-Ol; Thu,  6 Oct 2022 15:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1FF140CD4;
	Thu,  6 Oct 2022 15:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1FF140CD4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCF9C1BF3F9
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 15:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A85AC83F12
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 15:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A85AC83F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EfpbnSm3djvq for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 15:52:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A293483F0D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A293483F0D
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 15:52:21 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so1176272wmb.3
 for <buildroot@buildroot.org>; Thu, 06 Oct 2022 08:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PySORqBscOCWV2RaOV62vUS0caplcrQ8qg5fB0YHr0g=;
 b=I/L2AlsOvlJRnafD5A5EzZ2LZ6M8gZ8XjJouMYOzSanwYGhTldMzq3HJ+tbVA8J9zo
 BUAsIvc04ICG7POjN9JMi7JEXlms+CT7ft3NbHa2MUUSUHJxxydXeLoD3bJ7MmU1RfcD
 D0+ODptJ7WueNbszWFgkPj0U83ThLcLdEjQtrNtaL0+d26XRHGsyEUNOZCKPaV0icFca
 4jAspEEytNwxtVJlSoO22Poy+iMSaU18xwTxoUzkYefEV6nNn1vkb4z59lMMJgtwgv53
 MQG2YcTm8oGSYPYzwntiXd7gIks6CI8/ldLRhMRfgwyEWOEvzr5ziGFd0HIzf1ZafHkY
 CUYw==
X-Gm-Message-State: ACrzQf1NpjEvdVtNClT9C8KPlE0etRGz7LNeI1WJy8lcnaLZFp4nKCp9
 k0ZSFIQV4r/jiXbKyzhN2ARM4PP3xPo=
X-Google-Smtp-Source: AMsMyM4a+tqPKIzmi3iqsRqshMsP69W3goWcKGSTR2xS8mzV2kpAkhKI899RO6RTl2/lcICRjxDA2Q==
X-Received: by 2002:a05:600c:3b1b:b0:3b4:92fd:559a with SMTP id
 m27-20020a05600c3b1b00b003b492fd559amr7304188wms.69.1665071539773; 
 Thu, 06 Oct 2022 08:52:19 -0700 (PDT)
Received: from p19180.intranet.cnim.net
 (pop.92-184-102-63.mobile.abo.orange.fr. [92.184.102.63])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0a4800b003b4fdbb6319sm6096824wmq.21.2022.10.06.08.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:52:19 -0700 (PDT)
From: Victor Dumas <dumasv.dev@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Oct 2022 17:52:17 +0200
Message-Id: <20221006155217.626248-1-dumasv.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <326f98fd-645f-5679-a0e5-6af19e8913ff@theobroma-systems.com>
References: <326f98fd-645f-5679-a0e5-6af19e8913ff@theobroma-systems.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PySORqBscOCWV2RaOV62vUS0caplcrQ8qg5fB0YHr0g=;
 b=afiDq/aneCWCpYfEZT4x9leLnFlmomq1iTYPIDJmHiVI6ga/6voDZ7Zd6MwDz0IHIM
 ZqHl8mnYP/SI9C89Ljkx9XGVm6Tki8dVDFrri0ygCnUWyFec1lUGyMDCTA2WaACxpOav
 DjsbcJXR9jziXaSRiPnbkiviC8EnxgtkzSPxPPBsrjRmxUwN7Di8uVztgjoCPfOJhswn
 B6MnfgPAa6vi0EUUtS1kv7Kyy9Kipnu3QFHgX5GXMYJ7UPtGoMvD0b8Mm8OVv61wfheC
 8MCXWqEjhsulqhx7Ro5runUysxMKMU4+DH2eaO56euIpFW8+wJWLHlKXJBnEGPALv8iV
 uoQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=afiDq/an
Subject: [Buildroot] [PATCH] support/scripts/fix-rpath: parallelize patching
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
Cc: Victor Dumas <dumasv.dev@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized, significantly reducing the amount of time it takes to fix all the paths.
On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core machine

Signed-off-by: Victor Dumas <dumasv.dev@gmail.com>
---
 support/scripts/fix-rpath | 62 +++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 3e67e770e5..c9d40e1cce 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -58,6 +58,40 @@ HOST_EXCLUDEPATHS="/share/terminfo"
 STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
 TARGET_EXCLUDEPATHS="/lib/firmware"
 
+patch_file() {
+    PATCHELF="${1}"
+    rootdir="${2}"
+    sanitize_extra_args="${3}"
+    file="${4}"
+
+    echo "patch file $file"
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
@@ -125,32 +159,8 @@ main() {
 
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
+    find "${rootdir}" ${find_args[@]} -print0 | xargs -0 -r -d '\n' -P $(nproc) -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
 
     # Restore patched patchelf utility
     test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
