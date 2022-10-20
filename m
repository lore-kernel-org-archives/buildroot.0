Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C3DC4332F
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 11:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C19296FAB5;
	Thu, 20 Oct 2022 11:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C19296FAB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTiB2oxSXor2; Thu, 20 Oct 2022 11:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E29296FAA6;
	Thu, 20 Oct 2022 11:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E29296FAA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF3C41BF287
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 11:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9714C6FAA6
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 11:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9714C6FAA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCUI-XT3w_qm for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 11:52:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92D2C6FA08
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92D2C6FA08
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 11:52:44 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so1981501wmq.4
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 04:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=46WylYLwj7jZY523NCtEw6S+kfYSgvD9l/tc6eYC2Wo=;
 b=Qui+3uOrRUkBHT48d7b3EyfDH8AqAT1IpaW/jTQjET5DRsBof3eLpJwR8dM7+xvVwn
 5cpcmNkKLyzerTk5X+sZWE6vQk0/SfK4//T2IRll191J0ez1uesYGs7/B7QNPeJJ77FJ
 iKe3c71cDBaf6HuVwS9TwA+fSwCn9s3KF1Co0/vopcF4OqO+UmSrHJYXOggm0DvE7aBZ
 tvoAOv4M6F/p4f9iL82EsoLGzLFqxZwctsi8hShQXy35R6ggXaoztoC9/cykWdHNSKZ5
 VmB41eAZdX4EOmdwhKdGj36jIl2iXZZc8n72zKWwkXy69WFbhv62Xw3pRaIZVQ0B4iGP
 SrSQ==
X-Gm-Message-State: ACrzQf0A7fUKuaGMU4rSlqFagTpgP+sE4/0LJdelSR2vyw6/6J1IwXJC
 K8xZ578zyxfecTuNUErhlbVxVCH64iM=
X-Google-Smtp-Source: AMsMyM6oM7MO8QX0ixGaSOuD3Zv9imuT1v1AJfhQZ25J4sl34FJfdmnAyLvVuUY+ns15j4yWjwfgmg==
X-Received: by 2002:a05:600c:1:b0:3c6:c456:f07a with SMTP id
 g1-20020a05600c000100b003c6c456f07amr9418849wmc.158.1666266762775; 
 Thu, 20 Oct 2022 04:52:42 -0700 (PDT)
Received: from p19180.home ([2a01:cb1c:e35:9600:4170:2ec:443b:608d])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b003b47ff307e1sm2459958wmb.31.2022.10.20.04.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:42 -0700 (PDT)
From: Victor Dumas <dumasv.dev@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 13:52:39 +0200
Message-Id: <20221020115239.483333-1-dumasv.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221019124017.427199-1-dumasv.dev@gmail.com>
References: <20221019124017.427199-1-dumasv.dev@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=46WylYLwj7jZY523NCtEw6S+kfYSgvD9l/tc6eYC2Wo=;
 b=e15qEO2+LISYJb/8g+Byhjih84Yb8faQTpbusXlzxpJaWkXwzMJAkeez5wPlbdnlHs
 MQPnErjwT4Eu54Bpg2LsXOVn2DEnJOhKNlnrjyc5HEZhMzlF5aCo5XgYAb+dC6CzTLLJ
 K0AzvjrT+eoZmPKrPfWEDM82Y9w8habKTcOiAxvQcw1fc+n95N7uHBthoVp9lMeEXNfM
 aRo0tf4amV1dI1LwzATGWu+8yMOveCDzaQgsJzVZJHz6DrPO4tFuGpfXWauWKmfSLDKT
 9ksUQq8cPlhHV9CK2ZjeXnTnKs3jAGDGtSD4t915bhobyyowV3AprFmdBssolkvHWCcM
 AQog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=e15qEO2+
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

Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized, significantly reducing the amount of time it takes to fix all the paths.On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core machine

Signed-off-by: Victor Dumas <dumasv.dev@gmail.com>
---
 support/scripts/fix-rpath | 66 ++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 3e67e770e5..cef7a48e76 100755
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
