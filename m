Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EF1C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 15:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37ECD41C40;
	Fri, 12 Apr 2024 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5f5eP30SBIeR; Fri, 12 Apr 2024 15:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7F93409A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7F93409A7;
	Fri, 12 Apr 2024 15:44:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1011BF42E
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A64041E93
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZG8S6Efh95T for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 15:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E2B14155C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E2B14155C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E2B14155C
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 15:44:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 903DC13F8A7;
 Fri, 12 Apr 2024 17:43:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Apr 2024 17:43:52 +0200
Date: Fri, 12 Apr 2024 17:43:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <ZhlWuOI9ZJzGMh6i@landeda>
References: <20240412055358.1354293-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412055358.1354293-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712936641;
 bh=QFH4BP469l7CWMU4ah03pRkBpRJvYzVAk7wZaUbXCXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MMu7BPlGJ+R3900ajf0GWD2hwt1LDTS0VyPDDSGQ9Fcc8dOYOE8utB81qxTseaCQL
 pd1AY9DKvV0b2nVl2swYkTCaOF7qyXD6bXm2/TYJ2hJYfj6Rf0N9IVvl43zVbADADr
 EN7TGInFWKgbOzqi9mu2oZAV41sLroNsv1P/u7OxBpZLC5OwcbjpD+ocL5KUpe1rJB
 uO1lO9q4GLjdv9KaQT2PhwbcFp5ie7Hm5HvJsA9/s9AgcZMw79yuhWnAAEEsPL11VK
 Shw82t9SEBNvPM6o140S9uLUnLigWapH27+7sGQtlCWnuvB6gMAG9SflRwjw7LoFpQ
 dzdDZE+ern1UQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MMu7BPlG
Subject: Re: [Buildroot] [PATCH v3 1/3] package/python-yamllint: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

On 2024-04-12 07:53 +0200, Heiko Thiery spake thusly:
> This host package is needed since u-boot 2024.04 for building ti defconfigs.
> 
> This is an requirement for using buildman/binman [1].
> 
> [1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/python-yamllint/Config.in b/package/python-yamllint/Config.in
> new file mode 100644
> index 0000000000..5c0962f09f
> --- /dev/null
> +++ b/package/python-yamllint/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_YAMLLINT
> +	bool "python-yamllint"
> +	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime

    $ ./utils/docker-run make check-package
    package/python-yamllint/Config.in:3: BR2_PACKAGE_PYTHON_PATHSPEC referenced but not defined

OK, I'll go and apply that other patch of yours that introduces the
target variant for python-pathspec, but which is not in this patchset.

You need more coffee! ;-)

Regards,
Yann E. MORIN.

> +	select BR2_PACKAGE_PYTHON_PYYAML # runtime
> +	help
> +	  A linter for YAML files.
> +
> +	  https://github.com/adrienverge/yamllint
> diff --git a/package/python-yamllint/python-yamllint.hash b/package/python-yamllint/python-yamllint.hash
> new file mode 100644
> index 0000000000..d80e0fdf42
> --- /dev/null
> +++ b/package/python-yamllint/python-yamllint.hash
> @@ -0,0 +1,3 @@
> +# Locally computed sha256 checksums
> +sha256  7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd  yamllint-1.35.1.tar.gz
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
> diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
> new file mode 100644
> index 0000000000..ceaca3b0b8
> --- /dev/null
> +++ b/package/python-yamllint/python-yamllint.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-yamllint
> +#
> +################################################################################
> +
> +PYTHON_YAMLLINT_VERSION = 1.35.1
> +PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
> +PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/da/06/d8cee5c3dfd550cc0a466ead8b321138198485d1034130ac1393cc49d63e
> +PYTHON_YAMLLINT_SETUP_TYPE = pep517
> +PYTHON_YAMLLINT_LICENSE = GPL-3.0
> +PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> +$(eval $(host-python-package))
> diff --git a/support/testing/tests/package/sample_python_yamllint.py b/support/testing/tests/package/sample_python_yamllint.py
> new file mode 100644
> index 0000000000..369a3b8d7d
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_yamllint.py
> @@ -0,0 +1,13 @@
> +# example form https://yamllint.readthedocs.io/en/stable/development.html
> +
> +from yamllint import (config, linter)
> +
> +data = '''---
> +- &anchor
> +  foo: bar
> +- *anchor
> +'''
> +
> +yaml_config = config.YamlLintConfig("extends: default")
> +for p in linter.run(data, yaml_config):
> +    print(p.desc, p.line, p.rule)
> diff --git a/support/testing/tests/package/test_python_yamllint.py b/support/testing/tests/package/test_python_yamllint.py
> new file mode 100644
> index 0000000000..226048ae87
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_yamllint.py
> @@ -0,0 +1,11 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonYamllint(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_YAMLLINT=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_yamllint.py"]
> --
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
