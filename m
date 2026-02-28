Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C92FEE4EF
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 14:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5C3E82D40;
	Sat, 28 Feb 2026 14:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQDFBNiKyvVO; Sat, 28 Feb 2026 14:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59EFA82974
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772287996;
	bh=Dm+wu5WIiVFvIpy0258mqtCPi6KcGNUZSRsvh8LI4VM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lMhdwu4zx7b7HCjYSuOUUPoWaXditE/KXNj7497/eslsn+wdTtknikgXidwhtbNLI
	 A/yk6y76jLmupVEvFInr+I+6mZRdCOsf+Aent/mTSg5TGOuwJzHHPZ3Mu/LF8R0hKu
	 Ivp2xLz9k4gt8/EPldwZETudRMbmBvGMjST/BxWOsDGULDNQ0im2h2VHM2qt718aCR
	 N+suBghcAoN1AThC39MNjYr7vEq0YzLmc2d4rsjrBIha1myViNTgw/49J+k74bpWJF
	 XW/JMIJB3WPT6KOfjExd6HCcQbGHLXRMiX1Y2fqH0vybqBSjE+patFvrKnk/I8zRy+
	 mMbghagsGx8yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59EFA82974;
	Sat, 28 Feb 2026 14:13:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 435AD1D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2946E607C1
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJVBUW7-kQ7V for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 14:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CDD360600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CDD360600
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CDD360600
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:13:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 42897780375;
 Sat, 28 Feb 2026 15:13:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 15:13:09 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 15:13:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260226201334.905458-1-bernd@kuhls.net>
References: <20260226201334.905458-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <10f64add6af76237f7708261edb9f286@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772287991;
 bh=BIq3lXS4w3ISdI26Knj+a/fBygyL7ZbHcMFMxqpfa3M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rZvRt/D47xG8AXkDJAYnR5HGt9kkonxIs/767g/Eq9HwP2n6j8rjlyM90U4JxH0SJ
 mjdOZGZJE0dTvjlPz9q36fwmv6vQoG+rWcm8l0NpVO2gKIdYZJ1JeTxdalO2vSjipx
 SMUa73fZz2uT2WmqE97TgARtR0a1P48Zr+9QonexF3GClTtUSrPDo3vKd0hGDzdeqd
 kMSzQLAUVmS6zX36sxE7O4u4dU0mV/oIORnrOeTnWiDcx/LwojO3N7EfwXgkfXTCYu
 VucHrK7xG+Ph5Ykkju835RVn1dRVbiaWYZD2A31gxe2bCwv58A4iCx2jXxB+D5mSyq
 8asZnuuGC2lTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rZvRt/D4
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libeastl: bump version to
 3.27.01
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

On 26/02/2026 21:13, Bernd Kuhls wrote:
> https://github.com/electronicarts/EASTL/releases
> 
> Updated license hash due to upstream commit
> https://github.com/electronicarts/EASTL/commit/c18a037660ee213e9546edbbbddf31634af11a56
> 
> Added patch to raise make_minimum_required in subproject EABase that 
> was
> added by upstream commit
> https://github.com/electronicarts/EASTL/commit/c530255b690c9d14feff249f5753824eef9ed818
> using FetchContent_Declare which downloads the source during configure
> so we do not have a chance to use _POST_EXTRACT_HOOKS to patch the
> source code directly.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
