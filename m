Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970A2D5E387
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 642FC80B5B;
	Sat,  9 Nov 2024 22:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZfIqkrI0GLk; Sat,  9 Nov 2024 22:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C5658124A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C5658124A;
	Sat,  9 Nov 2024 22:16:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13FCDC2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D381A60708
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FE2ce_FXkIkb for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 106D8606C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 106D8606C7
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 106D8606C7
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:34 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a6c7bede1aso13282115ab.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190594; x=1731795394;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuRafH+ZaxCie+/fCv8wQXEdMLBOWUp0T4iQrL8eEEE=;
 b=RLI28kyyMHrApsqdww6COwz1w1gD0b6AwzXowKSrDQh82/44cwy/cRr7v/Ykt5mAww
 n5V88IQ6J2TQdVcQBIBhC3iacu/Nm8J83MgND8hOhoduBorSJFaOgJiiyfpUWZo2kBlX
 b8n2NbpRZCPtw7Do7N1XN/woP95+22qwvK08VI/nj6L/bmVNt3z75xetyrBc/vgm22rv
 6EMtAFfqqy2qZ5eePVnq9gDZg/BO5t/Gx+e6z59Oj5P5rFBZQc9/uXEUvRzWbVO1Fc3T
 8M4AqCQLbd4A7DIZUWa4t8iiq5Dd/B+St0Bd2Xjji9/lEG+zSJ4i7bMWyuqh8B66UAPP
 bzgA==
X-Gm-Message-State: AOJu0YwSzqVHKRW8HQKyu/LKIXY/wkCzrSGJKPYVBNBWhKclJPtuUYBV
 cM3n9puG5JUTZvlrsA1t5ON4h4MTgRKaepUgkKGMe5EymW8Ks6LI
X-Google-Smtp-Source: AGHT+IEA5dc+30DnfhvNNv+ubUAjuC5WiI1k6OoUFoCWUlkxh3/jUGQ8JtRFApIkDz7S/jD2hJvcig==
X-Received: by 2002:a05:6e02:20cd:b0:3a6:c716:ab29 with SMTP id
 e9e14a558f8ab-3a6f19e383amr99660385ab.14.1731190593823; 
 Sat, 09 Nov 2024 14:16:33 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9890ba0sm5396415ab.66.2024.11.09.14.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:33 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:22 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-8-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190594; x=1731795394; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fuRafH+ZaxCie+/fCv8wQXEdMLBOWUp0T4iQrL8eEEE=;
 b=HU1Vwz0vYL/WOtBy8uvxQFPqfZAvzHLNEpfIMICpBzp3hPoOfAlgJXcM/Qn0DN5Grh
 8ZBqz+Oe2uErDm0FX0jFCjew66Zt8ARYdwUvj1saty8Z99+XJAhDv/PnJL6XEBnne26Q
 gDWl5Q6cl7r03jsBkXIO1jWVPtEDuqE4bEWF51pYz5e1nRbuZXqQZFu9di9HIaR6ONVW
 EcgEdzS/UhPqgX25muQzo898w2FdzVVpsD58NXNb4AbyZIPNT4KXEuB8i2UDhEggKXE3
 Vt/orSPRIKQ+fitvvWvbTFFH6tVqH7NOXWqblsuzmkt/7lkJnOIW77IJww8lzDCtpcby
 tLWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HU1Vwz0v
Subject: [Buildroot] [PATCH 08/17] board/radxa: use partition-type-uuid
 "root-arm"
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
 board/radxa/rockpi-n8/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rockpi-n8/genimage.cfg b/board/radxa/rockpi-n8/genimage.cfg
index bfcd92f590effbb28cc1fa000a333bed46fec416..8165df8f36a82f56fb543d168dc9c6f5a160a2c4 100644
--- a/board/radxa/rockpi-n8/genimage.cfg
+++ b/board/radxa/rockpi-n8/genimage.cfg
@@ -33,7 +33,7 @@ image sdcard.img {
 	}
 
 	partition rootfs {
-		partition-type-uuid = 69dad710-2ce4-4e3c-b16c-21a1d49abed3
+		partition-type-uuid = root-arm
 		image = "rootfs.ext4"
 	}
 }

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
