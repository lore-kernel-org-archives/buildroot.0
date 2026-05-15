Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856E1CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A89408C1;
	Fri, 15 May 2026 13:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yLmuOQRoUmz; Fri, 15 May 2026 13:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7306B40BE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852052;
	bh=qiiIy4gPMvjuAjkGfqycleFdd0CX6WFjnrX4kMkow7w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y6nYBwRouGGYKeLvhgEd+5SdUU5MPSgx9Q4BX8fc3fFfe2vnXQzRu8O3vGogkE6Y5
	 eN+U9otf5Gt+byw2/BqVelwTB2yD+eg0OpMpf8WYZy1EtWVvy6Xo1at99Hun17bPIB
	 1hgNi5o8oQ5VXn9a2VpLjNfpKJzh03IzCuvxKR5B/8A65FojQyLSGLxv2RrJsdc3tN
	 qIOcPYK2J8OAy8ppGb87MK2cXnxrKLy3vjqQ5HHHyzhCocPf0La6u2orTAGjjBjazx
	 pB/yIvKRpufXi2d/k9OfqH6h9glVMonU2w0BUaFt8vT+GgiS+dKegD67QvkE7V3IqF
	 LEHuZT8lK/TXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7306B40BE3;
	Fri, 15 May 2026 13:34:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC24136F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C195040A49
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6lx9Yw3vBQp for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAE0B40595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAE0B40595
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAE0B40595
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-444826c16ffso7662500f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852047; x=1779456847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RcbAmTMQOWKyPYo/xhc2HnluUcINdnT3Tcz2HTxsETA=;
 b=D8/67mZtxdKanxupbODCXfUyWKh7kDIiBlVVxlMU5B8+viQ2B05KyLMnY7K9TCrMYA
 SxSLRnYkPjWs1FVhvpj+JzzQ8m9g84fwVanWNB//nDyFHeBN9e0bWlsDpzQd7JMYTTen
 zFqbsAp7TGi+mh/80kP4vop9RFRqbjR2OUSJ27TD6VJwRJl016Laaa4es63VHDc1WjK7
 oXhH4K3PX6nXpAJdeON8LXJ7nVtYJLa7XgrJ6tV03WHKf9YmCVV3Sox276yDJK3nqEMb
 5ArFEvnt5QdXoPTbqwo2h9O1i0TBodavVyKS6F6n3+LVouizkhWHLC28yJEMS4+xGcmh
 i7Uw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9KJROVuJKF8LPGQ9vezrS0LKS3DdPsvokahq+FzD2RoQrsxdldvd9yadaz6z7kQQz7gMQSCWUgCqk=@buildroot.org
X-Gm-Message-State: AOJu0YydfjepzpTptBD1trIO8/T3gVN29SSkscPuLevkwK1pG1e+JIU5
 qmFFddZDu9cBdfTyj2AB6AsOH7kHnZPZqaUbcaA+TOQZTkQhFno/1XFESDzPbW2JX0g=
X-Gm-Gg: Acq92OGH0ViFjntRnytsmVwW5h20cRsnOmdkAXa3bFv/MT9fGgjPHJG9CF6FUy1EZ+D
 wMyz+OZjoVn7OZcfMuH+feF0btZWafcpbItrZiTZ11XhB1EvsW9N6UU2+jrrbMsNpX2Gl4bUIly
 86cf9ufbq0qdPfW195kjpGUMdRzIQGi+8zoGaxNNQRTiTU5062dFHKo/kOMePA1SzTSVNHvF8xQ
 UP1zxF6XgUwLXzhCx1lXyQ8WgCrKs3iV3d31wGwNtFASg+hmy5u5DCHiOJDs1PVkuBNGET4UJds
 m8bOWKNH+YJKj7KnRPCV6CMNpS7/nOPhTiA5/4+XEiqXJBZtohmnW1wbJWwMIzDf5QU/JDhJL5m
 d6H5VAz/P+GbzFtf/17LyR5F+iZOt01utQwjF/Rn0o/AvsnW0R7zB5N0919k/l9EQo/FQCn5Lqy
 +tW47r3fQVGuZ/R4ZXhGhLluRZUrvRh4fytMp9hsHgLN2c
X-Received: by 2002:a05:6000:1867:b0:43d:dd:8ca4 with SMTP id
 ffacd0b85a97d-45e5c36bd24mr5719641f8f.14.1778852046625; 
 Fri, 15 May 2026 06:34:06 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe222bsm11931945f8f.27.2026.05.15.06.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:06 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:05 +0200
Message-ID: <20260515133405.316221-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427153731.3792798-1-peter@korsgaard.com>
References: <20260427153731.3792798-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852047; x=1779456847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RcbAmTMQOWKyPYo/xhc2HnluUcINdnT3Tcz2HTxsETA=;
 b=K9gFeGLQjxBewcB04aCn6Tt68hDYYnh271+7uDYz/9AJW9M9O12yr3BNXcOo8SgdWn
 oR+k3cNIqFMJtC+DVzq6GkOSUUaU6mwTDbrIg/rFWs0JBFnTHTTEBEEQUxNZRM+Z2K9y
 gSRmEuYnUtb5w6dUmQlSsP/0Y7L/zXWXjsgv6N379z+JAsHssGSf8rUIbRWa93TWJb2O
 vllQm866GEfxxrEIzngzn2ucS1q5JlMAVqUdhNAALyYIDoy3guwCprXcNb1CZRiuiL+G
 mVVPdmDDsIfXkMSjK+e5OKeDOEtYoLK8SNBNFk3WY9YEwF4SyPv2TTzh+Q7gbr5d+qOz
 gung==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K9gFeGLQ
Subject: Re: [Buildroot] [PATCH] package/liburiparser: security bump to
 version 1.0.1
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
> Fixes the following vulnerability:
> 
> CVE-2026-42371: integer overflow in text range comparison
> https://github.com/uriparser/uriparser/pull/298
> 
> For details, see the announcement:
> https://www.openwall.com/lists/oss-security/2026/04/27/2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/liburiparser/liburiparser.hash | 4 ++--
>  package/liburiparser/liburiparser.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
> index f8d7124b7f..c18df8eb98 100644
> --- a/package/liburiparser/liburiparser.hash
> +++ b/package/liburiparser/liburiparser.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.0
> -sha256  154a3f649d80a78d5095fc461ec032ffb45f5ed3619edec923ac68cff29a088d  uriparser-1.0.0.tar.xz
> +# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.1
> +sha256  acd18cfb14d1851705f863f7a625be693fb3971fb85d4996faa21147f0315fcb  uriparser-1.0.1.tar.xz
>  # Locally calculated
>  sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
> diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
> index 731739e582..d8dcc22063 100644
> --- a/package/liburiparser/liburiparser.mk
> +++ b/package/liburiparser/liburiparser.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBURIPARSER_VERSION = 1.0.0
> +LIBURIPARSER_VERSION = 1.0.1
>  LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
>  LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
>  LIBURIPARSER_LICENSE = BSD-3-Clause
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
