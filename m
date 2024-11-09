Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8481AD5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512E96071C;
	Sat,  9 Nov 2024 22:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cG3UxBN9gI1C; Sat,  9 Nov 2024 22:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE3D760716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE3D760716;
	Sat,  9 Nov 2024 22:16:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05F27D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC2308114C
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zexb2eaA05jH for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3736280C1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3736280C1B
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3736280C1B
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:29 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a6be9bd626so12919485ab.2
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190588; x=1731795388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x7B0IsyN/yawz0J0r94nXyfqCN2j+xJDPsA5B/v6VIA=;
 b=ADPjUddv1kZGtBWZluvMahLHqFzge+sEbblE4NqmdRIdHeJWYe3Ra+by66+zPkwZo0
 q/cSV11a0BB5FfQ8lL2wm0Z+3/CD3tZS5Ohkt1m0kwoIJZKsL1PCfP7wFlrtGHFeWaDr
 1rI5Zp95dxYeybBZJjHgHxB2lHGcZ76svimQ0Ca3+HL+4j97dPTZa23laQlfV20oeWmW
 0mllAgkb9+cweTZAeh+dTRYvDwo0TRHrYx8tMGcXw936/I/CPO6O/Qy+s+eiHWzVnae3
 COW7N5ZhisOextwzWW6sewPdJf65O2ZsCzSkJHtRi8qRp5e81oosr/6ZQScA6LIKWjmo
 qvxw==
X-Gm-Message-State: AOJu0YxdzriuJUpkWyup17xzoZ2kX4AkOUhcSi2lp/3WZGxKxqvdpUm9
 fyUbMY98YSZ5BiM7ytGzn/kif3wUddxhxQl/VBftZFr9OnUAq8GI
X-Google-Smtp-Source: AGHT+IGzxeANdqI/QWhSlcgyUgE+5uXKv4lbSBq4rOt6yXAQHWoUnsqwg46HQOimcGLG5VWm3t374A==
X-Received: by 2002:a05:6e02:2205:b0:3a6:c4c1:e732 with SMTP id
 e9e14a558f8ab-3a6f1a256d4mr87744055ab.18.1731190588061; 
 Sat, 09 Nov 2024 14:16:28 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787d6278sm538822173.88.2024.11.09.14.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:27 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:18 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-4-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190588; x=1731795388; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x7B0IsyN/yawz0J0r94nXyfqCN2j+xJDPsA5B/v6VIA=;
 b=h1YpzhQbXVRqyksoZ/F0DsxNjiqbzLOG2PwK+Rexz968DAa297dxarJ/rT/lzU/f4f
 A2P14On/i79HV8FSqrfY+cTjdTpwsBJEQTof1xx2rAe5D6Ui7OFE3cvg7zAQspLsRi2z
 hFocBF1FA1PyC0kjvKQkJ3HILvNDgWGYyROkH4zqgxeJCeMzhk5o2xpy1cekDuKPykUr
 rYBp/WLbhz402q76rGyNlTONKhhz/hoA1WwZPdE3i3XmLdVg1l6esOBU4tlO7WULsvsT
 FwO7Uo85m74JyNOmLslmJT5ugw3w/2qwxjpjzRScJOFMNAlwpQgEOOvCXS65wdCQWNco
 X2jA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h1YpzhQb
Subject: [Buildroot] [PATCH 04/17] board/visionfive2: use
 partition-type-uuid "L"
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
 board/visionfive2/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/visionfive2/genimage.cfg b/board/visionfive2/genimage.cfg
index 8133e740c0da233873937540d2a42b76d05a6f19..73d027c2e843246eaa8a4323e874c8892c0c2b88 100644
--- a/board/visionfive2/genimage.cfg
+++ b/board/visionfive2/genimage.cfg
@@ -16,7 +16,7 @@ image sdcard.img {
 	}
 
 	partition rootfs {
-		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+		partition-type-uuid = L
 		bootable = true
 		image = "rootfs.ext4"
 	}

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
