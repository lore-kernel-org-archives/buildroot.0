Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A310AD3748E
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 19:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A34784452;
	Fri,  5 Dec 2025 19:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObevBKbLc6Hr; Fri,  5 Dec 2025 19:35:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A54B8445B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764963349;
	bh=XCvLIqGrkb+1pMwFy3PRXukCJHTGZuj+LzaMVWnMyZk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=deVFYkDyHo5lwDbPQKItLwPl956g+21TIOQi05wbZfUIuFXWjdfzzScSRnStxnlmj
	 Okkdoa97tsH2Kz9GoGtN9b9cOe6PJmxDXHrKt0pCwwCEgvW9S54Lnl4qo9ND4VBci3
	 oAwkJMR8/kYWkXOdLx7vugdMPwQ968MN+JHla+i+Aj5i0BnvT6e/oERWErO8n2xc+O
	 C1x+fLjYz9D83QK8vy4AV3EsmJevR0JvjGEpHcprseijBSgjNk1NzqBI1OhRlY2qkJ
	 UuvL3JL1J3e7f2vSBOt7CROoXEapy7ZHkh0d+Qk8k0JUVcYTEZSdu7p8NcTChp59Sj
	 IgdQg92NnfLYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A54B8445B;
	Fri,  5 Dec 2025 19:35:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60E7E258
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E95940209
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGMOWU1rtJ_0 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 19:35:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50A9B40109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50A9B40109
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50A9B40109
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:35:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 07DC34E41A72;
 Fri,  5 Dec 2025 19:35:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BACCE606AC;
 Fri,  5 Dec 2025 19:35:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7411D102F170A; Fri,  5 Dec 2025 20:35:41 +0100 (CET)
Date: Fri, 5 Dec 2025 20:35:40 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>
Message-ID: <20251205203540.7fe5d366@windsurf>
In-Reply-To: <20251205193057.1884663-1-bernd@kuhls.net>
References: <20251205193057.1884663-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764963342; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FS5za/ed9J4G08YO+BHYzX+PbB8DodpI5L+qL5ukg4g=;
 b=pfMI3JTNfFL3NRi/81hUTRh3hbffjC04IxstPLs6fGCskLrQwEvovurYRJCt7Yz5Jws+K/
 lnO/UExyiiTcdVpChYsOZQmYp3niJiMdUhZJe10OnxU1s/dBHcck8Mk1gyNE9+ylBzZgiw
 srFoqekvHSHStxQpY2rSsDqyymJlX57vBL66rqoWTnfh1kV+MuiTqSQRvi3mWge7JMvsEx
 6if68hxc2jvDCDTqd3+f1MoohAUZCoFNKDUUpa9fo+4zfiIdOCTxFErl79HD0MGXDLMoxu
 3Z5sXtAd5LT5cdQp6LlMfWBXjrXuLMTVB4Bu590aG+n2judpPEDdBJvTVLY+8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pfMI3JTN
Subject: Re: [Buildroot] [PATCH/next 1/2] package/libsidplayfp: new package
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

Hello Bernd,

On Fri,  5 Dec 2025 20:30:56 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Replaces libsidplay2 as dependency in mpd 0.24.0:
> https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.6/NEWS#L125
> https://github.com/MusicPlayerDaemon/MPD/commit/7e2538e07a80bd12baf2e7c328e7d1a64eb434f9
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/Config.in                      |  1 +
>  package/libsidplayfp/Config.in         | 13 +++++++++++++
>  package/libsidplayfp/libsidplayfp.hash |  3 +++
>  package/libsidplayfp/libsidplayfp.mk   | 20 ++++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/libsidplayfp/Config.in
>  create mode 100644 package/libsidplayfp/libsidplayfp.hash
>  create mode 100644 package/libsidplayfp/libsidplayfp.mk

Thanks for your patch!

Could you add an entry in the DEVELOPERS file for this new package?

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
