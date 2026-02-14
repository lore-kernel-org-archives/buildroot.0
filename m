Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D61EF5851
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 20:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E264540B4D;
	Sat, 14 Feb 2026 20:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vaB4QnD2wIU; Sat, 14 Feb 2026 20:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4751D40B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771100738;
	bh=kOG+ApTGD9ocPeSnxAKCzHGgp2rTFdwtKn5M06Nk2hg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VRi4jnBwe67xl7pYtjW5un3lBDXqkEg5bk0GmRzTeNeuzJe5if6dhXIq45UavFBFo
	 IpIqZA4ZqBKFVu+yraTBHU5QS8LxjKNDKh20gUAf84h8Kw+HHx4z4hIV3w70Ef08xt
	 7VNu1hBp54H9V/kgANFDEJk5M7elHKdfSVeAv66cH/U937IcBaX+J4xDgo2/3ykzK7
	 V2bjQ9aqoYaZE9CP5C14s1prYhSuuEEGo+6BgkaTZdSJZCG+sBkGyKyKdIv81LYXHG
	 ngOoSfXYcf8FeKEuAz/PGhrRHrDALITXwJH8F+txkKXBSQuQvMgxfIOWjBLm2Osv06
	 FUrCBcysRrV8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4751D40B3D;
	Sat, 14 Feb 2026 20:25:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF5D669
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD0688321B
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pe0XY2U6lrAp for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 20:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16E04831CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E04831CA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16E04831CA
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:25:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E2C01780395;
 Sat, 14 Feb 2026 21:25:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Feb 2026 21:25:32 +0100
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 21:25:32 +0100
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260214121958.212935-1-shirokovalexs@gmail.com>
References: <20260214121958.212935-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <c868550d04a6aad3260c8e01996c2530@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771100734;
 bh=wEp/h1op4cPeyikk6OI+ako1UNsYDL2nnARP+V52pbA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RmLF7wbiSmZ3TqkVADGwqjpa3U/0whnliMPZgqC6Ar0IchrCrSh2qHVKvdiKvSI89
 1yB+ePVdN5vImfO92UhJD4I/i5F7r2Wk8B3PNJnOjrfSHowF0ZCob6t4F1Qv8t5yQe
 guZe33nkWGaVGaHa/YKh9rMF1ZSbHmdK661eVFHYOWBg78N727JkfjAXSm03GGN6a9
 kmLVBUX2qXpP/n0KhmLcwPjMwVg/Xd5GN7C3O6jwPiJxZxzaOyjQjhK4/2tnH81D0m
 xdAFpQEsrH9wr7+tdhYNnCtDyNOd3WfIzxk0fqXznJQKaOLPHevTzq0RZmx1RDuKLo
 FoT2xWVLdIUCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RmLF7wbi
Subject: Re: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.55
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

On 14/02/2026 13:19, Alexander Shirokov wrote:
> Changelog: https://github.com/Canop/broot/blob/v1.55.0/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
