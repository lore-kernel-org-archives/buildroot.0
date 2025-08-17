Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB729CA0EDC
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 10:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D879843BC;
	Sun, 17 Aug 2025 10:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCJtYS0vurmp; Sun, 17 Aug 2025 10:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DAA8843FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DAA8843FC;
	Sun, 17 Aug 2025 10:27:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E038196
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 10:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5055C61650
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 10:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vd59QfgQomeG for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 10:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45F75616D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F75616D0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45F75616D0
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 10:27:27 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so497752266b.2
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 03:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755426445; x=1756031245;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4yCx9il95ZVpZYB6U0QlGOqAaLuHRyzdQUVqpOW/Lg=;
 b=VX9z617QKxY9PAMo5MadGM/6JZeN4eB06aNffeK8q1GAduAMYIQNR+Iaikhh9CUwot
 bhow0Y546uhuqNM7V3tzlIjOZvD1ngm+E6N2amkHSDy6rOggAIi0kjub3SbRYgT9MdJ/
 xMUZn1qy0N19aXGLZu52sq7uQPuG4W88riLXtbPgqoCtkcRGL0IihK3Zs+p4CRgaJNoU
 lHsA4h7H8fVFSY+GTzDR/Yth1JC1zhp151Mdo+wUR/PNBFCyBqUfP6kZ4gBqgf87HNJ0
 1uFmr/oE25zsCTWGH+sTFsNrW2pF8Wsvsbms0PjT5ozAoyGbrlSYjzXsJbZmGKYgTIRC
 xA+Q==
X-Gm-Message-State: AOJu0YxPQztSaojotE7B+tF3nBwWNhG3o2K0M0vm99lGH2ddCFKHSxlC
 UaadHpjtG8HODg3MFmlsjmKC5BaUGVtKAuYc0vB3fyfQ0kFrwzw2bRQwmlsffQ==
X-Gm-Gg: ASbGncscjI2u7L9DaHMhjAaiEWhJ7ysHDxTJiaGYyH19/CzomCvMWvLzM7s19mEvE0s
 wwcn7L2Vn28WPXBBBbAZwOxiS4yq8lZBkhS86C12HqO080Hl28TSSZb+tr9RENUlTleItx1kD9c
 KR41tpwn6lk7UcMMBsiehy/K4lpQY20w3of2V5Yx57MNWAkJb9hbHa1oMzRKnCVELMlcc51czQQ
 eHxoSWmT6zchF9nF2UuhxbowfPlpmjoGo/8oJRLNJIEtiGRzn7m3sbT0ktfwMwm8fYKYeS1Wczn
 ljn+24QNsMwFWnLIyZfrx5YgsorNfZ4XUTtMSAEJexBNqLW34GTaMPhr2sws0g6zcJmnQi3VeW5
 HDf/wG653MGMn51w1vMkVfSvKdzE=
X-Google-Smtp-Source: AGHT+IEufBgeDQmYsTmwxYL+CoJWPUo5eqc1l775pvLTPGXDHwaeaFDNidEDqOoST82iTLnDC5NWdQ==
X-Received: by 2002:a17:907:a04:b0:af9:a53a:6b38 with SMTP id
 a640c23a62f3a-afcdc28226bmr763823066b.20.1755426444866; 
 Sun, 17 Aug 2025 03:27:24 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53de0sm572544866b.11.2025.08.17.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 03:27:24 -0700 (PDT)
Date: Sun, 17 Aug 2025 12:27:22 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20250817102722.GA89579@pevik>
References: <20250816193255.1429450-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250816193255.1429450-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755426445; x=1756031245; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4yCx9il95ZVpZYB6U0QlGOqAaLuHRyzdQUVqpOW/Lg=;
 b=LtZsM29UMZQGJ10bccMjF5/xl8J8robBnsVTjgiieGdjMjKTLzc4roYEb4B1NGyigJ
 /37qfmiarc2J+d20gBtg3lxEf0X4rlraPpvQsUNpQ/Z3rOqoNJwEwvTGwQvXpKRX1F/k
 e9Ng91WgNa81a7iaCBWruTjhc1aaeMJkjzPNylnw8PbDZoCeaDESizQAYU62wjRBo9mH
 UMj1MryyX4p9OEh0qPJrYDesZ5NMhaR1UvROTZS0u99v8uBDQ/KchN5n2y/9+vRZMvc0
 +SkK5zWwR4gbPhI8N4J0QoOOvX5eWzWicqvTpH7P0QC1tgudDj9HynQX28911+ek2N7/
 O/+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LtZsM29U
Subject: Re: [Buildroot] [PATCH] package/rpcbind: bump to version 1.2.8
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, all,

> List of commits between 1.2.7..1.2.8:

> f979f1b8fa202cd0d6c352de0f2b64361ce5ea33 (HEAD -> master, tag: rpcbind-1_2_8, origin/master, origin/HEAD) Release: 1.2.8
> a9ecbb81940b23a4bb9814e126c1c1ae1db93b69 (tag: rpcbind-1_2_8-rc3) rpcinfo: Removed a number of "old-style function definition" warnings
> 8cc10d038c361f296b0a8e068c173acc33568997 rpcbind: Add -v flag to print version and config
> 8ef2e504df6e5ec3321c0804a8c6684d781e7a84 man/rpcbind: Update list of options
> 74da58dde5b1a1a7e54df1fb16315845195a69c0 (tag: rpcbind-1_2_8-rc2) Comment out ListenStream=@/run/rpcbind.sock
> b78689b8f1df42eb593dc3412698aa1b8aaa3532 [nfs/nfs-utils/rpcbind] rpcbind: avoid dereferencing NULL from realloc()
> fd1d5387de8078530d51eccf876afe6e6182b975 (tag: rpcbind-1_2_8-rc1) Move rpbind's default configuration to /run verses /var/run
> 7a6b1c58eee2e5fa74e3e4045c4950fbb4f8af0a Move rpcbind.lock to /run
> be63348bd3dd9e69e151ff83f08f09e1a9df82bf systemd/rpcbind.service.in: Want/After systemd-tmpfiles-setup
> 626fd801a13cecd8eb79ac6e979c248d7214aad4 systemd/rpcbind.service.in: Add various hardenings options
> 511fc4f4bc5ca7b7c8dac877d590d0634e570e6d man/rpcbind: Add Files section to manpage
> 31157ba6e60b0a8c4989010df8b1cf2aa673a86c systemd/rpcbind.service.in: Add few default EnvironmentFile

First, thank you for doing the update.

> So really not much.

FYI the motivation was 1) to print version and compile time options to fix RPC
tests on disabled remote calls 2) upstream more distro patches (mostly Debian
and openSUSE specific).

BTW I thought that old Buildroot specific patch 0001-Remove-yellow-pages-support.patch
was already upstreamed, but obviously not. Patch was added by you in 2012-11-04
in 8bc245da21 ("rpcbind: new package"), rpcbind was at the time 0.2.0, libtirpc
0.2.2.

When I get the time, I'll check if it's really needed. If yes there could be
libtirpc compile option to disable it (and have it disabled by default, who
needs yellow pages nowadays).

> While we're at it, let's add a sha1 hash provided directly by
> Sourceforge, in addition to the locally calculated sha256.

+1

I hate having to look at sourceforge web page (I wish the upstream upload
libtirpc and rpcbind archives also to kernel.org [1], as they do for nfs-utils
[2], then there would much easier to update the hash.

[1] https://www.kernel.org/pub/linux/utils/
[2] https://www.kernel.org/pub/linux/utils/nfs-utils/

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
