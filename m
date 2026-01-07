Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ED8D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFBDC40D97;
	Wed,  7 Jan 2026 17:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eKk5SJ18U-p; Wed,  7 Jan 2026 17:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5CA840D94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808201;
	bh=MwJImRchh1VGeV5u/EJ0D8uZyO/n/j5iRQu9idEtlow=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LkEnIe3FdRkWsz6qrznmA57ZiYyZ0PaS0zAGfHrpPPw+Qpl+rN8jMbvIUV1jyK2VL
	 /iHa3nNcW6M2u/QBul6YqwvaR54C4gxduOECCRFemuw3IEVzUqa0B3yixiqqJYAmVs
	 Y6IDsfJ5DJF3vadwMFUAeGiYqEY6U7Qzq8a4mSpS8c2bGohQru8DFvwoxYBSsxesN2
	 evybWs6qZynb+mlsroeJeQrGiZikJBWN3j27pdqW9ETnj6SwTu/TCx9GX33dD/b5iq
	 hzUGzK8mSdpPO7DIuZ59pz2o3Nn9zqC1jeRz8rys/j3H8NIrTJh19aPsfdhQjHnC8N
	 ySCnzm+r3jsJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5CA840D94;
	Wed,  7 Jan 2026 17:50:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A9919ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CE3640D8D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HBOOP3HRoIJ for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F41640B1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F41640B1A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F41640B1A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 42FBCB97A192; Wed,  7 Jan 2026 18:49:57 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:55 +0100
Message-ID: <20260107174955.225713-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-3-bernd@kuhls.net>
References: <20251221223441.185169-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808197; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=9PnF98wWjwff0bEE5BoCVHNgpU+85dCXqf/m6txNPE4=;
 b=Kc5kPcJ5bn+LrGu7blwCpuyhv3Q51iZ04JIaST8BVp4MbyWtY0Kdw9YashBeZ83nGO+csQ
 UMNpSlBkSa9ItGoWaQa+jcPDA6mN6uq56C6XQsjyBU57Sg5YHzWQd7tq8zPniGRbPqDe1v
 qQm1ouz6gOKTEzWPeoYTYxXsgJKm5N/D2ZX1+Q4jufVEfpMfyv21EV5EkVkEBvfdBwWMDC
 yEWaJ8DA3kqLLqtN04FaQm6dqkCZYZdeIwGuvyPXcv/FkqEskL8+lNo9DZJYdOtMiXpeKW
 ujB93fQzkcyE/C2BjMOTpxvfnvWI6pyyyjLJ4eFgBbOZEvMvTXOUx6Z1ag/XLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Kc5kPcJ5
Subject: Re: [Buildroot] [PATCH v2 03/23] package/python-crc16: switch SITE
 to pypi.org
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-crc16/python-crc16.hash | 6 ++++--
>  package/python-crc16/python-crc16.mk   | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-crc16/python-crc16.hash b/package/python-crc16/python-crc16.hash
> index 4576a907ec..5244e400fa 100644
> --- a/package/python-crc16/python-crc16.hash
> +++ b/package/python-crc16/python-crc16.hash
> @@ -1,3 +1,5 @@
> -# locally computed
> -sha256  10aeda70fbe8b284874b3b1b8f74b9c1f6d5e8dee20ac8f9d5bc49f45f12a42a  python-crc16-0.1.1.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/crc16/json
> +md5  3cb6a4f5fd10a58c09792e321cc467e5  crc16-0.1.1.tar.gz
> +sha256  c1f86aa0390f4baf07d2631b16b979580eae1d9a973a826ce45353a22ee8d396  crc16-0.1.1.tar.gz
> +# Locally computed sha256 checksums
>  sha256  ea7d049c7705dc13afc202dd18e1827f3484f8212fd3fa7b82fc4a0c363432c9  COPYING.txt
> diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
> index 86e6f2ecf2..7a773eaf8e 100644
> --- a/package/python-crc16/python-crc16.mk
> +++ b/package/python-crc16/python-crc16.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  PYTHON_CRC16_VERSION = 0.1.1
> -PYTHON_CRC16_SITE = $(call github,gennady,pycrc16,v$(PYTHON_CRC16_VERSION))
> +PYTHON_CRC16_SOURCE = crc16-$(PYTHON_CRC16_VERSION).tar.gz
> +PYTHON_CRC16_SITE = https://files.pythonhosted.org/packages/a6/e0/70a44c4385f2b33df82e518005aae16b5c1feaf082c73c0acebe3426fc0a
>  PYTHON_CRC16_LICENSE = LGPL-3.0+
>  PYTHON_CRC16_LICENSE_FILES = COPYING.txt
>  PYTHON_CRC16_SETUP_TYPE = setuptools
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
