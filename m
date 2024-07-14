Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6A0C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 22:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37BD840026;
	Sun, 14 Jul 2024 22:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0TkQCrv0jm9; Sun, 14 Jul 2024 22:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4A7440106
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4A7440106;
	Sun, 14 Jul 2024 22:05:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61F221BF47A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 22:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B7F040106
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 22:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HrA4JvjOr3k for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 22:05:56 +0000 (UTC)
X-Greylist: delayed 800 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 14 Jul 2024 22:05:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9B8E40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9B8E40026
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:598:64:8a00::1000:a7d; helo=mxd-2-a7d.seznam.cz;
 envelope-from=havran.jan@email.cz; receiver=<UNKNOWN> 
Received: from mxd-2-a7d.seznam.cz (mxd-2-a7d.seznam.cz
 [IPv6:2a02:598:64:8a00::1000:a7d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9B8E40026
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 22:05:54 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-675d887675-rm6b2
 (smtpc-mxd-675d887675-rm6b2 [2a02:598:64:8a00::1000:a7d])
 id 1abc9e429a5bf4df18c8a02c; Mon, 15 Jul 2024 00:05:52 +0200 (CEST)
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by smtpd-relay-685c4db54c-tfwxq (szn-email-smtpd/2.0.19) with ESMTPA
 id 72982b1f-cb35-4859-9fb4-918229e138d7;
 Sun, 14 Jul 2024 23:52:29 +0200
Date: Sun, 14 Jul 2024 23:52:25 +0200
From: Jan Havran <havran.jan@email.cz>
To: yann.morin@orange.com
Message-ID: <ZpRImeKEAIAeJcYD@arch-zen.localdomain>
References: <cover.1720535037.git.yann.morin@orange.com>
 <f068a1d175dd8472c8ff10ffb5607d96d760e1a0.1720535037.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f068a1d175dd8472c8ff10ffb5607d96d760e1a0.1720535037.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=szn20221014; t=1720994752;
 bh=W+xIHwe4n/aOpE3+cAYU8ztintuJ2GDybJDD9yXwBeE=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To;
 b=d/rMWPAoATVigrVJDNTpQK9mBKGZAqsuqFTAHJUnvwJEu5nYzcDjsk/vHh8Pl+iq3
 TAgnzEOY9napufp9TTYbksd5uXIKaERRpagfXD5c+35ybwMpbhhwOs+oSvXjII6Lfl
 DFebgZeYLzY6zQdmoruFqsr/FFgO13iwv1jmOS6+LwFiiZOVKctAm3cGc0Yfg95FJu
 nkQLbkMsfNjPcGJqRWg1TzLiU6x2ORXJUtqAZ6kamyqhuRmvK+usVfXSRKYY2VD1xr
 qiGKsm+1yB8jyuxxDSua9Z/SefpApybmW+RFg/j6IL7ZbEUmnHqkTAlO2w1+EnkVdl
 zggrnDb9CIg1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=email.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256
 header.s=szn20221014 header.b=d/rMWPAo
Subject: Re: [Buildroot] [PATCH 1/5] package/gpsd: condition python stuff to
 the proper kconfig option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

V=A0Tue, Jul 09, 2024 at 04:23:57PM +0200,=A0yann.morin@orange.com napsal(a=
):
> From: "Yann E. MORIN" <yann.morin@orange.com>
> =

> Currently, we have a Kconfig symbol to enable the python support in
> gpsd, but the condition at configure time is based on whether the python
> package is enabled. So, if a user does not enable python support in
> gpsd, they still get it.
> =

> Switch to using the proper symbol.
> =

> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Jan Havran <havran.jan@email.cz>

> ---
>  package/gpsd/gpsd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 1d4013d122..c57fad83c3 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -178,7 +178,7 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
>  GPSD_SCONS_OPTS +=3D max_devices=3D$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
>  endif
>  =

> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +ifeq ($(BR2_PACKAGE_GPSD_PYTHON),y)
>  GPSD_SCONS_OPTS +=3D \
>  	python=3Dyes \
>  	python_libdir=3D"/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
