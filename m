Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1974FCF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C62B781393;
	Sun, 22 Sep 2024 10:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3JCOZDqWY8O; Sun, 22 Sep 2024 10:34:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B338B813B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B338B813B8;
	Sun, 22 Sep 2024 10:34:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 034AE1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E599C400AC
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgfEa01W1jlm for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 833E540022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 833E540022
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 833E540022
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D2CBF60128;
 Sun, 22 Sep 2024 12:34:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Sep 2024 12:34:14 +0200
Date: Sun, 22 Sep 2024 12:34:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zu_ypqLrKDtSYD4U@landeda>
References: <20240922054607.946074-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922054607.946074-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727001258;
 bh=VN24G3GxiHV5dGo94UL1CtZtxKun6DRMqPfVUZIRBHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bo+KaJqL8tMBl2WDYzjM8MGxfqgaN7AsbLbPzuATcm3IhPJEqzYUZ/VzQ+yjJZ0Kb
 +Rf9d3o6wsUOeqAblCR88qgJ9IyD1ioSKLwAW2R+OHN+cdps/B9OxedXmUOsnV/dAg
 HV5fVkc0lxD9RtrWCJSpXDGEJOSPP9BJOj8ponb8V1JjT5t+Gtp1IMEWccbGD1qDDp
 /y/+SdUZL1WyBdnlUOHBVcm/jibJ2myMKilCUq0nxgnEU7Dkp0vYatYjEyVP4/hVju
 zfKvfcjjcrUx4KHxhYtk2hbFz1+0FhKwMbXTqYSksHQkLYfzFhYWp6+6ZOPZ5qqsI1
 Ze7D65pOdkrVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bo+KaJqL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-types-python-dateutil:
 bump to version 2.9.0.20240906
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-21 23:46 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-types-python-dateutil.hash                         | 4 ++--
>  .../python-types-python-dateutil.mk                           | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
> index ef5e9380cf..4a2dcec502 100644
> --- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
> +++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
> @@ -1,3 +1,3 @@
>  # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
> -md5  58072922ac0c740121e311e970f003bf  types-python-dateutil-2.8.19.14.tar.gz
> -sha256  1f4f10ac98bb8b16ade9dbee3518d9ace017821d94b057a425b069f834737f4b  types-python-dateutil-2.8.19.14.tar.gz
> +md5  0d91422e92000e77d633a8adff3039e7  types-python-dateutil-2.9.0.20240906.tar.gz
> +sha256  9706c3b68284c25adffc47319ecc7947e5bb86b3773f843c73906fd598bc176e  types-python-dateutil-2.9.0.20240906.tar.gz

There's no license file identified, and no hash for it. Could you send
a follow-up patch adding those, please?

Regards,
Yann E. MORIN.

> diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
> index b230394120..c210d71b0c 100644
> --- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
> +++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.8.19.14
> +PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20240906
>  PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types-python-dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
> -PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/1b/2d/f189e5c03c22700c4ce5aece4b51bb73fa8adcfd7848629de0fb78af5f6f
> +PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/3e/d9/9c9ec2d870af7aa9b722ce4fd5890bb55b1d18898df7f1d069cab194bb2a
>  PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
>  PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
>  
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
