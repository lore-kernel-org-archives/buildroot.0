Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8216CC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE7B060BD0;
	Tue,  9 Aug 2022 07:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE7B060BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zu96Wtm04_c5; Tue,  9 Aug 2022 07:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33B6960BBE;
	Tue,  9 Aug 2022 07:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33B6960BBE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CEB51BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 448F44053C
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 448F44053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3WDCowxmNaR for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85C8C401A3
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85C8C401A3
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:22 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id uj29so20923149ejc.0
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=TTvmHgW7P60CvfmAGnUbfA2ZfrY34B0qe4Ciogmsmtc=;
 b=4R3Jv4PR+W9C8Lv7aDsXC2uhckPTPsrMlNLPhvmxjWvD3jTWbZdjafOz0VaKbrrc1f
 CcoSECZad2TSD5U2JGqEvoPygL3zDrDFx8Vw+qMb972MxK+XVkeJhVc3wnbSzvVZNTAV
 A/U5Jaj68pIlT+u6orRFgvUaPmT8BWVEAHFU9oQwAuqFD0WG/yJ7Wmk8q2wRNHvWtqle
 kuoUGOJxRDUTVlLotTkCbuW9qAeI2ocX9lB+lWhLm6zfGMy0V10ELnPkGxUQ7bGtTu2p
 xSOq4w5IEy07Scja76c4gEYP8j0LJgZTnZPPH1c6B5IlL9WqW4unf2zlbbhvkjRd9FQG
 odqw==
X-Gm-Message-State: ACgBeo3tEMgC+GkY7FxhGMx2fzN79m3oyNMs1mNIj+a1mVS6gLYvXHxV
 P8Kc/VioUoBTB+pUVrrDLMGBNJJqrww=
X-Google-Smtp-Source: AA6agR6TyqKHe8X/MKQqVg1+RcIEQCvZMz9wj+ErGIrhYZ0MlLUumbjl7ENX0Vcnz1Z9w3Iyv3wUhg==
X-Received: by 2002:a17:907:842:b0:731:3310:4187 with SMTP id
 ww2-20020a170907084200b0073133104187mr8431819ejb.578.1660031840419; 
 Tue, 09 Aug 2022 00:57:20 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:20 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:56:52 +0300
Message-Id: <20220809075704.86472-2-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=TTvmHgW7P60CvfmAGnUbfA2ZfrY34B0qe4Ciogmsmtc=;
 b=GBpGm+5KsY/X27b+7vf0BzL5OePx5d606ztg6G9xUa9nM9+WnGCdn94XebfB4S23et
 lYAfebb8RMhUuu42NAWW8ih+7Oz2aS0vZ1wJkUDoU1XZncrnNxsgpEkGqHYdV6vX3bw9
 8a4B361eEx5xW37fE6hdUJuKCqQ1/HUNBHq4UQ8WOTm+dUAifRI46w3rB142tboNABac
 7jsfxLwC70gAcMxzIzUWK/WCpl3qgaEoKQCoEoDht8wWIgsO2nQ/0ymt8WUrmullxMzu
 1LV1tu21BnX4+AYYuFzbcrSaOl/M0FEhpU7jubIUVKhwwlJSU/HgaJazCtByDUdt65AV
 1FsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GBpGm+5K
Subject: [Buildroot] [PATCH 01/13] package/libuv: add host-build
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Useful for nodejs cross-building to build some of the host-tools of nodejs.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/libuv/libuv.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index ed51fc92f9..033390e318 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -27,4 +27,7 @@ define LIBUV_FIXUP_AUTOGEN
 endef
 LIBUV_POST_PATCH_HOOKS += LIBUV_FIXUP_AUTOGEN
 
+HOST_LIBUV_POST_PATCH_HOOKS += LIBUV_FIXUP_AUTOGEN
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
