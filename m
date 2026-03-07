Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B13FF5510F
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 22:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17EDF40884;
	Sat,  7 Mar 2026 22:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0uepDq5D32U; Sat,  7 Mar 2026 22:12:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F61840857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772921556;
	bh=Ha3NLVXZ4KFfTHrtbnfxV4MGqWqBu7GWlo3mxi8vbMk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ebGJKoa3UrdsGXmCE60Nd+gRiExKxIuTuO1Rl35pIifryRbMDyLnxcrAVD64qfNk3
	 /KFDYyIS0jschm1fYu+VkBiRzuqP8NurmGx1kpxpE6HDxVEtYuS+lOz/4KEx3Of3dg
	 ih5F6vh5yE4h9BZF/iUsZRVqb98On2oKf4krJetZuzL+IEZmnWbrIXLf20moOyOAYz
	 TqvBdUSVX+6J2M+kCa8EABjnEKppj8aBaaX7GtZSyXIT87QDTpendPE6xGbBx9v5Hs
	 Dh5jJnTa2i9Kdr1LofteQa8F4aDnb3MZYhTE2xgI7SbDw5zGGOnn97MRhrPHKeH/24
	 FXgBCa4fE4FpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F61840857;
	Sat,  7 Mar 2026 22:12:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4329223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9D78403FA
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OERTP4EH3byJ for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 22:12:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D353E40075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D353E40075
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D353E40075
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:12:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 450FDB00535;
 Sat,  7 Mar 2026 23:12:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 23:12:30 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 23:12:30 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260204113551.1606741-1-buildroot@bubu1.eu>
References: <20260204113551.1606741-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.13
Message-ID: <a2a23dcce7e16dfb1262ce888f24731f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772921552;
 bh=1sQO4TwOzsPP7rNMMfmZ3jQhGBlZKPNHmf8Epd/wVbw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QavDEsA1GSavZelCBblwyJBr44A3xC/IbEmQsrhJutimx8chDtVDr82Hztz5auNyy
 DbmbNyx9W9NSmrMf1TofAQ0aJUKvbpiHHEheVFrHXR64a/ivg9EvzMhby92DNyhY99
 lik/8k6OEztU17t1tVLBPkn+lAbW0iMi5Tb7Xo815T47TKDw+LjWj0PbIlUG+tD1WQ
 rLdhJ7gn+/fc4mTuGVlpCPvqlIbbyYDTBAuIwJI5JB7ytAtk4MKQldfZaTKp7XbN6z
 /5FanjBusHR9cfn9+ecaUeOm7kyAi1LxnkMx8gssNj2Nreqc4howMBnUjJVbIcfWww
 cWr8c4dea1X/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QavDEsA1
Subject: Re: [Buildroot] [PATCH] package/mobile-broadband-provider-info:
 bump to 20251101
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

On 04/02/2026 12:35, Marcus Hoffmann via buildroot wrote:
> The package switched to meson in release 20240407[1].
> The download url changed to gnome's gitlab, no more xz tarballs are
> available, use the bz2 one.
> 
> There is a signed git tag, but no signed release archives and also no
> checksum files released, so the hashsum is now calculated locally.
> 
> Release notes: 
> https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/blob/20251101/NEWS
> 
> [1] 
> https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/releases/20240407
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
