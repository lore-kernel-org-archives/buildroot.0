Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116C3C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 16:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C184780ECF;
	Sat,  4 Jul 2026 16:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTytW5jpRGn0; Sat,  4 Jul 2026 16:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC41D80E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783182713;
	bh=SHsttK8r1zh/q4EAakOe1W893FVKKBf8QsvdsTRAdok=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MIoX72DbwvAXbk32olKHNQ9Dvig64yjxYsJzDFfOlaboUKD/uXrQixvIgedYbdJbp
	 ykmPLwNSnutAlCOf6yVDE/Hl0Aj4cxqObQVAiRzti132eDhk4AZGN8odA2CzsgClcH
	 p88CB0KLOuxQBNuAxrJaqfPm+ZWciPUjQK0CMOFTLg/HeaM1/erZU/XX2Fl+Z7crC2
	 jLvDydynzfiwdkjSvpm/rLnoLqy3lS2ZwDKR5vLzdrpjA6vO3cDvN8aHl8AMyPnxaZ
	 rg8mkJNuhoEBySegA6Pd+qlTY07DPV87ISdgvGoGu/xpRcmvTqIfkxcKYeOldg1Glb
	 BZxOPR/m8HSBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC41D80E88;
	Sat,  4 Jul 2026 16:31:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEFC1316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4FC54097D
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwB1eP1D4C16 for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 16:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAD834097C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD834097C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAD834097C
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:31:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B09B82003C1;
 Sat,  4 Jul 2026 18:31:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 18:31:47 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 18:31:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260703195050.3703334-1-bernd@kuhls.net>
References: <20260703195050.3703334-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <e3201335cbe34b6afde6db479a5db8e8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783182708;
 bh=EGbmJo6I611DowGpcRxsEYzaPDrMnUIw93pplho/xng=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KpebhG+a0QcEALRzH4rsm/RiSuecWIqgHHGDjOMwWn276vgjpx20HBZ0zg+Kl1ZZw
 MNslIK1nHB4IKwpzOPTdCYfWRyOEBIbLL+ty5i1YHsVRHhwghSBCdu7YpH0Iq7/+a8
 jUYc9WIcbvQsEUG8CNGuARvKTbZpn1HXCLUIeuzeiiUkj31OcHh/xHQy1JnlH+BUdl
 fEMAgxaxhz399K4giMVvFUPGLthtP21H6IU/8IHUQyMY3adj0qRVKI0vAhA32V98Bz
 TuPs9FAu9yjSDThXtHlXfkf6Up3K5cNxVs/bQiSQyTgSQXEH+GumT9hc4kBphdmeZs
 iAQn099yTTMeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KpebhG+a
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.5.3
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

On 03/07/2026 21:50, Bernd Kuhls wrote:
> https://blog.clamav.net/2026/07/clamav-153-and-145-security-patch.html
> 
> Fixes CVE-2026-20213, CVE-2026-20214, CVE-2026-20215, CVE-2026-20216,
> CVE-2026-20217, CVE-2026-20243 & CVE-2026-20244.
> 
> "Upgraded the Rust tar dependency to resolve the RUSTSEC-2026-0067 and
>  RUSTSEC-2026-0068 advisories, and upgraded the Rust openssl dependency
>  to resolve CVE-2026-41676."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
