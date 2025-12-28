Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72EBD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 19:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F39A60A4E;
	Sun, 28 Dec 2025 19:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PJ2Hb2zewa1; Sun, 28 Dec 2025 19:52:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 961A860A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766951575;
	bh=JfVORki+LEmpVdK0VTEbfRsWwOTEfUekEc9oklFoqNk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YNiUkFVpl00XvA/4xZwcdbvaggQy+DS9MWWKfmVLJUDvEH/ftKhskGCX88+yjY3/M
	 xaVrL8NRkNLGzpTwE3mxwJrbIaLtC0DwqVBurmHAKVNrXTA/mAMEVuquYeqgWMi3Dc
	 V65JOtImqb9gR0pCjX+oEKa0ye3PKwgh59YnQAl7g1AslP6ydodKN3YmUO2GS4599h
	 BNvGQgmbFpB/R847a4d4fI4R/LA2A5nuouo33CpXx20qpeFhR0p0dXz2v2lhmQhAd2
	 JxUaCkOavgTK1TUTgmvZP6ur30NOci8zKjoSjhjWukATnU2XlwWX07Pb15KAlV1CPD
	 KndctTxUbN83A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 961A860A44;
	Sun, 28 Dec 2025 19:52:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72049D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50BA0813C9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUCH519sna2v for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 19:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B142813B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B142813B5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B142813B5
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:52:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 23F11C1D70C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:52:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 50CDB60725;
 Sun, 28 Dec 2025 19:52:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75E7711979259; Sun, 28 Dec 2025 20:52:45 +0100 (CET)
Date: Sun, 28 Dec 2025 20:52:44 +0100
To: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
Cc: buildroot@buildroot.org, Peter Seiderer <ps.report@gmx.net>, Julien
 Corjon <corjon.j@ecagroup.com>
Message-ID: <20251228205244.74e82185@windsurf>
In-Reply-To: <20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com>
References: <20220922214512.2098221-1-thomas.ballasi@savoirfairelinux.com>
 <20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766951568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=z2z7R+gv4A2DMM5vL8gRJVIuBAnJlYgXRdMWW2mtIYA=;
 b=0vneHWw6fZHefVRU1k3tfp9LlwWrDMFZjdpGer8kXbWpDwAcLtSVtcrv/SOEq8vYrikFyB
 8YVSy33cfOUYhQ7kjfvvW8jUx9VbOIII8/Wm1PPSpIGhBQn7tzdhGrDvBKZrZ7GjqrpiDp
 b3Zk1yVuHn2zydfmfsV9fG0Drm4sMFrhDwKYLHovf6ELaNofj1aetYjZ+tQsM32922uT+T
 9tOCYd1f3MTwQP8WR5gTeXoOVg3Kgb0UDd/2qdrmHodEDRHAknfCI8PUGYZw934ildnd66
 AnFLrQx5PAZ1CaxzFUwX5oR7tvzkq51eVIUo9r3lQUqGPtfJgbVvjapw0X80sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=0vneHWw6
Subject: Re: [Buildroot] [PATCH v2] package/qt5/qt5webkit: fix generated
 artifacts
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

Hello Thomas,

3 years later, getting back to you.

On Thu, 29 Sep 2022 14:13:50 -0400
Thomas Ballasi <thomas.ballasi@savoirfairelinux.com> wrote:

> Generated artifacts of the installation process were wrongly located,
> causing packages using qt5webkit (qt-webkit-kiosk and python-pyqt5) to
> fail at build time.

Unfortunately, your patch doesn't seem to work, or at least not anymore:

+QT5WEBKIT_INSTALL_STAGING_OPTS = install/fast

doesn't work anymore as we're now using "cmake --install" instead of
"make install/fast". So I had to drop this line.

But then, the build fails during staging installation with:

qt5webkit: installs files in /home/thomas/buildroot/br/output-all/host/aarch64-buildroot-linux-gnu/sysroot//home/thomas/buildroot/br/output-all

But I do agree that the build failure still exists, I was able to
reproduce it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
