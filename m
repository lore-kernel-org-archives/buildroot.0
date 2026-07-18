Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DE5C4451C
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 13:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECACB80F8D;
	Sat, 18 Jul 2026 13:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwN4jkTt4DQU; Sat, 18 Jul 2026 13:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7FC980F84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784379644;
	bh=ZpLSr5kN2kj0qUOR2oeocHcH00SXeNVOL/aE5zJmYiY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PX3s/NvBdBhm2qTG87YPGYtRtrJcSZvrbPIXl59IgttmGkTOEXPKVrCUiFlb6h9b6
	 d/ZAw2tss5sb9Hvo2uOuBEioRRQpRWdAhyhz3VT3FoDFSPNLpkoP7QSTqycMfnl500
	 CqTnbYj+fusYwW9lqbpspVjwfI2WtedEVRHUDG71MJsD5Bdf9wcsgfuIikhXI2nmna
	 MpzILt2n42c/Q5ZJNm8Mqc3Cr9mF8doP/FLw+p6q+vOaS/Lhc+uija5iVv1Knyfmt9
	 VLDuXz2BDtJZvQu3t2h1SDv6SXPChnLik7lj4IzJMlpULk+E/XFecFnnsuaGI5POsV
	 MBnAFM0bYjFAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7FC980F84;
	Sat, 18 Jul 2026 13:00:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D920736E
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 13:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C00FB4081F
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 13:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oa7npSHsLx0D for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 13:00:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B3B124081E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3B124081E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3B124081E
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 13:00:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4FB6DB00548;
 Sat, 18 Jul 2026 15:00:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jul 2026 15:00:37 +0200
MIME-Version: 1.0
Date: Sat, 18 Jul 2026 15:00:37 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20260716130715.101592-1-maxime@leroys.fr>
References: <20260716130715.101592-1-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <ef93df3c6cad83681e6983505c2eea28@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784379639;
 bh=17QxzCBEOmNxiIazx0A6LZewGfdKeZzvHEpANi60KWA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dGOfUEagRyeTC8tw1CxBrbN9ffgolk99VsMCOpyc99WiYQJSkgFogIVqEDexhHM0a
 W//TyFjnE8GkhrnA3/73O1C8o8GpZuune40vwx8LKHesntslab8GKPPoJHX1QzrODN
 Zs3h3r7ZCJp+lfljQ8kTuMK6YwnPINrsdMxYwfIPCdWI4ZdiA2WvZaOgAnKhVWuQoJ
 ghvAEaxyT/829hkeudLihsJr59ZUuG6VegbGOxdH7Hx+wvRX8VeJ54yil9oAVt3mC3
 lu/8EADZRq1rppYwauN6+ssXp9vgejcm5EmBkkOvHpP1Jt5Jkjbl6AAE2xbqlEsmNZ
 hhX3Qd2QYrcrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dGOfUEag
Subject: Re: [Buildroot] [PATCH] package/dpdk: bump to 25.11.2 version
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

On 16/07/2026 15:07, Maxime Leroy wrote:
> See the release note of the new versions:
> - 
> https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#release-notes
> - https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#id1
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
