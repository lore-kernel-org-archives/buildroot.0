Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C332E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 18:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F58B60A6E;
	Mon, 30 Dec 2024 18:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajNVmiw7qQYR; Mon, 30 Dec 2024 18:09:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F5B760A73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F5B760A73;
	Mon, 30 Dec 2024 18:09:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BFCACA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64E4F4069D
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNl908rPuxtA for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 18:09:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1477440690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1477440690
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1477440690
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:09:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8460A60128;
 Mon, 30 Dec 2024 19:09:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51102])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Dec 2024 19:09:14 +0100
MIME-Version: 1.0
Date: Mon, 30 Dec 2024 19:09:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: kilian.zinnecker@mail.de
Cc: buildroot@buildroot.org, mark@dibsco.co.uk
In-Reply-To: <20241229202456.23018-1-kilian.zinnecker@mail.de>
References: <20241229202456.23018-1-kilian.zinnecker@mail.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <9a7e549a885d5e587fee6e7f6eaea0a8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735582156;
 bh=BuMkR5bNtypDkDZYpnxtDkYVoLn84zPflxa+0mECKGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gYfSJgdbIRWDX4wSF9rXgQM09FnHcv9o3vUbZO/1QhTRyxlv03tMSFXOLomETYc3X
 g6JybFjTzFEGZHSPR+DlC65RJxK2m8ZTzsJ4V2HGpFKTc23op3ASpj5hi5TDJ7+wsz
 cy9/emMOSHVZpQ6lfE1PEHlOPxH1JdquTypJqZPz9BasWRP3pOxZyzCmiuucGZ3hxa
 TbhVyoL5YwzZy+ybvXeY+ogNWE/K7vUejoaqtiIA557gJaA92f1H782yHQzoOUH7DG
 BAI6VSTy6jDpR+AXWBSd1Y/KM2Sqh229vdvoYNJYLYxlPGosiz0aAB3zm4h99prrN2
 vbDAcfM9JfqXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gYfSJgdb
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/qemu_riscv{32,
 64}_virt: Bump OpenSBI
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian.

On 29/12/2024 21:24, kilian.zinnecker@mail.de wrote:
> From: Kilian Zinnecker <kilian.zinnecker@mail.de>
> 
> This patchs bumps the OpenSBI of qemu_riscv{32,64}_virt to 1.6. The
> qemu commands in the readmes are adjusted to use OpenSBI's fw_jump.bin
> instead of fw_jump.elf, as the later causes ROM overlapping issues if
> OpenSBI 1.6 is used. See also:
> 
> https://github.com/riscv-software-src/opensbi/issues/372
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

I applied this patch on master, thanks.

I added a new-line before your "Signed-off-by:" tag to match the commit 
log
format. I also updated the opensbi hash file, specific to this qemu
defconfig. It was working because the boot/opensbi/opensbi.hash file 
happen
to be at the same version, but we have no guarantee that those will be
bumped at the same time in the future.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
