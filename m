Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1273BC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE955406A0;
	Wed, 16 Sep 2026 21:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbpgfV_BAJB8; Wed, 16 Sep 2026 21:27:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C02CF406D2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789594022;
	b=broDKJPTu3J4wBWxgJvYWd+tg2dRsOhQ4cZmvea9UnycTFonPH6gpid62bZYke/uNnNh
	 A8tZd/JEAQ6QrXqsbj/CK/awV0/ERr3o0yzssEKh2mAo5S30V+mXijozZcxYFJwngxpa4
	 C3qDZt6SIvK3rePNms5nV4Q0tGlHwsXyVkGMhZjKY/NCgwWp10FFzeaCSfRoIeZJe6mFM
	 R02i/eXZZ4WLo22sORd21/G0krEYiWONeYSTcOHvCocTbTa1+cJvoIhcxWyg488tmEnNi
	 bPH6kfSlIi/Ecvqbaj+WO2qoBsuyDajtm53ggSYbPFi2vnn4L16J3ksJgjI3NgfRhvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789594022;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qTVNWrGWNZjPKGUvfIbl4ki+pZbNBmlFT/2JlhvF5tQ=;
	b=Pq8agNGUNzU4R2YVLKm09lia+r/QPjD6z6ZLEa0leNcdnZBPG7kUo3y15a8ylK0oR2Lz
	 fxR68SFIjdPKimj2pete9QXFC0VB39rLnL1AkUkriBmFpKuwWhl6i4TQgUtWUK09v9NlA
	 BP0h4stcRg/jaSiaogHZCZqkVBFPFCTTux1uXxq1G/o24sWWzeqYLtKEHvveQm6gBBuqY
	 OhHFPecY01XzGiIdTkak1+55kcnnkHixTvIGY1FH3T7bCZNirsKcaHa91QCkDXwb4VuPf
	 G2OwLXNgDDvr1ZBLfiizjKd6Tmz65f6Mg5RP1LtcZTEB9Vwqt+EBm/podoP4Q1ykBSA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789594022;
	bh=qTVNWrGWNZjPKGUvfIbl4ki+pZbNBmlFT/2JlhvF5tQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y9oVcMyOZWURRFjQNfIzXwzBxhEzoORPPeea15XlQxmDnc2dhVCsbRGbMc8FfDaSY
	 1X2C8QE3rYXdPFR5e67dCpgQSC5J2g3FBpfGNRuLRXyZWstcMJX/MnKTOe+GSu0TGo
	 0Dku1pmaHwO4jaDhvGtjtosHhq4T3Nw+BYuEghKb1Eb7boVNJL+X78GkCaTxGXWm9Z
	 cnKyrbHxN7y7XujyrTfNFDucqXW4i8q1Q+bn2OJkp1m7LV9gyJh2a1yIi3ktAS5gNZ
	 rOW2DO9PKFtKSuH7GetunJZnWhDTfILuT9NtmMeyrXJdewcRfD/a7A7uK0aRje5PdO
	 dk2882Wd1k9+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C02CF406D2;
	Wed, 16 Sep 2026 21:27:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A7A22EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F06086061C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4nBJoK6_PO7 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:27:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 99F43605D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789594020;
 b=pOsSYnIc1hfCOsuBuzHGzHSaZxD7GnMzstdTiqlGAVih0a7vxiHVEmlzxtIPYqAPzZS6
 6ebqvn8PK1GnxTU4i1AV6gz6NDZO91qt+XBAht5cvubUTMkPpfXjMnl/3jMxYE2hHYZgm
 XhCSohTWQUPRf9Q6SoQi7iJaf1wgjfKojMckA4SJUTxmYq3oxd1we5NQRgD6aYM8k2Vco
 MbZ8w1dZNA/iYv1JPHTqacyAS1Dw9HImo3pTIat/t13Ezw/JH7+mP0/CMn19JfCo9NS3W
 dJfnAdXcVWFqSYj1Zy7/z7zRfO34NXXXV1HWiywXGxMVtBTlw1+NXxeVVotwBUPdSiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789594020;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=J6fp+Ppk9BWwd4Sieyvtfe7V584ZcfMEqOkSGRX5EK8=;
 b=Wd0EziXpKXmblRw4Ct0kXqgAIzTSo4hQkWoSBzaT9zqTCOe04XZyucnSEHQvbyhIPuom
 mQD1SjT48Pkj+zl1fyC3K3NTx0PXOHUaFI2qnlu06kchZ/W7eDeJnXbpW8mwRJsSSY2A2
 4+R9cVAAixB5IDlMK10rTSCsUE2aCE2wlmQUgpFMwcwQq6rsugdznMWwyvJEtmITemltJ
 awS4vWhlLpVAYDTYLpdiK53n1gK81w14qNHQdHWDjzXlycXWRvpL1zCe0vjaB5vfYoxqk
 J4shvBCRt1efmyfcTq6aNhmrRKsL2lV+n2uw39+Zd93auIjdl0Bqxant4CoZehNYbFg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pXPmoszZ; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99F43605D6
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:26:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 376554E40708
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:26:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9BA3960337;
 Wed, 16 Sep 2026 21:26:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8550411C79C1A; 
 Wed, 16 Sep 2026 23:26:51 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:26:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <aqsJiM15FhYI3qt2@windsurf>
References: <20260906165149.1035063-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260906165149.1035063-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/boinc: fix build error with
 uClibc-ng
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

On Sun, Sep 06, 2026 at 06:51:48PM +0200, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/f10/f1015559e37d73403c396ee883d9a73fd167b9dd/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, but when was this issue introduced?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
