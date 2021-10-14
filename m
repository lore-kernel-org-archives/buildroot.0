Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D25C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:37:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C027F60F59
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C027F60F59
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8321540125;
	Thu, 14 Oct 2021 20:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GCvkbnLR-Y4e; Thu, 14 Oct 2021 20:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0256440467;
	Thu, 14 Oct 2021 20:37:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7CDC1BF599
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D581C40467
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLaGmC9sBNwY for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:37:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10A0540125
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:37:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r18so29182785edv.12
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 13:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NwKOyzksu2AfuelHoJY8B6RwFKbAQJxrr98YR/k9ots=;
 b=AcBL1L3u5CwzeHM9zY0PqZKuXzJmMo1QAwaCMR2ggD10Ao/Wb8NpTUT2xcgqWbauED
 nqEFCtPLUKwnesefAnyaUZ+Gh5Qs9YKpySTWoakrIFJ4V6fmt4/kndDtW4ltSu1ddW0D
 thIoh9zPVD9K+hyBT1Jw6ZT9w0nVW5DGXDV7FuTzpWwdA0FJz0LSM8c05fiMClpYOTWf
 rDPfV8TbjSiNLRqINf0s8QDLfIN40d2yyIyIc9Ww16MHDG53rwZyGdFHrmFxmJREe+lL
 dHTFq2PzmyA6yHcGtQthhK89R7CuUpR4Q0o4txchVclxedwrvDrhWXfk1WAgVTM5Brp+
 3qTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NwKOyzksu2AfuelHoJY8B6RwFKbAQJxrr98YR/k9ots=;
 b=Jbi6iR+66nCMM9VGzsq+4jr3fZPbpQ+j1u2+EHre6pe5js/rMXk1G61spuizAzbcwn
 C2WV4uIQ9XOO2XfgbKwNjpWBTm+dkNmwAda3Ls3WLMlDJxFQEz6Mn9GPIirUU25MYc0R
 8fXirTO1PQ/5jTziuw6x2TxUcbD3/+jVf8o9kL44h0cnLP0u8f/fCFG5/gmB3QDBkijP
 vz4+ALzKxSkjVcOCzugNolzUob9p/r8wVQIc/YfuhbienjfhoGxtwbXqx2I7QOfCkn84
 HrNDu6ldLJNDF8BighwvPrJ+ncLDYDRlWQx3rT0cJC28gasglGLJfa1/N2mi/+HHL0Vk
 PpXA==
X-Gm-Message-State: AOAM5304X6tQYua9Rw0+alwoA3k1TcHPIvwsO44b1saxYz7Ga8DegehE
 GvlpvjZLiOo8qz5iIcvZBGaRbg==
X-Google-Smtp-Source: ABdhPJz/YfOfFIZk7PHGR8bSBdIrl67qf41imXsdAYAwV/Et6zZhuvFF9Saq0Kyy778hVSHUtYofIQ==
X-Received: by 2002:a50:e0cf:: with SMTP id j15mr12253265edl.23.1634243829123; 
 Thu, 14 Oct 2021 13:37:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i19sm186455ejo.101.2021.10.14.13.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 13:37:08 -0700 (PDT)
Message-ID: <0c6ae527-348c-58dd-72ff-d4dfd5863b74@mind.be>
Date: Thu, 14 Oct 2021 22:37:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211007193121.3775311-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007193121.3775311-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-markupsafe: bump to
 version 2.0.1
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Matt Weber <matthew.weber@collins.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

  Quote a few changes needed I'm afraid...

On 07/10/2021 21:31, James Hilliard wrote:
> Drop python2 support.
> 
> Remove python3-markupsafe host build as python2 host builds for
> markupsafe are not supported, python3 host builds are moved to
> python-markupsafe.
> 
> Propagate reverse python3 dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-flask-babel/Config.in             |  1 +
>   package/python-flask-cors/Config.in              |  1 +
>   package/python-flask-expects-json/Config.in      |  1 +
>   package/python-flask-jsonrpc/Config.in           |  1 +
>   package/python-flask-login/Config.in             |  1 +
>   package/python-flask-sqlalchemy/Config.in        |  1 +
>   package/python-flask-wtf/Config.in               |  1 +
>   package/python-flask/Config.in                   |  1 +
>   package/python-jinja2/Config.in                  |  1 +
>   package/python-markupsafe/Config.in              |  1 +
>   package/python-markupsafe/python-markupsafe.hash |  9 +++++----
>   package/python-markupsafe/python-markupsafe.mk   |  7 ++++---
>   package/python-wtforms/Config.in                 |  1 +
>   package/python3-jinja2/python3-jinja2.mk         |  2 +-
>   .../python3-markupsafe/python3-markupsafe.hash   |  1 -
>   package/python3-markupsafe/python3-markupsafe.mk | 16 ----------------
>   16 files changed, 21 insertions(+), 25 deletions(-)
>   delete mode 120000 package/python3-markupsafe/python3-markupsafe.hash
>   delete mode 100644 package/python3-markupsafe/python3-markupsafe.mk
> 
> diff --git a/package/python-flask-babel/Config.in b/package/python-flask-babel/Config.in
> index 272d9ef1c1..52f05f1e6a 100644
> --- a/package/python-flask-babel/Config.in
> +++ b/package/python-flask-babel/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FLASK_BABEL
>   	bool "python-flask-babel"
> +	depends on BR2_PACKAGE_PYTHON3

  We normally put a comment behind it to say where it comes from, if the package 
itself doesn't directly depend on python3.

>   	select BR2_PACKAGE_PYTHON_FLASK # runtime
>   	select BR2_PACKAGE_PYTHON_BABEL # runtime
>   	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
> diff --git a/package/python-flask-cors/Config.in b/package/python-flask-cors/Config.in
> index e2e84797f9..f34f77e5b0 100644
> --- a/package/python-flask-cors/Config.in
> +++ b/package/python-flask-cors/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FLASK_CORS
>   	bool "python-flask-cors"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_FLASK # runtime
>   	select BR2_PACKAGE_PYTHON_SIX # runtime

  You should check if six is really needed if it's python3 only (some packages 
drop the dependency on six if it's python3 anyway). Just check if any match of 
`import .*six' is conditional or not.


>   	help
> diff --git a/package/python-flask-expects-json/Config.in b/package/python-flask-expects-json/Config.in
> index 901234762e..efe4c248d3 100644
> --- a/package/python-flask-expects-json/Config.in
> +++ b/package/python-flask-expects-json/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FLASK_EXPECTS_JSON
>   	bool "python-flask-expects-json"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_FLASK # runtime
>   	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
>   	help
> diff --git a/package/python-flask-jsonrpc/Config.in b/package/python-flask-jsonrpc/Config.in
> index c8ecd854b3..4bc13f9bcb 100644
> --- a/package/python-flask-jsonrpc/Config.in
> +++ b/package/python-flask-jsonrpc/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FLASK_JSONRPC
>   	bool "python-flask-jsonrpc"
> +	depends on BR2_PACKAGE_PYTHON3
>   	# runtime dependency
>   	select BR2_PACKAGE_PYTHON_FLASK
>   	help
> diff --git a/package/python-flask-login/Config.in b/package/python-flask-login/Config.in
> index 88c413e2a2..00fa58d783 100644
> --- a/package/python-flask-login/Config.in
> +++ b/package/python-flask-login/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FLASK_LOGIN
>   	bool "python-flask-login"
> +	depends on BR2_PACKAGE_PYTHON3
>   	# runtime dependency
>   	select BR2_PACKAGE_PYTHON_FLASK
>   	help
> diff --git a/package/python-flask-sqlalchemy/Config.in b/package/python-flask-sqlalchemy/Config.in
> index fa4a035110..e96bd7078c 100644
> --- a/package/python-flask-sqlalchemy/Config.in
> +++ b/package/python-flask-sqlalchemy/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FLASK_SQLALCHEMY
>   	bool "python-flask-sqlalchemy"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_FLASK # runtime
>   	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
>   	help
> diff --git a/package/python-flask-wtf/Config.in b/package/python-flask-wtf/Config.in
> index bb15489956..022ea89265 100644
> --- a/package/python-flask-wtf/Config.in
> +++ b/package/python-flask-wtf/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FLASK_WTF
>   	bool "python-flask-wtf"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_FLASK # runtime
>   	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
>   	select BR2_PACKAGE_PYTHON_WTFORMS # runtime
> diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
> index 0e5b64ce59..56bfe10f01 100644
> --- a/package/python-flask/Config.in
> +++ b/package/python-flask/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FLASK
>   	bool "python-flask"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_CLICK # runtime
>   	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
>   	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
> diff --git a/package/python-jinja2/Config.in b/package/python-jinja2/Config.in
> index 5b99df75b8..27f6b1a7dd 100644
> --- a/package/python-jinja2/Config.in
> +++ b/package/python-jinja2/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_JINJA2
>   	bool "python-jinja2"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
>   	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON

  This should be removed. There are a bunch of those in various packages.

>   	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3

  The condition part of this one should also be removed.


  python-jinja2 has a host variant. Making it python3-only means you also have 
to set HOST_PYTHON_JINJA2_NEEDS_HOST_PYTHON = python3

(there may be others as well)

> diff --git a/package/python-markupsafe/Config.in b/package/python-markupsafe/Config.in
> index 48421e0a32..cd7cb2d8e9 100644
> --- a/package/python-markupsafe/Config.in
> +++ b/package/python-markupsafe/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_MARKUPSAFE
>   	bool "python-markupsafe"
> +	depends on BR2_PACKAGE_PYTHON3
>   	help
>   	  MarkupSafe implements a XML/HTML/XHTML Markup safe string
>   	  for Python.
> diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
> index df07662a86..520bb405fb 100644
> --- a/package/python-markupsafe/python-markupsafe.hash
> +++ b/package/python-markupsafe/python-markupsafe.hash
> @@ -1,4 +1,5 @@
> -# md5 from https://pypi.python.org/pypi/markupsafe/json, sha256 locally computed
> -md5	43fd756864fe42063068e092e220c57b  MarkupSafe-1.1.1.tar.gz
> -sha256	29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b  MarkupSafe-1.1.1.tar.gz
> -sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
> +# md5, sha256 from https://pypi.org/pypi/markupsafe/json
> +md5  892e0fefa3c488387e5cc0cad2daa523  MarkupSafe-2.0.1.tar.gz
> +sha256  594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a  MarkupSafe-2.0.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
> diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
> index f067d94f34..14a8d06dfe 100644
> --- a/package/python-markupsafe/python-markupsafe.mk
> +++ b/package/python-markupsafe/python-markupsafe.mk
> @@ -4,13 +4,14 @@
>   #
>   ################################################################################
>   
> -# Please keep in sync with package/python3-markupsafe/python3-markupsafe.mk
> -PYTHON_MARKUPSAFE_VERSION = 1.1.1
> +PYTHON_MARKUPSAFE_VERSION = 2.0.1
>   PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
> -PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
> +PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e
>   PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
>   PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
>   PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
>   
> +HOST_PYTHON_MARKUPSAFE_NEEDS_HOST_PYTHON = python3

  Yes, like this :-)

> +
>   $(eval $(python-package))
>   $(eval $(host-python-package))
> diff --git a/package/python-wtforms/Config.in b/package/python-wtforms/Config.in
> index 33a17d3d37..0cc136fc13 100644
> --- a/package/python-wtforms/Config.in
> +++ b/package/python-wtforms/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_WTFORMS
>   	bool "python-wtforms"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
>   	help
>   	  A flexible forms validation and rendering library for
> diff --git a/package/python3-jinja2/python3-jinja2.mk b/package/python3-jinja2/python3-jinja2.mk
> index 5d29e1d889..41081db04a 100644
> --- a/package/python3-jinja2/python3-jinja2.mk
> +++ b/package/python3-jinja2/python3-jinja2.mk
> @@ -15,6 +15,6 @@ PYTHON3_JINJA2_CPE_ID_PRODUCT = jinja2
>   
>   HOST_PYTHON3_JINJA2_NEEDS_HOST_PYTHON = python3
>   # In host build, setup.py tries to download markupsafe if it is not installed
> -HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python3-markupsafe
> +HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python-markupsafe

  Since python-jinja2 became python3-only, this package can be removed entirely.


  Regards,
  Arnout


>   
>   $(eval $(host-python-package))
> diff --git a/package/python3-markupsafe/python3-markupsafe.hash b/package/python3-markupsafe/python3-markupsafe.hash
> deleted file mode 120000
> index 947cfa12d7..0000000000
> --- a/package/python3-markupsafe/python3-markupsafe.hash
> +++ /dev/null
> @@ -1 +0,0 @@
> -../python-markupsafe/python-markupsafe.hash
> \ No newline at end of file
> diff --git a/package/python3-markupsafe/python3-markupsafe.mk b/package/python3-markupsafe/python3-markupsafe.mk
> deleted file mode 100644
> index 58f6e67b64..0000000000
> --- a/package/python3-markupsafe/python3-markupsafe.mk
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -################################################################################
> -#
> -# python3-markupsafe
> -#
> -################################################################################
> -
> -PYTHON3_MARKUPSAFE_VERSION = 1.1.1
> -PYTHON3_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON3_MARKUPSAFE_VERSION).tar.gz
> -PYTHON3_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
> -PYTHON3_MARKUPSAFE_SETUP_TYPE = setuptools
> -PYTHON3_MARKUPSAFE_LICENSE = BSD-3-Clause
> -PYTHON3_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
> -
> -HOST_PYTHON3_MARKUPSAFE_NEEDS_HOST_PYTHON = python3
> -
> -$(eval $(host-python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
