Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A954D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B1CE81E31;
	Wed,  7 Jan 2026 17:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTsWetkJTzHd; Wed,  7 Jan 2026 17:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F7558233A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808196;
	bh=3OUi/1EZZtdDgCyAsUEt6VpE6Qn5LFpaMR/CVLV3bTo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U4ShOmXIvFg4mF9tutIKifeEVFxuE2Q+6h0GkMnlimmIox8mti7znRAscglhBs+/2
	 jmJ3bbD5JBd61718ybU4kLTC7JUa6fpmOtmMO/4nuYrCivF2kiwCsDTeFMz/VEIPCz
	 CBBUs+e9O7m/Wi3xjtKSxtDYDn+uRTLeZn+w9TG2Vlvtx8jOj094HrBr4jNZ4ebAvc
	 QFlVu8N9XKmLF31FNAXNM0rqdUzVJL6rTgTT5bYwjoBQInMcOPqgoErWSb29C3i1G/
	 4O5oSRHC3PG3WjctGrPNqMfCTlXTNy69O8VhmedCDjSJX2iLgu7InDIDTlCzFD6wk0
	 /pBWweK66Hvcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F7558233A;
	Wed,  7 Jan 2026 17:49:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12B119ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0516340263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIszLTPQsqGT for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E3AA40128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E3AA40128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E3AA40128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3556B97A192; Wed,  7 Jan 2026 18:49:51 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:49 +0100
Message-ID: <20260107174949.225612-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808191; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=mPa4LUzdBbh9PuxIew+XvrQd3yp+60SXJozCS10DZRk=;
 b=aZ0dvSxpMge64Ww+yZQkb/uAoh2B5ixHUvunpMV0fy+V1vQGjVMxahwdBkwBeJdlLoTzBp
 vokPv5vEjQLeNclBi6Y68m2LcZppjKO6oZaKggBcjnckMJ4IdJUysnBJkRH7ISKvkXhUVJ
 6GZMlNUjVB42ZepUzLQVtTvLoeImmq+fFHc7Cf8vEZAg9+GcRaEhgdTnuhCM6NczwI13YM
 euhVehMd1aN/x99chpkw8bbpm1uPirtk+J/2ZHbSXJqdINLSsXNjAxa4yQAxi0m8LBx0Nl
 SsS0vH3iwtuCo7Adqq3UJoK/6CpOLG5EZB6UknnCbf31dMJy2DpEU7F3lW0qKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aZ0dvSxp
Subject: Re: [Buildroot] [PATCH v2 01/23] package/python-characteristic: add
 md5 hash, update SITE
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
>  package/python-characteristic/python-characteristic.hash | 4 ++--
>  package/python-characteristic/python-characteristic.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-characteristic/python-characteristic.hash b/package/python-characteristic/python-characteristic.hash
> index c91017d707..84304818c6 100644
> --- a/package/python-characteristic/python-characteristic.hash
> +++ b/package/python-characteristic/python-characteristic.hash
> @@ -1,5 +1,5 @@
> -# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b249368dd021fde1c06b4802867c0913
> +# md5, sha256 from https://pypi.org/pypi/characteristic/json
>  md5  b249368dd021fde1c06b4802867c0913  characteristic-14.3.0.tar.gz
> -# Locally computed
>  sha256  ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380  characteristic-14.3.0.tar.gz
> +# Locally computed sha256 checksums
>  sha256  0af91b662f8428b28f5e517b049a0bb9feeb59b1adaa5c9418c1579f9485107c  LICENSE
> diff --git a/package/python-characteristic/python-characteristic.mk b/package/python-characteristic/python-characteristic.mk
> index 7ea8d95cd4..dd081eacef 100644
> --- a/package/python-characteristic/python-characteristic.mk
> +++ b/package/python-characteristic/python-characteristic.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_CHARACTERISTIC_VERSION = 14.3.0
>  PYTHON_CHARACTERISTIC_SOURCE = characteristic-$(PYTHON_CHARACTERISTIC_VERSION).tar.gz
> -PYTHON_CHARACTERISTIC_SITE = https://pypi.python.org/packages/source/c/characteristic
> +PYTHON_CHARACTERISTIC_SITE = https://files.pythonhosted.org/packages/dc/66/54b7a4758ea44fbc93895c7745060005272560fb2c356f2a6f7448ef9a80
>  PYTHON_CHARACTERISTIC_LICENSE = MIT
>  PYTHON_CHARACTERISTIC_LICENSE_FILES = LICENSE
>  PYTHON_CHARACTERISTIC_SETUP_TYPE = setuptools
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
