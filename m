Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AADCD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 12:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF4381EB7;
	Mon,  1 Apr 2024 12:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsJFIKPDlAc3; Mon,  1 Apr 2024 12:58:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 291AC81ED6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 291AC81ED6;
	Mon,  1 Apr 2024 12:58:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3A3B1BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B003E40298
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IstGsd3m5TMV for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 12:58:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F34204038B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F34204038B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F34204038B
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 12:58:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-415515178ceso16116095e9.0
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 05:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711976305; x=1712581105;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G8KAbUk+/RiKzOZ1TmLGZt+avocJMduWnwpKBMp/xzA=;
 b=V4fQbew0xv5eZjGlgifuTreyq/s1nia4DEtKVkb/WHlTnO+ZZjv3n7TAy/k5oYBI56
 JrDrfQTeyc5hvs5bbW4aAoehs0ixx8L/D0cL3YjYq+tjNgRhPZbjrYosoAmu8zsb+G1R
 bPbEiP3qgdWaGvfWM+W5dBycxPX3WkYzOtixo+eTaJ50Cy+FQnNUfrdr63H73bTkvFEk
 LUErlEA6e7AqLi5sRhO1+LijpnJlrvvBpVIiihJPiq2BGX8ODIrE85TyEDqksreyFkfP
 ZET4mHoThHSuo95MljNoAmX2XBDlSvknfZgHvsFBoqkKVs69cGEPO+/s/McnDrl8HwzK
 vA0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjTCCQArCprx104+JreavCsuc/R/8gYMgoABKxre3DRHwBON93q2Okfdfp0CmUTCoFo60bJo/WD49Cb2oaW7/AdmGdkunbEw==
X-Gm-Message-State: AOJu0YzNyDFExVC4z9JpMrXKk9+lPZ3JTwN+4q53KPBE/DjJ2nhQ5f+m
 DLS0j3uqkJZf49mOXCezLq+rWo7L1E9Ez7OEdoxLFpp1c+kkbGXWZnVPJRyKAA8=
X-Google-Smtp-Source: AGHT+IErsuM1N+eIR3O5pI/oiBsGCZlgjeGftKt+3n82PSDtiP5nRLhkLZc39sohFK1Gfs1O9fbYyg==
X-Received: by 2002:a05:600c:1f84:b0:414:245:f6df with SMTP id
 je4-20020a05600c1f8400b004140245f6dfmr7416618wmb.21.1711976305105; 
 Mon, 01 Apr 2024 05:58:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c001100b004155a32841bsm7710928wmc.39.2024.04.01.05.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 05:58:24 -0700 (PDT)
Message-ID: <39c48fd9-7bcb-43c4-bec1-e0a3ca8d912d@mind.be>
Date: Mon, 1 Apr 2024 14:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ralf Dragon <hypnotoad@lindra.de>, buildroot@buildroot.org
References: <20240401084841.439073-1-hypnotoad@lindra.de>
Content-Language: en-GB
In-Reply-To: <20240401084841.439073-1-hypnotoad@lindra.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711976305; x=1712581105; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G8KAbUk+/RiKzOZ1TmLGZt+avocJMduWnwpKBMp/xzA=;
 b=Ay14qGsOYnCVXMSO07eRi34IQYHLJ8PmGmKpAvnBzg//wPUXw4Wc0SP7DhV5FEzyMh
 EBaMDwakWKjhtU++UNAG6ZkjSRbFZjH8jdYQih0w6XErl3OIOTQRvyUcDyTq30q+fdS7
 tvpSrt8zHwlIVXXF7JrKi4yK/jLXInyOPa51JgQIa3xbsFAnW/9vwzm62t+Pk7CGMxcP
 veNaaBDs4pFatJwBNt/GgVo9TXpHvlyCB1sXwXMU3rblcyiyh2UkXpb9nPIco9AQTbXi
 qLpe9t1U2qgrdwA1F8KtvZA1sAdzsAl5He9a+nTYcMoaX9VVlGTPiDD/l52zoChrcirM
 Mfbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ay14qGsO
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pyqt5-sip: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Ralf,

On 01/04/2024 10:48, Ralf Dragon wrote:
> This packages adds the PyQt5.sip module.
> 
> The official documentation [1] mentions that this module is needed
> during PyQt5 runtime. It is currently compiled without any
> dependencies to Qt or PyQt5, but it seems quite useless without it.
> The module was introduced together with PyQt 5.11 [2].
> 
> [1] https://www.riverbankcomputing.com/static/Docs/PyQt5/installation.html#building-and-installing-from-source
> [2] https://www.riverbankcomputing.com/static/Docs/PyQt5/incompatibilities.html#pyqt-v5-11
> 
> Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
> ---
> Changes v1 -> v2:
>   - fix License and make sure legal info passes
>   - document in commit message why this package is needed
>   - split off the runtime dependency to separate patch
> 
> Backport to: 2023.*.x 2024.02.x
> (2022 LTS branches are probably also affected but I could not test any, 2021.11.3 is fine)

  All 2022.x and 2023.x branches are EOL, so this will only be backported to 
2024.02.x.

> 
>   package/Config.in                              |  1 +
>   package/python-pyqt5-sip/Config.in             |  4 ++++
>   package/python-pyqt5-sip/python-pyqt5-sip.hash |  7 +++++++
>   package/python-pyqt5-sip/python-pyqt5-sip.mk   | 14 ++++++++++++++

  Please add yourself to the DEVELOPERS file [1] for this package. This way, 
you'll get an e-mail if the package fails in the autobuilders, or when a new 
version is released if the package is registered on release-monitoring.org.

>   4 files changed, 26 insertions(+)
>   create mode 100644 package/python-pyqt5-sip/Config.in
>   create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.hash
>   create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 33039331f7..d897f16120 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1278,6 +1278,7 @@ menu "External python modules"
>   	source "package/python-pypng/Config.in"
>   	source "package/python-pyqrcode/Config.in"
>   	source "package/python-pyqt5/Config.in"
> +	source "package/python-pyqt5-sip/Config.in"
>   	source "package/python-pyratemp/Config.in"
>   	source "package/python-pyroute2/Config.in"
>   	source "package/python-pyrsistent/Config.in"
> diff --git a/package/python-pyqt5-sip/Config.in b/package/python-pyqt5-sip/Config.in
> new file mode 100644
> index 0000000000..f7be60c8ec
> --- /dev/null
> +++ b/package/python-pyqt5-sip/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_PYTHON_PYQT5_SIP
> +	bool "python-pyqt5-sip"
> +	help
> +	  This is the PyQt5.sip module which is needed to run PyQt5.

  Please add an upstream URL (that should point to the project's website, some 
high-level intro, the documentation, or if nothing else the README). If there 
really is nothing specific to this package, just refer to pyqt5.

> diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
> new file mode 100644
> index 0000000000..fb4a8cb04d
> --- /dev/null
> +++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
> @@ -0,0 +1,7 @@
> +# from https://pypi.org/project/PyQt5-sip/12.30.0
> +sha256  7f321daf84b9c9dbca61b80e1ef37bdaffc0e93312edae2cd7da25b953971d91  PyQt5_sip-12.13.0.tar.gz
> +
> +# Hash for license files:
> +md5  9cd437778ebd1c056a76b4ded73b3a6d  LICENSE
> +md5  e91355d8a6f8bd8f7c699d62863c7303  LICENSE-GPL2
> +md5  7ea41d866d6638e430db5287a3f66090  LICENSE-GPL3
> diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
> new file mode 100644
> index 0000000000..0114f6db69
> --- /dev/null
> +++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-SIP-QT5
> +#
> +################################################################################
> +
> +PYTHON_PYQT5_SIP_VERSION = 12.13.0
> +PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/ee/81/fce2a475aa56c1f49707d9306b930695b6ff078c2242c9f2fd72a3214e1f
> +PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
> +PYTHON_PYQT5_SIP_LICENSE = SIP

  SIP is not a valid SPDX license. We have the informal habit of indicating this 
with multiple space-separated words (typically ending with license). See for 
example the python-sip package, which mentsion "SIP license".

  In addition, this license declaration doesn't correspond to the license files, 
which include GPL-2.0 and GPL-3.0. So I suspect the correct license declaration 
would be the same as for python-sip: SIP license or GPL-2.0 or GPL-3.0

  Regards,
  Arnout

[1] https://nightly.buildroot.org/#DEVELOPERS


> +PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
> +PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
