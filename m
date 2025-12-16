Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F200FD5C0DA
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 08:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E0184053A;
	Tue, 16 Dec 2025 08:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgMuCSJroeyH; Tue, 16 Dec 2025 08:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAECE40352
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765874162;
	bh=XzwDuDoMn1oAhrzs+ExKElxsw4oNNGAmWoLzeBz9FQ0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E24YWEb8awP6tCT+ZS75+Szr9krTcRZdXJok9y2sU/UKzZrXVzdlkc7hXOW+8JOlv
	 U0BYA1LXh9B7skaui9pkmcSzYFr/l5A0N1tO1CByPRJtqB1po41ihSEvErZifJLi8z
	 TgvtTO4rzl22G8iYnKM8/PRcGABb/i8dCb8St6cHQnr0gPAZeT/S9iUqEkOJgVB7Ng
	 mAaRdYOonDPacZtsaLt4IW1AkZLivz00phTTPR68DFukV3IT8Z26x0oaNsR+EbbHwF
	 7I2EWqzQT4px3GV1VCE7DI4Gb7YgB8chCZC19jdcsVBd+dVRqlUUOrY2Lc7xFb9+Gj
	 sRtoOjpsXhf3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAECE40352;
	Tue, 16 Dec 2025 08:36:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADC48370
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 08:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9491240632
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 08:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vp8Fmbkm10Mx for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 08:35:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E4704050B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E4704050B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E4704050B
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 08:35:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 874184E41C2B
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 08:35:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 45CC16071C;
 Tue, 16 Dec 2025 08:35:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A5D021194318D; Tue, 16 Dec 2025 09:35:52 +0100 (CET)
Date: Tue, 16 Dec 2025 09:35:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20251216093551.78ccc5af@windsurf>
In-Reply-To: <20251202195845.1666460-1-bernd@kuhls.net>
References: <20251202195845.1666460-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765874154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Prg9L/QDqetO9K4TiyVvcQy/TYX02MRYli7IBoZVdpI=;
 b=BSqaeOBw742kvKjJNA/+/8dUCwKgLAAuT8Yyhz7GNxKT9Omf31gDpZQCzCLOde9OIiQ31j
 V1mbhVyEaO8mNX8Tquv1BrwERuEE8t8GxoIHwAP20f7qNuCyfePpq1f/TuTMWJHeNqgeWT
 6gtt5gTeqVIwoSvGO4EkZhx1Wx7MxaIbmpBZFpNcKa94A95KyTwFNDEolrWbB6d4JWs98c
 nght6Jdm+GFPXtOaITsITR1uzbyA5FfNmNVL1eMc4pHpNGB0IAQFFErgGeesC6eanGjWXc
 toZzwXA0re6ytgLqRupQolKP0cZrHS1vCXpbrgYdehcXyK5YvCofmnCtuxFneA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BSqaeOBw
Subject: Re: [Buildroot] [PATCH/next 1/1] package/cegui: bump version
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

On Tue,  2 Dec 2025 20:58:45 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Added patch to fix build with cmake 4.
> 
> Removed patches which are included in this release.
> 
> Updated dependencies and configure options due to upstream commits:
> https://github.com/cegui/cegui/commit/36c0eaf629b46bdaa3448d20d46294cb0dbc6db5
> https://github.com/cegui/cegui/commit/c9adaa03d67e2ba650e063dc7b60c63113ba6cf0
> https://github.com/cegui/cegui/commit/20f5ac6658ce151e73772906cdb9be93603c5064
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for your patch. However, it would have be nice to send separate
patches for the CMake 4 issue (affecting master) and the version bump,
as they are unrelated matter.

And indeed, cegui doesn't build properly after the version bump (see
below the details). Therefore having separate commits would have
allowed to fix the immediate CMake 4 issue, while resolving the version
bump issues separately.

This defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_CEGUI=y

fails to build with:

CMake Warning at CMakeLists.txt:601 (message):
  None of the XML parser modules are going to be built.

  You should ensure that CEGUI_OPTION_DEFAULT_XMLPARSER is set to something

  appropriate.


CMake Error at CMakeLists.txt:606 (set_property):
  set_property could not find CACHE variable CEGUI_OPTION_DEFAULT_XMLPARSER.
  Perhaps it has not yet been created.


CMake Error at CMakeLists.txt:607 (set_property):
  set_property could not find CACHE variable CEGUI_STATIC_XMLPARSER_MODULE.
  Perhaps it has not yet been created.


CMake Warning at CMakeLists.txt:654 (message):
  None of the image codec modules are going to be built.

  You should ensure that CEGUI_OPTION_DEFAULT_IMAGECODEC is set to something

  appropriate.


CMake Error at CMakeLists.txt:659 (set_property):
  set_property could not find CACHE variable CEGUI_OPTION_DEFAULT_IMAGECODEC.
  Perhaps it has not yet been created.


CMake Error at CMakeLists.txt:660 (set_property):
  set_property could not find CACHE variable CEGUI_STATIC_IMAGECODEC_MODULE.
  Perhaps it has not yet been created.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
