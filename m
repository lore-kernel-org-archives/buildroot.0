Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5798FCCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D6E041020;
	Thu, 30 Oct 2025 08:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnrHj4blypX9; Thu, 30 Oct 2025 08:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 409DD41115
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 409DD41115;
	Thu, 30 Oct 2025 08:23:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E38CC2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C99B36128B
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOnK6rjRWjFx for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8DA660DD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8DA660DD8
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8DA660DD8
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-427007b1fe5so588019f8f.1
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812627; x=1762417427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C9SF8BfaS6gH0lKsmqOKOTrqzTo5aZ5CWhmQ4HkfxNI=;
 b=YrM6dUxDkSZjE5G99wdFuwf5ljIRIbZGlu8t0ix4q0/h0EysLkH/dKfBSN/PNbfWbt
 sbe5t0bBn7tZ7HcQ5mae0h/CTKZZheURv94M+xQaJbNXdYluCd5MxtnAAwofbONbUxQq
 sj/WWU2BVUFMHxlzUlyxBfUtppK6tNkQ5MAOXG7I5HwOGGJG0AkpqSm3rbwQ9aL9/QEY
 0UdATD9Vj7/kBqTuk79kc7LovMilRhx6gMi4YF0ygBG9L0i4NQWe/h/h32xebcM0YIqd
 dIB/XFrNtHUMmkyDAHPVgwj43HcNqeupORkTm6mkeVDJwnKvo9BuN1DemI0IoKQl+TV7
 wbKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd01jMGso9Ks0uKnJdAUuWuf2h1l9a9lV5TPqTF44egYKoqN5byM3nDhHg/mIDizOTbupV1RzQ/1c=@buildroot.org
X-Gm-Message-State: AOJu0Yz9GlvAWgxJ94PtbvbqB3vK+OU5QWV3LLVI5oUgfaIoCqfgoMzI
 Yb1+vXEWRNEd5t6bTHdPGKmeaUAEFgGTRMOxNkDJ4YxwiJc8xFGiIZ93TjYxCZB4pu5OTG+ygKV
 aoS1o
X-Gm-Gg: ASbGnct7CrnZOsn40HnLjhNFtqfxr3Pn0xJVo8zZIeHpZR50EkDtrFdDYM0VJvEe3Ib
 Iw1z2bWIURltjPdHtCaLQZR2wsq9VOTjaaMSJOVepnyTbiNM/8H5S6reEUYDvyBZIKSPUaviFZ3
 yUlr2hWnxxCcTaFkcncamwUK7r20glFuBjR3GTECM/ghZ0SKfE3SWzZbufYwYjA+vjNW0YVY2Gq
 2EuA9Fw4loicaQS4qFij4UTDe77PfF5Yg9Xvse5a5udBlbXqECdeb50Zf3hG/5ndqzdSJ6+jrvQ
 umLSBJVOtyZp1SFHd0mlsRGn6gssVs/hgYsyMkuquvT5wLcnPBkDmMGZl1+tB9bBb+N8clX9alV
 I1a8/DZnnQspQz9vIB8/o6z2HgZ4opDAmdvygDgAX4UVmdUxCB47SSSIEfXQp0FjKI3UAcrNdGk
 E3i3EWhbW/r/uZwAv1SZZlmbrApqX/pN0uqVvX
X-Google-Smtp-Source: AGHT+IFE3iIuiDrXh5CTq56p56QPeOvy9BvCALpVoCZzbc2Ugptso3C92WmqzDq+i4P2YXPdNgEwpg==
X-Received: by 2002:a05:600c:6207:b0:45d:f83b:96aa with SMTP id
 5b1f17b1804b1-477208d1be0mr49379495e9.7.1761812626827; 
 Thu, 30 Oct 2025 01:23:46 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289b3956sm26724795e9.10.2025.10.30.01.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:46 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:46 +0100
Message-ID: <20251030082346.34977-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021162330.106028-1-titouan.christophe@mind.be>
References: <20251021162330.106028-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812627; x=1762417427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C9SF8BfaS6gH0lKsmqOKOTrqzTo5aZ5CWhmQ4HkfxNI=;
 b=dE8Qe6YimRUTcJnPOiE6Xt5N/FnBlkxZFMWBcbm5LT/7J3gc4kSqubrRZsOv2mx+Tr
 PaLEZDPhypl9RgfBoVJpey9NwQPAq2DExH6iO8tu5IkCeaUpWf4OFt/EX5niX7dB65Md
 AMeEQZfnbYCqRpBAd5irNCUWRmyLJSGlPOEx+zxe7tXrGp7miqf4FN3l81UMX33RuxAe
 4FU5HqGB+Wml/dyBrYGRnl1aIUVIwig4FxosIA/mgTyfH7pAAEs2y8laOEo/gndc8ZVA
 ER/z/lYNlD+i9ZGozQGolaqSyhrjdyGgnL7dexDmfRj8o0HLwfqWnrarHQdXqE+Aqn+A
 21CQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dE8Qe6Yi
Subject: Re: [Buildroot] [PATCH 1/2] package/xerces: security bump to v3.2.5
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
> See the release notes:
> https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12352411&projectId=10510
> 
> Also update the download site to https
> 
> This fixes the following vulnerability:
> - CVE-2024-23807:
>     The Apache Xerces C++ XML parser on versions 3.0.0 before 3.2.5
>     contains a use-after-free error triggered during the scanning of
>     external DTDs.  Users are recommended to upgrade to version 3.2.5
>     which fixes the issue, or mitigate the issue by disabling DTD
>     processing. This can be accomplished via the DOM using a standard
>     parser feature, or via SAX using the XERCES_DISABLE_DTD environment
>     variable.  This issue has been disclosed before as CVE-2018-1311, but
>     unfortunately that advisory incorrectly stated the issue would be
>     fixed in version 3.2.3 or 3.2.4.
>     https://www.cve.org/CVERecord?id=CVE-2024-23807
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  package/xerces/xerces.hash | 4 ++--
>  package/xerces/xerces.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
> index e6b5b922d2..52c22ee826 100644
> --- a/package/xerces/xerces.hash
> +++ b/package/xerces/xerces.hash
> @@ -1,5 +1,5 @@
> -# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.4.tar.xz.sha256
> -sha256  075bc57940da0f9be6dd183c550c8ce0b9833e4550dc382048377a1a5e3b2bd9  xerces-c-3.2.4.tar.xz
> +# From https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.5.tar.gz.sha256
> +sha256  545cfcce6c4e755207bd1f27e319241e50e37c0c27250f11cda116018f1ef0f5  xerces-c-3.2.5.tar.gz
>  
>  # Hash for license file
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
> index 08efa6fb5c..7734cff0d2 100644
> --- a/package/xerces/xerces.mk
> +++ b/package/xerces/xerces.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -XERCES_VERSION = 3.2.4
> -XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
> -XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
> +XERCES_VERSION = 3.2.5
> +XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
> +XERCES_SITE = https://archive.apache.org/dist/xerces/c/3/sources
>  XERCES_LICENSE = Apache-2.0
>  XERCES_LICENSE_FILES = LICENSE
>  XERCES_CPE_ID_VENDOR = apache
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
