Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F44CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 776ED6066C;
	Sat, 10 Oct 2026 07:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJuCC_cLgtQB; Sat, 10 Oct 2026 07:06:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4A2C460663
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791615960;
	b=itTX2iWKuLe3/O1avI2qbXRdrgrHCrYMFPafuvdXFftzMye4UkYHR7Se7IP18XTDx/O1
	 wCbJCT+tQBQrMhRLDnzaDY86kaB8lQJbm0ChXMhnF1sZl6DOpcMvM5WdPvUS2Lfv2pnf4
	 YOyoAy5SAGVylIDCeYCPB8x0g5AMfNPuRjpDLSKnaOSIO7Bzno5NnXcflCulo4MROetM9
	 HzSxl1coIOTbTU1DmFUUJJJDlYHFMQrdfNyP/XD1svg6CU2W8Yuf/ZO8ZwntGxtqYo3is
	 A9IFMAhcd+S8ukcS8hw88JFwz0LgHQC5vqHlqvsUiv+1cpBhnJxU3j7y5pjyllJehOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791615960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=l2wJU2uwLUGVM3Btm30gd3bjsMu6eD3A+gmX1zXmSE4=;
	b=DI8oqP8nWHK0+fvKG2V3XTMO4p01QNS9ZYfo+YGH9Dgk2UQoyg8cpGoBeOUU2frTUtkY
	 VlVc0uI6m8T9rpDiy2fjE0Lb4sL2/gKS1ZIKwxxdE9JIhunALIyb6h90OKwObE2+UfLa2
	 6lbZl1YXjQPnQjZYJCFEPk1ng9HmejXfq1EVvqvuSDUZlXao6e5i1fEQfdSzgh2xMeQlI
	 i8iL6Wsr9av8Rri7xl+ozK139F1SYWEZX09QV7cTTHGAjD2WN299nZeSpMEajha2b79si
	 HkKwCn3K9xWVfe/pPokFjpmv2dmlWO9vwVUoZoqSqAcgw41FPx5aOJvspBgRas+SsXw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791615960;
	bh=l2wJU2uwLUGVM3Btm30gd3bjsMu6eD3A+gmX1zXmSE4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P6/C0HjrqgWRCRRqpJ6yGmqL6ERFGW620tDrLezHKnENvISY1cdeQJcW3hdc0RxZq
	 vJiAJrmmPfJK+AuAB3pEKzVWULYzQs4aqNo0SbhkWgAGSuAM1cRtBxe6kARI/esC3B
	 eRaxGKJHcFXjUC0yMa2uAn6AQ5+xbRDALaquQipMZjQiwrfsenMcxRACgignvbU01u
	 bL2J4wJYYyCXAkr/dw6l8AhfEqs9ZKGQ1MA1CXjznAAWHti3mCwbq4Ciwptb303PCp
	 262e9sNaSFTynItOb+LFt09/xP5k4SedbfXSyWjMWlHHht8Lp4vgDy2mqZmjtaTu5y
	 TrTQWJovQTFDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A2C460663;
	Sat, 10 Oct 2026 07:06:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5E9375
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B3BB40068
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUIuzMCffKt0 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3EF9C40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791615957;
 b=TV8jGESYg/c9oioVakM/VU91NCZDjlAgSdo8jkv9OHkLyPY2r75YRNGj4geTNuaD70eG
 vsq8Dg7m204UpOD0qcnmt+TWTTumqyKtPwQPk25gASK3zqDeTnuhOqIK5rBFbiYGP1sQQ
 iz+LMZpi+Vd4G18PO2wk4OsR5W8Kkd5hd97XfmgkXvC+3jbTUSOGYfgDkFTs/Do5QvNq8
 ig1oZWb/M5J+q9JVLiqva99y9V8+Gasek3RhTcxxisyoErnQgUifzKxaprtuR102C2MVK
 MRF9GPWwIm11/XlNImEs0mqLnDp5Rv2UNvPiHSJnGVHACHa0p+6eOXDdMGNhzldcT+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791615957;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=IgOZzuUKtZitsCmFm7fUmL5/Sh10oOs7cLWeM8w4KSo=;
 b=URXfzULnlnoyy9J6IDYqE66eWwaIJBcfGFtnNoU3h19cPreqFqKRWt2CV5vPVuENYM84
 9luTCKsxpanA1a2om3hoxBVHJ44ADp0qGSCVa54E4HkllNqiC4wC1b+ZjXQKxYWfoQDiT
 1JO4Hke8b/L3GtPfJ9Bt+SpvFHeO7Thv9CJH3yGx99weR6PBYFRXi1hCGC26sJf+vuIIg
 OOhNk+1xHHW8bews8qgHVoYNTJRpvLCzgk9CX3/1RD7pCcX9KefOq8SvhA7gp3/caHUyr
 3/0OiM+er9e2yml3rIijMAlqB+N31TXfW0GE6HtqK4VkCJdDKNCwIFCVi7ogQ61rWkQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xcGiVEHi; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EF9C40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:05:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0FB154E411CB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:05:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CCD7C6075C;
 Sat, 10 Oct 2026 07:05:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C437211D70BC3; 
 Sat, 10 Oct 2026 09:05:52 +0200 (CEST)
Date: Sat, 10 Oct 2026 09:05:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asniCZ4ltvtZWCh5@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 00/84] Bump libopenssl, python3, kodi,
 ffmpeg
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 06, 2026 at 06:19:41PM +0200, Bernd Kuhls wrote:

> This series consists of the following parts:
> 
> 0001-0003: package removals
> 0004-0056: - version bumps that provide compatibility with OpenSSL 4.x
>            - upstream fixes for packages without a released version that
>              provides compatibility with OpenSSL 4.x
>            0006-0021 belong to the boost patch series
>            The luvi package needs to be bumped first so the upstream fix
>            for OpenSSL 4.x can be applied
> 
> Until here this is the latest version of the libopenssl bump series.
> None of the patches 0001-0056 depend on the libopenssl bump, they all
> build fine with libopenssl 3.6.x.
> 
> 0057-0060: build fixes for ffmpeg 9.0.2
> 
> None of the patches 0057-0060 depend on the ffmpeg bump.
> 
> The following changes will break bisectability...
> 
> 0061-0062: bump python3 to 3.15.0rc3 (RFC)
>            This bump depends on the ncurses fix
>            This bump will break kodi 21.3
> 
> 0063:      bump libopenssl to 4.0.3
>            Due to the python3 bump no new breakages are expected
> 
> 0064-0065: bump ffmpeg to 9.0.2
>            libcamera-apps 1.10.1 is incompatible with our current ffmpeg
>            version, to reduce the impact on bisectability we bump it
>            right before the ffmpeg bump
>            This bump will add a further breakage to kodi 21.3
> 
> 0066-0068: version bumps to prepare the kodi bump
>            These bump are incompatible with our current kodi version
> 
> 0069-0084: bump kodi to 22.0rc1-Piers (RFC)

If the python 3.15 and ffmpeg 9.0.2 bumps break Kodi 21.3, isn't it
possible to bump Kodi to 22.x *before* bumping Python to 3.15 and
ffmpeg to 9.0.2 ?

Generally speaking, this series is too long, and you're reposting it
too frequently. Can I suggest that we try to iron out each topic one
at a time?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
