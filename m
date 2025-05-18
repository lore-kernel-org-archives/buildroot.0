Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975F2C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 501B780EA3;
	Sun, 18 May 2025 14:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYx93DL4VaYr; Sun, 18 May 2025 14:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B88381EBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B88381EBC;
	Sun, 18 May 2025 14:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B7A31BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D18440E46
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xK5fjpMClpuT for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:43:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DF5440A93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DF5440A93
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DF5440A93
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:43:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE5C91C1001; Sun, 18 May 2025 16:43:12 +0200 (CEST)
Message-ID: <0f1210e8-8e8e-494c-b22b-a80af97d4d1f@rnout.be>
Date: Sun, 18 May 2025 16:43:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250516165911.225407-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516165911.225407-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579393; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VvvQM3PXeNzEfJ0G0SMfOAXiKNFrUn2Y8x4g19SGE8I=;
 b=UIW5mYDE0PaoLIopRCao3zENiDyWH7ocJbCrgZXF8+WTJTVpcg6z0sQnUD3+snM67k+0ad
 x3LuUe+qS/7ggWfmDW3Q9yd+ea+pY3je7dqdWHm8dmv6czKB1hGjefs/Vyf0actevpFDxi
 ghuKcqlXGYMsyQfMK8kuV5rBSgLHMensN7QbHPZPe5F3lb2bulCyqdhX2RwVBySRN0eyjI
 E/DuneKJ9Qv+uWJsponxC9Yj31vzDt01MpXlWKgUeKzyZl8dKQTf9mTXW5ykr/60yPNA0c
 MIoXeuNqSkEcolwOCAAGjGhyeRDCRQONdQkufIhS8Cu+9s2E9KUh+NrQjuhGAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UIW5mYDE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-h11: security bump to
 version 0.16.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2025 18:59, Thomas Perale via buildroot wrote:
> Fixes the following security issue:
> 
> - CVE-2025-43859: A leniency in h11's parsing of line terminators in
>      chunked-coding message bodies can lead to request smuggling
>      vulnerabilities under certain conditions.
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-43859
>    - https://github.com/python-hyper/h11/commit/114803a29ce50116dc47951c690ad4892b1a36ed
> 
> For more details on the version bump, see:
>    - https://github.com/python-hyper/h11/compare/v0.14.0...v0.16.0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-h11/python-h11.hash | 4 ++--
>   package/python-h11/python-h11.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-h11/python-h11.hash b/package/python-h11/python-h11.hash
> index 0c65a11d00..1ea92278dd 100644
> --- a/package/python-h11/python-h11.hash
> +++ b/package/python-h11/python-h11.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/h11/json
> -md5  84c33fc0aa1f868928114c4d02c43dc2  h11-0.14.0.tar.gz
> -sha256  8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d  h11-0.14.0.tar.gz
> +md5  af51401a776fd654cfd98a197af9f21f  h11-0.16.0.tar.gz
> +sha256  4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1  h11-0.16.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  37db5bb85926db28a427a25867f10b1232003aea1be69ccb851138adb8e6f361  LICENSE.txt
> diff --git a/package/python-h11/python-h11.mk b/package/python-h11/python-h11.mk
> index d7dca5244b..4e4685ea5a 100644
> --- a/package/python-h11/python-h11.mk
> +++ b/package/python-h11/python-h11.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_H11_VERSION = 0.14.0
> +PYTHON_H11_VERSION = 0.16.0
>   PYTHON_H11_SOURCE = h11-$(PYTHON_H11_VERSION).tar.gz
> -PYTHON_H11_SITE = https://files.pythonhosted.org/packages/f5/38/3af3d3633a34a3316095b39c8e8fb4853a28a536e55d347bd8d8e9a14b03
> +PYTHON_H11_SITE = https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963
>   PYTHON_H11_SETUP_TYPE = setuptools
>   PYTHON_H11_LICENSE = MIT
>   PYTHON_H11_LICENSE_FILES = LICENSE.txt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
