Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B16FFA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 14:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A99A80E91;
	Fri,  2 Jan 2026 14:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id li3TVLxNxgqn; Fri,  2 Jan 2026 14:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 778B980E6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767365256;
	bh=L1K02ImMFmbcBM5obHUKlJ56U1B/84pAl4FRSTcQkHo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WuPcd63SVVRyPidHs13L6LbcDpt8DiMK4YqWhpBQY/Lf3hKKk1uMYkDWarwiXBjjN
	 fUEreglIpOB5qRRgpPIoltcSs0+yQrjnehr4DNUWAqJI1WANTBbWlRGpt4hQb+pEnS
	 SjiuT4mIqq5pARB/ixWGyIk4wM9jzcsQ+YeVd64vtdt8GzvW9fU28gkncJ4Lm9aWed
	 Gl1lmY1QjIM5kJ/51Egxr0i/xLehEQ0PWbrq59karcTaYR1/9WJLULfrmgQqkdKEu8
	 OQ23kFpLVSb3zj9hQEEyvSdbSWAr7OT/kB3/4qsXAf6qfo2ur/W96rUpddARq4x6ro
	 VqqLjcaEvMiGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 778B980E6E;
	Fri,  2 Jan 2026 14:47:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2970319D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FA9460689
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2F8hns59Te3h for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 14:47:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 908266067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 908266067A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 908266067A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:47:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 767C5B00539;
 Fri,  2 Jan 2026 15:47:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 02 Jan 2026 15:47:21 +0100
MIME-Version: 1.0
Date: Fri, 02 Jan 2026 15:47:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Guillaume William Brs
 <guillaume.bressaix@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
In-Reply-To: <20260102140805.166641-7-bernd@kuhls.net>
References: <20260102140805.166641-1-bernd@kuhls.net>
 <20260102140805.166641-7-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <d38e7dc1392e83748e2b53b86deb08a9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767365250;
 bh=0wD4rvHVgUeoUiC+/Rxu0YZfHg9h56DlZ1CytDsMg+U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V61clfEVwQ+Lcj0M5Ym7vyFvTzEHPrMgV9Bw3UmVaidYlzbYYEMUUcUNyrcnt7TT+
 aoyadFmlybn2cTXm9hHdOJmkXYnNYl93EUgUSkIPY4GG0rJJmW+kvOO8AYXU7SmBnI
 nwMzs0ccVqbo/IudUAFOGIQdL7w51q1Zsw0Vg94K82GHXYg/RKYTsWn+zusXK6jBYh
 jK+2lC8pibAwC6BHrVmaADIyScyhed57wQHqu6KWzjDmXf2ko8c/FLqs8ETWx7mpb4
 Rm9b79w+XKEFFSPbY+FPZtBQfm3z2dar0nhZWodbiaB2CM86KR9kSoUpJ7Yd10QOGS
 E3Vh41GjCoAvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=V61clfEV
Subject: Re: [Buildroot] [PATCH v2 6/6] package/python3: bump version to
 3.14.2
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

Hi Bernd,

Thanks for the patch (and the quick update).

On 02/01/2026 15:08, Bernd Kuhls wrote:
> Rebased all patches.

The bump to this new 3.14 version series is not trivial.
Could you add in the commit log links to release announce and change log 
please?

https://www.python.org/downloads/release/python-3142/
https://docs.python.org/release/3.14.2/whatsnew/changelog.html

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 0690678c04..48a76bea37 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -PYTHON3_VERSION_MAJOR = 3.13
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
> +PYTHON3_VERSION_MAJOR = 3.14
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2

I also tested many cases with this series. So far, it is generally
working well on my side.

While testing, I observed a new build failure with this version:
https://gitlab.com/jolivain/buildroot/-/jobs/12589702787

It is likely to be related to:
https://github.com/python/cpython/issues/139275

Maybe we should backport a patch to fix this issue?

Also, Python 3.14 introduced colors in its output. This seems to
break some runtime tests. I've seen such a failure with the varlink
runtime test for example, at:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/testing/tests/package/test_python_varlink.py#L30

See also:
https://docs.python.org/3.14/using/cmdline.html#controlling-color

Maybe we should globally set "NO_COLOR=1" somewhere in:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/testing/tests/package/test_python.py

Tested-by: Julien Olivain <ju.o@free.fr>

>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
