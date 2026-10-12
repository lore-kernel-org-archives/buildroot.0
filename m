Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E68ACA9ED0
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C4680CEB;
	Mon, 12 Oct 2026 10:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuCmQJE2w4JY; Mon, 12 Oct 2026 10:30:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 19B0280C84
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791801018;
	b=ZMhaP1V2BwXxAqbxxxxbFHzXzyJixHNaObM5xPjMMY+iG8KvlohDVBgtu9tjDmiVx/Nt
	 ZIIN03GJh9pVewvlNldeuVqK/P8FG9HVXUMsFza4LZY3FHwmst7fA6RJr72ELo1E68yAW
	 xKhK46KdoKyUTHoXMaAuMzrpMdFxYa2Ptaf4PC4j2ZZGtEeyIDegiiTT85xVYOZNHTNx8
	 Hs4VZ/DN8fYMCBMo8R+h8jRvQuXmAkohCoY0a3yXrdge9YIGnfI9xPsiySFz06vCNVECk
	 lTUxObTSmr+WOzVcff5A5nca25eOJgtQ/0zy8SeBI/3Op8xA0aHqkoeBrRJP96rsRFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791801018;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:X-Rspamd-Fuzzy:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AzDemOMnDUIjaRayIc7G2WVaEH46sLEqv+mGegOv5nY=;
	b=DLH90Wy+538mV8VSHjmataZhdRKbCIurd1lPWfI66mFEq1GdlRQqRYP/mk4qbYjfFn7M
	 R3DJ8NQ0Voitz8xyE1VWY5Ies4Yckm3s0trfQK9MhUDMb113xk3H7DrbvMCttc/Q6VdkA
	 AfK3E2+Jm2z1KiiRvzkcFHOGtErhRhvA+iS2irH8knXTvCNIXnyEPBYX8LE/GXOxDFFDj
	 p2Lclpkb2MK0glN4ZwQewotx0m6jc+B+wSw2SKwXsFhBymHjMH45wgQDop+UvqTR7lJDf
	 9UXGO5VOwPDUI2dI706DuLI7xo0BRy9gweH3ZpZ75OMJ2OUurQVFt7A1s4F2Yd7FXOQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791801018;
	bh=AzDemOMnDUIjaRayIc7G2WVaEH46sLEqv+mGegOv5nY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H5QiIu717iCpmP/0+dCyuRgzi73Y6S/duTwKNIHmb8EFUqiKUQRSBtsegULrBJu6o
	 890S76/4SoOfsyOugZdWq5UgyRt8CNbg0nBN7rvGf29xuCY3jhhO0mDtQOAUY9fX55
	 b9u6q7meF7ImCl7pnewuoTLv8U+z30m38atYpAxr35ZbHN+9xpQN7piMmrZtjK7JZS
	 Yr2NSpCDO8HpvV+6yQr2gAz3Qxl+Y1E+CFkDRsLLb4iHRzLXOXi6YcTr8Gf5joXYEt
	 rIvH2+802B+nMTos9pZpMi8IN7Xg50jfmSXVnBqT7/S/IFNNCjH5u9Z6dqdq/JvLiT
	 aX12+FMItVjqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19B0280C84;
	Mon, 12 Oct 2026 10:30:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C9DD9DF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 322C5605F3
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDVG6fugYhmC for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:30:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6918A605F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791801015;
 b=YYtzv2kNg5+XZzoia7hfm18t01Y+PIpfOrlbOrxqf0Q3MV+vwUSAQN8PRhllbomdYZGz
 XtsheZkZHqzy9HKd5tVCTB93rQzpOHaL0PqAfOjjqd4J+AzfI9KXcMYBFygwji9+jOMg4
 04aLGxfJuqVotnqaj04cvco2krZQMZtWAILL/Xs3UO70KpJOKIfPIPuoyHIKEV+B6bRFF
 jZoupXJjXRgzvbaaRoS53ZuCkXvewCFJyfQMusi/ah6FJe2qhvhKPHZY81BZxz3s8nZMn
 FolTSrqJs97+yfV3McGpTVaaCFc8OmfQOPeARwrcJnZ7trorCtZYHFT8OwWYNiRYoMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791801015;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version:X-Rspamd-Fuzzy;
 bh=9ZvX6z23/eYsK8u66xIs8BTyz7k+wSl8DeFy+dHpoEQ=;
 b=WKuuGwJEsq8yJ1oEhcGEaO4qPk9ju95t3smO4iaYUmbLGV8R5m2dMKXhCzgkMLA3GHD0
 h4C6vdUvCldC85fzG8+RzvkGkybUfWguUvwDosDnnL8F4UsEBH7HDaSSoNbsz/EDWKvO2
 CFFtqq9pq2DT5e80MKsI+L6hINJqX6w/YZoqTtMo4YBzk9P8b+uvvgU1E9WKDJj5S5KJU
 /VwZhdInsCS2f/TB5Gc+5wizVvUNCRz3KnwG0sXF/YpuLNVXd75CJkbxikbZx9ayjE3Iw
 Qrk2lc2ZBRg9Ayt3RKfKjv2+M2qdICKpWXJuqKklJxr/Fyygkurn6z9lzj6Tp6RauPw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=VsAKAX3l; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6918A605F1
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE4C6B97A199; Mon, 12 Oct 2026 12:30:07 +0200 (CEST)
To: buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>
Date: Mon, 12 Oct 2026 12:29:37 +0200
Message-ID: <179180053896.385429.2185356314743837142.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260925064257.1162394-6-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-6-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Fuzzy: e62754c102fb48b443e38f5d350a591d002057ce188f8adc6262f348cf77e94c4f28306182aca09febbc03b66fe94366452d4c5d08369a1f6503d103d3779cf4
Subject: Re: [Buildroot] [PATCH v6 5/6] package/qwt: enable build with Qt6
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

On Fri, 25 Sep 2026 08:42:56 +0200, Dario Binacchi wrote:
> Version 6.3.0 added support for Qt6, so enable building Qwt with Qt6 as
> well.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 Applied to master, thanks!

 Regards,
 Arnout

> ---
>
> Changes v4 -> v5:
>   - OpenGL option depends on BR2_PACKAGE_QT6_GL_SUPPORTS
>
>  package/qwt/Config.in | 22 ++++++++++++++--------
>  package/qwt/qwt.mk    |  4 ++++
>  2 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/package/qwt/Config.in b/package/qwt/Config.in
> index 736ccc2a5ea5..7b0e068ad131 100644
> --- a/package/qwt/Config.in
> +++ b/package/qwt/Config.in
> @@ -1,9 +1,13 @@
>  config BR2_PACKAGE_QWT
>  	bool "qwt"
> -	depends on BR2_PACKAGE_QT5
> -	select BR2_PACKAGE_QT5BASE_GUI
> -	select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
> -	select BR2_PACKAGE_QT5BASE_CONCURRENT
> +	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
> +	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
> +	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
> +	select BR2_PACKAGE_QT6BASE_WIDGETS if BR2_PACKAGE_QT6
> +	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT if BR2_PACKAGE_QT6
> +	select BR2_PACKAGE_QT6BASE_CONCURRENT if BR2_PACKAGE_QT6
>  	help
>  	  Qwt is a graphics extension to the Qt GUI application
>  	  framework. It provides a 2D plotting widget and more.
> @@ -14,15 +18,17 @@ if BR2_PACKAGE_QWT
>  
>  config BR2_PACKAGE_QWT_SVG
>  	bool "SVG support"
> -	select BR2_PACKAGE_QT5SVG
> +	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT6SVG if BR2_PACKAGE_QT6
>  
>  config BR2_PACKAGE_QWT_MATHML
>  	bool "MathML support"
>  
>  config BR2_PACKAGE_QWT_OPENGL
>  	bool "OpenGL support"
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> -	select BR2_PACKAGE_QT5BASE_OPENGL
> -	select BR2_PACKAGE_QT5BASE_OPENGL_LIB
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT6_GL_SUPPORTS
> +	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6
>  
>  endif
> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> index 67292ee025be..0e835c700e16 100644
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -18,8 +18,12 @@ QWT_CONFIG += -e 's%/features%/mkspecs/features%'
>  
>  ifeq ($(BR2_PACKAGE_QWT_SVG),y)
>  QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
> +ifeq ($(BR2_PACKAGE_QT5),y)
>  QWT_DEPENDENCIES += qt5svg
>  else
> +QWT_DEPENDENCIES += qt6svg
> +endif
> +else
>  QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
>  endif
>  
> -- 
> 2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
