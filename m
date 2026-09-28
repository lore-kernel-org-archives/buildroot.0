Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EE8C9832F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 07:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 566C680DC5;
	Mon, 28 Sep 2026 07:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uK4Eekumilm; Mon, 28 Sep 2026 07:53:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 898C780DAC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790581998;
	b=AHMpH6kV48rSVXZ3a+KvM0PPy0yOgRm89Z+O+s2TooJOcJJUR+5bcxkoFSZ186y7T7tA
	 ifTdfZDyjbeZsAwGTsmZLxbgqUNBKyHSzxZ6HJexi1/2oDoahRUpG1uv65Xk5bggKfwl2
	 0XyzV/kv9Pctd56x+oj2FBDu7LJNr/ka/JojttYXUNVnaxuDIYHq36hlJMjMhSemoOFZq
	 v2xGxPETqxLbeR8tSh4wwJpn94hlP1r0GTQ6RnVj1kWxhZBEElZvoVBRRQtO/WV7O+uxT
	 hRvO8AXmk/I7mzmcAkNF99O6SM2++VNQJgGmCpWpg4HToRIhWcXOJ8XrV9sLEYEyalQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790581998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7bDLA+9qGB2kjNL1gkRmOkmVvJB2Dh5XbwDYPsAu95A=;
	b=QO9JYHcPuOdHwMwmaOG7ARnlhIOs+IbyTvQU/VVkgDJrjqFARADsGFZ0uLKqyQXKGA6e
	 FqXf60Ezr7qMmolaBrcRZefFtysOAU3R8vsQjYHPWfQSY0C2GXq098xjHfKgveP0PWStA
	 gr6PHZBplxErd+diN0uwIfe2qVtZnzES50fMm0I5jCBBuRe/DMytjd0pgqoydkxbeQSez
	 didci5T3pVxb3N30OqJd3jKpV64lWKF6wSYubKrzlp9BgHfz53hnJVomAPLW1eQqyP1o+
	 krebZFRB2KWHbvMcNkHcwfEoB5YvFvvTUYaTMvOzSWURjDFV59MLRRq4khjeKZqcovw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790581998;
	bh=7bDLA+9qGB2kjNL1gkRmOkmVvJB2Dh5XbwDYPsAu95A=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=THQDbEl2dsZgAWbmLqMhX/Gm3I3Qd3i7HopvCjg2sWHyqvLykju+ak1pATpHBNNQ3
	 wxgZBwRhPRlxuUTJkwEzjYdb570KibvPZ6A9P7yQjzQ0ZssoDaw5MsU5wGuWL7r2Vz
	 tOu3D7PpSspNKWZtFhIOLhbboZM57cYzf7LGAvGtTgb5pOJhFqJNCxMEaX1Tf7Z7SF
	 wcyps0hoUVV1jt8dSxZsl5nx5kjSLoZvR4c0mf3eHpYfZPVVjhxHdyLI77ZGb+5K/I
	 Pb5GJ8BU24DTVdTP1SsEuzlZsAhD4LOUXslN5INyVRsBaBpUXuCqZwUESFMvXCXFNC
	 KTzeGS6QSbN1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898C780DAC;
	Mon, 28 Sep 2026 07:53:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C10072
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4955740553
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yA96-SHkACaJ for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 07:53:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 131DD40552
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790581993;
 b=KPDJD/du6zuuM1gpT+o3ItGb2hYKRxGEUNJKorIXtVzjThABdZ3OBcGrFqit9SyisOp0
 K2yNdu55pVIktjr5jfdBWIQs9zB5vkPZD1ciAiCdEGhK/FlXaF5Ov0NugEW3RcPAan92z
 +IIhvhRj8y434sGER5Peg8eiKmW9JjEy1i5Z0aD4k1HFuWpBEcyYRkuY/yTdR1zq2F26u
 lGTclhRI0MjEWfiO7xOZziIP0USR1TbVNFVZzf1RA2sXk18qrFzdKmwk4pcPSzgAqdy/q
 IEuG3u7RayZzV0ypWv1tqjCK2CjSF+aQvA4sOojRTkxyd7fxfKpgCsKHJzHEe5P6cfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790581993;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ZcRsQYT8kFhrS1VA4UpICjyEYY4RV7Xl6rIDsJy7oIk=;
 b=RCwxExQyiuDJY9fLyHe6leupvqYXTNoK7qhP77NWFYvZ/cHUJDnPxWs+SPQKis6Utp87
 y3ioQ0sj7BEvYwkNMc4Ubi5EC5/7R/IGEPo845uw03KZmEe5obrw0kgNddgJZNizfKf/6
 /Cz4dZYuDIKyR+6qbHNAVabEJQGP0ITmhm4dGKUYalTxIDfNww7I6P2snRul2JyQZLOdB
 Y7Y76T+nHVEtttZVc9gmjH9aB0fyiGbIPbpwauY4n/T8s73Gd+EVqMG1/pAk1+7RikKhg
 ZNwDZjn61wy4PPlY1LUHHAMmyY64Kqbl5THcZimiQBTBcefNgiLFJmALOtFHox6azIg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dpgpGwuD; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 131DD40552
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:53:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D0FCC1A0952;
 Mon, 28 Sep 2026 07:53:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9D5DD601BD;
 Mon, 28 Sep 2026 07:53:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC20A102F1E9E; 
 Mon, 28 Sep 2026 09:52:57 +0200 (CEST)
Date: Mon, 28 Sep 2026 09:52:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <arocoPuLuM0sxzID@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-22-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-22-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 21/82] package/asterisk: bump bundled
 pjsip to 2.17
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 buildroot@buildroot.org, Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 27, 2026 at 12:41:59PM +0200, Bernd Kuhls wrote:
> Buildroot commit 7f48325de69ddaed921572edad875694a8154419 bumped the
> asterisk package from 22.9.0 to 22.10.1.
> 
> This bump includes upstream commit
> https://github.com/asterisk/asterisk/commit/5d543ad80ce6ad8a697cbd6c1938565047d26a99
> which bumped the bundled pjsip package to 2.17.
> 
> To allow offline builds we download the pjsip tarball so we need to keep
> the version numbers in sync.
> 
> The autobuilders logs show a download process:
> https://autobuild.buildroot.net/results/400/400e53158f11926446c11d22681eb8a9430caf1d/build-end.log
> 
> checking for embedded pjproject (may have to download)... configuring
> [pjproject]  Downloading https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.17/pjproject-2.17.tar.bz2 to
>                /home/autobuild/autobuild/instance-3/dl/asterisk/pjproject-2.17.tar.bz2
> [pjproject]  Verifying /home/autobuild/autobuild/instance-3/dl/asterisk/pjproject-2.17.tar.bz2
> 
> where the tarball was once stored in the configured download directory:
> 
>   --with-download-cache=$(ASTERISK_DL_DIR)
> 
> to be used during later autobuilder runs.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, I've added a Fixes: tag referencing the commit being fixed,
added a comment in the .mk file reminding anyone bumping Asterisk to
also double check the version of pjsip, libjwt, and sounds, and I've
applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
