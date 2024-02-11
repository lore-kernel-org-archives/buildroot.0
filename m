Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FB3C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A125881F50;
	Sun, 11 Feb 2024 22:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bkde4oRYW8XW; Sun, 11 Feb 2024 22:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8559B81F51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8559B81F51;
	Sun, 11 Feb 2024 22:04:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 939771BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DD6641B52
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qX1x0LeKj4n for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:04:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B3C541B51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B3C541B51
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B3C541B51
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:04:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7AE5C13F89A;
 Sun, 11 Feb 2024 23:04:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 23:04:35 +0100
Date: Sun, 11 Feb 2024 23:04:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZclEc16Vj7fC0OCD@landeda>
References: <20240211214904.89575-1-james.hilliard1@gmail.com>
 <20240211214904.89575-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240211214904.89575-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707689080;
 bh=ne2qSDzZgFVrV5JsOewpkfwVc+a+RxX1O27zspinoy4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rPMZPb7v9zpvX6d/DKUpy4qHlrK77SQn+X7DIrTwzjEcEmq+PJgMkxqiN3O2n5mXq
 HZL9i3q67fqejrCUoU7XaH4F1a7RIGi8XcCcXoORjmoTvxdAHvMbPKzwDkDplkXrD6
 4Kc75ybvrtjfS4c3EHyliOuBPDzzohMRP1tptP+VCFjrpgng86keouHekpYErlvN8W
 bJTgoMkB5SWJlJh2THg+UMQKIf5YKAMbFZKeEvK5D7AS0QYJ6ZHEVrxTA+nG/637ue
 MvHvsq5380VDO485rwt5+RdgVygA9wCjziu/GtqW1rGjJNPSlbCbtq+qCPNccI7MKs
 sewISbNFkuARQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rPMZPb7v
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-cython: bump to
 version 3.0.8
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-02-11 14:49 -0700, James Hilliard spake thusly:
> License hash changed due to changing links from http to https:
> https://github.com/cython/cython/commit/331d9d824ee5f0c539310332215ebd6ed3257325
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Err... I haven't seen my comments on your v1 addressed in this v2?

Regards,
Yann E. MORIN.

> ---
>  package/python-cython/python-cython.hash | 6 +++---
>  package/python-cython/python-cython.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
> index 08ad8f6d84..55e4a6f203 100644
> --- a/package/python-cython/python-cython.hash
> +++ b/package/python-cython/python-cython.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/cython/json
> -md5  a4d0f9fbc9c137f1a88937cd40e8c5ee  Cython-0.29.36.tar.gz
> -sha256  41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f  Cython-0.29.36.tar.gz
> +md5  9f7baaa983e1bd06eaeb4fa0adfc77e5  Cython-3.0.8.tar.gz
> +sha256  8333423d8fd5765e7cceea3a9985dd1e0a5dfeb2734629e1a2ed2d6233d39de6  Cython-3.0.8.tar.gz
>  # Locally computed sha256 checksums
> -sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
> +sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
>  sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
> diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
> index 47e105c065..d76bfb766d 100644
> --- a/package/python-cython/python-cython.mk
> +++ b/package/python-cython/python-cython.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CYTHON_VERSION = 0.29.36
> +PYTHON_CYTHON_VERSION = 3.0.8
>  PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
> -PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/38/db/df0e99d6c5fe19ee5c981d22aad557be4bdeed3ecfae25d47b84b07f0f98
> +PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/68/09/ffb61f29b8e3d207c444032b21328327d753e274ea081bc74e009827cc81
>  PYTHON_CYTHON_SETUP_TYPE = setuptools
>  PYTHON_CYTHON_LICENSE = Apache-2.0
>  PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
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
