Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4599C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 08:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F2D04025F;
	Tue, 25 Oct 2022 08:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F2D04025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fv02Vd32jdc6; Tue, 25 Oct 2022 08:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 775A340220;
	Tue, 25 Oct 2022 08:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775A340220
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18E511BF2FC
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 08:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7900401F4
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 08:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7900401F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id guyP6GQLBJ_T for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 08:33:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C7EF401CF
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C7EF401CF
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 08:33:32 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-36cbcda2157so49691037b3.11
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 01:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PoZBXPmUiVDpiUWQnYIhRZVcp4LA3sEDhgrYqs9GMfU=;
 b=wmahn9dsZG1F3jt+IkYKHbljw3E6quVrOezdALu23roy1sMGHhKWFRS3VAblmDyxoI
 9Xtbe7uBsVeLKX9ubixpLN7pJ1MSdrl1tWs96V5rnvQd0JsjYDY1K/65l7QThGClaD9v
 /9nV06YiaSlJEzeYyru7NIhGa8n5DOXLJeACcYkuar6pRo2M+WOF9iklceqhaOxoU9ri
 Tqtk8TVTRLbYhtFNJTDiNtVuUTzJm/nTwtVmtZ77Uu+CLAWzTnXxGoyX4AkPnPou4gFD
 4LOjhEXlO6YGwHmZnxYZ9wveYG9KZttool64fgrkQ3x3f4Vfw+HWr2XMcy/iK+KXDTmf
 y76g==
X-Gm-Message-State: ACrzQf1j6LloGlZNkrlFWaIKupJQUqfCtdH3L+OUa+WV4Vh9+o+X4yNH
 VAHt980E/qZA+4vVmbZ/v+/1IPHIn0/2Hic+ZQAPtwXmb5I=
X-Google-Smtp-Source: AMsMyM7P9HPJB4uWEEK3MoT/nCwGRlVuK/pDPnl/UB/gKvdfHs0a63FtRE1cbZVDcimaw1wGC3qnvFrq0nVNCLBcByc=
X-Received: by 2002:a81:14f:0:b0:36c:3370:e1c8 with SMTP id
 76-20020a81014f000000b0036c3370e1c8mr11217333ywb.247.1666686811140; Tue, 25
 Oct 2022 01:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221025065539.4646-1-afshin.nasser@gmail.com>
In-Reply-To: <20221025065539.4646-1-afshin.nasser@gmail.com>
Date: Tue, 25 Oct 2022 10:33:19 +0200
Message-ID: <CAGm1_ku8QUbDtT+Bt=5jmD46Vws_go6r2dK9oD95i_bgJynLbg@mail.gmail.com>
To: Nasser Afshin <afshin.nasser@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PoZBXPmUiVDpiUWQnYIhRZVcp4LA3sEDhgrYqs9GMfU=;
 b=Fll6w5NPi+m+3jlQB8twH10awQ9BUzWYkQX+k86VmbQU7Enfc0BBmX4+f+ctNAOwIU
 vwE8aiB+2Pj/6geQN/pPtW3PFFUrMCi23NP7WlwR5BTFyGfwexi1ii4DJ2OJqz4UWvP4
 xn264jOiDxg6dZVA2OcAMlZZ4B9F5i7ECcDwkayfjP/6QpVgvl2Nq4gesjkAITKkeovC
 5IXPjPj0ttzXtueSdIeG3YdOwrQK4bQ4S05KFJLfpgVQCQRW4lVR5NFP7I/VlxPXT6X4
 efIJva1fs1kKLg6fmI3OY5My8v20kvbF9ouvHiFu1uYfQ+r6Ik8WcZMjjG8zVNVOiWnI
 Gdbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Fll6w5NP
Subject: Re: [Buildroot] [PATCH] python-pycrate: new package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nasser,

On Tue, Oct 25, 2022 at 8:55 AM Nasser Afshin <afshin.nasser@gmail.com> wrote:
>
> Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
> ---
>  package/Config.in                          |  1 +
>  package/python-pycrate/Config.in           |  8 ++++++++
>  package/python-pycrate/python-pycrate.hash |  4 ++++
>  package/python-pycrate/python-pycrate.mk   | 13 +++++++++++++

An entry to the DEVELOPERS file is missing.

>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-pycrate/Config.in
>  create mode 100644 package/python-pycrate/python-pycrate.hash
>  create mode 100644 package/python-pycrate/python-pycrate.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 56b1a08d8b..2443b7bb27 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -951,6 +951,7 @@ menu "External python modules"
>         source "package/python-pyasn1-modules/Config.in"
>         source "package/python-pycli/Config.in"
>         source "package/python-pycparser/Config.in"
> +       source "package/python-pycrate/Config.in"
>         source "package/python-pycrypto/Config.in"
>         source "package/python-pycryptodomex/Config.in"
>         source "package/python-pydal/Config.in"
> diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
> new file mode 100644
> index 0000000000..9e2123d4dd
> --- /dev/null
> +++ b/package/python-pycrate/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_PYCRATE
> +       bool "python-pycrate"
> +       help
> +        It provides basically a runtime for encoding and decoding data structures,
> +        including CSN.1 and ASN.1. Additionally, it features a 3G and LTE mobile core
> +        network.
> +
> +        https://github.com/P1sec/pycrate/
> diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
> new file mode 100644
> index 0000000000..24aa51d8e4
> --- /dev/null
> +++ b/package/python-pycrate/python-pycrate.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/pycrate/json
> +md5    075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
> +# Locally computed
> +sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
> diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
> new file mode 100644
> index 0000000000..41ce6c18f2
> --- /dev/null
> +++ b/package/python-pycrate/python-pycrate.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-pycrate
> +#
> +################################################################################
> +
> +PYTHON_PYCRATE_VERSION = 0.5.5
> +PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
> +PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
> +PYTHON_PYCRATE_SETUP_TYPE = distutils

SETUP_TYPE is setuptools.

Have you tried this command?

./utils/scanpypi pycrate

It will do almost everything you need. The thing that is missing is
licensing info because there is no license file in the source archive.

Best regards,
Yegor

> +PYTHON_PYCRATE_LICENSE = LGPL-2.1-or-later
> +
> +$(eval $(python-package))
> --
> 2.17.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
