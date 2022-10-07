Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB043C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 15:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3615E41C5E;
	Fri,  7 Oct 2022 15:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3615E41C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXq99cIa6xWO; Fri,  7 Oct 2022 15:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC9741C53;
	Fri,  7 Oct 2022 15:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC9741C53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0F551BF408
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B90224059C
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B90224059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XclDWmJfJDL for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 15:50:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDB784059B
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDB784059B
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 15:50:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r13so7876353wrj.11
 for <buildroot@buildroot.org>; Fri, 07 Oct 2022 08:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PySORqBscOCWV2RaOV62vUS0caplcrQ8qg5fB0YHr0g=;
 b=27B8887j0fzGgQnkEAaLC64p68K6KbUmgYwcCA2qAxusdp9Z3TII2e7cpgKR8v8vZr
 XqrcK2yOPEsZGL1sO52BQsrxBsVz3WCkb4wraSwuN3+F7j3t0eQzd+eHQaGWGuD/Lzfm
 IHP9CMG95GfWDoURCRNqDg38e99yBchBa45SgZavq3uAZQG9+iW4nFqxHolNyq0JsZAl
 XOFlLLnOV5BaT9OZBg/5S8112L1ZESwp/367qnVFZCIX+HygTi0t6iGFu5sclpEUPoj/
 f82l9UccT8wCuuzrpa++RREDbxfizwscLWauJTY2t4DESg5OgI0u09BHQOr9Bf8ioCdn
 IhWg==
X-Gm-Message-State: ACrzQf0tATfhNERT6/Ft87jlws54Sv3qM8oIi4Sm46yKkLBkG3TXX3hf
 m9bdr20kAPBDzd1LcmppC/MYhHbpV5o=
X-Google-Smtp-Source: AMsMyM6EjKiBBTGA7/d7qiI6yBTosCKUmznXOk6e7rNKIYMCKL/KRbwrPPkGEB2Xrf+hGU389zvcqQ==
X-Received: by 2002:a05:6000:188c:b0:22b:5c7:a21c with SMTP id
 a12-20020a056000188c00b0022b05c7a21cmr3723515wri.59.1665157833942; 
 Fri, 07 Oct 2022 08:50:33 -0700 (PDT)
Received: from p19180.home ([2a01:cb1c:e35:9600:4170:2ec:443b:608d])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a5d444f000000b0022e035a4e93sm2188870wrr.87.2022.10.07.08.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 08:50:33 -0700 (PDT)
From: Victor Dumas <dumasv.dev@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 17:50:20 +0200
Message-Id: <20221007155020.177431-1-dumasv.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221006155217.626248-1-dumasv.dev@gmail.com>
References: <20221006155217.626248-1-dumasv.dev@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PySORqBscOCWV2RaOV62vUS0caplcrQ8qg5fB0YHr0g=;
 b=I4a0yX19sGDpEDQQrjzoEt+h/biz4Eif3+GJlpOkKj8YMJ8h76bfew37V4eb6AsCOH
 yswLvBTu7rQ/BXFnAYPgFp0SCpSU7IY4FGIhsHqgawJjh6AeqdmV6hckeKcy0Vni5WiL
 OLmh+8idsv1u6w94IwgYaGxVJQ1HsRxLZ/oUldtckR9pm90qDOf34kqvHmgsfSI04Qno
 0GYV7/3ko0qMd98+9n9dW0kMWfJNglHOj7ZWUeyLetVYPe+WXggUjqaaOWdsS5am4XEm
 p641tYWcFbyaxCg62uXfs8UpYjQzvqje7+/XGWnezn1H434kDIoVh17zrQwzVlo17G4i
 ujKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=I4a0yX19
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
