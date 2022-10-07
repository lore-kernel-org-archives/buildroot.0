Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5EEC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 15:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD37541BBD;
	Fri,  7 Oct 2022 15:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD37541BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WeT0soYK-86K; Fri,  7 Oct 2022 15:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80B4C41BA3;
	Fri,  7 Oct 2022 15:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80B4C41BA3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD6EA1BF408
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8712441BA3
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8712441BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JeJKcHz6KfQ for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 15:54:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77A26419C8
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77A26419C8
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 15:54:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n16-20020a05600c4f9000b003c17bf8ddecso2366291wmq.0
 for <buildroot@buildroot.org>; Fri, 07 Oct 2022 08:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yigGdYCV+s5W77ahDR55Z1mvJewmth7mgqVQsRikIY=;
 b=nCgPACcbSrOciaaVLdbevZYl7pSp/mAx300mTamwGnHbjxRVwGfCw6YLIZxDfKaWju
 9mn6WvaXs1C5xVExmx4tF7jwE8gzYksK6eqg1LOBQeYSn27yEQud8kxvJbFGW1aV5GNM
 0HPhRyxjBvwjWE37L1Sz27s6+GryHLk2Bem/ApBPi0G1wnAefiE+srs1jPmV880KFAip
 f3tdqmfNNnL7aOPzCyJtElSfaI3qeiGhUKcGWNDg3BllQGDcfmWlDfoR9vMrdN6h1hUS
 kXUOfQZ1hWGTCpAVOh1mPbi/GAxTefWm1AfniOWiKG+Q58LQMMRYvbpkjOTzVPx4sCmc
 1g8A==
X-Gm-Message-State: ACrzQf24sjfldXGU9dQiPRxI9Axts4BVc+OetY+00tQPxv09XCKyaD5w
 y1iY/39RCmuXAk/KGzdpVijgWNhOKf0=
X-Google-Smtp-Source: AMsMyM62iYQUou/HoM84brC9wQVVjCS8hptF8UaVXIw5F/n/xGhP3IFCNHA4MomeG38ZnP5I8BgPNQ==
X-Received: by 2002:a05:600c:19ce:b0:3b4:c709:4307 with SMTP id
 u14-20020a05600c19ce00b003b4c7094307mr10747016wmq.182.1665158079588; 
 Fri, 07 Oct 2022 08:54:39 -0700 (PDT)
Received: from p19180.home ([2a01:cb1c:e35:9600:4170:2ec:443b:608d])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a05600c2d4c00b003b33de17577sm2512591wmg.13.2022.10.07.08.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 08:54:39 -0700 (PDT)
From: Victor Dumas <dumasv.dev@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 17:54:34 +0200
Message-Id: <20221007155434.178261-1-dumasv.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221006155217.626248-1-dumasv.dev@gmail.com>
References: <20221006155217.626248-1-dumasv.dev@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yigGdYCV+s5W77ahDR55Z1mvJewmth7mgqVQsRikIY=;
 b=g1unz0ZQsd9FPs8QmXhVSWjyEL705gfaB9MvdGPx3npvA33iyPPt7v5p++/Co2Ge2v
 3M15veRbzdH7UFlqVXxj1dd+dS7j2bCMjcQJmGfgHCAV/825hBAzTD7xprVuhim9EKBz
 131HrGLcQ+SxOWZob5qP3NpxwT4cWo+wJwQItoHvgSIXojy0umXBlmn28XYa949xpOf3
 cVPMnjc/JAdIUkUSy1sUrk2q9D/MB5O6ISZCPAAfWudh6GrHcUzxakJ+D6MbbwmM+Hp4
 bk/NumLt0DoDow2PLg4CWcPvUe3LBjitUoRCK5p6KT7p1TXU25wJ8l3rLIFpL2Jx9+0H
 A2gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g1unz0ZQ
Subject: [Buildroot] [PATCH v2] support/scripts/fix-rpath: parallelize
 patching files
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

Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized, significantly reducing the amount of time it takes to fix all the paths.On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core machine

Signed-off-by: Victor Dumas <dumasv.dev@gmail.com>
---
 support/scripts/fix-rpath | 66 ++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 3e67e770e5..7ed1851aac 100755
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
@@ -123,34 +157,10 @@ main() {
             ;;
     esac
 
-    find_args+=( "-type" "f" "-print" )
-
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
+    find_args+=( "-type" "f" "-print0" )
+
+    export -f patch_file
+    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P $(nproc) -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
 
     # Restore patched patchelf utility
     test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
