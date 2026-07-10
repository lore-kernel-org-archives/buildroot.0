Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FC5C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBF4C811DD;
	Fri, 10 Jul 2026 13:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtxrTrEy4J9n; Fri, 10 Jul 2026 13:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4CD8811EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691548;
	bh=Hl610/expRm1CSMNHchX8fcbaagHkgwLRoHYFcbY58I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S8Zl2KsY+C4JBnYDHnht+hsRwRc9TvZBj6lBcSu1fyxV8uX9GU2//UB35wsoGPSTY
	 ZD4ymvOFp1XmOLBRusCMYD4nt4eBDv9rpHmPSo2w3A08UXYiP5tsuoS3U+TTH1OAWa
	 ZoA4oPWP066tSxMFtg89LCn7GXmmFYKJXxsBCZKCqEX3Ih1FBiIkovDpdJSzf3EW/N
	 sYz1BqaUja6Yc6dC4O6nkSKgYHtRwKHFm9aMtgN43RCMTbmNKu2ekJ8eFCE8awZsEy
	 9LbP91dQaezcgUpy8Pmytav6sTOH5Jw8WqIMFUtStuElEd5+Fic3wTY06Sq6zuG8bi
	 c1/YExRVnohFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4CD8811EE;
	Fri, 10 Jul 2026 13:52:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9D2AA3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9987040D0A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Udz6xhtjzExi for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 825F240D4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 825F240D4C
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 825F240D4C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4758b2a9e2aso613350f8f.2
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691533; x=1784296333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RDwZJ8uMgpx5bbwQ1aCqqOOcQfcgAKhlOjJA3b/oTNc=;
 b=L1UNqT5dLzAflInjLZ6Mvexch0cWqQUgPfq5GurIJHjaJ8xtylmBBsNADzDdoI8ldb
 1vpiHnbGWo5vUsC2mhfUaiSppSXbXAUkFfO/xqCDjJ6AlbX/kIHI+wbBOlxjRmESswBz
 dwTsZxRvG2unGIOppq4kwccYYCQdpa5ybQWmpZmYesN0uzdJJhqHHvtoQJrnzedx7Ift
 5Bwy12qzshk9Ytogmv9RT4mnXXc5bc+btsrpwW2qwRq5VBMBoxOX+cwz+oow8/JYy93Z
 VAP21Cs08accy4rOdrsf9MN7Q7eQtEUQ66iO6bb5444zabWUqdd75ZP7IMZECcNp3yjA
 oOrg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqInQVae0Tryg9tfFlkKKOZBcZsJFNJNYTmaJ0zrtiWWlgo/HjZjTtJb/RqbD/rJfx+A5nCEL46Qfs=@buildroot.org
X-Gm-Message-State: AOJu0YyQg1GUZBzrXYIldmmOV/GTr46cMWB4hxweuUyBc/CAJlhgKDs8
 T3248cJaDONCUcIkVHU/WjO2iS29WZa+sIyo4I4ZnAky8gTgK4+ySM/I77RiFc3D6zo=
X-Gm-Gg: AfdE7clqrQZMPSZJNwIYFN6zUyzhLS6mZ+UWdsZ6m5a/OHU30yqv5gCNm82diwLZdM7
 5mjCBEWEICohWaf6VqsoOY/DMvTGXnAK6aDfuDF7LwppF8S4g2QZHnzgx4XLhU7Ucrkg0rOBF9Q
 x4Gt2HsiTFGlWKQsvntpf/8xw9+m9xSS8z04fDTValO5CP54pmjrYEfgD2HxP9KH3pImU80eEFT
 jqCOw4cjfPJvkP2rAARhX3ALgfZvnsdIcZ1Z/N+Pf479/XLnfEUYA+kVGWfVIw8lhzIbtj1hYAf
 A5BLw+qp4PCi+o8vMmQUW0OL5gg3MXhZ5r38luYuE/9IHA6smaemSlsSb4Ut6moonyJGZ/SIhEe
 KnU1u1D0Ak17v8/MzLji1qZt8x9krD/sEvg9uawaEiGFvjCWROUdb/3qeYOJbDf4UYbCgwWR4vS
 fDeAC/pA==
X-Received: by 2002:a05:6000:4b08:b0:477:d661:79cb with SMTP id
 ffacd0b85a97d-47df079515amr12845056f8f.53.1783691533252; 
 Fri, 10 Jul 2026 06:52:13 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039bcdasm62853865f8f.21.2026.07.10.06.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:12 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:12 +0200
Message-ID: <20260710135212.760506-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703191951.3692295-1-bernd@kuhls.net>
References: <20260703191951.3692295-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691533; x=1784296333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RDwZJ8uMgpx5bbwQ1aCqqOOcQfcgAKhlOjJA3b/oTNc=;
 b=ZK8IT4zljkPjKRYiv8v7Yc5x6/tu2DYc2oVbz9wjI4Umz8Sa54ATmpM5h3sPyP36Fg
 SQJRxhVlhtQ8I1MUJaKS4OO9GXIu64nrIUOsSuNFWIaX2/V1Ps3rKpm41dAhr7udDi8d
 i/XQOFcmZ8T8whtTpLOUUSpiDVrtTA9mRevw4zinMuArvATJGdt8KW5qVBfDDTtRZBY1
 SYqu3NtjYmBcoCkpVPphTE5DxjU75O7cjuZSI20GbHm6o1hXbaps5Wn6U1OdTQujQwVe
 GQYQTPs+kyIX7Ce6aQ3KmTOHEwpImc2w3mIUvpsM9V/NhwdfFaRvihBYLEv3s92jGvnn
 52tQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZK8IT4zl
Subject: Re: [Buildroot] [PATCH 1/1] package/libevent: security bump version
 to 2.1.13
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
> https://github.com/libevent/libevent/releases/tag/release-2.1.13-stable
> 
> https://seclists.org/oss-sec/2026/q3/7
> "[None of the GHSA's list CVE id's at this time.  -alan-]"
> 
> Switched to sha256 tarball hash provided by Github, drop sha1 hash.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/67527841a8d7750f081e1de009edd75cfe5a1cf8
> 
>  package/libevent/libevent.hash | 4 ++--
>  package/libevent/libevent.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
> index 77574e784b..e047031f48 100644
> --- a/package/libevent/libevent.hash
> +++ b/package/libevent/libevent.hash
> @@ -1,4 +1,4 @@
> +# From https://github.com/libevent/libevent/releases/tag/release-2.1.13-stable
> +sha256  f7e9383b8c0baa81b687e5b5eecc01beefaf1b19b64151d95ed61647fe7a315c  libevent-2.1.13-stable.tar.gz
>  # locally computed
> -sha1  cd55656a9b5bed630b08f05495230affb7996b21  libevent-2.1.12-stable.tar.gz
> -sha256  92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb  libevent-2.1.12-stable.tar.gz
>  sha256  ff02effc9b331edcdac387d198691bfa3e575e7d244ad10cb826aa51ef085670  LICENSE
> diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
> index 355dfedcc1..cc8fb21915 100644
> --- a/package/libevent/libevent.mk
> +++ b/package/libevent/libevent.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBEVENT_VERSION = 2.1.12
> +LIBEVENT_VERSION = 2.1.13
>  LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)-stable
>  LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
>  LIBEVENT_INSTALL_STAGING = YES
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
