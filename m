Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E875CCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 08:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9FD08467C;
	Thu, 16 Oct 2025 08:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rk-qa3RbCWi8; Thu, 16 Oct 2025 08:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B95078467E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B95078467E;
	Thu, 16 Oct 2025 08:33:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FF7693E
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 08:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11C7A8467E
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 08:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jA-4HdiXmHET for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 08:33:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDD688467C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDD688467C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDD688467C
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 08:33:32 +0000 (UTC)
Received: from [192.168.109.49] (ip-185-104-138-122.ptr.icomera.net
 [185.104.138.122])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7B5352C800DC;
 Thu, 16 Oct 2025 10:33:27 +0200 (CEST)
Message-ID: <1ec508e4-44f9-4c53-b69e-4959bad7e426@bubu1.eu>
Date: Thu, 16 Oct 2025 10:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
References: <20250226123415.2518118-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20250226123415.2518118-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760603609; bh=4EcYvQKaWkV/MjP8Xq3koscr3Na8jtEeyMOOPZ4ytGk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=WN+m0U+LYqcAS5y7c5TYhxa8HsSC4SuSU5i/O1I/jqBvHn3wQvDlbWuQiQRSoQ4yt
 497vAvdUu92LXue396DtA9DQ2AGOxUmp6JSvyNMElIyNaw1sWllOb6lSR8ts4YRPlB
 2dSn3sbTpSPwJTB/8VGSC1+TQ5UudOPMt3Qu08uMnFZs06UwmEMRZAED+MmXJqn8fb
 pktduO7VERdqo5xi6PmS6ADzIkojgt46Bjj+XL9jUmZsTSvjt2Vy5pqQlPXBQ6dgB2
 7Fqq1bwKf7ob28eBPIp50ZiL8urE1QnqmdqO1BZcU0XpoqFs7FROckwLEQ0tRELPKE
 xrRDpm2uTmZZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=WN+m0U+L
Subject: Re: [Buildroot] [PATCH v3] package/python-diskcache: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 2/26/25 13:34, Marcus Hoffmann via buildroot wrote:
> The package imports itself in setup.py to get the package-name and
> version number. This doesn't work during the buildroot build, so we
> replace this by the hardcoded package-name and the version number stored
> in buildroot.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

I wanted to ask if there's anything I can do to help getting this 
reviewed/merged. This has unfortunately been setting for almost 8 months 
now, while later python packages I submitted have long been merged.

> ---
> 
> Changes v2: remove accidentally commited .swp file
> Chanegs v3: fix python-diskcache.mk lint errors
> 
>   DEVELOPERS                                    |  3 +++
>   package/Config.in                             |  1 +
>   package/python-diskcache/Config.in            |  8 ++++++++
>   .../python-diskcache/python-diskcache.hash    |  5 +++++
>   package/python-diskcache/python-diskcache.mk  | 20 +++++++++++++++++++
>   .../tests/package/sample_python_diskcache.py  |  9 +++++++++
>   .../tests/package/test_python_diskcache.py    | 12 +++++++++++
>   7 files changed, 58 insertions(+)
>   create mode 100644 package/python-diskcache/Config.in
>   create mode 100644 package/python-diskcache/python-diskcache.hash
>   create mode 100644 package/python-diskcache/python-diskcache.mk
>   create mode 100644 support/testing/tests/package/sample_python_diskcache.py
>   create mode 100644 support/testing/tests/package/test_python_diskcache.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c07837e431..6676f2cf31 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2257,13 +2257,16 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
>   F:	package/nethogs/
>   F:	package/pico-sdk/
>   F:	package/picotool/
> +F:	package/python-diskcache/
>   F:	package/python-immutabledict/
>   F:	package/python-jc/
>   F:	package/python-ruamel-yaml-clib/
>   F:	package/python-waitress/
> +F:	support/testing/tests/package/test_python_diskcache.py
>   F:	support/testing/tests/package/test_python_fastapi.py
>   F:	support/testing/tests/package/test_python_ruamel_yaml.py
>   F:	support/testing/tests/package/test_python_waitress.py
> +F:	support/testing/tests/package/sample_python_diskcache.py
>   F:	support/testing/tests/package/sample_python_fastapi.py
>   F:	support/testing/tests/package/sample_python_ruamel_yaml.py
>   
> diff --git a/package/Config.in b/package/Config.in
> index 4a81a62ec4..7e9ba87e30 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1084,6 +1084,7 @@ menu "External python modules"
>   	source "package/python-dictdiffer/Config.in"
>   	source "package/python-dicttoxml/Config.in"
>   	source "package/python-dicttoxml2/Config.in"
> +	source "package/python-diskcache/Config.in"
>   	source "package/python-distro/Config.in"
>   	source "package/python-django/Config.in"
>   	source "package/python-django-enumfields/Config.in"
> diff --git a/package/python-diskcache/Config.in b/package/python-diskcache/Config.in
> new file mode 100644
> index 0000000000..4bf6c57406
> --- /dev/null
> +++ b/package/python-diskcache/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_DISKCACHE
> +	bool "python-diskcache"
> +	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
> +	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
> +	help
> +	  Disk Cache -- Disk and file backed persistent cache.
> +
> +	  http://www.grantjenks.com/docs/diskcache/
> diff --git a/package/python-diskcache/python-diskcache.hash b/package/python-diskcache/python-diskcache.hash
> new file mode 100644
> index 0000000000..4befb40a4e
> --- /dev/null
> +++ b/package/python-diskcache/python-diskcache.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/diskcache/json
> +md5  d92b4afa944bb70ed38c84a622f7abb5  diskcache-5.6.3.tar.gz
> +sha256  2c3a3fa2743d8535d832ec61c2054a1641f41775aa7c556758a109941e33e4fc  diskcache-5.6.3.tar.gz
> +# Locally computed sha256 checksums
> +sha256  583546baa3fd93607d845126570677a401f508e228b5044fefbc3949af179672  LICENSE
> diff --git a/package/python-diskcache/python-diskcache.mk b/package/python-diskcache/python-diskcache.mk
> new file mode 100644
> index 0000000000..327d076779
> --- /dev/null
> +++ b/package/python-diskcache/python-diskcache.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# python-diskcache
> +#
> +################################################################################
> +
> +PYTHON_DISKCACHE_VERSION = 5.6.3
> +PYTHON_DISKCACHE_SOURCE = diskcache-$(PYTHON_DISKCACHE_VERSION).tar.gz
> +PYTHON_DISKCACHE_SITE = https://files.pythonhosted.org/packages/3f/21/1c1ffc1a039ddcc459db43cc108658f32c57d271d7289a2794e401d0fdb6
> +PYTHON_DISKCACHE_SETUP_TYPE = setuptools
> +PYTHON_DISKCACHE_LICENSE = Apache-2.0
> +PYTHON_DISKCACHE_LICENSE_FILES = LICENSE
> +
> +define PYTHON_DISKCACHE_REMOVE_SELF_IMPORT
> +	sed -i -e '/import diskcache/d' -e 's/diskcache.__title__/"diskcache"/' -e 's/diskcache.__version__/"$(PYTHON_DISKCACHE_VERSION)"/' $(@D)/setup.py
> +endef
> +
> +PYTHON_DISKCACHE_POST_PATCH_HOOKS += PYTHON_DISKCACHE_REMOVE_SELF_IMPORT
> +
> +$(eval $(python-package))
> diff --git a/support/testing/tests/package/sample_python_diskcache.py b/support/testing/tests/package/sample_python_diskcache.py
> new file mode 100644
> index 0000000000..8ba34daf6e
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_diskcache.py
> @@ -0,0 +1,9 @@
> +from diskcache import Cache
> +
> +cache = Cache()
> +
> +cache['test'] = 123
> +assert cache['test'] == 123
> +del cache['test']
> +assert 'test' not in cache
> +cache.close()
> diff --git a/support/testing/tests/package/test_python_diskcache.py b/support/testing/tests/package/test_python_diskcache.py
> new file mode 100644
> index 0000000000..d8618c1681
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_diskcache.py
> @@ -0,0 +1,12 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3DiskCache(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_DISKCACHE=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_diskcache.py"]
> +    timeout = 10


Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
