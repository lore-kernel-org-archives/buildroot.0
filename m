Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4924DCF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11A89413ED;
	Sun, 13 Oct 2024 10:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzj0G_U2lNuh; Sun, 13 Oct 2024 10:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D06440A8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D06440A8B;
	Sun, 13 Oct 2024 10:48:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50ED71BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10AB940729
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHY7WgWQsxYY for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7E1540728
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7E1540728
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7E1540728
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:47:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECBE4C0002;
 Sun, 13 Oct 2024 10:47:56 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:47:24 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241013124724.76484f02@windsurf>
In-Reply-To: <20241011180752.2769273-1-james.hilliard1@gmail.com>
References: <20241011180752.2769273-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kc7SKg6W858Jek+ZA4dt5/V1e5J7Jt8Nad0nkgeLzas=;
 b=MVysMB+3+4itH9M9T4k+aSkZtoBehHm2x+mhYpW1E8hIHCXbbo3miZRi4LOBZ51IOX39IB
 pKNC26TxkAhG2hFJR/QBYSiaW2ycQEJ8zQ6NvnvQOJ+Cwcp6j2YuBLD2aFCvpBFkGIu+E8
 Yk1QTkzAEfEfzglG3ez522jZ6ZVO8/cAA3iSCOAE1m7wG76zKL2wh/KkbHO9fmV9OO0k3H
 6OV2xERvqbgyS9xAyFMULqlvpclFP4hwIf8tWHdYqJ777RPNC4yoN2v7IG5PsCvcvq6IpY
 xE36zTsoeO4FLXxYmX8dwJ387CSfTD35uj37dhDnmkybcsrumqOAsPTdCpfTUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MVysMB+3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump
 to version 3.4.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Oct 2024 12:07:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-charset-normalizer.hash                          | 4 ++--
>  .../python-charset-normalizer/python-charset-normalizer.mk  | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
> index 8ef0e3fed0..ebed9d19d7 100644
> --- a/package/python-charset-normalizer/python-charset-normalizer.hash
> +++ b/package/python-charset-normalizer/python-charset-normalizer.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
> -md5  0a4019908d9e50ff13138e8a794d9e2b  charset-normalizer-3.3.2.tar.gz
> -sha256  f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5  charset-normalizer-3.3.2.tar.gz
> +md5  8e0d0f33219087c2cd2d01b1d6ff11b6  charset_normalizer-3.4.0.tar.gz
> +sha256  223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079dae93e  charset_normalizer-3.4.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
> diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
> index 914b96eb69..ee04bf8968 100644
> --- a/package/python-charset-normalizer/python-charset-normalizer.mk
> +++ b/package/python-charset-normalizer/python-charset-normalizer.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CHARSET_NORMALIZER_VERSION = 3.3.2
> -PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
> -PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8
> +PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.0
> +PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
> +PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/f2/4f/e1808dc01273379acc506d18f1504eb2d299bd4131743b9fc54d7be4df1e
>  PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
>  PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
>  PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
