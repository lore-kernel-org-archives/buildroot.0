Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A69CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3188560F22
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3188560F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA724052D;
	Sat, 13 Nov 2021 13:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AM9JaqIxXo6j; Sat, 13 Nov 2021 13:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 504B6404FE;
	Sat, 13 Nov 2021 13:31:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 109671BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50927605AD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3najGvED8R4K for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 702C1605DF
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d5so20676281wrc.1
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TxT1vaLPAL9tmOSNm/di2NB+R0GFIA4hj7Zu2Rm89Jo=;
 b=hdKMYSvCZE2r3xExV8kyuIoAYHxcYRvg9cZRircp2j1MNB9SGyjqh4/0muuB4rGnQ2
 hkY8JoGXhc0+yi0ky8jwkV/Wt37Wryc18aQ9h592E/JVRoyU6m55nIo+RlW2CBq9NusA
 l/KGDSbrHY6O6R9g7GXqJbyJAEdUQyg05h1UWIoHFyIe9mqunZCHCu/4vhG0OR5VMN7J
 /qXHDzP62v8psG4i2aGvIT/+kwqwvQTnTTQzMgD/8ojtXPs0eisw1+p8kEMe4C+wKn46
 wMAaXqLS7fTlt4gaxWTOwpZcVMltvknl6uoQ55KopKfVEL/zQ1lbTHk5vHH49gRN+WQb
 UYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TxT1vaLPAL9tmOSNm/di2NB+R0GFIA4hj7Zu2Rm89Jo=;
 b=wgju75XdzcH5/TMpvAkPng+1nDDvymSrGLr7Gbll3i065H7mZTSEs+lZCrAAETEmEY
 1+WUhJZoaCGy9APwg/7KadmYyx9xoNcFqis/LU0ER6MgY6w7hpX7dq28gRqmlQwbZuqm
 MvIcRoD0yqTkYdMCzDApk5lKXUT/eXQHIIT5x0HOYJHtDYP+ykSAWxFYHuInrNhVrNPZ
 bsMfe75iPbWoTF85uV76ThEbzNQorzy8sKccdkPkPILSOavsQEOkD+9hL108W6Ez5yOd
 6FTR8zYyhlOZ+WMzAVCA+lGuEXDrcsrrLbRxuwwTER0BFBORD8W6JYJjAmV21Hpds73T
 ijLA==
X-Gm-Message-State: AOAM532uPVCnTbjusZxQEVtxmGNWKCRee7GAiwzeAkzdU9Exq8YK/5UR
 wqDiV9wysRo6oRzQNqzAUgcN/VD7apf9Rg==
X-Google-Smtp-Source: ABdhPJw3jhmVLnF/rBgqbxtkAjnhTg8HPGQzFcsW44STsQ92WA4yS7yxqj3tJz44IHj70XWBkd97wA==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr27886777wrv.73.1636810118731; 
 Sat, 13 Nov 2021 05:28:38 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:38 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:26 +0100
Message-Id: <d69fc234a73801620273dfcc399f2c10f13bcbb0.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 15/16 v2] core/show-info: report package build
 steps and stamp files
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
Cc: Vadim Kochan <vadim4j@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eeppeliteloop@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

People (and their scripts!) whi want to report on the progress of the
build, will need to know what steps a package follows in what order.

This is handled internally by Buildroot itself already, by use of stamp
files.

However, the names of those stamp files are purely an implementation
detail (even if they are very unlikely to ever change).

Expose the build steps in a list, which is guaranteed to be ordered, ad
for each step, its name and stamp file. The output (once filtered
through jq, elided for bevity) will look like:

    [...]
    "install_target": true,
    "install_staging": false,
    "install_images": false,
    "build_steps": [
      {
        "step": "download",
        "stamp_file": ".stamp_downloaded"
      },
      {
        "step": "extract",
        "stamp_file": ".stamp_extracted"
      },
      {
        "step": "patch",
        "stamp_file": ".stamp_patched"
      },
      {
        "step": "configure",
        "stamp_file": ".stamp_configured"
      },
      {
        "step": "build",
        "stamp_file": ".stamp_built"
      },
      {
        "step": "install_target",
        "stamp_file": ".stamp_target_installed"
      }
    ],
    [...]

(Note: the first three fields already existed before this patch.)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop@gmail.com
---
 package/pkg-utils.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 37a4d244d7..d7cd8f9775 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -122,6 +122,29 @@ define _json-info-pkg
 		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
 		"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES))$(comma) \
 	)
+	"build_steps": [
+		$(if $($(1)_OVERRIDE_SRCDIR), \
+			{ "step": "rsync"$(comma) "stamp_file": $(call mk-json-str,$(notdir $($(1)_TARGET_RSYNC))) }$(comma) \
+			, \
+			{ "step": "download"$(comma) "stamp_file": $(call mk-json-str,$(notdir $($(1)_TARGET_SOURCE))) }$(comma) \
+			{ "step": "extract"$(comma) "stamp_file": $(call mk-json-str,$(notdir $($(1)_TARGET_EXTRACT))) }$(comma) \
+			{ "step": "patch"$(comma) "stamp_file": $(call mk-json-str,$(notdir $($(1)_TARGET_PATCH))) }$(comma) \
+		)
+		{ "step": "configure", "stamp_file": $(call mk-json-str,$(notdir $($(1)_TARGET_CONFIGURE))) },
+		{ "step": "build", "stamp_file": $(call mk-json-str,$(notdir $($(1)_TARGET_BUILD))) },
+		$(if $(filter YES,$($(1)_INSTALL_STAGING)), \
+			{ "step": "install_staging"$(comma) "stamp_file": $(call mk-json-str,$(notdir $($(1)_TARGET_INSTALL_STAGING))) }$(comma) \
+		)
+		$(if $(filter YES,$($(1)_INSTALL_TARGET)), \
+			{ "step": "install_target"$(comma) "stamp_file": $(call mk-json-str,$(notdir $($(1)_TARGET_INSTALL_TARGET))) }$(comma) \
+		)
+		$(if $(filter YES,$($(1)_INSTALL_IMAGES)), \
+			{ "step": "install_images"$(comma) "stamp_file": $(call mk-json-str,$(notdir $($(1)_TARGET_INSTALL_IMAGES))) }$(comma) \
+		)
+		$(if $(filter host,$($(1)_TYPE)), \
+			{ "step": "install"$(comma) "stamp_file": $(call mk-json-str,$(notdir $($(1)_TARGET_INSTALL_HOST))) } \
+		)
+	],
 	"dependencies": [
 		$(call make-comma-list, \
 			$(foreach dep,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)), \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
