Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB882D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C94405BA;
	Tue, 13 Jan 2026 19:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aB2VnwhvHQRc; Tue, 13 Jan 2026 19:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B056B405D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333584;
	bh=NKJ9E5b6nAdh7zMn2MOyUayF0WK9FBUzkDGtKrGtj0A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=roQM4hjqPigKErNUs0NvqUsNBYgp4H2tzLfU6Apgo8VkcpbzLRWe8XxNEQ40/0VIA
	 za7Kw+XgTwCXPfaPhUYE/vctA/0FemCF3VjkJ2KAQYnRLpaaCKySbITtM2BAQDak7u
	 KTYID1WVzTpkT26SWsGQxsOTeeRLYKYAt23/D9y1rVShad3029wuRx12x602mJ/T1h
	 SqI1BF/zwBfK3Q819G9BRSFU28fXnEc08ioqbat8h8Dp0f7QJ63gtfTuom56hY9FeZ
	 +MYLV/WliqZ6y/5I0xoLuJNknl6xylPh41QJDzdTZixJad2VC3A3M/Hz7En5u2+eY9
	 cdgXRr2fdjEYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B056B405D8;
	Tue, 13 Jan 2026 19:46:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FE251C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36C6960BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3lR93XQhIoL for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3086F60B48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3086F60B48
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3086F60B48
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35DC0B97A863; Tue, 13 Jan 2026 20:46:19 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:17 +0100
Message-ID: <20260113194617.98459-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228211045.3059593-5-thomas.petazzoni@bootlin.com>
References: <20251228211045.3059593-5-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333579; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=xyR/MsJbm+AkVOTK30bURp0/b59FKfVwCEIHVOPZrVA=;
 b=WVInS9XtqjErz3CtoJierRhWeodcp5t06hVLuCOXkUO3jsdLJT047NlsY62nvxQX7bDYs/
 sJg0nwYlxJkFaJivYylZCaMClrQxutUapNXI8q9b7xFfs/A97l7BnpK34bHnzp6NJcOFao
 ZVa1S/4jIBWVyqf3hhF42hLnSz/oxBD5ZshcAir2hxnYfUFyes8Ut1F1haClB+lNlmiix2
 9afkiDId18AYgVea5stmO/KMnR5MhxstRS4QHl8H9U//TsoT9Zmht/C9FbgMSfDIM+zR8Z
 +Ip4M05+do4+BoYbCt4Cp25nAcbnp4dQNYBjHQzQfzP8U8N+SCkO1a1Rex1j+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WVInS9Xt
Subject: Re: [Buildroot] [PATCH 5/5] package/python-pyqt5: disable qt5webkit
 module
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Due to issues in the installation of qt5webkit, building the
> corresponding Python binding fails:
> 
> Project ERROR: Unknown module(s) in QT: webkit
> Error: /home/thomas/buildroot/br/output-all/host/bin/qmake failed to create a
> makefile from PyQt5.pro.
> make[1]: *** [package/pkg-generic.mk:263: /home/thomas/buildroot/br/output-all/build/python-pyqt5-5.15.6/.stamp_configured] Error 1
> make: *** [Makefile:83: _all] Error 2
> 
> https://lore.kernel.org/buildroot/20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com/
> was an attempt at fixing it, but this patch doesn't work and looks
> weird.
> 
> So for the time being, disable the Webkit module in python-pyqt5. This
> issue has indeed been around for as far as 2022.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/b9d69d21e734aa62a6e0b4d4124c2bcfc027ebe4/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-pyqt5/python-pyqt5.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
> index bee0c529ca..1ab9cea4ad 100644
> --- a/package/python-pyqt5/python-pyqt5.mk
> +++ b/package/python-pyqt5/python-pyqt5.mk
> @@ -91,13 +91,6 @@ PYTHON_PYQT5_DEPENDENCIES += qt5webchannel
>  PYTHON_PYQT5_MODULES += QtWebChannel
>  endif
>  
> -ifeq ($(BR2_PACKAGE_QT5WEBKIT),y)
> -PYTHON_PYQT5_DEPENDENCIES += qt5webkit
> -PYTHON_PYQT5_MODULES += \
> -	QtWebKit \
> -	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtWebKitWidgets)
> -endif
> -
>  ifeq ($(BR2_PACKAGE_QT5WEBSOCKETS),y)
>  PYTHON_PYQT5_DEPENDENCIES += qt5websockets
>  PYTHON_PYQT5_MODULES += QtWebSockets
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
