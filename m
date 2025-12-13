Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BA5D59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 15:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF22980B44;
	Sat, 13 Dec 2025 15:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ou29uIwZSR48; Sat, 13 Dec 2025 15:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A8BF81F1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765641496;
	bh=/2Dsc9HatVzF31hCfcMjal8w2ApjoDw7Pq4CSOTT/yY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e6F2MFXMredgiZdc2nj+JEPpTP+RIALsXxiA5DPJXXewUhph8M7FsNY8xHCMY+U2C
	 /SdfTrH1uPv9qzQySye/JGWivbAe9yeSbjDqK2ZfCmhT1+5lVb3vTVPOz7mcivuc9a
	 HR7TvQey9TrRZX/zq37ir6TLPlGKl+BX1YlQo2So8SNurYqokCIxh/3vFjqjFdHIUx
	 cY0WRZV56XfCW4HOUAXfltsd5+7Rm3obb16AUP5hRlVvp+98CWtjh5eXqNSA+tckXD
	 YjP2D560mBElz1/JmfvwZ/IMF1SsI0bkoNvdrBi82StVW5rGifR+82LSEQKLVvs76d
	 ceyNIaSjjbuPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A8BF81F1F;
	Sat, 13 Dec 2025 15:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B5652C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71D6381F1F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTlUbAdS3rZL for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 15:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6299B80B44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6299B80B44
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6299B80B44
 for <buildroot@busybox.net>; Sat, 13 Dec 2025 15:58:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8714DB00592;
 Sat, 13 Dec 2025 16:58:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 16:58:09 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 16:58:09 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251212085421.76507-1-francois.perrad@gadz.org>
References: <20251212085421.76507-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <bf8d7a90ae96e613006d805d2ff603ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765641490;
 bh=RsQaaOXHIFBKHkFdFdaF+HQj4cA6QtOTXuamy87J2Kk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HQ14kq/xVefWutkL+yOm8knR7lobYTnBIOhooV3U8vGkV941gSl5WPaQNU5Mb0PJj
 i9Ijs4xNk7P29d6j8FUHY+v2jz4JIuELWCt9wZSiDuCCEE3k0UsaCOvRn4P16FEUUb
 +hBLFRsAleXwC1UOadvEX4uIgWAHtxBK9CJhcC+0p7B2D094M5T8CpJZEo25mvBN9y
 N7sBtCDUSTvzK2tyi2dC68dsFppsxR7w5rlvUKgU6iEUgx4WE1z9XiKOhvK9fFcq/m
 D9AJJs9WL3IQpMYhOc1amtWzXvKNJWelJe4IYtXoV263Eqo/nt9BASE2cQx0ckR6R9
 Ur/nTHYBqpMrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HQ14kq/x
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.42.0
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

Hi Francois,

Thanks for the patch.

On 12/12/2025 09:54, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Looking at the release notes of this version at:
https://perldoc.perl.org/5.42.0/perldelta

I see that this new version fixes:
https://www.cve.org/CVERecord?id=CVE-2025-40909

The other CVE-2024-56406 mentioned was fixed in:
https://gitlab.com/buildroot.org/buildroot/-/commit/164c84ee9b820f5b21e79b4d52c07a613925d3f2

Could you confirm that CVE-2025-40909 applies to Buildroot?

If it does apply, could you send an updated patch marked as
"security bump", including the links release notes and CVE,
please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
