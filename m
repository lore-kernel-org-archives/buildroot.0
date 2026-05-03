Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6660CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3EDD61261;
	Sun,  3 May 2026 14:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KjK3IERlHnH; Sun,  3 May 2026 14:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBA4161262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777820041;
	bh=FIAHMOwH+r7JO4bqrRaR1eAZerHJu3Ulu+0HzSKdI+M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZnermyifaaTIGyMxCVrH6Vt4nelQCZZKRuouJZwHUqPUa4IcvSMY78A1FYmnlSvui
	 Di285o53KtFGX+ObcBYy8HfqYrBWW4NEf8lPWFxeSFpF8rJucSFQeaDC6w6L7f2zY+
	 9QiMb/w/fn6lohFAGvqPXc1mvkFfspW7RCVL7q8I9hE2ejcQ6hAMFpWEGqH7YTF08v
	 mEWkqTfFQSjN4ZE+YWpnr9LloLIgngveTagZnDViXUOXVVCGqUPqIMApNVxOJMlIL2
	 yq1Lf/31zp07dU2t1KSvFoc8oVjS1Swmqxt/Un+TNfqFF1MXYBBIh4sh1s8lonZIzY
	 5lex2bZHJ+uEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBA4161262;
	Sun,  3 May 2026 14:54:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0B76127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6AD0406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7wl5vEqLce2 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9112F4046D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9112F4046D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9112F4046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:53:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1A38C20039E;
 Sun,  3 May 2026 16:53:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 16:53:39 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 16:53:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>, =?UTF-8?Q?Rapha=C3=ABl?=
 =?UTF-8?Q?_M=C3=A9lotte?= <raphael.melotte@mind.be>, =?UTF-8?Q?Fl?=
 =?UTF-8?Q?=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>, Grzegorz Blach
 <grzegorz@blach.pl>, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Falco Hyfing
 <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>, Fiona Klute
 <fiona.klute@gmx.de>
In-Reply-To: <20260501123100.1918951-32-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
 <20260501123100.1918951-32-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <0f8e1babf8f66fd8666085ec315633a9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777820036;
 bh=zqr3kTC3XTEAfUMslyd38F1EWzh4hpPs4t3qB4wFO38=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MTMEAT6U2w8j4a76q31UcAlP6kZnhDy8TkE6lIgPuCI/TWVpvihbUbU32j6DjP8sC
 KQWNKflJ5iHwwKDmSZV9mrBIiRiZBfRtDLnlFY4HEDvZPhjs/3vHA0e/cWUxrASvFr
 41zODcnDH2OY+xp/o2UgRhCdQBKuLaQF4sq662/qX2zs8M9Y5Dpylw+RyPWl+ARdve
 vP5Ur3gHF3u/JjoUz0DRi3X7n3Odat0U5h8NAj2vj2YirCO9LLW5gWfWbCV5nObiZw
 KOPtcrzkdaW0fax4QCBYA9GUKlNnS2ryHSo095nFXP/N3rGxlPAD66ECxFlHb29XRz
 wVGVDfk9q3eWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MTMEAT6U
Subject: Re: [Buildroot] [PATCH 32/75] package/python-mypy: bump to version
 1.20.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd, All,

On 01/05/2026 14:30, Bernd Kuhls wrote:
> https://github.com/python/mypy/blob/v1.20.2/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-mypy/python-mypy.hash | 4 ++--
>  package/python-mypy/python-mypy.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
[...]
> diff --git a/package/python-mypy/python-mypy.mk 
> b/package/python-mypy/python-mypy.mk
> index 4b02753978..c21cdc6676 100644
> --- a/package/python-mypy/python-mypy.mk
> +++ b/package/python-mypy/python-mypy.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_MYPY_VERSION = 1.19.1
> +PYTHON_MYPY_VERSION = 1.20.2

With this new mypy version, python-charset-normalizer is failing to
build with error:

ModuleNotFoundError: No module named '_sqlite3'

This might be related to:
https://github.com/python/mypy/blob/v1.20.2/CHANGELOG.md
"Enable --sqlite-cache by default"

So I did not applied this mypy bump while applying the rest
of the series.

Could you have a look at this issue, please?

>  PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
> -PYTHON_MYPY_SITE = 
> https://files.pythonhosted.org/packages/f5/db/4efed9504bc01309ab9c2da7e352cc223569f05478012b5d9ece38fd44d2
> +PYTHON_MYPY_SITE = 
> https://files.pythonhosted.org/packages/04/af/e3d4b3e9ec91a0ff9aabfdb38692952acf49bbb899c2e4c29acb3a6da3ae
>  PYTHON_MYPY_SETUP_TYPE = setuptools
>  PYTHON_MYPY_LICENSE = Apache-2.0, BSD-2-Clause, Python-2.0.1
>  PYTHON_MYPY_LICENSE_FILES = LICENSE
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
