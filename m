Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0CDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:02:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE9AC60FF2
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE9AC60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E08440507;
	Sun, 19 Sep 2021 09:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uhREYwopczF; Sun, 19 Sep 2021 09:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC5EC403D7;
	Sun, 19 Sep 2021 09:02:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37D761BF404
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3443683139
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dTz3MjbZ1UIZ for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 09:02:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C0F283103
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 09:02:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 13E7C2003F7;
 Sun, 19 Sep 2021 11:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632042156;
 bh=e/r5otqMB/uKQBwa0dRdEVeEyaCvnPPGiNPRSb+N5lw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBoKpCxdfBaYDu24mW3CRsGsE0HTYvgVQdeCC0cqgA1ufs3Lkq0kaBzbIprMVC+e0
 LZJwGXy60Yft5OjEyq3pDlC1RePMJx9/1nvxRkg/9d62tFAAW67wV8AKZzk5hktPRZ
 PCoAEXwAJXGzrAdA98TUDacNHiFn16qLwnKKcaVlfmUCZwkrxu20NVll4bRXWF+Iwm
 BJ/ki5QbZe7tjgbsT45VDiO8jKKcNf+tAZHJAJJYmP5L810pYmlJKnfAQpdmfRXgGE
 KjQcUzlqB3J8Jeqa5hEQ8g2o6kS2hPqKhUn0GE4XDOxpKx7mszbKbvMciIzAlJKAhy
 z4emP/luqldow==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 11:02:25 +0200
Date: Sun, 19 Sep 2021 11:02:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210919090225.GM1053080@scaer>
References: <20210919085244.1796002-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919085244.1796002-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rsa: add
 PYTHON_RSA_CPE_ID_VENDOR
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-19 10:52 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:python-rsa_project:python-rsa is a valid CPE identifier for
> this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython-rsa_project%3Apython-rsa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-rsa/python-rsa.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
> index eaa47e8037..a3d4bb8235 100644
> --- a/package/python-rsa/python-rsa.mk
> +++ b/package/python-rsa/python-rsa.mk
> @@ -10,5 +10,6 @@ PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/db/b5/475c45a58650b058
>  PYTHON_RSA_SETUP_TYPE = setuptools
>  PYTHON_RSA_LICENSE = Apache-2.0
>  PYTHON_RSA_LICENSE_FILES = LICENSE
> +PYTHON_RSA_CPE_ID_VENDOR = python-rsa_project
>  
>  $(eval $(python-package))
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
