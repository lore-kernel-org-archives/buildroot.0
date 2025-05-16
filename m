Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52857C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 153C4612C1;
	Fri, 16 May 2025 17:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6dWv8zegsli; Fri, 16 May 2025 17:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 724536132F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 724536132F;
	Fri, 16 May 2025 17:59:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28951185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DED86133C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCxD64FouTXa for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 259E0612AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 259E0612AE
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 259E0612AE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 486B91C0FCB; Fri, 16 May 2025 19:59:34 +0200 (CEST)
Message-ID: <a76f7e5d-2510-49ee-af7a-3239190bf48d@rnout.be>
Date: Fri, 16 May 2025 16:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250109201054.2382903-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250109201054.2382903-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418374; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Os7UYlNpICs/frpzh2QsF7kh9GXCkgLyVK0yY3P1vNk=;
 b=Xmoh+D08cukQP3V34KM/xjF+XDXFlmp4Vi0n12jThD8m/V8VbWfoEj5+Yn8971yxHhNla3
 pJQSYuR50iWV/nP0zGL/79KZsJb7MWUGdpdc8HLsazD7i+DsvK5NoIhK0a4u4K1JC6NOaK
 QFrkE+74qHn8c/OXMAOfsJRIiAbx+qsWio8990qkTsYAX9R9Nq8yb9UqonSlKhQ20MxwxB
 SNNqAr3N7nZk2FgYX/AEadS3KCIKaVfDYjbN7hDTvrHm0Pn10EWV8UmpGyK812QJSavI9E
 J16r9E7CQFucb1YSdnlt7spSEw0g/QrUshf9Aba+CIV0I8zHkk++ld8iYwhFXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Xmoh+D08
Subject: Re: [Buildroot] [PATCH 1/5] package/python-types-psutil: new host
 package
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



On 09/01/2025 21:10, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied series to master, thanks.

  Regards,
  Arnout

> ---
>   .../python-types-psutil/python-types-psutil.hash   |  5 +++++
>   package/python-types-psutil/python-types-psutil.mk | 14 ++++++++++++++
>   2 files changed, 19 insertions(+)
>   create mode 100644 package/python-types-psutil/python-types-psutil.hash
>   create mode 100644 package/python-types-psutil/python-types-psutil.mk
> 
> diff --git a/package/python-types-psutil/python-types-psutil.hash b/package/python-types-psutil/python-types-psutil.hash
> new file mode 100644
> index 0000000000..a1d673f2b1
> --- /dev/null
> +++ b/package/python-types-psutil/python-types-psutil.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/types-psutil/json
> +md5  411972eff624e78ca26706d297cde546  types_psutil-6.1.0.20241221.tar.gz
> +sha256  600f5a36bd5e0eb8887f0e3f3ff2cf154d90690ad8123c8a707bba4ab94d3185  types_psutil-6.1.0.20241221.tar.gz
> +# Locally computed sha256 checksums
> +sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
> diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
> new file mode 100644
> index 0000000000..50ae884c85
> --- /dev/null
> +++ b/package/python-types-psutil/python-types-psutil.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-types-psutil
> +#
> +################################################################################
> +
> +PYTHON_TYPES_PSUTIL_VERSION = 6.1.0.20241221
> +PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
> +PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/44/8c/5f82cd554cc5bb79d137f082e4c9f8d22e85c8c08dabee4971d422a9abdd
> +PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
> +PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
> +PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
> +
> +$(eval $(host-python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
