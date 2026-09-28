Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DD4C9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D27B80D43;
	Mon, 28 Sep 2026 11:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0P5CbVHf5VC; Mon, 28 Sep 2026 11:24:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DA6DC80D35
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790594683;
	b=Ry+rELeXQbPpizSD4Lu0RbCY9+3gTFMnl/eX4kz5wg0eY93m95HF/XkXw3oz/ScwY5XI
	 Qoz7BIH9GOOZ7Tb3HTf0+3PrV5Wsj4SZwrJBqT5aosiwJpIM1r361Xqtrzn6oH9yMKLhr
	 DtKiHc2RlaY+DtLakivXxxJ04tEshFJVZtMwDdex3xXdw7KLoKZIym1kWNuEJMIyaBzVV
	 XBC/7wnfKWA09GAQVft16uLxdcFgB7Cie/hAsGsryTNdnr2VnX6QE6NXC8SCyMXtHDvH2
	 UbxD8vnmij+s3Id6pYlL5eniCODEvNT/2cdySs7C1bP8mtXDhDuVLNHP6mgB2rdDIiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790594683;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DwfGsXXh3nc8T9jVqkHBbsvccXYGTjhGi6s+jnhJ33I=;
	b=H0Xbpvtqlyk3zANAGpRakKmur3/GT5dQZS0oU/1aYH4/E9FsKJjGU1i379vicgzccDvk
	 hPCHWNYaTixSYS3OvVs0jlKy/eAHsE5iFnv6Gh08paFM1cp29mSufS2tN5SBrVcde/1iT
	 +xk9j2D+TyWUcB7bKHhB4uo0pW8UH0XVRaVNKzqOTI/mkJijX78LV+UPcP9daoiMiXEhu
	 5sUPQerl0834R6OjuWSg2uuQjFTxr+NojCjycVr3WMNVjlGCz05vSMXmJyXSPxZ9uxEDA
	 vgoAZybGarSky7r2lHgJNOPPfOTcNb+vW6r0TVc17sdHUIbfKSPmDFDQjzSSTDlZbbg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790594682;
	bh=DwfGsXXh3nc8T9jVqkHBbsvccXYGTjhGi6s+jnhJ33I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HRNSY9faRqDkQl6JHIGJQsQGTkY2oaVnemWjnqfuE7Rm0F6opqqzxdAK4rO17Ufj8
	 p8g/xNrCb84CLB9oGSsmAnR+Da/I06QaqbHQ2n6VvXZ6aZviUQJ95JfKAeDF5PG51N
	 APlUd40a5/uf4l39xKPD5ndEDN7vG85JfnbjpYj2oiIkjE8fuFLQUVqVpJwrV+0KHf
	 PAGL9qnUd0T+FwcLQKG2QxRkb0mcWk7bxzZGeMXcFYe/c+z2COYcbGTPbqtc1BiQ00
	 gphM6tVlZa+i9/RrynfIPbCU/hmRm5cYYAKjF6aAZILhP8GpyPkCpVHxIP0VpTobqz
	 izq9FV9U7aSOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA6DC80D35;
	Mon, 28 Sep 2026 11:24:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9179F32F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81EA160625
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id if6NE2XLXEmT for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:24:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2F4326061F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790594680;
 b=KcqY7G9QJQjIGjAb0oknpU9ACnMtsN3ZUe/CaCCoPQN3FEbgDM0m31tKpX3y457aMG2A
 gI/VIu0gJeXsFZtYJzlNVWkdbMacxzMw9fMcg/Xsr6WO+EFp1qnD0i3n52YcbzvfYolaQ
 mz4gNkeUklvSANAzUTfz2aqyYRPyrbhBFwtZeplhE4sfqhp8OBW5eaigIt7frBr/6ofhu
 3upeI5de7oCVUWj3Drw9gdgmPpf6wVicygu9KFnZRfCngDK3V8vdpJ3lqmWg4/x37B2hR
 EAmTqKcSxPxluRemOYnt/4Cwpel7PmCeH8i4mItJSoUdxC+5LSDIIaIbO1Ik8/iwSTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790594680;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Xc1OHJtLxhi0BFU7IaMwzCixnv3MEBp5jFg7Qe42IQg=;
 b=GS1xnNJ2axiu47B3EiJhUwdZ86wbzp0lv2pqvfiehNlAwIo7vkAp7C8DcyY7ZNFQk64B
 RstitHPjW6SpRwGv+dSGXxhrId1CnmGTpySj7Rm8o9w9+sAc85aIA6hCfQdURLvQcPiJo
 kgJCt8VlqLfrkskLSHJPAxDGtheBn5FtwPcP7VZbJuBVX873nIw9erjrBXkYlnxM8eWUD
 5GwNZy5y7tLtnC6Zo4CMPDeARzVzb4NRbmDMnMmbrjHaD8FjyU6+932sBlXtkYpy3wRzf
 La/coiU72bP9zKDU00wegv3mdEFX5wyNrMaqn40FEB6ILkTAYk9bzPwqyrofEUqK+Lw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZR7FmJVe; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F4326061F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:24:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6102C1A102A;
 Mon, 28 Sep 2026 11:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 31635601BD;
 Mon, 28 Sep 2026 11:24:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B159102F1E82; 
 Mon, 28 Sep 2026 13:24:22 +0200 (CEST)
Date: Mon, 28 Sep 2026 13:24:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcin Bis <marcin@bis.org.pl>, 
 Robert Rose <robertroyrose@gmail.com>, Yair Ben Avraham <yairba@protonmail.com>,
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
 Sen Hastings <sen@hastings.org>, Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arpOYrhQe0ps_RLl@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-58-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-58-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 57/82] package/mtd: Fix build with
 OpenSSL 4.0.0
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

On Sun, Sep 27, 2026 at 12:42:35PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
