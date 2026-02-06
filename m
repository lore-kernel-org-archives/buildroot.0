Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80A9EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80948612D4;
	Fri,  6 Feb 2026 08:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuY8e8FwasZ6; Fri,  6 Feb 2026 08:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF07E612A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365550;
	bh=/Ru6/L+J1iq+UK0GdUBsmZiJ1+rOsTZ1/2DPxlAyEOk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WeLAVL5SvD+OM+NqDyAlx69zqqNS5l08XGSYjzd76538vH+s2BWygjdAZgULwmxyp
	 JVhuG+xQHazdba678sxLuF47kXS/TUfSqLdoIoYGI9Rs2p+s944VCK08GLZzbkFL2s
	 EzEFY3jHRNIP9PBtIrhZPy2aRZ0d8quV1/aL2Ud+fPBZi+YXM5oYP6s3eGIviHkwt5
	 9a4Iqyp5kNWyvko9vE4Q9NeCEsZlfv7+U2udKXhsBt9v/3Mqffk7dEfq4JQqH7sG9K
	 iZaN6SkHYr85yjJcH9oub5N49i0uFtKzr6WeyS4pcgRZYJNEZM+MZSLR9JFo26VsQ8
	 yFNZ5knZpJjwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF07E612A2;
	Fri,  6 Feb 2026 08:12:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E929219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53BAF40A4A
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8TJ7GQSK3j3 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 228D940A3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 228D940A3C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 228D940A3C
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso16345045e9.2
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365530; x=1770970330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9C4lKkkOS3IOB89vX9fdlpo5RBe9RYxjJHAnW8FByz4=;
 b=gHnh0ud2Qvtm3aRqtVy8Yw78rqSpkTUJw+lWlDEvyOIZwHB5Mkhrfr/CPtO2DY4D5H
 MG95YFUDGoZZ8/rU7nKwW6IZo0/oQvmduwQOvZngMT2MH1CXzWt7s104tf+3Eq4LKtfF
 gRP7CkLjHOjf3v913M1usKrdpToZ5IkAFQ04p8vD80rgYRaePfNoKIptUAoRps1SCzaA
 K/eH1ltZzSwlmMZNFBRs0l6c2Mo6oAL9xx31SBpTo0ScazrOGtJ1IGFEjmMAtAf+nHJu
 s8LnGyjPMyyniZQWp7Bg/WXCD6ZyWDR2SzBd3RkiSdSIVGTdi2VEppHTfLvXlS3+u1S3
 wYeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB4mISFaQXvPVcOR1aDtT/hECP/gub+jrSY6zMMOJdf62mJOxFhjWLemIf7J9b2QUi7L+SWAh+pHA=@buildroot.org
X-Gm-Message-State: AOJu0YxaPAdgKq+CAsOr1wspR/cqDVO+ZPtr/H16yHJ8S6jLgRVwm112
 eamt+3IUitY68CyGX80aABo5k2IK2JQFGm+o2l5LPtZn0NepYMaGH8eJjIy7TG0aePs=
X-Gm-Gg: AZuq6aIlytl1/WX4plYRE95i0n6uijrQc/v8WktUk758MpPFv25RBfNeNidgrb/o7XO
 2bJcdXDgoqeqbS42FbQ5FADWLGORFlNNkB+Q3N6w+v61ubFkuu654tVZGnMH9lOEmzef/5VqJc9
 prNikgw0BTRpaQoqxr24EuB70/64cYkvI2E8sStzQ5QN7M78sXKA9RqdVc7a2UhWnds7uGMmYHo
 aELjyGRhsIpPNrXxbZGBvkj/Va1+sfXOj/ewMHP8QmtX9EKH0W4pcN0E5M+M8ps6Z6dtsA8ap+o
 C9KKCfc8NMLCwtuHw6IjTe/BskvMFidODJFmgAp7zjL16myBGyG5fR/Szqm/8nIsmUJseR6RV6x
 ZO0G80tgXGCKogDUTM08fPbL7JlihL1YCLS0FZHw0RcVxPBUWa6Xtkgxq9sozyxELCRq4K6nNwM
 kQ96rTZC+QL4dMfQ==
X-Received: by 2002:a05:600c:8489:b0:477:73e9:dc17 with SMTP id
 5b1f17b1804b1-48320229cdamr27639755e9.35.1770365530124; 
 Fri, 06 Feb 2026 00:12:10 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d299bfsm101960375e9.2.2026.02.06.00.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:09 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:09 +0100
Message-ID: <20260206081209.33303-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130204808.132354-1-bernd@kuhls.net>
References: <20260130204808.132354-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365530; x=1770970330; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9C4lKkkOS3IOB89vX9fdlpo5RBe9RYxjJHAnW8FByz4=;
 b=HMZePjir02Mex+T/6fHK+QFOKOBaxcEJlyvjNwfrXwDa2vcCn//PoMO5QTQqhAjk4V
 CBPTxaWJUvbod+XjJ+8m6tFJwcYTP/wovMx5x1EniSHxt/FmlowXV4ib50sJEgodnjbP
 PTnxMyFnNKowk//723KA7e1Q10gbj4HsPZePC8JmGmnt2J6NjM3U6plmO5o8VkPEEYOG
 bR7RAyIOeeIGcvuFioV8W9g24N6iPdtWYAefa8pfgtSdvR1Q/3wfT9NGfTCqPPpfrxLI
 Gzc49EzwaTYtRNzvS3bBsFFoNmiJA7eFVKrUxMAQnErlW+yvDGCA9YaETgg5X6sLfcJm
 KtjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HMZePjir
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.8.22
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
> https://forum.torproject.org/t/release-candidate-and-stable-release-0-4-8-22-and-0-4-9-4-rc/21160
> 
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.8.22/ReleaseNotes
> "o Major bugfixes (security):
>    - Avoid an out-of-bounds read error that could occur with
>      V1-formatted cells. Fixes bug 41180; bugfix on 0.4.8.1-alpha.
>      This is tracked as TROVE-2025-016."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index ea15ddefe6..eeafd49058 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.8.21.tar.gz.sha256sum
> -sha256  eaf6f5b73091b95576945eade98816ddff7cd005befe4d94718a6f766b840903  tor-0.4.8.21.tar.gz
> +# From https://dist.torproject.org/tor-0.4.8.22.tar.gz.sha256sum
> +sha256  c88620d9278a279e3d227ff60975b84aa41359211f8ecff686019923b9929332  tor-0.4.8.22.tar.gz
>  # Locally computed
>  sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 746eacd581..c0785ef2b1 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.8.21
> +TOR_VERSION = 0.4.8.22
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
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
