Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AC4C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D7B341991;
	Thu, 26 Jun 2025 19:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEYUoZULg0mu; Thu, 26 Jun 2025 19:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BCDF40555
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BCDF40555;
	Thu, 26 Jun 2025 19:54:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7487010A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BF4040337
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cY9oKcvb9jC for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D9E940075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D9E940075
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D9E940075
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:41 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so1395261f8f.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967679; x=1751572479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9/xFGrQOa0MHK2bLaFmJ+MMI4fbhqmji+n+nNKY/b9M=;
 b=dLNRRXR5CgRgnildnD4mmBWW1/g3nvUrwK1umCtIrC8EMBksaoUdfKiKPyseDiXIro
 SUOoZjUxY+ZqDXlWWbSsSXKRZsvRfa4ZPXBY/6c/Yrgu/uUkokdXVs8yEQ8TPRA13gvk
 ucGqpUpuxPmlDT5UAExcpdK6SpJGXkqLyXsGxZN4EY4kRc7NS/+7Pcvo6CNXmycBnf7h
 BBqCyJhp9gbYEB97KW1RIbntLqTGzHh+ngoy7sDbhZyU/nDxCvcjqDkGqY0BktrrhYHf
 sG3kSyYRz9LuWD11PyLkrhrhtRPFLHpXWs3xyV3CmRrhORRzjy1V92hP15R/7l/clkUO
 gFuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2iXD5plAQW2oOzeqJnbgdWaufoNSqpAgSkeE5i+BROx4T64S1CwVARO2aFGuq2ATQerCLtb8aFu0=@buildroot.org
X-Gm-Message-State: AOJu0YxC/pVz2XwuFIUq9Gn+UzLHL7yeqtBjW8uHCxvV0wXWYtHzDVDY
 WsTFmXujOvt8hSEQUz7Xu9W7AslCRTQUhvjE/ubvrnjLZ7V8bpPpI9TMbG9EgJL6cWV+zKDQ4VG
 1+kfd
X-Gm-Gg: ASbGncuYOSYRR4Ql5TBcSzyBsEJUzyYzULl1ogFI3TeC/8Wdqha9cQulCmeEQ6g7OZe
 Xkb6DVNN8Bn2f6K/+74w8BgrK9OVVWO2PUnBFX/SXMcfR7dissl1m44sPPLra1MGLiXd4+7x3my
 yZLGpOddYt1gAl8ShPpyuqPfUP+papZtVHQpPhGuhjT1e4m9Y3DHpVSMEydj58AgyzYRmuq44bE
 RzfO3cy6+2jZ3HI/TtJrWAL/vsYsBm/tLdwC4UW7xju4i1W0v5OQfIlKk8zKvtXPQIR/z+5bCIB
 vRgX3BxIOpyrxhBI91bAfnaeT0wYnwU4yY5067IqyUIOr7pxdQ2SUZW0M1hwZxyP/+bTKFF3H/8
 TwbfmxvowNcfsAtzj58EIhtSAd4LYuR6q7Mg1Bm+0ZUc=
X-Google-Smtp-Source: AGHT+IGSWzHZFS20X4e/opKaTpRXvz7CeiTtvIJpuCL9q3b31APU4BJm1tyaaJVSxOECdri4noOKqQ==
X-Received: by 2002:a05:6000:25e8:b0:3a4:d31e:4af3 with SMTP id
 ffacd0b85a97d-3a8fee64e2fmr614417f8f.37.1750967679214; 
 Thu, 26 Jun 2025 12:54:39 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538327fed8sm27984255e9.1.2025.06.26.12.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:54:38 -0700 (PDT)
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:54:30 +0200
Message-ID: <20250626195430.15776-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617123249.1359316-1-gwenj@trabucayre.com>
References: <20250617123249.1359316-1-gwenj@trabucayre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967679; x=1751572479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/xFGrQOa0MHK2bLaFmJ+MMI4fbhqmji+n+nNKY/b9M=;
 b=cQfzcqeGgWnkKrLBIzBvOVVImIUUc80qpugxhXnzNau5BeirpkjBSYhpJs+sVx5KPJ
 6blmD21xV9bgdcSe1QhDO35qdsf6rl7o+S8zegoWnq8CskHYQjr4FbmZwjkTghXAq7JN
 uMA/88Wuml//lxvNpt0vAeZcjno8y+CuVZb8xSb9GKCsJeob6mVkUXjPoAXISiX0NjxC
 sTeEIZ51cHH12KyPIXwnJYEfbnGaMFf8xbYedZ78urjgSGST0zgTx/MhEEgKVy30oCCz
 X8759wH+isyhon+frqTa31VDoPl5H++amMQgxQR3Rmr7u4sESsWs0aeu5m9jHwzoQBUl
 TzAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cQfzcqeG
Subject: Re: [Buildroot] [PATCH] package/python-remi: bump to master commit
 and fixes build failure
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> REMI hasn't received new release since July 2022 and is currently broken
> with error:
> 
> Traceback (most recent call last):
>   File "<string>", line 26, in <module>
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 116, in setup
>     _install_setup_requires(attrs)
>     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 89, in _install_setup_requires
>     _fetch_build_eggs(dist)
>     ~~~~~~~~~~~~~~~~~^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 94, in _fetch_build_eggs
>     dist.fetch_build_eggs(dist.setup_requires)
>     ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 80, in fetch_build_eggs
>     raise SetupRequirementsError(specifier_list)
> setuptools.build_meta.SetupRequirementsError: ['setuptools_scm']
> 
> During handling of the above exception, another exception occurred:
> 
> Traceback (most recent call last):
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
>     main()
>     ~~~~^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
>     json_out["return_val"] = hook(**hook_input["kwargs"])
>                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
>     return hook(config_settings)
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 331, in get_requires_for_build_wheel
>     return self._get_build_requires(config_settings, requirements=[])
>            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
>     self.run_setup()
>     ~~~~~~~~~~~~~~^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 512, in run_setup
>     super().run_setup(setup_script=setup_script)
>     ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 317, in run_setup
>     exec(code, locals())
>     ~~~~^^^^^^^^^^^^^^^^
>   File "<string>", line 31, in <module>
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 117, in setup
>     return distutils.core.setup(**attrs)
>            ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/_distutils/core.py", line 148, in setup
>     _setup_distribution = dist = klass(attrs)
>                                  ~~~~~^^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/dist.py", line 323, in __init__
>     _Distribution.__init__(self, dist_attrs)
>     ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/_distutils/dist.py", line 309, in __init__
>     self.finalize_options()
>     ~~~~~~~~~~~~~~~~~~~~~^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/dist.py", line 786, in finalize_options
>     ep(self)
>     ~~^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/dist.py", line 806, in _finalize_setup_keywords
>     ep.load()(self, ep.name, value)
>     ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
>   File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools_scm/_integration/setuptools.py", line 82, in version_keyword
>     assert isinstance(value, dict), "version_keyword expects a dict or True"
>            ~~~~~~~~~~^^^^^^^^^^^^^
> AssertionError: version_keyword expects a dict or True
> 
> ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
> make: *** [package/pkg-generic.mk:273: /workdir/instance-0/output-1/build/python-remi-2022.7.27/.stamp_built] Error 1
> make: Leaving directory '/workdir/instance-0/buildroot'
> 
> Since last release code has been corrected and now build end
> successfully.
> 
> Another issue with remi is related to python CGI library no more available with
> python 3.13. This patch also updates Config.in to add a select BR2_PACKAGE_PYTHON_LEGACY_CGI
> 
> 
> Fix:
> - https://autobuild.buildroot.org/results/f0409533ebdc31e522f2ee2ea8a5acc11dbc7430/
> - https://autobuild.buildroot.org/results/a16cf5105d4b726b5d4136a2d8f82abcfdc0faba/
> - https://autobuild.buildroot.org/results/e7ac28e20ad92863d337e96c225463346ee6c690/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Applied to 2025.05.x. Thanks

> ---
>  package/python-remi/Config.in        | 1 +
>  package/python-remi/python-remi.hash | 3 +--
>  package/python-remi/python-remi.mk   | 5 ++---
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-remi/Config.in b/package/python-remi/Config.in
> index da2c2f4cfb..2ecd310bf2 100644
> --- a/package/python-remi/Config.in
> +++ b/package/python-remi/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_REMI
>  	bool "python-remi"
>  	select BR2_PACKAGE_PYTHON3_SSL # runtime
>  	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
> +	select BR2_PACKAGE_PYTHON_LEGACY_CGI # runtime
>  	help
>  	  Remi is a GUI library for Python applications which transpiles
>  	  an application's interface into HTML to be rendered in a web
> diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
> index e7937c3914..46bee6e664 100644
> --- a/package/python-remi/python-remi.hash
> +++ b/package/python-remi/python-remi.hash
> @@ -1,4 +1,3 @@
> -# sha256 from https://pypi.org/pypi/remi/json
> -sha256  542df88e174bbd58fe763c49e5c2116f2c8413c1a934731069ed8c17bb9cd64c  remi-2022.7.27.tar.gz
>  # Locally computed sha256
> +sha256  8a84941a58952657c7940db2fd3adc6d1ae10a186a02ddc0f1963c353e6108b3  python-remi-18505f6439849c6e01695dd90dbf680d5ffb0a14.tar.gz
>  sha256  3df7d3ad8904d7e99fc0810366483a7cbe5a43c13f7f913f1d7e5023f2ff7657  LICENSE
> diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
> index 419a3441a7..ed0fb2be1d 100644
> --- a/package/python-remi/python-remi.mk
> +++ b/package/python-remi/python-remi.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>  
> -PYTHON_REMI_VERSION = 2022.7.27
> -PYTHON_REMI_SOURCE = remi-$(PYTHON_REMI_VERSION).tar.gz
> -PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/b7/5c/fca9d9273fc9d5f4ca0bc2f387ca19f8ba9979dcb75617d094e575dc2337
> +PYTHON_REMI_VERSION = 18505f6439849c6e01695dd90dbf680d5ffb0a14
> +PYTHON_REMI_SITE = $(call github,rawpython,remi,$(PYTHON_REMI_VERSION))
>  
>  PYTHON_REMI_LICENSE = Apache-2.0
>  PYTHON_REMI_LICENSE_FILES = LICENSE
> -- 
> 2.47.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
