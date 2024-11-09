Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01B7D5E387
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F7B260647;
	Sat,  9 Nov 2024 22:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HefoFtwJIol4; Sat,  9 Nov 2024 22:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF6D6072B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF6D6072B;
	Sat,  9 Nov 2024 22:16:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33101D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1323E40177
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Njt4iIR89Y-o for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E4C340156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E4C340156
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E4C340156
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:32 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83ac05206f6so123229939f.2
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190591; x=1731795391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TS6Rio4iIzNskrs2L+8ojq69gTMVRmf61MMWHcx330E=;
 b=cAkWXFGPz1fWIF7JhesatqKERRIF+T7z5VWDH3dLxn2kJvZoMgGrMpXfwTyhy2wf/v
 q4Vjmd9Z4QkXQ/ALiZNSsCCinuTLrIxgJyB1/WZ1CmTjQkykGhB91RfiVYp0URFuTOQo
 WHNSHkgIL/p42bUyzSbBnC1HCaecms3r0zRciQFqPvkFOI2PTiCo+sjVh12ebZWLoFhP
 Zso0N1ei1TbOzFgPnvgjp4/eYPrWYA6ioQ5nDMuPBnJLHrPSIlirJtk53NrlQ2n3mTyK
 kKFI4JtlLgzgBpD7RMZh+BIo0as78TNCDVzPpPRTvcpyuCXJuQAh8zKiSZ4kHh6Vl0bq
 FBJQ==
X-Gm-Message-State: AOJu0YyV9ej/FprRqWQ1UbCa6/o9KY6+mrblD2z9ADMrvYCnm7wefPti
 N488qOg4a864x4/iGJWSx7lbiVzsDdYuNJs++wYp3qWsPK7HHEK1
X-Google-Smtp-Source: AGHT+IGo43kjctZzTBpNMsAp8tT6pDNvyJg89A5zlloQICgtXEfWA9BtuZYo8lp6A5Wrd7tDKtDjFw==
X-Received: by 2002:a92:cd8e:0:b0:3a6:c98d:86bc with SMTP id
 e9e14a558f8ab-3a6f199ff38mr76989305ab.1.1731190590951; 
 Sat, 09 Nov 2024 14:16:30 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de7883bf32sm512582173.155.2024.11.09.14.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:30 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:20 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-6-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190591; x=1731795391; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TS6Rio4iIzNskrs2L+8ojq69gTMVRmf61MMWHcx330E=;
 b=R4/lvHBvq6NehSAa4LutsWUxQYWPJ94V6MAh+vuIHwSWJ8IHSkKcDcsINqyBO8BjT9
 Ygk7K8/Uvm6XfpC1uACO9VFe0S+8avnmW2ApPttCMc/oOlMqUvkdr4pRUBQTiIYU+L+9
 5BVERXLd0GOBsc0DZ2cwA61FvIhwwul7ClGBMJGroYNmSZpFRc5odutGJyir0acJN7yh
 3xrUxnnEFQtftUX3Q3XP3noxToZV1ioJgG15UTxHCpZfYXn9abjiyBDmFLnlWMib/fgv
 M6PO7GhTdHMaDY6O9pIsu9qUohVaLNP1rY2QT+9hWcazANbxuuRNc/3TtEkwfpfyYz9G
 HEOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R4/lvHBv
Subject: [Buildroot] [PATCH 06/17] support/testing/tests/boot/test_grub: use
 partition-type-uuid "root-x86"
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
 support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
index 11615c885a062d5a86917bb942360a2ab9b3c2de..9717076ca871eb3efb4fea7ca94297d022839de3 100644
--- a/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
+++ b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
@@ -25,7 +25,7 @@ image disk.img {
 	}
 
 	partition root {
-		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
+		partition-type-uuid = root-x86
 		partition-uuid = UUID_TMP
 		image = "rootfs.ext2"
 	}

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
