Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795AFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:57:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2941661168
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2941661168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E804760B04;
	Wed, 13 Oct 2021 19:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPHcFJ6CGzcr; Wed, 13 Oct 2021 19:57:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFE660AE1;
	Wed, 13 Oct 2021 19:57:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1BB31BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A11CA60AE1
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDcmU0dRoboa for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:56:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CF7B60605
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:56:57 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g10so15015348edj.1
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jVSeFe2GSPqlTD93hGcfU/RwweZ449FYi4FEiuglgFQ=;
 b=MuXlK81PZuKZk7BVU71+ApkEhf0CoLC3YikcI43fcFzkCFsb3Mzbp77cy/t/3y+GCR
 n6AXSW2nNuvQhI4U5EJDwxM49/yyHizh38Nmvd0w2xNDULyhEGtcK8THSPgDG3Iqk02P
 +bN42WZOSJIj6lN9M0rdPZTfDOqfGfoxNIq3rFXy2XMBxGTeM4lpbJek6SN7eAB0UsXi
 TQzGxAKzEibGfkOWdbgDQqZ43wRUPVxw710lCNbNDRcuTnNyqbkNTOby0LXN1QS3VMov
 VncvS5/ascX27vpbkbVeclv9Rb9bJ7gsSDt/pD0XAX7eJ6aDUR5R5q1grkJxW/wUK3Dx
 Z+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jVSeFe2GSPqlTD93hGcfU/RwweZ449FYi4FEiuglgFQ=;
 b=lhbxW5ho/vPH8p2gD5mCYl1c2TgenZrbe9U+nv9YZ5Yb2ziIRUYoA3A3ru+1el/Mn+
 zab+4G33hiFT/XNzMfR/wZLc6GstuaIwXz2NKQr/FPy73WEIFFBh8jGLVbCX6dgIWuie
 m0bjjf5LzHjfnBqCMYfg7BLqAMJg0uazwrf5Wl0W7JI/dx3AYLVYQbnRD34IEwe7A2bc
 TFg+wvKgzaczAZ3L0gcALETS1SR6cYpcAJ+l2EWzsB6yk+SvMJSFklq10MLNmv6K6pvD
 WyzDA10QmbUkDiaioQsjsAEOn75ntWIQTFGTjvVwJc1D7LwGk2120beddpgTj2OLZLHE
 /m6w==
X-Gm-Message-State: AOAM533xhVcHDTIrHLYoQpsKZXrs9ETPiR8dPqvZluiVbCwITdMVUyn5
 eognVeqj6mh3y4QmNas/ANc13Q==
X-Google-Smtp-Source: ABdhPJzxZWgIRPkt7xVIE/HeteL8EE3kd1v2TNf8ljYUSQaGnL4pYE2Pz2Me5bPJIkbztVNmxWAPVQ==
X-Received: by 2002:a50:bf08:: with SMTP id f8mr2007940edk.400.1634155015585; 
 Wed, 13 Oct 2021 12:56:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y8sm341931ejm.104.2021.10.13.12.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:56:55 -0700 (PDT)
Message-ID: <91167f85-3112-85ca-d372-850b689c77c2@mind.be>
Date: Wed, 13 Oct 2021 21:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211006233923.3225201-1-james.hilliard1@gmail.com>
 <20211006233923.3225201-2-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006233923.3225201-2-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/3] package/python-bidict: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/10/2021 01:39, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/Config.in                        |  1 +
>   package/python-bidict/Config.in          |  7 +++++++
>   package/python-bidict/python-bidict.hash |  5 +++++
>   package/python-bidict/python-bidict.mk   | 14 ++++++++++++++
>   4 files changed, 27 insertions(+)
>   create mode 100644 package/python-bidict/Config.in
>   create mode 100644 package/python-bidict/python-bidict.hash
>   create mode 100644 package/python-bidict/python-bidict.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2f83c87582..91afefbb06 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -925,6 +925,7 @@ menu "External python modules"
>   	source "package/python-backports-ssl-match-hostname/Config.in"
>   	source "package/python-bcrypt/Config.in"
>   	source "package/python-beautifulsoup4/Config.in"
> +	source "package/python-bidict/Config.in"
>   	source "package/python-bitstring/Config.in"
>   	source "package/python-bleak/Config.in"
>   	source "package/python-bluezero/Config.in"
> diff --git a/package/python-bidict/Config.in b/package/python-bidict/Config.in
> new file mode 100644
> index 0000000000..adbfda69b8
> --- /dev/null
> +++ b/package/python-bidict/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_BIDICT
> +	bool "python-bidict"
> +	depends on BR2_PACKAGE_PYTHON3
> +	help
> +	  The bidirectional mapping library for Python.
> +
> +	  https://bidict.readthedocs.io
> diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
> new file mode 100644
> index 0000000000..59229f96d9
> --- /dev/null
> +++ b/package/python-bidict/python-bidict.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/bidict/json
> +md5  d9342771969dd0d42092a669ed6f3241  bidict-0.21.3.tar.gz
> +sha256  d50bd81fae75e34198ffc94979a0eb0939ff9adb3ef32bcc93a913d8b3e3ed1d  bidict-0.21.3.tar.gz
> +# Locally computed sha256 checksums
> +sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
> diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
> new file mode 100644
> index 0000000000..bff10e4a82
> --- /dev/null
> +++ b/package/python-bidict/python-bidict.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-bidict
> +#
> +################################################################################
> +
> +PYTHON_BIDICT_VERSION = 0.21.3
> +PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
> +PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/3f/81/7221b28d692af5c5fc180c4850b8e4a48c7db92b3d529b430488f67db74f
> +PYTHON_BIDICT_SETUP_TYPE = setuptools
> +PYTHON_BIDICT_LICENSE = Mozilla Public License 2.0 (MPL 2.0)

  This should just be

PYTHON_BIDICT_LICENSE = MPL-2.0

  Also, I've taken the liberty to add you to DEVELOPERS for this package.

  Applied series with those two things fixed, thanks.

  Regards,
  Arnout

> +PYTHON_BIDICT_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
