Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B65CE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 22:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE0386079C;
	Sat, 11 Jan 2025 22:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldOxVlJ5fEQY; Sat, 11 Jan 2025 22:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF61607D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBF61607D5;
	Sat, 11 Jan 2025 22:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6197940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 22:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96EEF83AD6
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 22:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUms4mqWWmh6 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 22:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B718283ACE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B718283ACE
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B718283ACE
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 22:45:01 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa6c0d1833eso645642866b.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736635500; x=1737240300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WZIEh1VtVsvVHA6gwWNT+Ow2Fa4w0vuEKK6We0amxHM=;
 b=rSAbkHL5SidG68sg5oB7oKW9/Po3F8f8kElluLLH6cr55O5/nsk9bdcWH0+elCjOYU
 8VRZehgSnWLDfQZZ9kxVqH6+e3FhWdXoal55xjtKE4xe91Y3XoYJxbCRtcm14sLZ8JeP
 uKIo/HbFmoCsPucv8n1LhlqfvCbbpqzjgXdHMyUxzz94GExqhfdZjFOiDVxeHT8G4xkc
 4r6K1ES55E6SJef/izkuI03YjPV7LVszWxq2lyYZ6PC7PiS2h8E0trvJW+JQKSKkaFHj
 Fyyxh7jtwIUvCgQSHSKtU/TbKOPudNn27lRJa+VRKqIyywQDvghBApjDQOVBZbx3Iw2r
 GHBA==
X-Gm-Message-State: AOJu0Yw+Sdtd18Axo1M5PCKmz3xrYWdSLVTR6A/59oPfYclmCNXn3eqL
 KilNq53LppcEfqA8zl/LtAwSGfpELYk1FRIYZpvV5rqVtCHbpWou8bXGUg==
X-Gm-Gg: ASbGncsmC45ropMl4C33TytQlYvCwmoqtLr/HmH73fykFUCnO0wxPqcT5ILabi2JzrM
 h1Y+EQZa86nFrP31wksx1ofr1xpELJZLHsGBgxCGWeJlvLAbS0eqDukpsajILSisi9qSSNAagMD
 KhMAzE4NGhpBCkWlQhTQ4unnbqJbv9p2bpNjkbmUV+DsCfLE0FlZBN/FPcRMjIY8cJ9hyi78s6h
 P1Zu8ECpZF09uPKNlfuyCWnZr1eUSHyrQwxa3KBhZ1Px0c/KoN4HM7VlNh1
X-Google-Smtp-Source: AGHT+IGf5rNF3BoFF4ZhIxayApgrY11zOhBA/EV4YfSO4Gm8YSdXSepMYHNd1dX0EwvR3oYr6VRjwQ==
X-Received: by 2002:a17:907:3f8a:b0:aa6:6e10:61f6 with SMTP id
 a640c23a62f3a-ab2abdc5a36mr1366097966b.52.1736635499256; 
 Sat, 11 Jan 2025 14:44:59 -0800 (PST)
Received: from localhost ([78.210.250.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90da8b2sm311384166b.44.2025.01.11.14.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 14:44:58 -0800 (PST)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 23:41:23 +0100
Message-ID: <2975060.e9J7NaK4W3@localhost>
In-Reply-To: <6118780.lOV4Wx5bFT@kilian-laptop>
References: <6118780.lOV4Wx5bFT@kilian-laptop>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736635500; x=1737240300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WZIEh1VtVsvVHA6gwWNT+Ow2Fa4w0vuEKK6We0amxHM=;
 b=DtLU9gEtJ/w6jICZdm8NMts6aHs5qHri4lGMil+CKowvP1nokJO1fsVEEU+XYsQqSx
 RyQEjWPLTTIhI4iD79DBvhZSmQOZPmPULljqlRwOUcnzCk5R3l5dyWybA4diHUqmdXsk
 d2mJe1yoQl4sze3nVYNAuQs193dMjBCxhixxAhkmZWBzm4R+sztTJ9oLbfkAKqHl/a3z
 nHOL12jQRVnVmIkICyP8+yCSLwvCRhSdeTCbIRDw1WpK2dFmWDBxsz+vcfyWDDtkae8O
 3Ko+4k524QVpE0SpH1mYYtJY+WAeJGMy49VgCRbau7/2yayd0edkEaa/vv06K7iuCSka
 fcKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DtLU9gEt
Subject: Re: [Buildroot] [Help] Using an external toolchain
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

On Sat, 11 Jan 2025 14:32:05 +0100 Kilian Zinnecker wrote:
> Hello,
> 
> I'd like to use an external toolchain, to speedup building my images.
> Buildroot supports this and also has a subsection (6.1.2) about this in the
> manual [1]. However, I was not able to straight forward set up using an
> external bootlin toolchain from the manual. I.e., I wanted to set up the
> easiest way, i.e., to use a predefined external toolchain profile. Hence, I
> set:
> 
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
> 
> However, with only these settings, I get errors, e.g., that the headers are
> not correct (2.6 in opposite to 5.4). Therefore, step by step, I add more
> options:

Hello Kilian,
I just tried building qemu_riscv64_virt_defconfig with the same
toolchain you selected:

diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index d9f715198a..aa7eb55091 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -1,5 +1,6 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"

and I can't see any problem.

Maybe you missed BR2_riscv=y, the target architecture for your board,
which the bootlin toolchain for RISCV64 depends on?

Best regards,
Mattia


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
