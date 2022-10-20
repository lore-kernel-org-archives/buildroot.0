Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC13C4332F
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 11:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08BDB40570;
	Thu, 20 Oct 2022 11:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08BDB40570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3mokR_00veB; Thu, 20 Oct 2022 11:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CCDA4052F;
	Thu, 20 Oct 2022 11:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CCDA4052F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E891C1BF287
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 11:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7B52419A4
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 11:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7B52419A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJx1RssWquxR for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 11:50:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 505FA4198C
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 505FA4198C
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 11:50:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bv10so33907859wrb.4
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 04:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oev9SU5FEr6z4gh37igc32/BN8a+5+9vgVQRml+GUIk=;
 b=cMv20qSj33aX+qoOHCAjuiN03w0GoB3DiFs+lPkjnp5dnyKGgJV2otLnIlbWKM5G40
 74ZaknJc+c+xITEzjtM2nAV3JgW7jzH2HnWb441je2fV7X1t9Cc2Ed3XvZArEuIAwPio
 KAGQfVDSZxpHI3zOMReOyjA8aVj378EX55xS6rEhy9q7DNTb6nsfrbHG1/1zlNg/pUS2
 rxDWkxH/bTe5qdNi9dkrBZCEc1kbotkMIkID6ej8SQaFrD6WqMETjKNnZCDe2rEFcpsJ
 0bMoGfjWJhCq91yoAa3aqR7DrUOE/ab0g6NWHEOVoqCPYBqyohgf+afZ8gBUBoySdp+A
 SvzA==
X-Gm-Message-State: ACrzQf143VQFH2SAN0sYiaJtUNkC4A6w7xV7c4W4BULdER1JaKX4lFdS
 rj2HEbN4B4yDmW2bTwaAgvRefsjqzgY=
X-Google-Smtp-Source: AMsMyM5SlmNDoAqupuB7QKtTmYD9enCwLtbzRJiuV85vlubbcgpjj+/V9iVCehh4ki2WwAKO94P+WQ==
X-Received: by 2002:a5d:4c4f:0:b0:22e:6c5b:a4b0 with SMTP id
 n15-20020a5d4c4f000000b0022e6c5ba4b0mr8443871wrt.574.1666266635501; 
 Thu, 20 Oct 2022 04:50:35 -0700 (PDT)
Received: from p19180.home ([2a01:cb1c:e35:9600:4170:2ec:443b:608d])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c3b0e00b003b4fe03c881sm2642386wms.48.2022.10.20.04.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:50:35 -0700 (PDT)
From: Victor Dumas <dumasv.dev@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 13:50:30 +0200
Message-Id: <20221020115030.483083-1-dumasv.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221006155217.626248-1-dumasv.dev@gmail.com>
References: <20221006155217.626248-1-dumasv.dev@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oev9SU5FEr6z4gh37igc32/BN8a+5+9vgVQRml+GUIk=;
 b=GPYpwA5WOzUZHazGCOZyouNEIvgeC0nQjJt+muG/8GsZ25+Gt5h7adIZGsaly04ReL
 s6RFg37PkOM03C3G5VPH2iT/Slx2YgqFNjYqPgSB8Kc+6BEbHLNBh9hZhEHXQD4BtFF4
 H3T1b7P3ayFR4KHMjeCohUp3BReUegB34FsUh9vvjVetr+h9J+7csv12NeO6uqcn7+Ys
 jA8oib4JQG06skHvL1VA9axJJQRk0wFfIGP374sGEp7GgjO4v83vfzBYtBCZH79i3Ved
 BGvMYHrxjXbCesIhAdPrUqAP+BlM+XgN7PGhjIuwgVSXVqG3RT1SzXe9tf2/53SvjzGT
 2Asw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GPYpwA5W
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
@@ -123,34 +155,12 @@ main() {
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
