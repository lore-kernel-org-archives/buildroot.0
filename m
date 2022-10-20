Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD83C4332F
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 11:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D3E84052F;
	Thu, 20 Oct 2022 11:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D3E84052F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4-hd-GAcKMwq; Thu, 20 Oct 2022 11:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B97C4013A;
	Thu, 20 Oct 2022 11:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B97C4013A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D49C1BF287
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 11:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56E7C4198F
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 11:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56E7C4198F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOEUiHfG9UFF for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 11:46:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC544198C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BC544198C
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 11:46:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id t4so14699550wmj.5
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 04:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzM5BH+xrmHhPy8eTXnAlYF0EQhAacOudT+M02MGNmw=;
 b=KtFqas0kEJ3vvwDl2jXVQAoneqzMe7ukgJyNjRIHCyjk0dI0juxGkzGwnURBZrdEMS
 qiMAhkD2m9Odzu6eWZoEORiDuaN2m30fMJ/FRnOsajec77EWqXiox71Sjb1o9P6BnEUi
 Qyk280Bk59wLpuuKFeoYHwy/A+GwsYfekaQ+CEda/9ZSz60nM3fZglpx943AntNULNkY
 Sz72BeJZPzSrz4HuGOHYcxVWS439VQnanp34oOLXsBJVBfh4hiCg4cOZl/mZHGBsKHC3
 C+XUkmvb4FC6GRM99iMwGaGHxuCeTlRphyMw4tmlNnwY1idEuZrYFy3m/NTX1lngKx5b
 obog==
X-Gm-Message-State: ACrzQf0YgHhGLlO4S7nD9juDs5qZDWPC0jhbIXEsM8nihc0uK9Il7KpY
 kJsEqEDcmyMS1Saokd2jniFBvbB2vRA=
X-Google-Smtp-Source: AMsMyM5LIEQlZ15+6Nr+npjXkme2eMM9sGXGJfkFPyb2yYETNPZ+zOQFeI0vEuSsVctdx5QcLJjPQA==
X-Received: by 2002:a05:600c:a0b:b0:3b4:f9a7:f79b with SMTP id
 z11-20020a05600c0a0b00b003b4f9a7f79bmr28766709wmp.99.1666266415263; 
 Thu, 20 Oct 2022 04:46:55 -0700 (PDT)
Received: from p19180.home ([2a01:cb1c:e35:9600:4170:2ec:443b:608d])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a5d4250000000b0022e47b57735sm15953815wrr.97.2022.10.20.04.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:46:54 -0700 (PDT)
From: Victor Dumas <dumasv.dev@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 13:46:41 +0200
Message-Id: <20221020114641.481922-1-dumasv.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221006155217.626248-1-dumasv.dev@gmail.com>
References: <20221006155217.626248-1-dumasv.dev@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzM5BH+xrmHhPy8eTXnAlYF0EQhAacOudT+M02MGNmw=;
 b=KVXtDFnD3OfZRwPiF3IMn/0QNrWAHFEsmzkEedD4y2spTsGFB+m1EEX5g6fOXlKz61
 xeiFhUzOXrvMMn1CKm+g02bJ+DYd5fI07UAjgaspFwff4PgeGlIT3HzMvbOP550ZTvox
 aoA1VtaPHPzeqYRUpSrXYRne2bLnE9pBndO/SWDZ4ZBLODWzPbapCJAhuq8BvBQNMwLa
 oBx64SBskDrsUbAvROHI+eHkn5FErjOFJ5NqvV5SxFlNpGp8kxNWqc9vRRmTvfRonwqv
 SZmYbPz3sMPmXztm9iO+dhIMDZh+UYTk11AWSiOwtfMHx4IkqjsC4tODgLjUUVUC6uyB
 HUdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KVXtDFnD
Subject: [Buildroot] [PATCH v4] support/scripts/fix-rpath: parallelize
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

Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized.
This significantly reduces the amount of time it takes to fix all the paths.
On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core machine

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
+    # Limit the number of cores used
+    procs=$(echo -e "$(($(nproc)-2)) \n 1" | sort -n | tail -n1)
+    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P ${procs} -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
 
     # Restore patched patchelf utility
     test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
