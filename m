Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1ABC5AD48
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 14:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C26780EC3;
	Sat,  8 Aug 2026 14:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrmVasf_F6wC; Sat,  8 Aug 2026 14:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71EDD80EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786200019;
	bh=GB91Q9u9n7ymn84oKZ5qJbSJ922qZZvEi1dqBkFnYaM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JekU7tPkGxVSWtQRocNMfHZFRAUjFbO0VfHKZgge5TvTI1cnnJC3fET/Y45Bpho3L
	 DLoVuwEAz3Dnqiu+U5IF62xVquA6EQufKGtV+8VZitvk5YMneeDT4Hfca6ejNAMeKg
	 P2w8rMjYpz4HgBooWCFgcvmb7h7eWmxmO2eu7H2TYUQ6Hrk/h3F6GURllSq+Mfwm5q
	 OW8P3La0Z6aUj9vvoxeZDrgOhzovl5XNmoMODAIqIXVIvERI6mzvtqXPxr9A178u3Z
	 V8bGzxlHrVCtm3KtpP7r4fwFYKHAL+d2VfArfKjPy01hIVLw3AYJEK6qmVeSlDpOSc
	 FJ3rbVham7ohw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71EDD80EA2;
	Sat,  8 Aug 2026 14:40:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B940218
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 612854057D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRp6v_m-KH2s for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 14:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2AB74054F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2AB74054F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2AB74054F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:40:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9A882B0054C;
 Sat,  8 Aug 2026 16:40:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 16:40:12 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 16:40:12 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260808130004.1231694-1-thomas.petazzoni@bootlin.com>
References: <20260808130004.1231694-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <bd6db4c34b2a04320b4e02df3851541d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786200013;
 bh=UuKirlJyITUXDJNU4bWG3O/vLpr25hrylZXv8LaEju4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PvKNQ6691leInNT3xKftSnopOMEAsWHBmpcHYXM5ijxtE9Z9iCsEnClFEVovdmzKk
 gB6/zZVaQdO9MXk2yFJiaSyWjS7ph9ODW2cIrS/sRvnBDK2VYM0nrpu1yP++bErHSa
 R+3tIJP9Crg8AXjcuQfuznDn9JEmIK4RVtWRp40UaLnqzSbhtxWVBr7OJSWHyjnB9V
 tQIBYspqk4WkZnkv+gq32pRP7xS0XLbgtXJm9VnshVrRUFAYohvs1mLFWzJYzsBRyo
 ffIe+oHIr9EzIwTFCziSJAwr3z+041ugB/QpYF+65tjklA48suEr7xrPK5KAEkkMaT
 acZ6avjommi8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PvKNQ669
Subject: Re: [Buildroot] [PATCH] boot/grub2: fix build issue since 2.14
 version bump
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/08/2026 15:00, Thomas Petazzoni via buildroot wrote:
> Since the bump of grub2 to version 2.14, the build fails on some
> configurations with:
> 
> /home/autobuild/autobuild/instance-8/output-1/host/bin/grub-mkimage: 
> error: 
> `/home/autobuild/autobuild/instance-8/output-1/build/grub2-2.14/build-i386-pc/grub-core//kernel.img' 
> is miscompiled: its start address is 0x9074 instead of 0x9000: ld.gold 
> bug?.
> 
> We are not the only ones affected: OpenEmbedded has the issue as well,
> addressed in commit
> https://github.com/openembedded/openembedded-core/commit/66aefeca482e2985fef5b936ff611ba8b7f81b85,
> and this commit points that libreboot and Gentoo have also adopted the
> same temporary fix: revert two upstream commits.
> 
> So to fix the issue in Buildroot, we take the same approach. It is
> temporary, and there is an upstream patch series under discussion to
> really fix the problem. But as this series has 9 patches still under
> discussion, we take the simpler approach of reverting two simpler
> patches for the time being.
> 
> host-pkgconf is needed as an additional dependency because
> configure.ac using m4 macros provided by host-pkgconf.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/89b/89b907278cada3d7ca1fee2d08d66921ffb4d7cc/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
