Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43790CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12D0E60E8B;
	Sat, 10 Oct 2026 09:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVUFF-lDFprG; Sat, 10 Oct 2026 09:25:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0E82660E95
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624300;
	b=HvJlCXTygqnNmoki6XzBXvPq/G9A1NeU51YE5Ccnc0fTbpniPRkGkRY9kl3nkgh28uiC
	 PamFFj/N3h/VofEx2aJZRxhTk0n2yB2H/jYAXHDnf+XZhBXf9kGpLSNWpeMP4b1iGcZq4
	 bEtzkSJsbtro/LMvjxETyj4+XRCgbjIlChgBmQnf274iIWGSFwgy9UgaC3U5KkTUG3IPx
	 2HD4IkHJ47WWyjEWFceJl3JvpshcrjhVbeFltcwsUHY2KMUZIO7t3MtQCXhiLJz2O02f5
	 xdy9cf2UGGY4SInNZB+waHAvhYuKvfeqFzHQE6vko8SsAJ8CoCyMUdwzl/08ouE9TYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624300;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6MbKHHjs/E9+N6UPI5ePxuiq18Ma9EHJU+Ea/ESFN+Y=;
	b=EfYyOnfB4SD0exj/SB5stKAEDZXhvJiEHRQHl/9b11VJqz5aOdARhslecPzWbRHEHSFw
	 EMpd3o2ocFv91QHIjqjaW4u3UPGpM3iJP2uiXClAprDdl2ttCxuOjikZ2F0xX6a7dCGax
	 obBEtvAoRWiu669qiYPvZL2i4HZ71auczhCNX3qFghUsd2uKEXI3T/pkkxJImSpJJIanT
	 QEXIqaebUQ2RmJNCYiBF0pFNQx5J/yXY7596xBBwkbtNgFODXPCjgXN2n6n0hOmMcQF2e
	 8iZ32rfjCt4RAAK2RjcrXi86tcFFpTRxqQDDf6r37pyw0O63jbIASuuBLqutZulhlqA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624300;
	bh=6MbKHHjs/E9+N6UPI5ePxuiq18Ma9EHJU+Ea/ESFN+Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BRNpPt7y5NB4RGvrxFTLeQ3NIts0FQ9ia6pbzs0hWHkYs4BRUu0TO+qoKJOWhfNqV
	 lHW1ClLn16RuuLV39JdCJBIraOUxunXrstCkU14hfk5KZ/0qJjtlxVGYFrZ5XTP9Dr
	 HaB7wdCSzDCUJToPtjRq8+RB3PWuXnNSdUddWQom15P3ObULionFOsZIR5CgsIu0h7
	 JlNeauj4QqM+SFBr5nbiIFlRwohCLL+Rlp7asMNyAI0GM5KtjK1KsHgtcvvp5yAZ+M
	 IaqNomGXqFeFN6s5FrSsq9qadRoMJbMSeLX5ENakHsc0Nskh6Mfv39ybfcO9HCshvo
	 yNQeU7LzMdxzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E82660E95;
	Sat, 10 Oct 2026 09:25:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4590375
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37850400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewps8mEAQYJ3 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0887740004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624295;
 b=lH2vr2JH4j3OqYqtx0PExg/mftRrfB9CpshuMbMir/uY30NjD4px389UwmA9FhbR6PYn
 /hBuTeyjr79Yvnnf5ZO7OvaNI05ivKI6YLuQq1NHWupEmVVlPWdSgguvTfEqdQYvIszBU
 96pBW8qFy6PP4dfVmBJc84PF1yg97emFhv/D2nMr3FOCstJhpNyc6y6RD1m8IAfGRAQrc
 aM6aBnahBtd8WJgoduAGqDAfIIsZWmRKXoFy4ixff4U/UfKuEVaCKIOuCZWMPKf2839fj
 Usymc/2wJoEJq9MDEXoQbA+VLWhWKVXaP7mVOkcc+mQQHdYcPfvANI2ENSImgFjLmTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624295;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=3w85kDODQ8HqMkYxojAvgQ/RTUZDPLWJearudin7CmY=;
 b=FOt4Fy+7B9NtKZn9yVviNQrjbmkPSCkdK8cuMyO44c5jcL0VTKXr3je5VYCKu6cp4TNT
 oPUWxJ4JY1mVH0iNyqTkN6WWiHV51v02KZRideSgcG2F2U2QgfcPkaCtG6xWqZ3SLzXEU
 2owLQQlR9f4DIoUvMw3+mumbMt6RFJtdGLQ9qQYocmPc43TBbefmtXu3T7Y4XM4UUglZs
 mHhiAPQqiHPXhZOYyf3JFRiwEO6XiJyg5dsgsSwsUemgnyzeGycTjx54xa19ebin+tvH2
 Lz8ZHlsGwtIiYpPPRCT9pWrYriVyjqhjc83HX5jFzNZH+62AcheZW/8CoKEh5S46jHQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SLobIsaz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0887740004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a16c399641so5037065e9.2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624292; x=1792229092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3w85kDODQ8HqMkYxojAvgQ/RTUZDPLWJearudin7CmY=;
 b=kcahiEKHc3ZhC+2AkjUo+Pm2ZArudK3cPaW0+ikf40IBsGYTFOGFAWaePzGd3EoKap
 h5I7jYiX6LQ2lG5IyyAUKoM7t3Rh7jrNJs0MGIx5K+nVrzBdvMjckHb6yQ5sAA1Evn9q
 fu6/S1OYk/F/78EEJ069VkgPEcO5OEyFC9itCle4jSHg+Dd+uFFiArVhJR4hg/TqLDaZ
 z7cyZNTd94u/HgNAWiB6WWxViU8/4+/VsJ4OESJQXTdVKqs5K2xtp+FSHGP3aUdILa4I
 PmHHPGjDhi6+epf63jolFC4KkNRqT+u/nCdM0UeL5JpCs6K87GxRWx6DdpFS7+Qywp0m
 QB+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByBVVlP6KsAMHjS+sBmGgj/PtXwTFX1YKBrT/dqlsee0SiVfK3BnUugxcnnepVMDeEJROrLlzVdOt8=@buildroot.org
X-Gm-Message-State: AFq9FYIr0gFSoG9i2wEJRLC8s7nBoi9jsbwcl6p06f04ba7lthaDn7CR
 M8fUKenZ6QamK+w6Fwaw40RjU9NnN0bKEqvoJTnJxpud1ZMfHwKzc4go0S7HDL1QF0Wn5IR3KvI
 QCXeNYjE=
X-Gm-Gg: AYBFou33Rs9BXd1ZfVOm8kqA3+Z90GN4S6FVuGznBB6L4+OjaDIOjkxrFngh5G8e3rl
 nNBk7UX8N00k+EGPJnTtP9XxqArNsy5+xxv59QHGmPYfxdAoxXTnEoMrTLtG3yZe3fIc5dGgEKq
 7EyhNZin6ViZBPgubj+KCqsnTIWcojMVCy8Sl5wQYOvH2memCZU2YqftV0Aesx94fNmEN11/tOc
 vfEFmm8UvjfGVinldGQvhOyqK7TLtNdy9Vy0/DPRKlKfCrdemawLMbWE9ATQMdO+MO0KNNjDGkf
 vxJhMbxSHpTeoxC0GGkR4SnaNXVxOFTjmUDS7UB6YxODjpzgt1wL2BjX+ZOTJptJY0Bl2L/KZ5R
 Vq0F3tIkNR+N0mcdScGEMe+V6Uw/lor6p0hDhZHil4TvR5RFQR8pwrNl4gHhGTUZwrgoouZKxI4
 xY+HL5MX1OUOHhgNJ0a4OFL5HTNABLfCN1rytDU1wyXyuXtzoo4ONATzmeGny4dM3i7G44UCNVZ
 rLTepk7cQJVEGEwJVQkKWzmMwoY8c/Dx/rWnStlc/y/KbGsQkwsqsiI
X-Received: by 2002:a05:600c:19cf:b0:4a1:7b56:1151 with SMTP id
 5b1f17b1804b1-4a18e48f00dmr80513765e9.18.1791624292583; 
 Sat, 10 Oct 2026 02:24:52 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf214a1sm136640155e9.7.2026.10.10.02.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:51 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:24:51 +0200
Message-ID: <20261010092451.140494-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004080940.3050791-1-bernd@kuhls.net>
References: <20261004080940.3050791-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.5
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
> https://github.com/strukturag/libheif/releases/tag/v1.23.5
> 
> Fixes the following CVEs:
> 
> (CVE numbers will be added when assigned.)
> 
> CVE-2026-XXXXX (GHSA-v8qw-hwjv-44hw)
> CVE-2026-XXXXX (GHSA-qwpf-5wf7-r996)
> CVE-2026-XXXXX (GHSA-9c75-9g8r-4728)
> CVE-2026-XXXXX (GHSA-r7gr-2xm2-23wf)
> CVE-2026-XXXXX (GHSA-q492-cfcm-895h)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/188f0146e907aa08e0d9dca0bbde53c5d5cd8a97
> 
>  package/libheif/libheif.hash | 4 ++--
>  package/libheif/libheif.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index 78f59f6b67..30265f4aab 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/strukturag/libheif/releases/tag/v1.23.4
> -sha256  d0c02b4b0e978f34a1974b6f3eea7975a537bf7a9195ffeea38e7242ff316fdd  libheif-1.23.4.tar.gz
> +# From https://github.com/strukturag/libheif/releases/tag/v1.23.5
> +sha256  fd9036064c4432f0550d15072ddf34956a248279ee9aeaff0fba3fa0f77d8f1a  libheif-1.23.5.tar.gz
>  # Locally computed:
>  sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index 3428646016..cd171b9637 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHEIF_VERSION = 1.23.4
> +LIBHEIF_VERSION = 1.23.5
>  LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>  LIBHEIF_LICENSE = LGPL-3.0+
>  LIBHEIF_LICENSE_FILES = COPYING
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
