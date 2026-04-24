Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92925FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6589084D96;
	Fri, 24 Apr 2026 16:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a59613_cocyo; Fri, 24 Apr 2026 16:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73E3984E28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048030;
	bh=YakzKNayl7gl1Ncce/mfbEThclfZhvU8SMuttK1i38Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SymJtEVcN2dDwFp8bKHXhyztGw9pqEIghc0sfakiYlhVlGCn3t9PZcPC6tGT9olX8
	 PxDKnRwL0LkHgbbwUY1P3/V1XuP5EGByXE5tXrg2UJ/D43CKA/tvFTymStxN96aFi7
	 qP9wEAo2Ds5u0fjkTT8kWn2PEPbCRI+Hb0ErU6gFASLZeT1JQsqJxy7Nq6aPs/fABc
	 D7GPpKFYoC/Lo0ekF1L4TdJi3LvIZGNxjYjscN0OmDOE2rh2fnKDlvt20CXKqT+5lS
	 1t7BcZGwqXF20cuG9miyQDYfcuiP8hKT6QDe0oXbRA/7DhKeMZYKYNQbt0khbGvqdx
	 UfVaDGz+etzSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E3984E28;
	Fri, 24 Apr 2026 16:27:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8A0B206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F09C84E6F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkG3g-u5Ufor for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3FAF84D9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3FAF84D9A
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3FAF84D9A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so5545705f8f.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048024; x=1777652824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GxKCalkyN1tTcvzYkD6PQV0ZAGJIVRZNBhTDA7fCAnM=;
 b=hBgVO7sJS848CwDbudE3Y0SVgtlnWZjyZxtHPQgrfEKTs089+71+/2aRs4KlhDC+ul
 2ugX7eZ0lNdnOgTZ2NXehuBXkxJH8JWx7YFoeYrnw6EBozB4O3FZsafU6ixc0tMaANOx
 eGibLRepP+Gn5H1vaEn/d6zjBrHOJL+U1D9o2dD9kpWZoomeeD/+N14qG1FM+K6NBPpZ
 82VmSHVBSR8kpqXlbibUR0XfZ+ASfpX+PM4+aCa+QYm27AkmWzte/meos77mld1Epk63
 oCwE6OleMojzIEO4o2Y4BCHTLBbMlfESMUQN4W59yMZL+Wty8sDVLNdwjAjQwxHaLYFA
 mKzg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8QiRoM42Yq9AaJBsxmd5vqTAspVNEfgFkdEPGA4M7HR7lye7LS0mu0RkQHiA3iBUHwOU6WyBjBTUA=@buildroot.org
X-Gm-Message-State: AOJu0YwaRKZ0Zv3GlerVN26pmaagUxmMj5xlcoO6Jj5JfOIxs2cx0Od9
 Rw7YtXHN7vHfT6UolwIgeWwZMKDQ5nQfbf0A3nnfwOT+j3QCXYWxQrIG5kZN0XdgmJo=
X-Gm-Gg: AeBDievgOoS2L/Mo044dSYbfTvYwlQyVGIyUmtKgC2MXQGnLuC6CqmKFpM5Rzd2d/o6
 miSm5Le5N1vDbAvwhKAygR6wAH/9khljYAW0mIxYaZzeqVcIw89zfZA6A1QVvtSorXv6Fa0Cs+y
 evZb0OndZMIL7nKLGBx0cVjqVzNIC4OQQyE1TSYV7kVA+cp+frcMH255ZvRi32buT0qlIOZdgxX
 684riWSQAVGrsBf5JgH8AZA6v7+jkVgtdooji3N0Wa9rM8L0Taf+4WGvyRArUY+PgVFUHrUYHkc
 2wS9Zn2lgeGzsjanRgeIdZIizgBRkTrL52X0KW7Th/LGXgNIqAHlaerq2A4GzQ0ZaUNymLI/V9/
 NVfuDQtOnEcHb1JBshCUkmO5Vfs7NMwqfgtKMqNSIuyi65VOW+/PZftgDFOQrV+LJat/4OGd3GC
 eqJWkBf6AIlMLnF0otMu15u2LK0w==
X-Received: by 2002:a05:6000:290c:b0:43d:772d:2b61 with SMTP id
 ffacd0b85a97d-43fe4073831mr48472436f8f.15.1777048023803; 
 Fri, 24 Apr 2026 09:27:03 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a341sm66471866f8f.24.2026.04.24.09.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:02 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:02 +0200
Message-ID: <20260424162702.161430-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420095823.2561132-1-titouan.christophe@mind.be>
References: <20260420095823.2561132-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048024; x=1777652824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GxKCalkyN1tTcvzYkD6PQV0ZAGJIVRZNBhTDA7fCAnM=;
 b=P997R553/EiX8yI+DKnJ9kbkPJaUT3qgCHDT8Q9hNiI88i2rk9JgYcMUpguSS/pbL0
 oqfZeRK0X0m92x6Z9cZVtg4tPT01Tdm7kTrqocPWbvt+cOa2BYoKB7te6pK8ieFHeqb0
 BIetj036kgEUFb1ej9lDWNuBINTe5nWUqs034Xs/11N8VJ91V2D4X5MNsht7UK6plSWM
 8x3cRt0tESX7V/IJqQFLAk7Cii1WIsOcRHlPkOAhNaawlKKMreJiYLZoSU6RoXVndMUs
 5X7uYB4Co3QRO1KR5I86Y7Jn/4gducSnLf6KIEaHmVKOOeG7/1sCLpt6VVWRTNKFogE3
 uz5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P997R553
Subject: Re: [Buildroot] [PATCH] package/systemd: security bump to v258.7
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
> This fixes the following vulnerabilities:
> 
> - CVE-2026-29111:
>     systemd, a system and service manager, (as PID 1) hits an assert and
>     freezes execution when an unprivileged IPC API call is made with
>     spurious data. On version v249 and older the effect is not an assert,
>     but stack overwriting, with the attacker controlled content. From
>     version v250 and newer this is not possible as the safety check causes
>     an assert instead. This IPC call was added in v239, so versions older
>     than that are not affected. Versions 260-rc1, 259.2, 258.5, and 257.11
>     contain patches. No known workarounds are available.
>     https://www.cve.org/CVERecord?id=CVE-2026-29111
> 
> - CVE-2026-40226:
>     In nspawn in systemd 233 through 259 before 260, an escape-to-host
>     action can occur via a crafted optional config file.
>     https://www.cve.org/CVERecord?id=CVE-2026-40226
>     https://github.com/systemd/systemd/security/advisories/GHSA-9mj4-rrc3-gjcx
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.02.x. Thanks

> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index d5a97ffcbd..e96d3ba7ad 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  5c95e54e555b21594ab11e76f91a092c6383553ed725292eb0a929bf2fe028ae  systemd-258.4.tar.gz
> +sha256  6bd311c25f00d634ae3b4544d582e27df0d4166e6ba3d403b18b3129d7f44cae  systemd-258.7.tar.gz
>  sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
>  sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
>  sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 4b488857fd..9ce4f8fef2 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 258.4
> +SYSTEMD_VERSION = 258.7
>  SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>  	LGPL-2.1+, \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
