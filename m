Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6A5CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BC068179A;
	Mon,  1 Apr 2024 20:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOcIx9HkMl-q; Mon,  1 Apr 2024 20:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8DDA81E1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8DDA81E1C;
	Mon,  1 Apr 2024 20:12:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 284A21BF3BF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 122BD40710
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHql652ME1FQ for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:12:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F256140382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F256140382
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F256140382
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:11:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41564adfd5dso7831885e9.1
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 13:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712002318; x=1712607118;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cSXHEmiU79xtAOQXiHngf60ocV8HbTZahrHtHmUUPPA=;
 b=XOatK71H270ZtVhIokI9qZl54bL7gQDRTplvpOa+SXYeM0kxVVKlREbZQgX9zSJnpV
 Pw01za5wF/BW7rMNefi1shs1COMfxiTsucYpnrOnXl0G+Bz1/7mujaJeAj85js3OeGIL
 ogq0dRpjsRCYOoZX2PI0cWb44UM8KMtZVH+Bsrxo5JNtlc70qjr3aza8DDCx9/URkumc
 pOBfIdxi2rGFCnhsxpPnbRqbz2Ocz5EC5EQSrGUHaPaC0C1C5cUZ1ZFoQkiQ8p1ulohz
 XPh76cZlKbLME78oYe+DZoww0svNURI/Mmd6LJuFmXoaTXZzB/qUZS/xhIUoREIbb2/B
 aCag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM7AmCYRcJAvkkvXuDnklxh+QGG9KrBy06atO1WrlKG4gr/j58wrTtEaP9IYNGpIehUtmKMI/e/cUzrO2B7SFmqXA/j+EUyw==
X-Gm-Message-State: AOJu0Yw9mMvsm1jUttGzy1NBzQpxeWUTQUU2amxVOOR8b4UaUruneJAe
 mRkfPOJIDk6Y+ZBe0o2FtMy7HJwE82iFwjBdSYKGw3og+GjALM8VXz97/6tnrLA=
X-Google-Smtp-Source: AGHT+IGkWLhu/007z8yLiQ/0rxYpiyv+arM8QgVm9Hkclgy7WPONlou6qqS1v2Y2VznYMZUQ1UD4sA==
X-Received: by 2002:a05:600c:68c6:b0:415:4efe:e9b0 with SMTP id
 jd6-20020a05600c68c600b004154efee9b0mr7201607wmb.18.1712002317615; 
 Mon, 01 Apr 2024 13:11:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c154a00b004155ea07080sm7141170wmg.43.2024.04.01.13.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 13:11:57 -0700 (PDT)
Message-ID: <84fa1fe5-d6a7-4011-ba71-5a3bbce13490@mind.be>
Date: Mon, 1 Apr 2024 22:11:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
 <20240331004133.636618-18-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240331004133.636618-18-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712002318; x=1712607118; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cSXHEmiU79xtAOQXiHngf60ocV8HbTZahrHtHmUUPPA=;
 b=Fa7MvtnQrvDIpdwQww3nL3pVf8KEUxToQ30wMp5x1wn6UFzTYDW3fHSlhAM2og3ZrB
 GRF7jnzUpEtxFvvKrPQNROfEBhRqQfPXl+2N3/9vx9E1azDfRFFpnj+4qpPCXzLq+YJS
 9XnENla4EpGOoOFREbqG6i4KzMYcq+Qh3W/V4KPqf9aMajvjCDcbLgGGKMUzRDXICXkG
 ePGOWHudqCBohyUBFH1xBD4sXVq7QD83WFL31f6bBH6ZC5K9e073eLjob2nhJPMP/9qH
 iHmEl+Mcdp2u13laEaWn5HJpq0czv9nKx6Z/OcVoL8vLjNNYvyQFcdnb9WKICWAv1tJa
 uzDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fa7MvtnQ
Subject: Re: [Buildroot] [PATCH v9 18/18] package/pkg-python.mk: migrate
 setuptools to pep517
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Christian Kellermann <christian.kellermann@solectrix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/03/2024 01:41, James Hilliard wrote:
> Now that setuptools and its dependencies are using pep517 we can
> migrate the setuptools infrastructure itself to use the pep517
> build frontend.
> 
> As part of this we need to migrate the all python packages using
> _BUILD_OPTS to the new config settings format used by the pep517
> build frontend.
> 
> We need to use a setup.cfg file to pass the pg_config path when
> building python-psycopg2 as this package needs the pg_config
> path for all internal build stages while -C--build-option= only
> passes the flag to the internal bdist_wheel stage.
> 
> Use new setup type variables to define setup type specific
> dependencies instead of using the conditional block.
> 
> We also need to set --skip-dependency-check for the following
> packages which specify build dependencies that are not actually
> required:
>   - python-lxml
>   - python-matplotlib
>   - python-msgpack
>   - python-pymupdf
>   - python-uvloop
>   - python-wsaccel
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v8 -> v9:
>    - use setup.cfg for python-psycopg2 to pass pg_config path
> Changes v7 -> v8:
>    - disable dependency enforcement for more packages
> Changes v6 -> v7:
>    - just disable dependency enforcement for msgpack
>    - rebase
> Changes v5 -> v6:
>    - use setup type variables for dependencies
> Changes v4 -> v5:
>    - rebase on next
> Changes v1 -> v3:
>    - rebase on master
>    - combine setuptools-rust and maturin env variables
>    - drop patch which is now upstream
> ---
>   package/pkg-python.mk                         | 160 +++++++++---------
>   package/python-evdev/python-evdev.mk          |   4 +-
>   package/python-lxml/python-lxml.mk            |  10 +-
>   package/python-m2crypto/python-m2crypto.mk    |   4 +-
>   .../python-matplotlib/python-matplotlib.mk    |   1 +
>   package/python-msgpack/python-msgpack.mk      |   1 +
>   package/python-pillow/python-pillow.mk        |  35 ++--
>   package/python-psycopg2/python-psycopg2.mk    |   7 +-
>   package/python-pymupdf/python-pymupdf.mk      |   1 +
>   package/python-pyzmq/python-pyzmq.mk          |   4 +-
>   package/python-uvloop/python-uvloop.mk        |   7 +-
>   package/python-wsaccel/python-wsaccel.mk      |   1 +
>   12 files changed, 122 insertions(+), 113 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 94f28ff841..839f728e2f 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -52,15 +52,62 @@ HOST_PKG_PYTHON_ENV = \
>   	PYTHONNOUSERSITE=1 \
>   	$(HOST_CONFIGURE_OPTS)
>   
> -# Target setuptools-based packages
> -PKG_PYTHON_SETUPTOOLS_ENV = \
> +# Target pep517-based packages
> +PKG_PYTHON_PEP517_ENV = \

  For the review, it would have been nice to have either injected a preparatory 
patch that just moves setuptools after pep517, or to have kept the ordering of 
setuptools before pep517. Oh well, I managed to review it so I guess it's fine.

>   	$(PKG_PYTHON_ENV)
>   
> -PKG_PYTHON_SETUPTOOLS_CMD = \
> -	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
> +PKG_PYTHON_PEP517_BUILD_CMD = \
> +	-m build -n -w
> +
> +PKG_PYTHON_PEP517_INSTALL_OPTS = \
> +	--interpreter=/usr/bin/python \
> +	--script-kind=posix
> +
> +PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
> +	$(TOPDIR)/support/scripts/pyinstaller.py \
> +	dist/* \
> +	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
> +	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> +	--scripts=$(TARGET_DIR)/usr/bin \
> +	--data=$(TARGET_DIR)/usr
> +
> +PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
> +	$(TOPDIR)/support/scripts/pyinstaller.py \
> +	dist/* \
> +	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
> +	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> +	--scripts=$(STAGING_DIR)/usr/bin \
> +	--data=$(STAGING_DIR)/usr
> +
> +PKG_PYTHON_PEP517_DEPENDENCIES = \
> +	host-python-pypa-build \
> +	host-python-installer
> +
> +# Host pep517-based packages
> +HOST_PKG_PYTHON_PEP517_ENV = \
> +	$(HOST_PKG_PYTHON_ENV)
> +
> +HOST_PKG_PYTHON_PEP517_BUILD_CMD = \
> +	-m build -n -w
> +
> +HOST_PKG_PYTHON_PEP517_INSTALL_CMD = \
> +	$(TOPDIR)/support/scripts/pyinstaller.py \
> +	dist/* \
> +	--interpreter=$(HOST_DIR)/bin/python \
> +	--script-kind=posix \
> +	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
> +	--scripts=$(HOST_DIR)/bin \
> +	--data=$(HOST_DIR)
> +
> +# Target setuptools-based packages
> +PKG_PYTHON_SETUPTOOLS_ENV = \
> +	$(PKG_PYTHON_PEP517_ENV)

  I think most of the additional variables are no longer needed now, because 
everything is either pep517-based or bootstrap... So there can be a follow-up 
patch simplifying things again, right?

>   
>   PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
> -	$(PKG_PYTHON_SETUPTOOLS_CMD) build
> +	$(PKG_PYTHON_PEP517_BUILD_CMD)
>   
>   PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> @@ -69,30 +116,24 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   	--single-version-externally-managed

  I wonder if there install opts are still needed now we're using pep517?

[snip]
> @@ -293,28 +300,17 @@ else
>   $(2)_DEPENDENCIES += host-python3
>   endif # ($(4),target)
>   
> -# Setuptools based packages will need setuptools for the host Python
> -# interpreter (both host and target).
> +# Setup type specific dependencies are the same whether we are
> +# building for the host or the target.
>   #
> -ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
> -$(2)_DEPENDENCIES += host-python-setuptools
> -ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
> -$(2)_DEPENDENCIES += host-python-setuptools-rust
> -endif
> -else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
> -$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
> -ifeq ($$($(2)_SETUP_TYPE),flit)
> -$(2)_DEPENDENCIES += host-python-flit-core
> -endif
> -ifeq ($$($(2)_SETUP_TYPE),maturin)
> -$(2)_DEPENDENCIES += host-python-maturin
> -endif
> -else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
> +ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
>   # Don't add dependency on host-python-installer for
>   # host-python-installer itself, and its dependencies.
>   ifeq ($$(filter host-python-flit-core host-python-installer,$(1)),)
>   $(2)_DEPENDENCIES += host-python-installer
>   endif
> +else
> +$(2)_DEPENDENCIES += $$(PKG_PYTHON_$$($(2)_SETUP_TYPE_UPPER)_DEPENDENCIES)

  Very nice cleanup! Would have been better as a separate patch too (especially 
because it's entirely independent of the pep517 business), but OK.

>   endif
>   
>   # Pyo3 based packages(setuptools-rust and maturin) will need rust
> diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
> index 5cf62b5160..b509b43e8a 100644
> --- a/package/python-evdev/python-evdev.mk
> +++ b/package/python-evdev/python-evdev.mk
> @@ -12,7 +12,7 @@ PYTHON_EVDEV_LICENSE = Revised BSD License
>   PYTHON_EVDEV_LICENSE_FILES = LICENSE
>   
>   PYTHON_EVDEV_BUILD_OPTS = \
> -	build_ecodes \
> -	--evdev-headers $(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h
> +	-C--build-option=build_ecodes \
> +	-C--build-option=--evdev-headers=$(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h
>   
>   $(eval $(python-package))
> diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
> index 519a9a77ac..336f954775 100644
> --- a/package/python-lxml/python-lxml.mk
> +++ b/package/python-lxml/python-lxml.mk
> @@ -28,11 +28,13 @@ HOST_PYTHON_LXML_DEPENDENCIES = host-libxml2 host-libxslt host-zlib
>   # python-lxml needs these scripts in order to properly detect libxml2 and
>   # libxslt compiler and linker flags
>   PYTHON_LXML_BUILD_OPTS = \
> -	--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
> -	--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
> +	--skip-dependency-check

  The backslash is missing here...

> +	-C--build-option=--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \

... and here it's indented with spaces instead of tab...

  Please do at least a very minimal final check before hitting send-email :-) 
(Not that I've never made a mistake like that so I shouldn't talk perhaps.)

> +	-C--build-option=--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
>   HOST_PYTHON_LXML_BUILD_OPTS = \
> -	--xslt-config=$(HOST_DIR)/bin/xslt-config \
> -	--xml2-config=$(HOST_DIR)/bin/xml2-config
> +	--skip-dependency-check
> +	-C--build-option=--xslt-config=$(HOST_DIR)/bin/xslt-config \
> +	-C--build-option=--xml2-config=$(HOST_DIR)/bin/xml2-config
>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))
> diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
> index 69a0c28df5..6c07f42d06 100644
> --- a/package/python-m2crypto/python-m2crypto.mk
> +++ b/package/python-m2crypto/python-m2crypto.mk
> @@ -13,6 +13,8 @@ PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
>   PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
>   PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
>   PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
> -PYTHON_M2CRYPTO_BUILD_OPTS = --openssl=$(STAGING_DIR)/usr
> +PYTHON_M2CRYPTO_BUILD_OPTS = \
> +	-C--build-option=build_ext \

  The commit message doesn't explain why build_ext is needed now... I added an 
explanation, hopefully it's correct:

In python-m2crypto, the --openssl option is a build_ext option so we need to add 
-C--build-option build_ext in front of it.


> +	-C--build-option=--openssl=$(STAGING_DIR)/usr
>   
>   $(eval $(python-package))

[snip]
> diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
> index 285884a2bb..aaeab2805f 100644
> --- a/package/python-uvloop/python-uvloop.mk
> +++ b/package/python-uvloop/python-uvloop.mk
> @@ -10,8 +10,11 @@ PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/9c/16/728cc5dde368e
>   PYTHON_UVLOOP_SETUP_TYPE = setuptools
>   PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
>   PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> -PYTHON_UVLOOP_BUILD_OPTS = build_ext --inplace --use-system-libuv
> -PYTHON_UVLOOP_INSTALL_TARGET_OPTS = build_ext --inplace --use-system-libuv
>   PYTHON_UVLOOP_DEPENDENCIES = libuv
> +PYTHON_UVLOOP_BUILD_OPTS = \
> +	--skip-dependency-check \
> +	-C--build-option=build_ext \
> +	-C--build-option=--inplace \
> +	-C--build-option=--use-system-libuv

  So, before we also needed to set the options during INSTALL_TARGET. That's no 
longer needed now? Any idea why?

  Regards,
  Arnout

>   
>   $(eval $(python-package))
> diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
> index 1f63aa5c40..7ccb033256 100644
> --- a/package/python-wsaccel/python-wsaccel.mk
> +++ b/package/python-wsaccel/python-wsaccel.mk
> @@ -10,5 +10,6 @@ PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/94/28/41c0e711b538
>   PYTHON_WSACCEL_LICENSE = Apache-2.0
>   PYTHON_WSACCEL_LICENSE_FILES = LICENSE
>   PYTHON_WSACCEL_SETUP_TYPE = setuptools
> +PYTHON_WSACCEL_BUILD_OPTS = --skip-dependency-check
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
