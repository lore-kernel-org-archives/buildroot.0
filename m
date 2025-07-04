Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259F8C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2E5960BA4;
	Fri,  4 Jul 2025 06:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWSWxX6OQtP6; Fri,  4 Jul 2025 06:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1E386072E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E386072E;
	Fri,  4 Jul 2025 06:48:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ECDC1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6563783180
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hif1wpbdW9F for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4ED2B8125E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED2B8125E
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ED2B8125E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:31 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso477662f8f.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611709; x=1752216509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zu88bel7or64pIiEpcImWWdE6KgAeA5zzgZfVZUD8Ic=;
 b=vXpkLc3ayOEHK250Eq8tz2GsTLbtTLbNEn7IfYxKDrSXdabYhjOF/Xnzz2Au8R8VdV
 H8y+2bvfOfV3Yy0PRMbOWl4Xc/jmInxeFG0QdbtBPGdcBbkpa7BA1i2O7b6WLCJQ40FB
 e7X0xewyqCY8T/jOESDGmUJmW8LGuVkInTbdkCgfOvaE+s9LC5gLJzISXYV9pSqoEAq2
 gjy4QFNApZbmqEsCNF1I8qSW9SaP152dJc3C5l4s1Ll34stB4P5C/GEFWiW7aYtcHVdn
 1iHqRd9rLWmOBs+88kyvunePCuezRqyv5GKP2sTQd46r8z+GwGR8pmNBFmPGE3KkgF9L
 w6yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6YhOZ98nyrgaV5/xdupdjYeLR0jlZftoTCqbMRwxS6VWqDpSCCLKJmF3Xa3d7c2L8dx0r67MnLtQ=@buildroot.org
X-Gm-Message-State: AOJu0YyUuAohmYzXey7VKjO2/7xBfGc73NyAbSKXo1MNLI05hkA6edRb
 16SOPsruvcRKyOFZy6vskGWLyrEvLPa565rOElG668qum+EExm5t7dZTlgH9CTY8T03eop1lL03
 YUQ5C
X-Gm-Gg: ASbGncuLjOJHai/OKeS93SUFtysmai2J0CFvZ0f95BNC3neMLjeBEGDbLdXz4rJ/odA
 cY2NIVGQmpMoUE2K9Sabj1rzysoPUIlM+nwILV7L3rUK8fK+N6rrJZaIZ1l5SScy3P/KECVbslo
 Ve1ych+ryUAOlReDpLg1j/04f+WkYv1fk9DZon+z9LX1tb5BWqo+y7c8rbacS+DIj/zn1IbWH4J
 KI2POQFor4rb+oNtngURbmii9o+1Zz2aMwvM7TVgxPNe97lIYES4ZE+OntKJU3QbZc2KHq40f54
 H4pZDT4u9kphju6PpGqxw6zDyRgVxtxdcjVkRACPkbQoe25OG5BnSG6FpdOpcSW3N3SWPpcWdG4
 x8b8vDzL76A==
X-Google-Smtp-Source: AGHT+IFQImX0icwxn4M5jcjVpEutZtmMTQtF0myM7qySBxDtHXUijsCokY1mhphvRmPUh5gPZuDkgQ==
X-Received: by 2002:a05:6000:4803:b0:3a4:fb7e:5fa6 with SMTP id
 ffacd0b85a97d-3b496fef93fmr644138f8f.1.1751611709366; 
 Thu, 03 Jul 2025 23:48:29 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030bd42sm1633695f8f.5.2025.07.03.23.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:48:28 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:48:27 +0200
Message-ID: <20250704064827.4065819-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626083005.537882-1-titouan.christophe@mind.be>
References: <20250626083005.537882-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611709; x=1752216509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zu88bel7or64pIiEpcImWWdE6KgAeA5zzgZfVZUD8Ic=;
 b=blvcHSearwCYV4aWpUjZLMaMUfw1/rX1sdf0fyOeL8VeqD3nLxsBAfuHn2+GvfPA0j
 E7sv0Gug66E5tkoY3lL/CGcgvQ1JuPXZ9D/mFjb50Aj6U8hfUJVlq1pmsqsHjfPbclUE
 8ZFQ7eaSNcWgSA7aBralexdivYg2SFgENa/HOEY4OMbxL2e4dt7Sro3LrbXoMvtROE7U
 rUEsWiEYIW0blTViTxe8Sb9Jz73nWoclnEv7JA8uudCb5WY0wTaHFEe3svcffihMMy0G
 yIr5wNzm+xMWJIdJzBKrBmSPygkgRzZJeKsw3oj96VvZ3abjABskgSSQUYnJjpjIBQSg
 CnNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=blvcHSea
Subject: Re: [Buildroot] [PATCH 1/2] package/libmpeg2: switch to videolan
 Gitlab repository
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The source code archives don't seem to be available anymore from the libmpeg2
> website (Sourceforge) [1], and their SVN repository [2] doesn't seem
> reachable either.
> 
> This fixes recent autobuilder failures, such as
> https://autobuild.buildroot.net/results/ede/edeef6a480350880b12eebd94654644e43c2670e/
> 
> [1] https://libmpeg2.sourceforge.io/
> [2] svn://svn.videolan.org/libmpeg2/trunk
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.05.x. Thanks

> ---
>  package/libmpeg2/libmpeg2.hash | 2 +-
>  package/libmpeg2/libmpeg2.mk   | 6 +++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libmpeg2/libmpeg2.hash b/package/libmpeg2/libmpeg2.hash
> index 615d0ea6bf..96b71fb1c8 100644
> --- a/package/libmpeg2/libmpeg2.hash
> +++ b/package/libmpeg2/libmpeg2.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  dee22e893cb5fc2b2b6ebd60b88478ab8556cb3b93f9a0d7ce8f3b61851871d4  libmpeg2-0.5.1.tar.gz
> +sha256  1b3adfb73e7d34ce9259130683d884b0b1af67572c9fd8229d45f55794b6dc0c  libmpeg2-v41f78cf4d30d0da0a24c8ecbc38b0c9dfd43f871.tar.gz
>  sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
> index db9b2f8bbb..cab800162c 100644
> --- a/package/libmpeg2/libmpeg2.mk
> +++ b/package/libmpeg2/libmpeg2.mk
> @@ -5,7 +5,11 @@
>  ################################################################################
>  
>  LIBMPEG2_VERSION = 0.5.1
> -LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files
> +# Gitlab repository does not have a 0.5.1 git tag,
> +# use the corresponding commit sha instead
> +LIBMPEG2_VERSION_SHA = 41f78cf4d30d0da0a24c8ecbc38b0c9dfd43f871
> +LIBMPEG2_SOURCE = libmpeg2-v$(LIBMPEG2_VERSION_SHA).tar.gz
> +LIBMPEG2_SITE = https://code.videolan.org/videolan/libmpeg2/-/archive/$(LIBMPEG2_VERSION_SHA)
>  LIBMPEG2_LICENSE = GPL-2.0+
>  LIBMPEG2_LICENSE_FILES = COPYING
>  LIBMPEG2_INSTALL_STAGING = YES
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
