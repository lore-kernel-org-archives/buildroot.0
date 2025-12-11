Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEEFD43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E75A583C95;
	Thu, 11 Dec 2025 19:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukbwoaYdN0bO; Thu, 11 Dec 2025 19:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 933D783C81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481496;
	bh=f5iBIfO5VZbK9d8PQ4wHyXR9G6A4a6ogkQgj8uTYfgY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IpWDm6TrZ9QeDCX7mwqHLp9erUZQJhGzLrNQlFHryGJ74QUlY32Te2tlHeC2FIcI/
	 Rvrg65v7Y2egXsVCCOWwJyJ6rf6HF2Br5LAbIAVa/Yl+q05e/kZi8ZQwUlganpUdNN
	 4yyWcBxXoIRatzR5Op+ZxIFWJN0jKasOkj8SMGJffhpJO+rSxvqYNOhtGjgpieUZ5K
	 lszXOjdtQo7YeSvGJ/0+3DlVwwevS0Q39eYejGL7Q23cMm0KL7r1EtrwvA3C/po3KK
	 vkPe2//n3wqjpzObTyukNGK5hxlLkVIfD6//GJw9QQ8bu8D7TloVwOqeT3Rr7AoO6S
	 /LDxmcdb7UCtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 933D783C81;
	Thu, 11 Dec 2025 19:31:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA58DE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CF2D40E0B
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCGhxP5dhToU for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C5D840B30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C5D840B30
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C5D840B30
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ADE4AB979EEF; Thu, 11 Dec 2025 20:31:32 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:31:30 +0100
Message-ID: <20251211193130.1100031-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207115405.3489553-1-bernd@kuhls.net>
References: <20251207115405.3489553-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481492; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=dxsbA50QHIDHDL/HrxxMgO7v4bbvaK2cjgBvxjurXYY=;
 b=VTkVGPmS+8TEhKNMmVVJPV2a7W4mIcQvbo+ehrgvVlAM5JxYKWnm+QkaSnQ3hD4uzUNa8c
 oBt36sJYnltoHRFKNpe5qOm3vYX0lvhpZnafyCraVJXHRkTDQ3liF35qrwzz9/TIDIUSs7
 QwbJElz9IOndi15hdK+dz6s/vX5vbWJqpoSmBP//mAgfYnX5KzQkNImEnD/2No0yHtu0EO
 gp9LByY3VsOcjIeN9lk+r49A5nMKRoKP3EYGanKkaVmdeftoRbqYrrgSXSL8UV0D4a28Mo
 rQH1TXy7dpsosxeURh9ogH4zaXqNEBz0NBvNqVeFmOtLJbVtS4R2TCMwxg/o5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VTkVGPmS
Subject: Re: [Buildroot] [PATCH 1/1] package/softhsm2: update SITE
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
> Original site is down, unchanged tarball can be downloaded from github.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/softhsm2/softhsm2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
> index 5e37e42dde..ae44b93bc4 100644
> --- a/package/softhsm2/softhsm2.mk
> +++ b/package/softhsm2/softhsm2.mk
> @@ -6,7 +6,7 @@
>  
>  SOFTHSM2_VERSION = 2.6.1
>  SOFTHSM2_SOURCE = softhsm-$(SOFTHSM2_VERSION).tar.gz
> -SOFTHSM2_SITE = https://dist.opendnssec.org/source
> +SOFTHSM2_SITE = https://github.com/opendnssec/opendnssec/releases/download/2.1.14
>  SOFTHSM2_LICENSE = BSD-2-Clause
>  SOFTHSM2_LICENSE_FILES = LICENSE
>  SOFTHSM2_DEPENDENCIES = openssl
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
