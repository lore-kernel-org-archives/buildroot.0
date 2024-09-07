Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9184EECE56F
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23FE56065F;
	Sat,  7 Sep 2024 20:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SanZ_aK0pgv; Sat,  7 Sep 2024 20:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EA5F60676
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EA5F60676;
	Sat,  7 Sep 2024 20:35:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2CD01BF3DA
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B9C4041C
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fI9zqVb8JuMO for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44CD94023F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44CD94023F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44CD94023F
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:35:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 51FDC13F880;
 Sat,  7 Sep 2024 22:35:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Sep 2024 22:35:14 +0200
Date: Sat, 7 Sep 2024 22:35:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zty5AlsdrND0H-_b@landeda>
References: <20240701193622.1786979-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701193622.1786979-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725741317;
 bh=PlGHJk0GwKnD8+kWrFsUnOijYbA+hYcd+umbLhJfZP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PIaMOruP1ZQBRiPtRyahbCg0XA1wbyZJemvp7Qg2lcjeOpfOEUGCl4MsAyzKblEN5
 ELat6cOhzw0mZlJ1N5taMCCb4mCPss+BpDPnz/+udaRIbzsXBfUX5PYFVwGySCB6H4
 x7bWI1Jgk7JrK02B6cs9A79uI6WJHfwFqmFboGnLDgqJGgeUCW2nwx69+QhMkNtmsb
 L2M/AtYW0WapcchqxMSueRfkJ7BlQnI6jaj7CbpgDBkLZnzM0bbkvYPpT4WMvbxuEm
 Smi5qKwTpYn8AWirVLs1gXJQuq+F4QGsEECzp+qatdF7/5T1JIhvSQvBNxntbZRwoR
 zHZxH3yrcMYWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PIaMOruP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.20.0
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

On 2024-07-01 13:36 -0600, James Hilliard spake thusly:
[--SNIP--]
> diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
> index 79d06deab2..2e37c37004 100644
> --- a/package/python-pydantic-core/python-pydantic-core.mk
> +++ b/package/python-pydantic-core/python-pydantic-core.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYDANTIC_CORE_VERSION = v2.19.0
> -PYTHON_PYDANTIC_CORE_SITE = https://github.com/pydantic/pydantic-core
> -PYTHON_PYDANTIC_CORE_SITE_METHOD = git
> +PYTHON_PYDANTIC_CORE_VERSION = 2.20.0
> +PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
> +PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/7d/fa/9802d053f33dbcf110d46e3f28667b06cd764b164f1e3f4189848cdd6e78

Again a careless change that drops our vendoring pst-version suffix in
local archives.

For that one, the migration away from the git download method was not
even explained in the commit log.

Could you please either reinstate the git downmload method (which
incidentally will have the local filename be proeperly named), or apply
the same hack that is applied to other cargo-vendored python packages?

Regards,
Yann E. MORIN.

>  PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
>  PYTHON_PYDANTIC_CORE_LICENSE = MIT
>  PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
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
