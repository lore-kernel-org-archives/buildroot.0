Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D972FCD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF681845F2;
	Mon,  4 May 2026 14:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjfMNEjbzREI; Mon,  4 May 2026 14:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00AF84646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906062;
	bh=GsoktSmF1oNvHNvejhQhONNspdY46YqmqOVqZorYcZg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NbIDhKcjsDMIyi0hxlk9rZqtil1WnMegphorKcWoe8SoKZBkxOMUs7GGPsU1y4pQg
	 Jxh9GqyV8C4xcCB1uh8+8vUrBVynBLEUcFPVZE4BZTH+4Q7pbgY8GWc4fBPeAutMIq
	 0L4tqhxvOA0B4YQoQySq2kh52VYTiIfGLOeJYJprBEMldlous0EN6w8Q6hNTTRheKc
	 pHWZrWb+WW5l/+6fpgBipnqwHO9+3JFBtEzeXcpyA2ZfXe5qrlc2DiHyK2pTPxHn8c
	 AlldW363s+FcYQvyIYNDcR9vENC3OwYsF9HPbFhp7UvJH+Nq7weRXyjcs8z03qpAaW
	 EC7lNxI3qe+5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C00AF84646;
	Mon,  4 May 2026 14:47:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEB03190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8DF7845BB
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnkIgASk9-xE for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2E97845D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2E97845D5
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2E97845D5
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso29741245e9.1
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906058; x=1778510858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SjREVxcKyt2r27FFf6PYmJdPrlyoiodI9+8EmAE1FyQ=;
 b=nasc9ZcLRZJQO28uwbWNbHBD760H2si/2xh+kuaV5bipulmf1qMHWpusm7+/rPuKDO
 XNmWRDd/hbr+zTdYOtSi2uXEY1WwAYGjcbii9IWT91NFQuDWOWYueHxjWYtIunTLm/hM
 T9MtzS0aDZQqFSZ2Mri6GN7tZ0DLv63qt5bigXEFzxCw1DYDQG9lWFjJzhbuIesYaLv8
 Sv80QSqARRfrMRfx/EGRDUYtS9SVlZohuVszKlGSvYqnyyPXOpshEaP8ahRHE4MKIgBV
 9eb6M5ijDf/Y19b/zpHcKFDr73jjeSHOTJSEi7Re42tYm0kLAXIXBD3ebowrcdtyS8Qg
 oqPA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+snxLgO0iKXhrjIpyNkwXelcN10/mAT9yFtZDwGTLsbuT//0IaTYRbmpAnUdQDg9hJXATdBNQE93k=@buildroot.org
X-Gm-Message-State: AOJu0Yz0IZMg2j3zyQs6FQnYCtUHG1w1VrtOoqnxf7xaSOAXegLYWRt/
 yknmZ47qzJ2Uw+55vfppBKmbVFFDn+vkC6J7+Kv7m6YkBq9UmAW7cpno3IvpFsrHIIk=
X-Gm-Gg: AeBDieu4QZB/X+CDnmJnWCptNe1tJdkSeE4pEUqFBFeaYvulrPWJo4iMU/D/tes3v8+
 41U7/BHAVrJwdrnmqYSr3GiJU0vygKjdfVsa8/UGE8qGnXaznaB77+hqG/ADc0A0S0DtussVGtO
 n3tfP0xGVkjxj5a4Dymyjot5ZNiiG8fXsRCNV0vS/5dD/spoe3SXkQIyH2J9AHjTb/d872NWJeE
 cwtGHCXKPpVGxRsSQm+nSCzSwmswDpgAld2ARizTl/FdiQRxLWPc6F7uG+lu3jISwDKnpK5ApFj
 tFbT8KwJplygEwqvvYQTeF4CYfmPVits5CgQslpY8uV23BEfGK4mu8vf9P55tWDZr5qgRkU3aXN
 v/j5hC0Y5GFOVQJLwBY6qJ00fXEUHQxtgw2azkeW0VwNGR/HYJkwwAg4PXyroBDHsgEnlcphbFj
 TcB/mP7KgfS89HD8uGu5Kce/cZNQ==
X-Received: by 2002:a05:600c:c058:b0:483:8062:b2f with SMTP id
 5b1f17b1804b1-48a9886c2aemr97858785e9.6.1777906057876; 
 Mon, 04 May 2026 07:47:37 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8ebb2fa5sm239253025e9.12.2026.05.04.07.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:37 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:36 +0200
Message-ID: <20260504144736.9812-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420173412.3572945-1-bernd@kuhls.net>
References: <20260420173412.3572945-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906058; x=1778510858; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjREVxcKyt2r27FFf6PYmJdPrlyoiodI9+8EmAE1FyQ=;
 b=I+cGmcnYu4pnGEoeGjb5HAASqOzqg+FED7zsZovAcEONKbOrKi0HijZfLEWveDsxLF
 Cr7L+fHxx/2owvy7KsD25q4viWYGjxqi3rF6sM0dW4Q8DSlnbgSNL3XusZEPj9+uqmj/
 GNyR1z7poOu/DT77c3xJlndqxFjG7/ydXqpbs/9IPDv4S5jyIhwKk9E4aKrhlOg+6Ztn
 JnQ4BUuYR14qqUsASGqUYndVoWTDPqjj0fcRtBOZOngY7xvrU4i0Y/wexNTUGHqwQduR
 2Y56cIMYKP3Tp6d5FwwhqSbyRlDV/IwYhgkDOvC9OGQowEuJnw8wboF0UNfpitwhQp9q
 GrDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I+cGmcnY
Subject: Re: [Buildroot] [PATCH 1/2] package/p11-kit: security bump version
 to 0.26.2
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
> https://github.com/p11-glue/p11-kit/blob/0.26.2/NEWS
> 
> Fixes CVE-2026-2100: https://github.com/advisories/GHSA-hq85-3f6c-jx84
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/p11-kit/p11-kit.hash | 4 ++--
>  package/p11-kit/p11-kit.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
> index 43a566a82c..943ad9c22f 100644
> --- a/package/p11-kit/p11-kit.hash
> +++ b/package/p11-kit/p11-kit.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated after checking pgp signature
> -sha256  04d0a86450cdb1be018f26af6699857171a188ac6d5b8c90786a60854e1198e5  p11-kit-0.25.5.tar.xz
> +# From https://github.com/p11-glue/p11-kit/releases/tag/0.26.2
> +sha256  09fd9f44da4813a3141e73d5e7cf7008e5660d0405f13d56c15e1da9dcecf828  p11-kit-0.26.2.tar.xz
>  # Locally computed
>  sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
> diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
> index 42de3e1065..68b1894183 100644
> --- a/package/p11-kit/p11-kit.mk
> +++ b/package/p11-kit/p11-kit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -P11_KIT_VERSION = 0.25.5
> +P11_KIT_VERSION = 0.26.2
>  P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
>  P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
>  P11_KIT_INSTALL_STAGING = YES
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
