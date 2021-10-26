Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B53C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:36:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E976610A0
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E976610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FD034022A;
	Tue, 26 Oct 2021 19:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpIcaALVWWIJ; Tue, 26 Oct 2021 19:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1054C403F9;
	Tue, 26 Oct 2021 19:36:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0CB1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A2C7403F9
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HL14xyKpE11 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:36:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6F9A40130
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:36:28 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z20so749063edc.13
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CmbdchAW60TCv5pECyaO2UeXroJcXdqGqnVD9Ex8Ro4=;
 b=F1wcRkh4ZXXI/f5fiabT97ISzHTVJBQUon53P+YVbI8H6RMHtSd45fovW03crDfQje
 r/cR3GYrWQIuhfq3tkwNPrJlPHTe7PmHEx+O1biB/DpgMacCoEV/GsHNJLU9KFBgCFx/
 Vg1Itxc07aMjney6jfMBj4JKhxo/YzoosUv9A48QV/Gh3EMT/vJ+nDGHYtzYx2KsZHlE
 unasK1zIYf3sJ/F4BxDi0C730z1AfPIgY2wq/S90AmBuSJbGgOXZ0oPcut5KaemNNbJN
 5kvbV6RRzN2Rz2+Bs+vU/ju466AW9Z9TLjiCaClPvLA78tYte6es3i8WRooHbHzJlezk
 xfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CmbdchAW60TCv5pECyaO2UeXroJcXdqGqnVD9Ex8Ro4=;
 b=IXoGhnaca9nOf2CLbpW8lkyEZfcuhXVdZjzjhHSqEMnR4fEI59rWhISkfRHdk+4x9A
 J0ieiXcw64GChBJiMK6lhB/jeVdSq9SK0YqFlgyqkQ3LneFuiv1QpJLVS1ZAbG2zCoIW
 a6xWN4C8Ej3KHlgpcITt36bf+jaft984f1w3wHCkn3Qy27rHgda0+5PsGvnBTZR36S9y
 /kiYoFrm66pucqa0NYiQNK+fqcVfFfgNwVKT0f3gFOaHSEMrDhGXl/7Ag6CLdBGXe7vH
 spr1ujC0Qel6+ihz4nIRqcaPRXYcd4G+HnGdy6z7luPl9UWxK//wZPwa97IqUdOxshCE
 Gd7A==
X-Gm-Message-State: AOAM532yHuVSCnp1GTYEQR4MFACug8Dd/eZlyVnNZhrwSa3nB2ckVrJz
 l2VpsGYjKJXCEpoWpT+tjYUqWw==
X-Google-Smtp-Source: ABdhPJxbYAIWHVjzu6ISL01gbgW9qtQqbinYrERC3nfp4iSHKrwD5zcCbgCHOGkFxB337e7xBsHsCA==
X-Received: by 2002:a17:906:6089:: with SMTP id
 t9mr9023215ejj.323.1635276987137; 
 Tue, 26 Oct 2021 12:36:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hd17sm3795475ejc.92.2021.10.26.12.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:36:26 -0700 (PDT)
Message-ID: <592aa3c9-dd14-ff92-d762-3f94483a8274@mind.be>
Date: Tue, 26 Oct 2021 21:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211024235939.2142310-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211024235939.2142310-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to
 version 1.2.0
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



On 25/10/2021 01:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-frozenlist/python-frozenlist.hash | 6 +++---
>   package/python-frozenlist/python-frozenlist.mk   | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
> index d8ca0d8b3c..fdbf694963 100644
> --- a/package/python-frozenlist/python-frozenlist.hash
> +++ b/package/python-frozenlist/python-frozenlist.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/frozenlist/json
> -md5  3d6747897187eb413327168329ecccde  frozenlist-1.1.1.tar.gz
> -sha256  32fa8c86eee5c6f11b44863c0d3e945b2b1a03df3bf218617e832f1f04ba3146  frozenlist-1.1.1.tar.gz
> +md5  8f1851ef871d95a15ebcf20255c12f6d  frozenlist-1.2.0.tar.gz
> +sha256  68201be60ac56aff972dc18085800b6ee07973c49103a8aba669dee3d71079de  frozenlist-1.2.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
> +sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
> diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
> index e17578879f..4e26499808 100644
> --- a/package/python-frozenlist/python-frozenlist.mk
> +++ b/package/python-frozenlist/python-frozenlist.mk
> @@ -4,11 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_FROZENLIST_VERSION = 1.1.1
> +PYTHON_FROZENLIST_VERSION = 1.2.0
>   PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
> -PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/ab/bb/80e0fdd91fe4018c6c11a1bfe9bb8cb1da8dbb2ed3faa3c1317161d056fa
> +PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/5c/ee/7c6287928ba776567603248e160387cf4143641ecf734e393ad9b2c82475
>   PYTHON_FROZENLIST_SETUP_TYPE = setuptools
>   PYTHON_FROZENLIST_LICENSE = Apache-2.0
> -PYTHON_FROZENLIST_LICENSE_FILES = LICENSE.txt
> +PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
>   
>   $(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
