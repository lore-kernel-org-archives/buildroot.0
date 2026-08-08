Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439A3C5AD48
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 23:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F8E40545;
	Sat,  8 Aug 2026 23:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHLDEB3QgAWK; Sat,  8 Aug 2026 23:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06A124056F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786230298;
	bh=DeeP7/CKiq0JcCNmxVzAiZDjSUQKQ9w8wWnBz/a13k8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PHZFHDusU/KmMuVRpURvc7by2w1wakNFLBc5pJWBPfPvbx9ImLxnbzHKfWzcXi+aP
	 TAxQq38AaBNC2yy2THVqPIIO71qx5EVfbfuc1HKvUOYbhnnY4LasKlMtBOHR2ZBR+1
	 tXCp16UFKYP+CP6yRTKOy016mK8pRYsyennWxjjecbMMF1Qo6zxlYKnZIYk11F6nmL
	 RInzNfbop5sXGcdsW40QvcyaqMjO0EryYV5+r+G2mqwej7K2T62MMlGRQwvF/ctuti
	 nF9RkgSzyMoon56F2Eg+fnUthSuEBC4ikRxfT8DmRqIQ8jYygzqnHfcbMzVqwuytXg
	 JmZApCOV/xQ6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06A124056F;
	Sat,  8 Aug 2026 23:04:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C133D282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B342180D8F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYC34EL_ISc2 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 23:04:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88A0580AE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88A0580AE3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88A0580AE3
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 408E4B0053D;
 Sun,  9 Aug 2026 01:04:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Aug 2026 01:04:51 +0200
MIME-Version: 1.0
Date: Sun, 09 Aug 2026 01:04:51 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260808161443.1297794-1-thomas.petazzoni@bootlin.com>
References: <20260808161443.1297794-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <ac8bf4272415b05ca79f4839b607a2dd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786230292;
 bh=SbgzkfTJ5zfY0gatrYSoEV/IFufv+vZ6IEptXZnbikM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D9YZq3Owuuuo3S60wyhzHVF/myc4zO8oMxq4P53XJeozK28Wzwe7XDKu1KoaBA4Tm
 VW7aO1bTEbVxY77V9cU/G+1bKAlknIP/iWaHUhoyI747Q5FAj5osyosFKf4yPp9D/t
 Zb9rWr0NxEwQeSFEz2wu0UcwXXlVAepSPeurgdXCR3bLhwvJg089Wbqmx4dvmrsgwP
 eEOd7FuXdjuF7jSL0/mGAx5yfUYhsto4HrZ2d5/rs/Dg/pXu67jqvebQLaB9UeWFy1
 zVqocIfrX8Uv8qiVzIbHrkP3nGgYWnYNg4UTf2cMqc6kgnDSAQdlKtJxLmRtFxdyBE
 Xo0RqGv+ppveQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D9YZq3Ow
Subject: Re: [Buildroot] [PATCH] package/mpdecimal: bump version to 4.0.1
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

On 08/08/2026 18:14, Thomas Petazzoni via buildroot wrote:
> Changelog (https://www.bytereef.org/mpdecimal/changelog.html) 4.0.0 to
> 4.0.1:
> 
>     features
>         Add Cygwin support.
>         Update config.guess and config.sub to the latest versions.
> 
>     build fixes
>         Fix pkg-config files for custom paths.
>         Set LD/LDXX unconditionally to CC/CXX, since LDFLAGS/LDXXFLAGS 
> from ./configure rely on it.
>         macOS: use libdir instead of RPATH for the install_name.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
For info, I fixed the license hash.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
