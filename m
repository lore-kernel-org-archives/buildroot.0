Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FC9109446A
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 11:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1017884975;
	Sat, 21 Mar 2026 11:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BMVYsolv0M2; Sat, 21 Mar 2026 11:12:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 060F984861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774091569;
	bh=QnxczKXti9FACHTwIiUbpzmqtcaZSSsfUONPcBvjgQs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c3K6Gcm4kG9q0nCByFhxap1BiM114zqLbHGFAEB22wYDEdQI3BQXlyT6U4acJNXJQ
	 xbVbtsQfzStrQyGPL9lTwWBxG5bkbaqTPTHUnfZheIzOJ4b+doLRKbauAqjlT+4trm
	 RoB7P7bYu+iw3XXJLkEOKs/6IPaZRqn8vfujEp0HFoaHPKG0T0Oc4yuXcPN3Q08SiW
	 rd4kvKf8d5/5b0xTE3ga81EA/Nmg86KgHGK2WLDIEh+VowUTgwauW588IR40yr/8ho
	 btXYTmSc0PoLVmafoNIvuQfB4msutCH1OK96v0wkWzKCHmoae8M78Kf3Cdi11tWY9+
	 tuas5T1Sxb27A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 060F984861;
	Sat, 21 Mar 2026 11:12:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAF7E34C
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 11:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDB3A84742
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 11:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvY64lfQhMSn for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 11:12:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C18E384866
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C18E384866
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C18E384866
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 11:12:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 772A1780506;
 Sat, 21 Mar 2026 12:12:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 21 Mar 2026 12:12:39 +0100
MIME-Version: 1.0
Date: Sat, 21 Mar 2026 12:12:39 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260320065330.2390703-1-peter@korsgaard.com>
References: <20260320065330.2390703-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <f417f1f63d0667358f6dc260f68955aa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774091560;
 bh=vJX3x2Fs4WNV3qTUxNdF3TPKRoH8bzYvrQ6EerL50JQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BT+CFXl/gKtbGSraJfTXgiHKlcJH6WxsMarWcGQ0XgBNJ1Mu669Cg0SR7Np8E1sr0
 0WDtf380Z5E+piwGfxEfUyQoMPxV2kNPKrO6zTuRZntxKyk1/YFN2brSx3rxAyqb7Z
 IK1kH6wSa9cyZTAk17TwJ66WVO06QC1Y9k0x0FX2O5ugwBBJO+0/oFMFvybx69vLUI
 cyxxv4ac6rkyWpiLoBuN5D/5KRUUyHoS9r7RMPBFE8NYh2Osoe45sp2tW53XiFNIpe
 WMwsifoqKGVWe214WVvvtGvewwmG/AJiytWgU1ybz3/Zoxm618ylbmKnoxWz2UbGyD
 2fI/WDiPKE6Gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BT+CFXl/
Subject: Re: [Buildroot] [PATCH] package/wireguard-tools: bump version to
 1.0.20260223
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

On 20/03/2026 07:53, Peter Korsgaard wrote:
> For details, see the announcement:
> https://lists.zx2c4.com/pipermail/wireguard/2026-February/009514.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
