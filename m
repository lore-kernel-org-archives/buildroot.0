Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1BDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 12:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45E7B606BF;
	Sun, 13 Feb 2022 12:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9Yg35lOzZn0; Sun, 13 Feb 2022 12:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D73C6072A;
	Sun, 13 Feb 2022 12:04:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4643B1BF46D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 12:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 337DB401F8
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 12:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Reym_3vJ-JB for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 12:04:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64A0B4011C
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 12:04:49 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id cf2so23030342edb.9
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 04:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m4ixT1/7n/f4yqVpupocrwI3LKtKNhjnIFIbl4MgTWg=;
 b=IQMI4bmNTIeaixAk8COlHG5cjAZ6SuuTuUAQh6efMypB3pbLL44NpKrCm1RuOl21Il
 O8AGWlvCoNkekbhZKYKQ22qo2XReGUvndDKae3Uc8ZBkx0xnntc3u2MnNoAi8/LOeyYG
 ooyJOC6Rib4ugfzItCKTdZNdydFd+W2OzzVJbTCcTBh3eGFqelyhzT7M/OKOyvSYPXKX
 TA9ovbzZpReH82aG6NmeItJuifn+8sqknSOaU7dVlOMS3aPoPQ2DAdWlwkKQuDTjtaNg
 lxnJZqArIlrda2KxDMi6Xrx7/InJbnCELJ7XIaWCkAtWcPSknBkl4RstNZTQGC1eBNNn
 6fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m4ixT1/7n/f4yqVpupocrwI3LKtKNhjnIFIbl4MgTWg=;
 b=JF1loKQiFD5H2qIrkQsB+0dnBjAlhkf+sURCxjRlqUJCfGHZRDIjF9kxFIhpFWEWiI
 0dgIeToPwZjYarmBQ+1/1HcKb2j9POcZU3iNozHCvLTmTI14XwsaR5nOYtRS7eQcjqJ9
 GDqBrTMMQf4rElze9aSDNIml6HYTYQBJyQp5CfUpYofCnKlVDmidSxZa1OKSSLIMeUZo
 /oVB6d7h/xvZL+FNawQh9L9ClkxiFjyWJndTSKaA8f7U+3JNbC1PFrbU2YNGl1t3g/Qs
 V3o0/wiN8S4xcFukhEWrz4Dr5mCm1bB9KAnJ9FAj2gbZfkqchAiY6P9nyKZl2J8BjLhN
 jW8A==
X-Gm-Message-State: AOAM530874a6B5R+VW4/3tjxu3bG5zHFfe8qRFtcbJYmaB78/q1pXE4I
 zAqE6AMss+qosI9AWsxhRyanFw==
X-Google-Smtp-Source: ABdhPJx0WPkju0rkzbyAN23LkcPxaNAv1GnCxz7ysqfNPPIUt726n4XrgKb4H6Bn93nkAxdXBYlREg==
X-Received: by 2002:a05:6402:3552:: with SMTP id
 f18mr10535057edd.189.1644753887377; 
 Sun, 13 Feb 2022 04:04:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id kb25sm7329090ejc.130.2022.02.13.04.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 04:04:46 -0800 (PST)
Message-ID: <88094627-fe17-f255-ef93-2e6aaae0e995@mind.be>
Date: Sun, 13 Feb 2022 13:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20220203090848.22869-1-yegorslists@googlemail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220203090848.22869-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/python-docutils: bump to version
 0.18.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/02/2022 10:08, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove the obsolete patch as docutils is now a setuptools package.
> 
> The package also includes code licensed under BSD-3-Clause licence.
> COPYING.txt has the following changes:
> 
> * copyright year
> * more exceptions from the Public Domain added
> * BSD-3-Clause license added
> 
> Fixes:
> http://autobuild.buildroot.net/results/02dd94c09dabdbdd8b47673393577a7fd3af3aeb
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

  James came later with a largely identical patch, but it also extended the list 
of licenses a bit. So I incorporated that change, with his Sob, and applied to 
master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Update-setup.py.patch                | 64 -------------------
>   package/python-docutils/python-docutils.hash  |  6 +-
>   package/python-docutils/python-docutils.mk    |  8 +--
>   3 files changed, 7 insertions(+), 71 deletions(-)
>   delete mode 100644 package/python-docutils/0001-Update-setup.py.patch
> 
> diff --git a/package/python-docutils/0001-Update-setup.py.patch b/package/python-docutils/0001-Update-setup.py.patch
> deleted file mode 100644
> index 3fb34a9763..0000000000
> --- a/package/python-docutils/0001-Update-setup.py.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 583e59ccf72a02c2a6f0399f29f622c7f2f4a932 Mon Sep 17 00:00:00 2001
> -From: milde <milde@929543f6-e4f2-0310-98a6-ba3bd3dd1d04>
> -Date: Sun, 1 Sep 2019 19:39:36 +0000
> -Subject: [PATCH] Update setup.py
> -
> -Python 3.4 no longer supported,
> -more languages supported (and Lithuanian accepted by PyPi).
> -
> -git-svn-id: http://svn.code.sf.net/p/docutils/code/trunk@8383 929543f6-e4f2-0310-98a6-ba3bd3dd1d04
> -
> -[Asaf: adjust upstream patch to 0.15.2]
> -Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ----
> - setup.py | 14 +++++++++++++-
> - 1 file changed, 13 insertions(+), 1 deletion(-)
> -
> -diff --git a/setup.py b/setup.py
> -index f801ea2..5c1ebfd 100755
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -7,6 +7,10 @@ import os
> - import glob
> - try:
> -     import setuptools
> -+except ImportError:
> -+    print('Warning: Could not load package `setuptools`.')
> -+    print('Actions requiring `setuptools` instead of `distutils` will fail')
> -+try:
> -     from distutils.core import setup, Command
> -     from distutils.command.build import build
> -     from distutils.command.build_py import build_py
> -@@ -123,7 +127,7 @@ what-you-see-is-what-you-get plaintext markup syntax.""", # wrap at col 60
> -     'maintainer_email': 'docutils-develop@lists.sourceforge.net',
> -     'license': 'public domain, Python, 2-Clause BSD, GPL 3 (see COPYING.txt)',
> -     'platforms': 'OS-independent',
> --    'python_requires': '>=2.6, !=3.0.*, !=3.1.*, !=3.2.*',
> -+    'python_requires': '>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*, !=3.4.*',
> -     'package_dir': {'docutils': 'docutils',
> -                     'docutils.tools': 'tools'},
> -     'packages': ['docutils',
> -@@ -213,14 +219,20 @@ classifiers = [
> -     'Natural Language :: Chinese (Simplified)',
> -     'Natural Language :: Chinese (Traditional)',
> -     'Natural Language :: Czech',
> -+    'Natural Language :: Danish',
> -     'Natural Language :: Dutch',
> -     'Natural Language :: Esperanto',
> -     'Natural Language :: Finnish',
> -     'Natural Language :: French',
> -     'Natural Language :: Galician',
> -     'Natural Language :: German',
> -+    'Natural Language :: Hebrew',
> -     'Natural Language :: Italian',
> -     'Natural Language :: Japanese',
> -+    'Natural Language :: Korean',
> -+    'Natural Language :: Latvian',
> -+    'Natural Language :: Lithuanian',
> -+    'Natural Language :: Persian',
> -     'Natural Language :: Polish',
> -     'Natural Language :: Portuguese (Brazilian)',
> -     'Natural Language :: Russian',
> ---
> -2.20.1
> -k
> diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
> index ccccca1064..9f6bb53bdb 100644
> --- a/package/python-docutils/python-docutils.hash
> +++ b/package/python-docutils/python-docutils.hash
> @@ -1,4 +1,4 @@
>   # md5 from https://pypi.python.org/pypi/docutils/json, sha256 locally computed
> -md5	e26a308d8000b0bed7416a633217c676  docutils-0.15.2.tar.gz
> -sha256	a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99  docutils-0.15.2.tar.gz
> -sha256  efa0c85aa99ea5b4781240031b0d02af54d7b5554c87ad2b2bea9ba490f6663f  COPYING.txt
> +md5	ca5827e2432fd58f4c8d74a6591135de  docutils-0.18.1.tar.gz
> +sha256	679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06  docutils-0.18.1.tar.gz
> +sha256  f20172170ef9aeebbf53adf5d8f7d309f7dc6068e9a3a1b52ea772305686739d  COPYING.txt
> diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
> index 9a42d3e5dc..3872b54906 100644
> --- a/package/python-docutils/python-docutils.mk
> +++ b/package/python-docutils/python-docutils.mk
> @@ -4,12 +4,12 @@
>   #
>   ################################################################################
>   
> -PYTHON_DOCUTILS_VERSION = 0.15.2
> +PYTHON_DOCUTILS_VERSION = 0.18.1
>   PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
> -PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/93/22/953e071b589b0b1fee420ab06a0d15e5aa0c7470eb9966d60393ce58ad61
> -PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, GPL-3.0 (emacs mode), other
> +PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/57/b1/b880503681ea1b64df05106fc7e3c4e3801736cf63deffc6fa7fc5404cf5
> +PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, GPL-3.0 (emacs mode), other
>   PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
> -PYTHON_DOCUTILS_SETUP_TYPE = distutils
> +PYTHON_DOCUTILS_SETUP_TYPE = setuptools
>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
