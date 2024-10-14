Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FABCFC53E
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 10:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C728D60759;
	Mon, 14 Oct 2024 10:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcnWgr6zBTjQ; Mon, 14 Oct 2024 10:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7819E60818
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7819E60818;
	Mon, 14 Oct 2024 10:21:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18FBC1BF2F0
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02A2080EFA
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVp2txOBJvuw for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 10:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3EAD80ECA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3EAD80ECA
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3EAD80ECA
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 10:21:36 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43111bdd54cso6692115e9.1
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 03:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728901294; x=1729506094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSw8h5zolL2TbJWfRpBUJv4t6++13NTgC4v/EaTHO70=;
 b=xMxZG5dlcZWhTPh/s+XQNaP0LL83bu5ryocZT4Dt9eKbagRl1jcfZpsQz+hWSzoBOW
 aNLvfPd7lwf3+vD37K4pVoZpVpbZsBSWZcczszGT0EblBObAKnvhP9KEfPyWEPtPu4Cb
 kCY8xx6i6roVHAgTuft+AQ2IvsajtNZbazP6es5rZsMw40woqC/VhRXgLyD+ARLVRhQo
 isfzz28xOK2BbNdgtavDxcRq/6/iyqrsrbjgO+5AOPnUHXK8UZjh4kURul+A9KSbp+zg
 OmpQfOqDzZQps8BqeELyRt7FgYQVJjw0I58zeAjjGVgY9Wc313NqLzIsE7rRWjgQttlH
 OjGA==
X-Gm-Message-State: AOJu0YyumhXALUQmnog8RpSJjpyofpuMsr/mbWgC8e7NiOl1Yl4UXZCT
 wPrGXIkUOCFu3bUmAplI/b3bx6FmGu23vI33D3MBHthcP2EtxmVt0Tscl/YvfTcLX6bA+thZFqk
 vKgY=
X-Google-Smtp-Source: AGHT+IG62jJ04bx1y1gPxj2KcskAwQiirX6ISKhW/aQzIQSt1YC1jbVb05uDswe8UE2lY5Nyqx/qAw==
X-Received: by 2002:a05:600c:4a27:b0:42c:ba6c:d9b1 with SMTP id
 5b1f17b1804b1-4311df5641cmr40852685e9.4.1728901293844; 
 Mon, 14 Oct 2024 03:21:33 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2001:b07:6467:4426:e642:fe3c:c003:b424])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7ca3sm116402605e9.2.2024.10.14.03.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 03:21:33 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 12:21:22 +0200
Message-ID: <20241014102123.3727883-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
References: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728901294; x=1729506094;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSw8h5zolL2TbJWfRpBUJv4t6++13NTgC4v/EaTHO70=;
 b=jFqL3ztsAuCzTrHrIdL6/aV5k12qidCBK4xX0xns9rRuA1Bw23ICEYM8RZ9CwZao7m
 kuW5f9mp8HHhKH9hZUxyOzlM/Tp52LMpevoGLKcjnLu228MxvJIB8KvvtiEIN8fHtITA
 R7tiDKPmeohI4fC65lCaW7FkHOTjr3ixbAoyI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jFqL3zts
Subject: [Buildroot] [PATCH 5/6] package/mender/readme.txt: update readme
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Add missing packages to the mender package list.
 - Update broken URL links.
 - Remove the example mender artifact post-image script in favor of directing
   the user to the board/mender/x86_64/post-image-efi.sh script.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender/readme.txt | 56 +++++++++++----------------------------
 1 file changed, 15 insertions(+), 41 deletions(-)

diff --git a/package/mender/readme.txt b/package/mender/readme.txt
index c884524a1b..d78623aec9 100644
--- a/package/mender/readme.txt
+++ b/package/mender/readme.txt
@@ -28,13 +28,23 @@ In Buildroot the following packages are provided:
     - This will install the client on target rootfs
 - BR2_PACKAGE_HOST_MENDER_ARTIFACT
     - This will install the 'mender-artifact' tool in host rootfs.
+- BR2_PACKAGE_MENDER_CONNECT
+    - This installs a client that allows for remote terminal access
+      to mender clients registered on a mender server.
+- BR2_PACKAGE_MENDER_GRUBENV
+    - This package provides boot scripts to integrate mender into grub.
+      Mender recommends every client to use this package, including boards
+      using uboot as the primary bootloader.
 
 To fully utilize atomic image-based deployments using the A/B update
 strategy, additional integration is required in the bootloader. This
 integration is board specific.
 
-Currently supported bootloaders are GRUB and U-boot, and for reference
-integrations please visit:
+Currently supported bootloaders are GRUB and U-boot. Buildroot provides
+a reference integration at board/mender/x86_64/ using the
+mender_x86_64_efi_defconfig file.
+
+Additional support and integrations are found at:
 
     https://github.com/mendersoftware/buildroot-mender
 
@@ -46,12 +56,7 @@ files that need your attention:
 
 - /etc/mender/mender.conf
     - main configuration file for the Mender client
-    - https://docs.mender.io/client-configuration/configuration-file/configuration-options
-
-- /etc/mender/artifact_info
-    - The name of the image or update that will be built. This is what the
-      device will report that it is running, and different updates must have
-      different names
+    - https://docs.mender.io/client-installation/configuration/configuration-options
 
 - /var/lib/mender/device_type
     - A string that defines the type of device
@@ -110,40 +115,9 @@ Creating Mender Artifacts
 To create Mender Artifacts based on Buildroot build output you must
 include BR2_PACKAGE_HOST_MENDER_ARTIFACT in your configuration, and
 then you would typically create the Mender Artifact in a post image
-script (BR2_ROOTFS_POST_IMAGE_SCRIPT). Below is an example of such a
-script:
-
-    #!/bin/sh
-
-    set -e
-    set -x
-
-    device_type=$(cat ${TARGET_DIR}/var/lib/mender/device_type | sed 's/[^=]*=//')
-    artifact_name=$(cat ${TARGET_DIR}/etc/mender/artifact_info | sed 's/[^=]*=//')
-
-    if [ -z "${device_type}" ] || [ -z "${artifact_name}" ]; then
-        echo "missing files required by Mender"
-        exit 1
-    fi
-
-    ${HOST_DIR}/usr/bin/mender-artifact write rootfs-image \
-        --update ${BINARIES_DIR}/rootfs.ext4 \
-        --output-path ${BINARIES_DIR}/${artifact_name}.mender \
-        --artifact-name ${artifact_name} \
-        --device-type ${device_type}
-
-As you can see some properties are extracted from target rootfs, and
-this is because these values are used for compatibility checks,
-meaning that the information must be present in both rootfs and in
-Mender Artifact meta data.
-
-- device_type - must be an exact match between rootfs and Mender
-                Artifact meta-data to apply update. You can set an
-                array of devices here as well, e.g if your image is
-                compatible with multiple hardware revisions
+script (BR2_ROOTFS_POST_IMAGE_SCRIPT). See the generate_mender_image
+method in board/mender/x86_64/post-image-efi.sh for a working example.
 
-- artifact_name - must be an exact match between rootfs and Mender
-                  Artifact meta-data to apply update.
 
 Configuring Mender with certificates
 ------------------------------------
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
