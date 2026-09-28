Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B11CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D1E980D66;
	Mon, 28 Sep 2026 11:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsOcjkduPEXP; Mon, 28 Sep 2026 11:25:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0B05180D45
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790594737;
	b=Jgl/euKDDbQphmYQy3rmvwqf5fBEkW346DrQgB1y1QNwZwqeA8EAgCegvK3VQGU7gFfU
	 EK2Z2S1maAWz7/Ss8xcfb4c5fLM3jvQAASz4GJaqjDT3AGDqn7Yg39zBL66O7TWzMsz/4
	 E3eeene1iy73CFQ2vc9fIENOsxCwr5qLwv1kWYaKAr8uTNJtXOYoSo76YSCiMGS1XfMFI
	 uRyUHgfHk4h7cn6aom4yo9nhp3ltPLsXPH3IHXThul8kBXWKm9loD66de+9zjMDGomX7T
	 RC8HyrqqMlGE7c3XLPKUM1JFH/AVLWbrMLuiXDlIZVC6Jpd+orYvPchLEPmIco8fPGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790594737;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FehlUyd+ShY2Nju6XX14e9oivSvIHdO/ATnNakUG+GQ=;
	b=VppPXd6D3lVGeCNIVgxZAmxUF6m3h8mL09VgdtKonmeObltag7NrPMhC7ytGMGGaUD9q
	 2awkGlKCVHhI0rbQrtcbvRH3qNI+fbHyaXoCP7eaWCxJLMajADsHafyBUphNxEOLPgyjd
	 wSAgk6k/QNTg7hw4UA/Jpe3YDPjtLapWfPKA4sh0btS7O2jz3bwJgQUPD4D2ksYszRWGn
	 joKhDjnZajT8uvCpVEfCGkdfVZTqhsGuwCfPlo/uJtUZdNv961TxptEMxoEnlimlT4507
	 r1chJyBt3JrjZYjG3ZfaXAEoWLUsutAYtI9bjyazd8YlVwMZSK2ImwuYEsKxYDXHoUQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790594737;
	bh=FehlUyd+ShY2Nju6XX14e9oivSvIHdO/ATnNakUG+GQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TPyhkkUplkon46APVMOXFHHGAafdt65kifm7wuUCc9GLXkJ2wPaCHmTghtkDozJu8
	 t6AtBPFx4sWCL9ORKPZ9JVqT464WJ24aW2znft2rxX1Ppi00w9hVhMMZeU40cMPmj5
	 5wESZZpbIqlp9lbsW59lwVikmrJQcSn9djdP1qmCaYP/Aa2+pVGulzrKxq0J8OWUwc
	 0Ogr+jRTo3B2NFAB4qQYy0/GBJg8NjGPeuqW3yUjla+8XMB3wc80feH9syUwF8ZBdh
	 25CTmjq1sWs/JzytpCJ0EGzJwbI3iI0awshtn7DAv+RBlOwRbAvk/EqUKyJCA196IU
	 hNyE4prJVcm6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B05180D45;
	Mon, 28 Sep 2026 11:25:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62DD83D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5491060631
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycjEnHye1HsD for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:25:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 869B26061F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790594735;
 b=PX69i70aekn8sNQlbarKEv0Lr2Ch8qqrRoxauuT+IRtDfByKxKG7+LmWrhLYIBMKHyH1
 cVI+Bcfi8fQyRW5pjKf+KReA6luPpxuHzO2JsShXolUxXa1XIb4CueuuDdFDvFqCrWfN/
 5zP5FL7/k+FuU0oy4es7TpfeAiOENXBCiklPIgfe4rB4SdC1cNh709z9/s2zNscsPMkZB
 9JzyNHSAD1YMOJ0IIvPM+67BM2yEWB2uNg1gccKzcC2ugf02J9iLwYr8KVHiHX+tC6iGl
 mvHCHJhK+KILFR5wRn1KBrPllXu8VrRE59ZH40SFQeW9y6PGDEWahm3F15yQtyEJ4+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790594735;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=08UHsn+VEXpWtN2bI8CzP88a8eN/w7ux9s4Mz1IRbgo=;
 b=R2rNt8dawjxoHFloic2Sfq4GFyro6YOgfJs42BvRf2L/kUYvoSKanrMCvNoltr6EBBat
 yQ6bJefi1KTiC+NfxITUmzUulYpoLO6VTkafnbfEjBNn8ojjKPBePTMZ0GVKflc/0icau
 bJnQshPQHk8VX9Khw/hItdqdzWeybf0pUkghSg96h/LpEE8b+mQAZd07QquYg4inbo+4a
 MX4CXg+jZ6c12KplKzrv6Pv/bABfNXubCWabw/EjZ/AqnF65EfLz6R/PMxbgEKy67WSL3
 OolQoc64aVbk20yddt7mKFU7+qqVIHNf0vkkU+yzzua7PfMwRyGPYSJspom8HHJCqNg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Cbn5ks+E; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 869B26061F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:25:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6B0641A102A;
 Mon, 28 Sep 2026 11:25:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3EFD9601BD;
 Mon, 28 Sep 2026 11:25:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 354CE102F1ED7; 
 Mon, 28 Sep 2026 13:25:19 +0200 (CEST)
Date: Mon, 28 Sep 2026 13:25:18 +0200
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
Message-ID: <arpOmimUoTiRSdAo@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-64-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-64-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 63/82] package/pkcs11-helper: Add support
 for OpenSSL 4.0.0
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

On Sun, Sep 27, 2026 at 12:42:41PM +0200, Bernd Kuhls wrote:
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
