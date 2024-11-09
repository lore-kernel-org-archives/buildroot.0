Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B23D5E386
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 863C2606D7;
	Sat,  9 Nov 2024 22:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qk1m7_uAhwFA; Sat,  9 Nov 2024 22:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91A7C60740
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A7C60740;
	Sat,  9 Nov 2024 22:16:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 215A0D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0099081357
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IonoYTUTVNV7 for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 559868134E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 559868134E
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 559868134E
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:36 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-83ab00438acso100567239f.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190595; x=1731795395;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=APuYJ5Vr8fJ8AnqcPxdQzxDF9IHLYQWso/n1g2orcsM=;
 b=xUZ1rMy0heOv0K6teS2747B74HW62oIffvlARqWQdYvV1PUyrH6ZVCqjbA4R/C3ZaJ
 OQTDeLTxfmz55ymBWmUTX/SLnoKXOi2sz3OUn7alQkyy98ZDrElBKodSsMz+TkRwY6pE
 Ux9rI6/oT1qsxjJJiboKk8lK4Ejavh3slqZRDPKMnonQw1nA8hHotIjcfhWRmOJIRqxM
 4SNHeDEIcRqm6xWM7QZKGLpgYylX+hjZk8n4PBxE2l9LWlpoGlZwgGhaN6pGK2WcGeaW
 z72AUSRVK7fFe3uZzZlpPLIUnXyjGR963R+wjtUMl4631ZwQn5KwjsY12UtYIARhOo6o
 L0AQ==
X-Gm-Message-State: AOJu0YxXWXrFzfVCLR9lGcLP4iYsgaBVwa0E5JzpUi8sW5bRrMwvWImd
 xRArViJqm2nFcKcdg7/ZU3gaT969FMkfvgt37vKtEUwK7tTT0Wl9
X-Google-Smtp-Source: AGHT+IEFF37SumDup8UWsa2qSV1H4GMioVqimvqe8mubPpAcDAsav+Fy5VHNzxPjQlStmOAZygI12g==
X-Received: by 2002:a6b:630e:0:b0:82c:da1e:4ae7 with SMTP id
 ca18e2360f4ac-83e00809f1bmr693938839f.2.1731190595143; 
 Sat, 09 Nov 2024 14:16:35 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de7883bcd6sm514029173.152.2024.11.09.14.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:34 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:23 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-9-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190595; x=1731795395; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=APuYJ5Vr8fJ8AnqcPxdQzxDF9IHLYQWso/n1g2orcsM=;
 b=JUjIxWx+yG3Efi/OXpJsMvBq6l7QQPdNZmAFItrjmiPQQs5JBOeTywz208F2iSv4Aq
 8s+Zmn1Zb9AR199jGWcCO3hehjLqfcj9zmYSyOj/W4CbHGqoPDxg9Aq+OPKIowymrEg4
 lH/Sa9smKm5DfkkBeZGnXyI8jnl+/lhvMARqBvDtQoyMeyZ4bmQ5lTlUorgWvMSnLDzP
 uroec8WNrNA6fYZ9f7PtsHAT86SZizF4kh5enAm6Qoo7jwNU6ae3314CEGcsLau3fRtl
 ATysXyxK4dsTpiUz8gFSeuwQIqX4wDmo4R4uImbwMrp/l9TIVXcO6EB9oIzVZy+AjK3A
 toeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JUjIxWx+
Subject: [Buildroot] [PATCH 09/17] board/qemu/arm-ebbr: use
 partition-type-uuid "root-arm"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 board/qemu/arm-ebbr/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/arm-ebbr/genimage.cfg b/board/qemu/arm-ebbr/genimage.cfg
index 3d4c9cff1ad55e172421b0a388b52f94eb1f0dae..988c6ec386ffe3ef455fd15d021064681553293c 100644
--- a/board/qemu/arm-ebbr/genimage.cfg
+++ b/board/qemu/arm-ebbr/genimage.cfg
@@ -25,7 +25,7 @@ image disk.img {
 	}
 
 	partition root {
-		partition-type-uuid = 69dad710-2ce4-4e3c-b16c-21a1d49abed3
+		partition-type-uuid = root-arm
 		image = "rootfs.ext2"
 	}
 }

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
