Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD7CCD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9406341BCA;
	Fri, 15 May 2026 13:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id For4kow_ZpcR; Fri, 15 May 2026 13:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25FAA41BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852031;
	bh=UevsRj7Wieji1qEKikoLWiCF4Ph8TKjM0anQH/PSxVQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ya3CxsfVqR52HMFojupOii8impuSjanAy9MCgqdJj3HUoZnVqlgW7aRjg/yDiT0CB
	 /APHfgJIs+duoXhjXJw40kcTYlV4AYO99qDR01OxLdcgqEazyut98vkUd+OfzLCIwK
	 BqKOeYbr/k3bN1DsnnysZq/PumSVKtdjWIrlIMLiUkkcJxsIzNakvtOD64mq532xot
	 QwvBtbiME7BnZNeh4F0fpg9L/MYnWPY5JKalNdzviCC9TwMPERj6LZWI8bcG36g+4u
	 HauPfITYC9e8lBWlJriYR/ih3whWEhHw6+Ug0uHBU+lq6jw2qaWsPYePZskhZDDauE
	 gNvvkSmXxW8Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25FAA41BBC;
	Fri, 15 May 2026 13:33:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E913942B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE564842E6
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnbKm-4ZzFK1 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8D2A842A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D2A842A1
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8D2A842A1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:46 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43d75312379so636957f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852025; x=1779456825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eHPT0GqhjOXTkFnph61jLAI0UZZFYqVv2p6yOVxyaU0=;
 b=VNo99vuAzIAddRrd+PhXmSQrLYO8ZkpaM/qyxDSX9FMOGqT3yFZBYaSeTWir1kw1H1
 SuPBrjINgvls3I1UcBINbRN2dxnuFY9QR/yY6cIsfhxdmN6hnynBTgEex98uzqbvyJPi
 VS4xyf7WoUWOMICUrxClMJTsdEY6jBguMn1ICmHZLwg0YrRP2icmLPFKONAzbxR62o/p
 z7Lajgx5H12i2QZFj8LAO7eJLlYmsVOJFCbKqW6YBQH2jtlBo15nqMKXaWB9ZqYhwb4+
 i7WY+/wbHAslqQ1FEsSFLScO+DT5GGmQOsK+4IRLC8uJQmKIxaf+TeDyzM02I3bscsPO
 5hOQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ88FytR+AKEc1CUXz6EC6Vv4Of5qn2DqtIe4IIt3kb/mK/0IJ5GegrcK6NoO97D48TRj6ugVi0Q9iE=@buildroot.org
X-Gm-Message-State: AOJu0Yw4QO5euvYuFhoIx7lBdKYMN2iF56Z/R27IE1D8dV8PmDl++zeK
 +U1uU+ocktEF7xBthTkDyFSSGwuPEuAZjsUqa/46M3eKkVCE24RrluuQ9Atcxqk9s1QucJ/v9ae
 ok5MF
X-Gm-Gg: Acq92OHuOVNTLn2kxfNME/pIavEH/WMFlLgXcG2hOHr5t8mRJFcCqPYHufpd4jwrfDL
 0QSOnWgvsam+JprQLkjdtvDyjILewGCuq+T064W85QLmoCM0EXzjDu5LPTwhtVDAREZN0VRssBh
 /Bic/tqDn9+Wge+KI2UmKv92jfZnvyGNpkGIasa0oeQzYQWonelHG005ksqPC8Y1XPVMuDL7rWn
 ynfytdyefLc4pr2XfY5S//s0qUjrKR/mUCArVDC4ZoM165nX6C2F5yNJ7hE5ZQSwy6WObGa6Hdf
 si2wTmW0NErytlgMxvsJaUp6u32N2VStI+cJw31OSYQvQ4zCoS+D/6ARqQWUpGxMwYkfpkHFvpv
 qJRkqTUAit3w1bVx5Nr0DMCoj7bqVtUqZ5JX5EChebBUzqeWKa7wJpbha2vtEd7Cs+sqrOQIElg
 OIFQdjMhAS0bFVkrgxTyKiyi/TPslNhF6l78TcqZc6ol1t
X-Received: by 2002:a05:600c:8906:b0:488:aa33:dc8f with SMTP id
 5b1f17b1804b1-48fe486cca4mr54806505e9.0.1778852024701; 
 Fri, 15 May 2026 06:33:44 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fea529727sm32530845e9.1.2026.05.15.06.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:44 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:43 +0200
Message-ID: <20260515133343.315572-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430145130.1803104-1-giulio.benetti@benettiengineering.com>
References: <20260430145130.1803104-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852025; x=1779456825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHPT0GqhjOXTkFnph61jLAI0UZZFYqVv2p6yOVxyaU0=;
 b=MNeAFY0fJJfKYJDr+LMMhhipQOHRHYIUYzmZq+tDYUBucMtZgV3K7AfgUC5V1+/1Xb
 +ePfRe7Do+Xt9W4kQit+HgYW17V1wAgcCf3oh5d71VHEuCzOioB4Cg8iUq/MqIUH+m2V
 oQ3LwCaFFkbfOlJ8leJP97TYRVyOU3xW6KZQctFjetQ2LHNcgwgckhdXnZuwM+NATfSD
 4dbwA9AgIwZ4ARSltLFS3axFcM9p9Z2GwsqG6VZB71RKPHlBNMFp04LJTa9PMpH/o8TU
 HDeChsFG3Lfu5phLBJPFxKL20aST+crZajzXaNbJTClm6Tb8YNHhLM272zsy5DE8zxVA
 ZP/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MNeAFY0f
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.15
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
> For more information on the version bump, see:
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.15.html
> 
> Fixes the following vulnerabilities:
> CVE-2026-5409, CVE-2026-5408, CVE-2026-5406, CVE-2026-5407, CVE-2026-5299,
> CVE-2026-5401, CVE-2026-5404, CVE-2026-5403, CVE-2026-5405, CVE-2026-5654,
> CVE-2026-5657, CVE-2026-5656, CVE-2026-5653, CVE-2026-6538, CVE-2026-6537,
> CVE-2026-6535, CVE-2026-6534, CVE-2026-6533, CVE-2026-6532, CVE-2026-6531,
> CVE-2026-6530, CVE-2026-6529, CVE-2026-6527, CVE-2026-6524, CVE-2026-6523,
> CVE-2026-6521, CVE-2026-6520, CVE-2026-6519, CVE-2026-6522, CVE-2026-6870,
> CVE-2026-6869, CVE-2026-6868.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2026.02.x. Thanks

> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index 7572ea8b52..037f2f509a 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,6 +1,6 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.14.txt
> -sha1  41536d8ba1fc977d0832b509af6ea65056c6fe1d  wireshark-4.4.14.tar.xz
> -sha256  c9113130bd2b37919fdcf575f710469ce391960baaff31911e3288469e6a8e8d  wireshark-4.4.14.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.15.txt
> +sha1  dd591df261c7866e7eaac3f015c904ab21d9d51d  wireshark-4.4.15.tar.xz
> +sha256  05e884da8d91929bd1fb6a91c26836d69145ecd439b97c2d82698388de221570  wireshark-4.4.15.tar.xz
>  
>  # Locally calculated
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index d58fa7a6c5..1ded080906 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRESHARK_VERSION = 4.4.14
> +WIRESHARK_VERSION = 4.4.15
>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
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
