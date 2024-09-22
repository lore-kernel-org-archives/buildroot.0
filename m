Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A33CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8811B40247;
	Sun, 22 Sep 2024 18:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMdWgOiFknsz; Sun, 22 Sep 2024 18:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22E024027F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22E024027F;
	Sun, 22 Sep 2024 18:18:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29F891BF3E1
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18DBA402DB
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQdiO-2kiPi1 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF2F0402FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF2F0402FE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF2F0402FE
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:17:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 658E05FF95;
 Sun, 22 Sep 2024 20:17:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Sep 2024 20:17:49 +0200
Date: Sun, 22 Sep 2024 20:17:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZvBfTYGnqnv1SyBi@landeda>
References: <20240922084406.1012789-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922084406.1012789-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727029074;
 bh=F0rD0Os9XpnZ0Br5u/QJL+HmicxSf2JSdz4lR5E+D+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkECjhtpaTVSh5uJcV0JLsaaI5mufQsi+9TCLAiyFd7q3hm23oc8FVMXj8MQnmAR3
 GitG/e6+EFoIU509YrG4eel77juP6ds7QgZY6yoEGWlYepXPcdDCLbrEp9ua830Mp9
 jKsMsHILSt5VVAyCds8t7xhQpBJHZFrPFikayB5/4Rh+qcXpc1epY1fM478zMutww3
 FCNr9bi75uH/9NisPm3eQvKiGyjYtNVNbCqCDQwTQObhYsgiZBOUPxKhuFFyhQXwi+
 WCJQbxDptAgRtT5ngEA4PPB3JVCweq0pNcOkW/EdLB/BWBai2AJ0i4mOSYpqtDL+c5
 TdFMyijaT/0DA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bkECjhtp
Subject: Re: [Buildroot] [PATCH 1/2] package/python-argcomplete: new package
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-22 02:44 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                                 |  1 +
>  package/python-argcomplete/Config.in              |  6 ++++++
>  .../python-argcomplete/python-argcomplete.hash    |  5 +++++
>  package/python-argcomplete/python-argcomplete.mk  | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-argcomplete/Config.in
>  create mode 100644 package/python-argcomplete/python-argcomplete.hash
>  create mode 100644 package/python-argcomplete/python-argcomplete.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2200f16520..6e1ce3388a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -998,6 +998,7 @@ menu "External python modules"
>  	source "package/python-anyio/Config.in"
>  	source "package/python-apispec/Config.in"
>  	source "package/python-appdirs/Config.in"
> +	source "package/python-argcomplete/Config.in"
>  	source "package/python-argh/Config.in"
>  	source "package/python-argon2-cffi/Config.in"
>  	source "package/python-argon2-cffi-bindings/Config.in"
> diff --git a/package/python-argcomplete/Config.in b/package/python-argcomplete/Config.in
> new file mode 100644
> index 0000000000..ba9db643a7
> --- /dev/null
> +++ b/package/python-argcomplete/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_ARGCOMPLETE
> +	bool "python-argcomplete"
> +	help
> +	  Bash tab completion for argparse.
> +
> +	  https://github.com/kislyuk/argcomplete
> diff --git a/package/python-argcomplete/python-argcomplete.hash b/package/python-argcomplete/python-argcomplete.hash
> new file mode 100644
> index 0000000000..88bd7c9565
> --- /dev/null
> +++ b/package/python-argcomplete/python-argcomplete.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/argcomplete/json
> +md5  5e5bb2e193a5581cb06abae2de3dd3d8  argcomplete-3.5.0.tar.gz
> +sha256  4349400469dccfb7950bb60334a680c58d88699bff6159df61251878dc6bf74b  argcomplete-3.5.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.rst
> diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
> new file mode 100644
> index 0000000000..1773f98914
> --- /dev/null
> +++ b/package/python-argcomplete/python-argcomplete.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-argcomplete
> +#
> +################################################################################
> +
> +PYTHON_ARGCOMPLETE_VERSION = 3.5.0
> +PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
> +PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/75/33/a3d23a2e9ac78f9eaf1fce7490fee430d43ca7d42c65adabbb36a2b28ff6
> +PYTHON_ARGCOMPLETE_SETUP_TYPE = setuptools
> +PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
> +PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
> +PYTHON_ARGCOMPLETE_DEPENDENCIES = host-python-setuptools-scm
> +
> +$(eval $(python-package))
> -- 
> 2.34.1
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
