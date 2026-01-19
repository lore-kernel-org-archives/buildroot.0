Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07358CCF2DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2332807BD;
	Mon, 19 Jan 2026 10:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_-dfRCVuPcq; Mon, 19 Jan 2026 10:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D042380596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817372;
	bh=J4hycx24QuJwrngLULBKhWNIVzjCCdtFOYVd6/myUUE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FGZh6AKJnJcI4t/kzJ3dVlm/lKEyE0iDzyOIdehYDu0kLIjLYvPrGmlyuGmLY8yZx
	 TcFbXgjHG2T0khWcAuluhAeRHV3Z+VsAKEQqdAgA4U2zg8vOpsYVVxXRwvWxQwJVLN
	 8zOy4M40ZV9kjdYPtTLfpao+Chq/xMO82b88IGeTOqPKEluuXIOlTZluw1aJ42BZPo
	 FoGe0C/dBDJB5hDtbRhzRGh3mmoQlNycpRPRVKJPsCHVj7YJ9WX3VebD78S5q3cxja
	 NSl9jCNuJsaaE3jO1iwJapt/fgETPopNmFjRigi5kHrrnCll06kFClBHjRLRn68Qht
	 lfGIsoMJPT/Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D042380596;
	Mon, 19 Jan 2026 10:09:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A3F1160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D05580741
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRu1BDM3hYVA for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D389F80615
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D389F80615
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D389F80615
 for <buildroot@busybox.net>; Mon, 19 Jan 2026 10:09:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A3C7B97A968; Mon, 19 Jan 2026 11:09:24 +0100 (CET)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@busybox.net
Date: Mon, 19 Jan 2026 11:09:23 +0100
Message-ID: <20260119100923.12951-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107200004.665611-5-francois.perrad@gadz.org>
References: <20260107200004.665611-5-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817364; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=lTCkrpKYpX1AeHVpF233/JVo7th9SUvOEVoZ0GRW4jI=;
 b=N5CmvaT6Xz3wG81HZrwjpjL84p4EdSA1GULDylBv/F7rzQWz5LRLmEsHjncBhkk49P/F5s
 hleArdK80Bgzf69gBqVbxx6JXAW7nGcVFGdqYKXucfP/HzA8heecRxdjmT4rDBchFRpObI
 n5bpP1kAt/WBRe+/4g9G5OKUxcje01Qt3RCocef1hrnk5feYjHuOvgqwgAFyTWd+s0IStW
 8qT7BUdLrBj8Ba0jhNB5WRLvH7Pl3dDF5SkaXjbJKVFg6mo/vidQTpeJm5J+mXPgUJ8ohm
 LuyBK97/Gx5MhYoGVSbtUTy/lePjNhKvkt4lx4j6tzySAuOztvpl7qz9Ach/2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=N5CmvaT6
Subject: Re: [Buildroot] [PATCH 05/16] package/perl-mozilla-ca: bump to
 version 20250602
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
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
>  package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
> index 35bb158d1..bd396d1de 100644
> --- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
> +++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
> @@ -1,6 +1,6 @@
>  # retrieved by scancpan from https://cpan.metacpan.org/
> -md5  dad624e6dce1d5f87dbb6268395df180  Mozilla-CA-20240924.tar.gz
> -sha256  c4b1412bbc37dff8cf29af6f92cb47defbe90eebcbc29e407a98638f7a31bcd0  Mozilla-CA-20240924.tar.gz
> +md5  c28848458e8ae2325e46b15a243f1918  Mozilla-CA-20250602.tar.gz
> +sha256  adeac0752440b2da094e8036bab6c857e22172457658868f5ac364f0c7b35481  Mozilla-CA-20250602.tar.gz
>  
>  # computed by scancpan
>  sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
> diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
> index ce5664996..02b4cf3d5 100644
> --- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
> +++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PERL_MOZILLA_CA_VERSION = 20240924
> +PERL_MOZILLA_CA_VERSION = 20250602
>  PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
>  PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
>  PERL_MOZILLA_CA_LICENSE = MPL-2.0
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
