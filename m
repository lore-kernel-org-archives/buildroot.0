Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16DDD5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5A44813C6;
	Sat,  9 Nov 2024 22:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2yR8o6bxWre; Sat,  9 Nov 2024 22:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C40B581346
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C40B581346;
	Sat,  9 Nov 2024 22:16:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22F10C2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02ED9606FA
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFZ8k6bZWZzh for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E968E6071B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E968E6071B
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E968E6071B
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:37 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a6be9bd626so12919695ab.2
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190597; x=1731795397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f4Y8uFtR05mU4wobudWqJ+2Q+e0pUEniAaaMBZ2osmM=;
 b=iGEpm22ICu9DW7AvNQqzWhimBHFNspe6+485w1dxYN/jviRieuOw3M0txxD9se2KZc
 35s0TfayHtmIoZ5Qvh9Vr1ud+5WxTy2ORBbw/XgKiwIPQ19X0mYOP/YEwIJb+ubL7bTt
 amGvDsR3Ep0YaDSJJvpm7ysQBHuf2xLnAuQ3p3jsoiyz5GKMqIga0almqOGaV3KE/t9h
 VzJfOd+WvpDZVpE+bccZ8PREWCVUSzl1vj6uKuKonIgJ48DuWQ1DNjAzuqAsGG4W2/Bd
 pj0dbhhpBYm7C34Hzevlfwj4BuBNOv5Jv5lEn/fUm9rtVvzg0YRMaV4boxPa1PYqafTz
 LqFQ==
X-Gm-Message-State: AOJu0Yzslmkb/GZenCCzaPnuburtSqMo/U1nYjLlOrV7j3mpKqfogulp
 R9lJXlTJgo3I+h6FCY9scYuTX/2mmmavuXdGi6V3D1JgPSWUBYbd
X-Google-Smtp-Source: AGHT+IHnCdqTf/NLSdAlQanfm6xan7R+tWRzDKS8KoWUP7kWIhHA1gvo0XFRRKKRvlHza0ZOEUsgxg==
X-Received: by 2002:a05:6e02:1a44:b0:3a6:aade:e30f with SMTP id
 e9e14a558f8ab-3a6f198e7c5mr79075785ab.3.1731190596604; 
 Sat, 09 Nov 2024 14:16:36 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787f00besm529128173.124.2024.11.09.14.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:36 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:24 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-10-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190597; x=1731795397; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f4Y8uFtR05mU4wobudWqJ+2Q+e0pUEniAaaMBZ2osmM=;
 b=XgbpaVggZFRDEavEqKKBQ1TD3aWFP+TkJwE2zmlHig26dluogpeNha2lT2IZu3yTFI
 rOsJ8Z2yEADBcWzqo5oosPjexdEroeG3rWLsOlIcHE3xhwoutlbWVpzIuNbLhF4dVuCA
 0u5EMsauSbgf0+a8jP3PQSwejYS27+wVuyrZ9gL3QKITtIpKHbovzU/QzaU/KkFc1pJB
 KRkst4pjk5nSS0DsSpL3AUbjjYEKXhL70P6zPcLLQe7q5dzeRmxjZKwdfW4raygc0heo
 bxtVj4KvvBwcyZ2i0vke90/PijFX3X3U2yMsIzAqv6FN78awP/AHs0ihpwO//WIDqZ+3
 hvMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XgbpaVgg
Subject: [Buildroot] [PATCH 10/17] board/qemu/riscv64-virt-efi: use
 partition-type-uuid "root-riscv64"
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
 board/qemu/riscv64-virt-efi/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/riscv64-virt-efi/genimage.cfg b/board/qemu/riscv64-virt-efi/genimage.cfg
index 46950591e0a3d4c3fb14f81d71a6c2ccf245d564..a7d5420d78dc637a0c18fe7ce2ff86378b55741a 100644
--- a/board/qemu/riscv64-virt-efi/genimage.cfg
+++ b/board/qemu/riscv64-virt-efi/genimage.cfg
@@ -28,7 +28,7 @@ image disk.img {
 		# For partition-type-uuid value, see:
 		# https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
 		# SD_GPT_ROOT_RISCV64
-		partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
+		partition-type-uuid = root-riscv64
 		image = "rootfs.ext2"
 	}
 }

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
