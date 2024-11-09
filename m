Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B039CD5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79ADB60740;
	Sat,  9 Nov 2024 22:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zz4jt4xNimCy; Sat,  9 Nov 2024 22:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D893F605D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D893F605D5;
	Sat,  9 Nov 2024 22:16:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E81E2C2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE108401D5
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0530NnLblV5Z for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 057F540156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 057F540156
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 057F540156
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:38 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-83ab5b4b048so132981039f.2
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190598; x=1731795398;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uEtjOj8A12jqVqrs10AUY4CF3Pqld1+TyhBStucOOi4=;
 b=QkjcmZ7Eo+D+h5pypRE/4a2syNHp1E3r2Zwi3F3i2cqFkqHNDC0DVLk+Vbigp4vSQb
 Ad6wAS9Rs6WUryHv3I7/p09SJS9QzfViELQBOXtN2V5LRA+f4PWagd71zaemRQsXYlyD
 d/SVFkIE8YnJs7K4oWThz+GnOgQHHhF8KMNgVj/i4wwCYb3ptLawTHDvf4RKd1ovKlRf
 gWY9X/0QVDK+RfBBhis//FHvOwVgSMFo0kWwzhpiYtQY8b+wwlCHMs4VziSddembUMvK
 S0wGaKABF3mOC1JgYg5BOnbxz70jcKNIGstIjLy3kzXRRC+1d5brOonathTUdQUn2itg
 uN7Q==
X-Gm-Message-State: AOJu0YyFSbpeAaval2qvX26e3Z4GVP7brYBT3wAnveYza3IZyFz3qGRz
 5G0JGsbGGfHlkiFAQY6s+xM9pBd+5wnypPoGpdEIq8X8yuK2OZBD
X-Google-Smtp-Source: AGHT+IE1MOUEGYqzl5xws/zcBTsHxz7cBgZ+ea/NAQqM0gV7gf1wiIeSHbtu13A2vc8eL4vVbL6L/g==
X-Received: by 2002:a05:6602:29c8:b0:835:46cb:6747 with SMTP id
 ca18e2360f4ac-83e032994femr947714339f.4.1731190597927; 
 Sat, 09 Nov 2024 14:16:37 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787f3e49sm519102173.137.2024.11.09.14.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:37 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:25 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-11-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190598; x=1731795398; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uEtjOj8A12jqVqrs10AUY4CF3Pqld1+TyhBStucOOi4=;
 b=F5H2+j0wprWguEtEoiQ3g0chm2yxbWp/kRwh43vmJc9pR91wvXD7Q2MvXaOZFNisO+
 wO62OGRMSIHSulUuK6tFQv4zjQQ+tM1m/cG72VwfmZAkRDysWUzkjRV0Wyc2A8c4mi/4
 Awrm+Jsu8d4B1qgaXODUQ1r+zbg8Plx5K/h0baBVD0l306OPOegpRYXumB6HDVSuANlm
 YyWDrsrlsQrheVfAsp3eI6WPzQPKbe5xOlFL7BqIjCkD0YLGVRWe2VsGLQKR6k9+qb2u
 +QtNiA/uB4spCzz/78VcCu7OdddD75Ony31ICsgbFX1W/JDun594Ji89XTf2sS/f8RH4
 f+ew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F5H2+j0w
Subject: [Buildroot] [PATCH 11/17] board/aarch64-efi: use
 partition-type-uuid "root-arm64"
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
 board/aarch64-efi/genimage-efi.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 158deab87dc38cb918f066ceb5e9ba8d791e9895..207fc3e3bcc6325eab4cc03cb42a9a5c1978e219 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -24,7 +24,7 @@ image disk.img {
 	}
 
 	partition root {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = root-arm64
 		image = "rootfs.ext2"
 	}
 }

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
