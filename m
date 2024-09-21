Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF4CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 20:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD9BA605C2;
	Sat, 21 Sep 2024 20:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPGChcwt893c; Sat, 21 Sep 2024 20:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9EC560643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9EC560643;
	Sat, 21 Sep 2024 20:53:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9BA1BF48B
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 20:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F361813FA
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 20:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnAXZuEslDlg for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 20:53:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36EB5813F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36EB5813F9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36EB5813F9
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:53:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BE0515FF3F;
 Sat, 21 Sep 2024 22:53:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 22:53:29 +0200
Date: Sat, 21 Sep 2024 22:53:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zu8yScN-8KJTH-Kf@landeda>
References: <20240917174651.3846612-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240917174651.3846612-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726952014;
 bh=l77X0HHhZLExtcVvTvVgPxgWTj7mQYH42WOioZKiDF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pGquB45VyikzoH1Vp9AbLnnKgy3IxiqNVeNCT/UdcVGZGRgZt/lLTIK5r7h1ci1Ik
 HKMMNksUrWpo2WkYfJrLRlb4ODtRU5E0rXemgbUe9qW4r4tsOjsrRKlFcwh4cwIVId
 OvRSn7ll8XeWuqU/XmANZKzvpzhh0cGy47n8LsXEK1I0cO0bsOORyqHvhI+7tcQ8u0
 Qq6YZXwN2ruEN9lmtMsoBxJfPkkarLLFE94YK0X/11Nd+HMl7Pz/PxQiCP+DFZ4Bhb
 9lw2VpOkRunN9Vhj99f4BH3Btx0nKWJsCQdH5WjdsdKwvQGnz0kCbfJPWhMefBLqDx
 rusD85sqaBvUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pGquB45V
Subject: Re: [Buildroot] [PATCH 1/1] package/python-netaddr: bump to version
 1.3.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-17 11:46 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-netaddr/python-netaddr.hash | 6 +++---
>  package/python-netaddr/python-netaddr.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
> index f969aeecfc..1ad35966bb 100644
> --- a/package/python-netaddr/python-netaddr.hash
> +++ b/package/python-netaddr/python-netaddr.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/netaddr/json
> -md5  c0d7b080da18c851ea436389813d7652  netaddr-0.10.1.tar.gz
> -sha256  f4da4222ca8c3f43c8e18a8263e5426c750a3a837fdfeccf74c68d0408eaa3bf  netaddr-0.10.1.tar.gz
> +md5  b0307617f8f3aa73bbcfadac52d91df7  netaddr-1.3.0.tar.gz
> +sha256  5c3c3d9895b551b763779ba7db7a03487dc1f8e3b385af819af341ae9ef6e48a  netaddr-1.3.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256  0e53de62547787462f41eefb5cee31a14f7ea767ba0362c6f9304f1742486d47  LICENSE
> +sha256  36dcdc429f76107d1697396ca0d8c43b343808c98beacb3405f472a76b65bffa  LICENSE.rst

The license filename chanmged, but the content also changed. What is the
difference?

Regards,
Yann E. MORIN.

> diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
> index 79e55a739f..7c26b16bb4 100644
> --- a/package/python-netaddr/python-netaddr.mk
> +++ b/package/python-netaddr/python-netaddr.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -PYTHON_NETADDR_VERSION = 0.10.1
> +PYTHON_NETADDR_VERSION = 1.3.0
>  PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
> -PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/af/96/f4878091248450bbdebfbd01bf1d95821bd47eb38e756815a0431baa6b07
> +PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/54/90/188b2a69654f27b221fba92fda7217778208532c962509e959a9cee5229d
>  PYTHON_NETADDR_LICENSE = BSD-3-Clause
> -PYTHON_NETADDR_LICENSE_FILES = LICENSE
> +PYTHON_NETADDR_LICENSE_FILES = LICENSE.rst
>  PYTHON_NETADDR_SETUP_TYPE = setuptools
>  
>  $(eval $(python-package))
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
