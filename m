Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEF4C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D93B4038B;
	Wed,  7 Feb 2024 09:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y8abfWb4J44G; Wed,  7 Feb 2024 09:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10D940297
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C10D940297;
	Wed,  7 Feb 2024 09:58:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B60F1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4599B42201
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uHyDtLvi4lwk for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:58:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1C6241A60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1C6241A60
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1C6241A60
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:58:51 +0000 (UTC)
Received: from [10.0.0.63] (unknown [109.133.241.250])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B8F822C83776;
 Wed,  7 Feb 2024 10:58:49 +0100 (CET)
Message-ID: <d486cffd-3faa-465a-a966-08809329c87f@bubu1.eu>
Date: Wed, 7 Feb 2024 10:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20240206225928.2290100-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20240206225928.2290100-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707299930; bh=uYa84BqexAIgfu9rf97CD+da8FQATf7vf+Z1e+V6EM4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=nBJBC4f4mTN5fWB7y6N3bk9lLErSe8jog0sl94KHMfT2cKXj6riDxSxHDOaxJz6j3
 QQAEIstV9G1He2HJS+Eo1WTYMxqGPttdKjhqp3cJ2dAyM/t6fUO2/cNLR8aN84C9he
 oXofKiTrpdyWnMQTpw2eGJfSK+qZwq6FrriD0D/pNIcBY6CeoEF9vxJ0G7NkagE5Qx
 DWvltCLcgMi9Tcryc0GQ2PJdYHuCz52YLF8+JyohDHy8Ebb3RLkC5PljQPZYGqLsKf
 wt7VvZqdAWHzdTPhSTG4P1M/33HAy3thIPtj0Zi6FjQcv1qe9AR5Zw8IgLj0GDZHUg
 h3f7NisWcsg2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=nBJBC4f4
Subject: Re: [Buildroot] [PATCH] package/python3: add option to disable
 ensurepip
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 06.02.24 23:59, Thomas Petazzoni via buildroot wrote:
> This module takes 2.1 MB and is not needed in most Python
> installations.
> 
> Reported-by: Marcus Hoffmann <buildroot@bubu1.eu>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks a lot for this patch after my suggestion! Patch looks good, but 
given the unfortunate "non-cooperative upstream", I still wonder if this 
wouldn't be easier to maintain if we just remove the installed module 
after the fact with a post install hook? I suppose a similar thing could 
be done for the other optional modules as well with the new 
py_cv_module_XYZ, which disables the native part but still requires 
patching makefile/configure.ac for not installing the python lib part.

Both approaches work and get us to the same end result, so it's not too 
important to worry about, I guess :).

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   ...-add-disable-ensurepip-module-option.patch | 68 +++++++++++++++++++
>   package/python3/Config.in                     |  5 ++
>   package/python3/python3.mk                    |  6 ++
>   3 files changed, 79 insertions(+)
>   create mode 100644 package/python3/0018-configure.ac-add-disable-ensurepip-module-option.patch
> 
> diff --git a/package/python3/0018-configure.ac-add-disable-ensurepip-module-option.patch b/package/python3/0018-configure.ac-add-disable-ensurepip-module-option.patch
> new file mode 100644
> index 0000000000..2761236c9b
> --- /dev/null
> +++ b/package/python3/0018-configure.ac-add-disable-ensurepip-module-option.patch
> @@ -0,0 +1,68 @@
> +From 10b67aeb6a6be10218c3dd675d3e54874ced1a55 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Tue, 6 Feb 2024 23:49:32 +0100
> +Subject: [PATCH] configure.ac: add --disable-ensurepip-module option
> +
> +The ensurepip module weights 2.1 MB and is only needed if you need
> +"support for bootstrapping the pip installer into an existing Python
> +installation or virtual environment" [1].
> +
> +This patch adds a --disable-ensurepip-module option that allows to not
> +install it. It should not be confused with --without-ensurepip, which
> +already exists, but even with --without-ensurepip, the ensurepip
> +module gets installed, but not used during the build to bootstrap the
> +pip installer.
> +
> +[1] https://docs.python.org/3/library/ensurepip.html
> +
> +Upstream: non-cooperative upstream
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + Makefile.pre.in | 5 ++++-
> + configure.ac    | 7 +++++++
> + 2 files changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index d9fae62aa9c..3a8e6200891 100644
> +--- a/Makefile.pre.in
> ++++ b/Makefile.pre.in
> +@@ -2096,7 +2096,6 @@ LIBSUBDIRS=	asyncio \
> + 		dbm \
> + 		email email/mime \
> + 		encodings \
> +-		ensurepip ensurepip/_bundled \
> + 		html \
> + 		http \
> + 		importlib importlib/resources importlib/metadata \
> +@@ -2274,6 +2273,10 @@ ifeq (@EXPAT@,yes)
> + LIBSUBDIRS += $(XMLLIBSUBDIRS)
> + endif
> +
> ++ifeq (@ENSUREPIP_MODULE@,yes)
> ++LIBSUBDIRS += ensurepip ensurepip/_bundled
> ++endif
> ++
> + TEST_MODULES=@TEST_MODULES@
> +
> + .PHONY: libinstall
> +diff --git a/configure.ac b/configure.ac
> +index 06df165ccc8..5774297b9da 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -6944,6 +6944,13 @@ AS_CASE([$with_ensurepip],
> + AC_MSG_RESULT([$ENSUREPIP])
> + AC_SUBST([ENSUREPIP])
> +
> ++AC_ARG_ENABLE([ensurepip-module],
> ++              AS_HELP_STRING([--disable-ensurepip-module], [disable ensurepip module installation]),
> ++	      [ENSUREPIP_MODULE="${enableval}"],
> ++	      [ENSUREPIP_MODULE="yes"])
> ++AS_IF([test "${ENSUREPIP}" != "no"], [ENSUREPIP_MODULE="yes"])
> ++AC_SUBST([ENSUREPIP_MODULE])
> ++
> + # check if the dirent structure of a d_type field and DT_UNKNOWN is defined
> + AC_CACHE_CHECK([if the dirent structure of a d_type field], [ac_cv_dirent_d_type], [
> + AC_LINK_IFELSE(
> +--
> +2.43.0
> +
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index 38f0580aa4..a398a1d7dd 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -75,6 +75,11 @@ config BR2_PACKAGE_PYTHON3_DECIMAL
>   	help
>   	  decimal module for Python3.
>   
> +config BR2_PACKAGE_PYTHON3_ENSUREPIP
> +	bool "ensurepip module"
> +	help
> +	  ensurepip module for Python3.
> +
>   config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
>   	bool "ossaudiodev module"
>   	help
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 42765abcf4..8685ca238d 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -107,6 +107,12 @@ else
>   PYTHON3_CONF_ENV += py_cv_module__decimal=n/a
>   endif
>   
> +ifeq ($(BR2_PACKAGE_PYTHON3_ENSUREPIP),y)
> +PYTHON3_CONF_OPTS += --enable-ensurepip-module
> +else
> +PYTHON3_CONF_OPTS += --disable-ensurepip-module
> +endif
> +
>   ifeq ($(BR2_PACKAGE_PYTHON3_PYEXPAT),y)
>   PYTHON3_DEPENDENCIES += expat
>   PYTHON3_CONF_OPTS += --with-expat=system
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
