Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F8D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B5940D57;
	Wed,  7 Jan 2026 17:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NwtODHGJHUb7; Wed,  7 Jan 2026 17:49:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FD2E40D2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808161;
	bh=EuG1/vMMu+GkDF3XD7/nh94qbgHV3zcRpa9FV21g174=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OOES2oaPPyyXNjgyikcbYY/kwvYNiyDWztoF8Rw/Qyqg8ve5RMbRpFbMBSfYIHORw
	 6VNF9/rpvLnFcbnchKdFC1RvmKqiDm0YhxnSZzoMvd2MZQ104JRi+1E+Te1aXoswms
	 olWVwjLi7q/uKpZ48/GVVXDJ3NCW/H0CKx4lqkijdHU5iJ3CeKkTnaPJ6Qghe0F1qC
	 H4gofup2Ia/m8+ovpbXcUX4tRkEvG/PEMdbdIuUZWK1r5tR8m8PA2OjLzZZOUzFgUS
	 luGTzGHVQ3O9IRbx2qsuhpMi7oy3AJSgbTQZV/FtgSr2v4Dx2Kw+5U00e+ZhfhFJXX
	 UIfuhTu4qR3rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FD2E40D2A;
	Wed,  7 Jan 2026 17:49:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 863A625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C46F607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0zeklb78yoK for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AE71607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AE71607D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AE71607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7647BB97A70C; Wed,  7 Jan 2026 18:49:14 +0100 (CET)
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:12 +0100
Message-ID: <20260107174912.225055-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217012751.2602488-1-matt@codeconstruct.com.au>
References: <20251217012751.2602488-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808156; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=F30lC+M43baD+8/6qp1juD1Yqm4U/pi1DMTtKvEZh5g=;
 b=W41dfxcNik5bc3OYTe8KtJXUXDj/0/08RHGcVjav9V0oZCQ8s18sKDUH2xxYvrm9WSZnPx
 zkdo/O4mFpfpdr9m8YCLDS4BRFe/L7IAyUfPkW9RPe5KPaD4ZJr/MopclU/ok2MtFU8Kam
 VTNPqO7wdsw/ml3rDpN3bQ+TxF6ItSbVDbYUzvAvmBuODKtXfmIHNPQqik53NLLbyb3k5V
 gWg5uSiZHY4m6KfhaBWWVPIU+iaj3n1lbIQ/i8IJtuMAntDVcIEHGRsZwCxEg1aZszAfMZ
 L3lVLRX5426i/jg0nh1oY0c2dcL4QOXFr9jtCNZAWkxrrV750pB2AddqS/0IUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=W41dfxcN
Subject: Re: [Buildroot] [PATCH] package/dropbear: security bump to version
 2025.89
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
> Fixes CVE-2025-14282
> https://security-tracker.debian.org/tracker/CVE-2025-14282
> CVE-2019-6111 for scp
> https://security-tracker.debian.org/tracker/CVE-2019-6111
> 
> Release notes:
> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.89
> 
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index b18aca3aab5d..b3f532b1b79e 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4  dropbear-2025.88.tar.bz2
> +sha256  0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634  dropbear-2025.89.tar.bz2
>  
>  # License file, locally computed
>  sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index d57d6b6e372b..e4e42cf99442 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DROPBEAR_VERSION = 2025.88
> +DROPBEAR_VERSION = 2025.89
>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
