Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B41CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 16:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 408A480BD8;
	Sun, 22 Sep 2024 16:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kR9iXIc89h0C; Sun, 22 Sep 2024 16:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4047480BEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4047480BEE;
	Sun, 22 Sep 2024 16:46:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B99E1BF403
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B154400AC
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJQ7tI6mu6na for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 16:46:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C76340018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C76340018
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C76340018
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 16:46:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C8D2460134;
 Sun, 22 Sep 2024 18:46:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Sep 2024 18:46:35 +0200
Date: Sun, 22 Sep 2024 18:46:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZvBJ64YMhaSfOHK3@landeda>
References: <20240907211638.945542-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240907211638.945542-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727023599;
 bh=YcDGy1Sv184tseOjmh41iC5a4c5frQKkwqHlvQDYPk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XpEnWhvGd+mV2QKrnESbIK4I7UCTwS8kjhbvM1xDiRZ8ioNGuWdvvWLwhmpI+upog
 eNr+sAUCCOxY8n9KlCkfSb65Pqnfx8zZ8h0WloRvWkTyZ3qcSNpmqTeR0q+YF1092B
 1mnawWzgTUiE5wSxU6CmI/Rh7oIqLmp+QA8t8bR3UuqweyhX4/uQv0NBdzNzbIPGGB
 cXYs/YOyANufPrqvmsCjJvAgMu36JHuBHyZmnZm00X5/FLErF8DWDSbDpCoetAkoh9
 5dd1NdDzn4IUOGZ1vzd4pPzlP4l6HsWWFuZf1g0Bao8HXWFJzO75RASPg2zWarD7wl
 DkDWyIX9C94Qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XpEnWhvG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.1
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

On 2024-09-07 15:16 -0600, James Hilliard spake thusly:
> Restore cargo2 archive suffix format as well.

It would have been better if the revert had been done in a separate
patch, so that it could be backported to the stable branch...

Could you do that for 2024.08.x, please?

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-maturin/python-maturin.hash | 2 +-
>  package/python-maturin/python-maturin.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
> index 3c5f836ad5..2b601d6ee9 100644
> --- a/package/python-maturin/python-maturin.hash
> +++ b/package/python-maturin/python-maturin.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after vendoring
> -sha256  56c18b09d38080f9975fb679be1fda01b936d21f5ef233967cda3dd74905e683  maturin-1.7.0.tar.gz
> +sha256  92c5fc2a24f32623a6994334b523a587dca63ebb5b46ae14a255a2ebc25fd3f7  python-maturin-1.7.1-cargo2.tar.gz

I also got that same hash when testing here.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  # Locally computed sha256 checksums
>  sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
>  sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
> diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
> index 70cdb15949..76f136826a 100644
> --- a/package/python-maturin/python-maturin.mk
> +++ b/package/python-maturin/python-maturin.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_MATURIN_VERSION = 1.7.0
> -PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
> -PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/80/da/a4bbd6e97f3645f4ebd725321aa235e22e31037dfd92caf4539f721c0a5a
> +PYTHON_MATURIN_VERSION = 1.7.1
> +PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
> +PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/1d/ec/1f688d6ad82a568fd7c239f1c7a130d3fc2634977df4ef662ee0ac58a153
> +PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
>  PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
>  PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
>  PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
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
