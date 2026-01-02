Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5F5FA3748
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 13:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81AEE40647;
	Fri,  2 Jan 2026 13:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dsr4VG1Bqt_D; Fri,  2 Jan 2026 13:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90406405DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767361312;
	bh=UzEKngd8l8mwG9ykUEeCrVpPXmKME3IrWO/w9mFWJ4E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mCq9wDFWAE5C4hjnbKq0zuoTYKySqKYRApCqPWdWHfIlshdsPyecmOxN+aPGSYqAs
	 COAt8Wux5DaEzbUvJqXjGl3H8m8luPdxSx8bAinmXJ7O5X+buqeUBQ4NtQWPYNBeTX
	 iw/1zhR97JFYtiO9JnnJePl1NLMYVHfISLDM1PVnkAHgRvoW/Ovhhdg0+MST3vbX7j
	 UmGEym3u4S9N0c+p/khm+754SZw7KcXunVSRpsdNTvRwjh3qi3LDwd/Jx6CRY6SheK
	 SZEmnmEvKaqOikWcERP4CeLzUhEQsJGfMaIKg3pZCXsJyOLYaf3dxZrHJYY5M/JUdv
	 KGohv9PTMrvgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90406405DD;
	Fri,  2 Jan 2026 13:41:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB2E0351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 13:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D16140416
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 13:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvJ-WIvl5T5P for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 13:41:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A3EF6403C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3EF6403C4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3EF6403C4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 13:41:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9B3CE13F88F;
 Fri,  2 Jan 2026 14:41:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 02 Jan 2026 14:41:46 +0100
MIME-Version: 1.0
Date: Fri, 02 Jan 2026 14:41:46 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260101183342.1930880-1-pkerbrat@free.fr>
References: <20260101183342.1930880-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <eeadbfdd59133907b6b116c8ee98bce8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767361307;
 bh=8r14nSMvpoGSJZGHFKTGd4f8c9OYrIXnR5bCjcsKE7M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IlN+Ln6MCrCLdOKsCxHKlo1Yk8K3reDfL3PGSysKDr/ADqAYHswMtNstsFT3vMgnE
 +oO+Ad14j9ATxe6PIeOmPsTVSLvm/nr5/eBpKBB0eG8NYchRN8BHijG6daYjMtLSRb
 gGSmksmf+M8H4g7lviARJO5j+7b72b0nOdWvhHT4WIlhDzODDlYoCp3H9+i39x6Oxt
 Jwr1dKcxzr5OE2UGfNkp2aHqwGFb0y/lUKCAM4UY683n8qyZK8ir4RwlQCbdcNRF0e
 /Jtq9W7LVfm64SuTX8AdyxWuXdR3sMHBpdnMm22jrh3P/sL9nGC7WV4+RnemHno3nG
 wMnB0uB5YXJKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IlN+Ln6M
Subject: Re: [Buildroot] [PATCH] package/imlib2: bump to 1.12.5
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

On 01/01/2026 19:33, Pierre-Yves Kerbrat via buildroot wrote:
> Since 1.7.5:
> - imlib2-config is dropped. pkgconfig is used since.
> - release tarballs are delivered in .xz instead of .bz2
> 
> Changelog:
> https://git.enlightenment.org/old/legacy-imlib2/src/tag/v1.12.5/ChangeLog
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
