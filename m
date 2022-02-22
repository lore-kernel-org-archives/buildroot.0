Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588BBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE061409D3;
	Tue, 22 Feb 2022 10:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UgdrdqDCiCd; Tue, 22 Feb 2022 10:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2583F408AE;
	Tue, 22 Feb 2022 10:23:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC4BD1BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7ED940155
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z2tlWv96In_M for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:22:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 998E340137
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:22:29 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id p14so41266864ejf.11
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BlhgwX52PWWusRbIt9/bBEyHNhloRixe2WJoJ1iaXxU=;
 b=nBYkcdYSM4RU49S5FRXBhzO0NK37G7peHscgNUnXjoXC2Q06RDaN2EScB5PEhdWP+Q
 bQrDIzNCOSVkfpE2zv6ehUf2H1TJkgNIIx0maDjTT/LJE34RAyGvBB0KYdYn7yW58UQh
 /1pheOQV1k59VFtNRianmMHY5A5lPDFB0sS0S/CRwFpYq5/EKNqknNW5RDl6Ds/S8Yum
 zb/SI146L61ipvbGLi1Ct+mucwtrM4uko/3PxcWZpCC7366WPvAiHec4TN8iOj2GcSk7
 w+5hpR+yjsMleaKA6UamnO6eVIwnPGU5WKbmhcgM0gQvmf+k2Uu/vfKAK9n+uPPB8b7R
 RB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BlhgwX52PWWusRbIt9/bBEyHNhloRixe2WJoJ1iaXxU=;
 b=xb94znLWi+CMQbwzjuULaDtzOn+VQKFejY1BaH8IJImCYkrtGpYEMr9LcSIudmsB1e
 2cdODDPCPsCOAm6y0AYQPsWjoln8aRlN3b9319bOtGpHOjTfHOsIGcE+h8jSErAPHkKF
 Qz/uZKipyKo58dOhjSu8CsMSGLd4aJWWm9IeNxwXpWPfG/GpiPM8agzgSze5QfuupOZ2
 kocJM2PthSGILB5MzAnvxcQ8u1QpxPNIkT/KwTpwQr006Fa8o/Mg6yFwRDsG6fjKt9S3
 iFn8Hv1bqDzkb5CK1plfOL9W/vQ7pkppuZyNGrvzZiHknNKz0Zs9hAXMaKh7vxRyUS5t
 t1tg==
X-Gm-Message-State: AOAM530HlrS2p2iURFAX51VhKYeMQ1OWlfIgMfKGMiWjR+TTnavTIr3U
 dZwCQMc72aUACvnrqRvSl8+PWUJ/qdKfTA==
X-Google-Smtp-Source: ABdhPJzpEpibaZ2Sz9uWDRsWapJBUGNiiE4nPHb2aVS60VEyQkw80qAdjSAX+O32fen5jNK9/G80cw==
X-Received: by 2002:a17:906:50b:b0:6d0:9ebc:b9df with SMTP id
 j11-20020a170906050b00b006d09ebcb9dfmr14898371eja.67.1645525347769; 
 Tue, 22 Feb 2022 02:22:27 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id c24sm6097032ejj.60.2022.02.22.02.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 02:22:27 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:22:08 +0100
Message-Id: <20220222102211.74573-6-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222102211.74573-1-nolange79@gmail.com>
References: <20220222102211.74573-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 5/7] Makefile: remove /usr/lib/rpm directory
 on target
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
Cc: Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

this directory is used by the rpm package manager, and packages
like systemd will install "macros" for this system.

It should be deleted just like the similar
/usr/share/aclocal directory from Autoconf.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1 -> v2
-   see https://lists.buildroot.org/pipermail/buildroot/2020-June/284213.html
-   improved commit message

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d92438166f..4953b382ca 100644
--- a/Makefile
+++ b/Makefile
@@ -734,7 +734,7 @@ target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake \
-		$(TARGET_DIR)/usr/doc
+		$(TARGET_DIR)/usr/lib/rpm $(TARGET_DIR)/usr/doc
 	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/lib/ $(TARGET_DIR)/usr/lib/ $(TARGET_DIR)/usr/libexec/ \
 		\( -name '*.a' -o -name '*.la' -o -name '*.prl' \) -print0 | xargs -0 rm -f
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
