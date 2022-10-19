Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C95C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 12:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53E946119F;
	Wed, 19 Oct 2022 12:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53E946119F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNKkrCsVe3Bt; Wed, 19 Oct 2022 12:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 728B360BB5;
	Wed, 19 Oct 2022 12:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 728B360BB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58CC01BF46D
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 12:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34A5683F8A
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 12:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A5683F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OtHZMO8SwvjV for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 12:40:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE31680C1C
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE31680C1C
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 12:40:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b4so28867408wrs.1
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 05:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bg4sN4NSj11IvL/8KlVHnlgK+Tb90no41ZYitreEN8I=;
 b=SWqloBM6GlU3iiifLaJ1cDTD8Imkvh3eXzaYSMBxUVAOpPxSXHRj8lgieznKdSXkQJ
 rpLmWSkTfKozSdAwEBfXKoF2P2yFjhfqCnk9iDWMfuWrey9Q8f+F4zLHO8UJ58Q8payS
 nO4CS4M75XW6vMBrOn1CijwSYJ3Q+0snDtsReRRiHu+pGORuh8ssd7QEBC6rzhGWL8df
 +NpllQRNQ3G/AxkewM8EkvLC8ptV3+JKBBFvzMdcOSSvTZFZfHHtCqbSKfnrrxMBQV02
 tAl36Lo78hjtEEJ4odDeuKO9UbcJ5SA2njrIfr2YIBCsiq9EiXxuSJtwdMncShSKXxUT
 PT3w==
X-Gm-Message-State: ACrzQf1oG313jBiUpLowPD5Imjw9i6SRZcD2fCYLL3OPkxZ7+oeCYemR
 m+d3r0A01U/IOpdQCBvRjOWehDiVCdM=
X-Google-Smtp-Source: AMsMyM4mZb6csdKljaoUy0rjVScZ/QCvaXCGdqpFaMfkNZ/8GdVrLd6PuC8bgAX5ZRTKDaELhII7pw==
X-Received: by 2002:a05:6000:1087:b0:22e:3731:e6d with SMTP id
 y7-20020a056000108700b0022e37310e6dmr5216105wrw.614.1666183217122; 
 Wed, 19 Oct 2022 05:40:17 -0700 (PDT)
Received: from p19180.intranet.cnim.net
 (pop.92-184-112-86.mobile.abo.orange.fr. [92.184.112.86])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c311000b003c6237e867esm17136474wmo.0.2022.10.19.05.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 05:40:16 -0700 (PDT)
From: Victor Dumas <dumasv.dev@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 14:40:16 +0200
Message-Id: <20221019124017.427199-1-dumasv.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221006155217.626248-1-dumasv.dev@gmail.com>
References: <20221006155217.626248-1-dumasv.dev@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bg4sN4NSj11IvL/8KlVHnlgK+Tb90no41ZYitreEN8I=;
 b=dZH08nzlvjw1vwkfaWPpk3cCU00/bL7owvatJf6vdzI5FWclM+Wt/tHHF8d1JjIaSN
 7TSl0N7nIlw+Y1FNgIDocNyNNKsopZPFr2Um9Fs2ATHukshluQhT6OCsKUinR6/G+YlF
 LJyeLuQLOBWUfzyAeSEZ8PyiWzJtbnmhT2At+hBJ/QL2v5hEVAPmmFpv7xaPZa2ioUvU
 9O6JztGSHPLRkue+rJG0RtqQXub1dJq1+3QNAig4BIi81nOgDfP7G7v/bRoDYIBsrKsq
 BKQRWZyjGYzTIbWQQbhYaYXWSnL3B/uIUZulNmb/AO/TzSCB3g0B5QOyW5HfBbc9cKAi
 PyMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dZH08nzl
Subject: [Buildroot] [PATCH v3] support/scripts/fix-rpath: parallelize
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
