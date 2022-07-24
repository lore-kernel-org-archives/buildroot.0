Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1506BCCA47C
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85C4E4248B;
	Sun, 24 Jul 2022 09:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C4E4248B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEdkOukt495p; Sun, 24 Jul 2022 09:40:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 597634174A;
	Sun, 24 Jul 2022 09:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 597634174A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8411BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D617060C28
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D617060C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8p4qesg-hww for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:40:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06CB861004
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06CB861004
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:40:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so6559620wmq.0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+PiBn6e/JTPxKnG5uFGohZ1sFXDmZ+4QLkiX0yij2Pc=;
 b=Ezxs0pLj51qxZ9UbfKZ6nSPOZ6vCzXHSAlckyR8sayIe7a13HWDi2XsodODhiZsek/
 K9StvRD8X0uyJiJFUYza0enCDNm/mvE/bz3slVkhd6tnHUCr/S98ty0eGLQodF85YhHg
 DzKd8kD4x0qo3Kg5VtjtHBiOPsKw0VI8WoHz1eHw9l0R96TgMaIQP8KUqKdKJ8B71F/q
 bKuozk+7+weDwBmvO/2nTfGK5hg5736JnmDX5apgRbVrb56nC49NLafeHwKlIqoKvjfu
 msXPsEbWI8RiNHXW6vSe1WgEp+FvMEeqnOgIs8pLzEgau62qT0K1b80TuI4uI31yLRsb
 n8Ew==
X-Gm-Message-State: AJIora+ezyCiuRJoNNRq0+S6np5DgozucJDnSR1ON7i4ybY1nlaEVOaZ
 h0LsqJLF0/mUxlniYLonjOCBCGo3dY4=
X-Google-Smtp-Source: AGRyM1uw5a+4zx/gVryls5Z6jgYwvxH50butPoI6kg55rBa99nbms78D3RgaeVpoOfHKtqrKVi5ggQ==
X-Received: by 2002:a05:600c:230f:b0:3a3:11ff:628d with SMTP id
 15-20020a05600c230f00b003a311ff628dmr17968505wmo.50.1658655620794; 
 Sun, 24 Jul 2022 02:40:20 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bq23-20020a5d5a17000000b0021e57963c4asm2443932wrb.77.2022.07.24.02.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 02:40:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 11:40:14 +0200
Message-Id: <20220724094014.93552-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+PiBn6e/JTPxKnG5uFGohZ1sFXDmZ+4QLkiX0yij2Pc=;
 b=UE8D1IUOf0gLdNmMNJUkuz9SsuiqhAzXka/I2+arIQvHGUn6HPVOFFDojdc+RWIR2v
 TmE9RZmhyELH477S0WY4m1j2d0sWqbkOc8r9numaQYw6GKXCinANBn84Nq5PLBDSYrF9
 GP93D1x88RdtnVB8hJdkwahcSy/LD8/WQMwUwwSKhxXv7HgOTMSRbInu1g+WVG6tcYUl
 8ROtF3a5wtMHJTr6/DzphUahteZV8Y6N7kquE1m9C26Ty7TZ4+hJuJWMhcgRC7cccrJv
 QrkRn3VX5iia4UuHly5INrm81Qm57Snr5rB5/ijz1MQeM2mtq8hArIFxEOr0YgZZEgbl
 QcXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UE8D1IUO
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: drop
 minnowboard_max-graphical_defconfig
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop minnowboard_max-graphical_defconfig from DEVELOPERS as it has been
removed by commit b9bc22ee8a1b98e3d2ab2a4c135e969423eb9d62

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index bb840e420a..6f529d0c46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2265,7 +2265,6 @@ F:	boot/sun20i-d1-spl/
 F:	configs/avenger96_defconfig
 F:	configs/beagleboneai_defconfig
 F:	configs/lafrite_defconfig
-F:	configs/minnowboard_max-graphical_defconfig
 F:	configs/minnowboard_max_defconfig
 F:	configs/nexbox_a95x_defconfig
 F:	configs/nezha_defconfig
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
