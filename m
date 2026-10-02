Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3A2CA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA3C481214;
	Fri,  2 Oct 2026 10:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mgozdwlycle; Fri,  2 Oct 2026 10:33:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EECA780F69
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937200;
	b=JCkwmQMoV8/hoBGm1AANQSG768WRc4oDmviKBrEzeB8ue1Y8PfWlQdTcwfn6ui6JliFk
	 8MUHejIbPnEze0H2oAr9Z0ldHkX08tXuCz4IZvBJ5Sthm6c/xVT6ZXDeaidrAmj1mWMzy
	 i7QDSx8KIUV2V+j8Ei6RJQY6hb7UYX+SdRvjw2UsGhpKIbGCvnuKEBsWHoy7EY15RYzKJ
	 qs0KbYrdVT9QVprm2vimJHvxp0Zn7GsHfYV2xRSI/drGyUft9P8ZNOdaMGQW6/cr2gTBi
	 3p0xnZECRJbay7hRNP8q4dCllSHXOXuySwsZpranOhhL9+gn15Wr0+1G7SNXRyArQTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZYRyB1tiNkJejQt3CMYFqSEJe2wE3c5t3SJNi1RWB2g=;
	b=fClHHwgvOCtEM2kOTdnUNeiC4VSY2kpT6NJ1ST7akeTBNIHK0kFFOeogBu0vwcZYuI/R
	 64LaOgZubXPoKVN7/frF8mBSOMzMF6G8Eokb4Ttx8fVxtp42dsZIOvV6gaT4Np+X7Wo8U
	 NhBi2LB/Acgvh1N0BXDmZWLrOpmiaHn0QKl6mkxQ7FzWWwdyKcKGBgyA+9e+FO5lhkyd5
	 5DygGnrwQCRQcI/dV0J+rOZdi61R6m5gizFarMNmmdE921tHs+xpRW6rUQxl7rfoLFytV
	 dHPWT/oTfAj8UL/8oChT4RFKXahWbiuptacJ9JWAD36FGTmXsXRGMx7lP0rOkR+b0eA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937200;
	bh=ZYRyB1tiNkJejQt3CMYFqSEJe2wE3c5t3SJNi1RWB2g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lXyHvabZ3quuC7eGOtoJo9oU75k5z8rJSS1Zek7PzX8TNOC/3b0AYVVOpKmR4jCxU
	 0znf0vYe1vpmjbTpmsqrOwXp+OLC+5Cd/t0TUWVYPI/tk7vLtQFr4Ky4O4XXzsGMZL
	 ++OnLJSjcBGZFA1mKhff91HNE3L4M3tp6/UDmTy3RY94plUw8hXiBQMqZCIpIVF8Zr
	 8fZkS7EivIkyr7jVqDnFnRu1Nz7lrOr3splSjYhoQgTSPWezbtevIAVd3jpTdqZmIC
	 M/Uc+EhwRHO6fMtUJ1o3/5x1J0mM68apDlE3OtorIwSIpFnM1NxFywyTTeQOCAPCe7
	 ziElC24CT2pCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EECA780F69;
	Fri,  2 Oct 2026 10:33:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D597434D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB440400B3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2SII9EN4Nhr for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:33:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 72D634004A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937197;
 b=iPuY9HLBDYCoqdxaUdBmQ+Inpjf/BlRwrCpPpPGZDcVvI10FIbF9u3fC/Pr54uOLX5dh
 4ROUwKEfPU3utJQIr5HClmBDn6TTE/ieTd5mq9ABODepvKys6j5maMoLC7rYIDR0ABzRq
 0tmvAgTTa/+OChcCUu4a9TaNtfQoI41bP3r+FDer8gh43T5lB+Mmuey+skBViQQfeeNuq
 bClQYCrqVFvcYayMOTj0bEY8wzeTmLZrmebO8n2CQ/vYW7IMBTzXSwGj4HgZtk8WxQygD
 icgCfh+FSSL17nMmMiIi1JlruhdrMNs0ci4Fve7ezAmmNfOquLdih7gyQyeljJorVIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937197;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=KeipgQ7HbWLcmweEDp0BdiFbkdhcl18BFfq4Hkbc+Mw=;
 b=teaXzu0cqJptVbR9spnF/7jWLxkAXSq8uHUGN6XQgTf3f8iSbC/rUJ1W+GCosFjNdkI4
 6V4H9ohzp+KUabj86QLUPFBRWEP1rlk1/FMCXRr7LKoZx5WKPGB+mjhEOYcfBs4CPafj9
 KPI02yNM2yTW75jYxOFsxYVwx3CAEoJGlZbK6WcJgY72sIlclx0S3ZjMw0FvwIZmMMwtf
 AejVAaiETvhuqJ3V9BuVe6/hnvt2P2ZWHERnLiQmuojSgPyfZH2mhEgoJoT1Bsf+F/Qq7
 GxqLGcb4YCODrfiSagevg3P32obrMFVPW9jwyrpTzZnUVHlZPLjrA7c4c4LFmSzs7Gw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TL1bJLso; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72D634004A
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:15 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-48b03eb33b2so996416f8f.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937193; x=1791541993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KeipgQ7HbWLcmweEDp0BdiFbkdhcl18BFfq4Hkbc+Mw=;
 b=p/rv4RWHK8+VWyETm0oGJZSXzZNOUJU8LGdOmSuH5ENOT5O8xerL5l1ioKRN2a3nUU
 p9TK+ZugVD0zx4KJiM7iyf37mXv7RSysPuWgtI2EbkTCZzWL0MrXfRweKW9QPlGLszfn
 HQvO8hpb39xYI7dkv1W4AZQeDIzeM8fskCXQCouA35oPSc8jRNz8K7gRH5xbKsFArfaJ
 jpjKvIhMqTB9sXwwB3sQhSAe2TQxJihkdxBlBi6i8xHu2/RMwfheQA+IqIRBI2LHvnMD
 fqlfcAocp7/t+GAX5mU0+HLOCn2VO8BZnSCtMaIeoAaDy6xd6f9FmU3QVihuekJjwDhf
 ceEA==
X-Gm-Message-State: AFq9FYIP1MzuaQdtGyC/Np3pWDtCbnISxtL611xB7eNs0Nmk0GltWSBn
 4GI+tnVBjw4m1xJhC4R4oA4kqBXg9ZvEo+7tVcjChdwNDowdBhYU/YfKf7zGIdr2NQrN6RHlxU9
 HCdh5Xto=
X-Gm-Gg: AYBFou1cEEnoWcj0WKcMcwjha8qTE2h/40dbqDmTkcS4wk7qLa0KYyuKkisOCFDIgaP
 XDca6i4JqemFQ6Ix+nIQnjYSdPstCQIVAew/BzY3ADn8uxlu4SgI0GsTe5v9U+vbTzWqP+e818Y
 E2rJv18Lyd3tWMIDX+JKAOAL3KfbgxD4BKITpN7UZrus+MZOzMk3KgdozASPz3s4nBjBWvovGON
 NEfIsodZCzddl/VpK/km1AsoyK4aFiZD0P77ZHSvI0RWGTfowzB2vLMbLU6fvDJkBVLIfTOVcYD
 o9Gd2Iskrc7nx4UQN5lQf7YZenpo464B3xKBOWI3bwaPxXEU1BPac/YyTAttOxLPa6gfD2FLGhm
 RUs80POWFGZPdh8ze4C6lrSwyTAyjEeQhuYk5z0dcV9daIbFPXvjGreb4xRB0POsVnVMOlHtaj6
 4Z+7mayvwAr7f/yAtslKSYD+uj/AxmwCJEQF7OWxUE3gnTNiA23ULoGPf0YKA2X0qFpJYZTLRqc
 aYajFIRptfr/Ur1hCgX+E4alSV+C5nOyePJRGj90w==
X-Received: by 2002:a05:6000:480f:b0:487:f31:857f with SMTP id
 ffacd0b85a97d-48b1273f8a1mr4135356f8f.15.1790937193172; 
 Fri, 02 Oct 2026 03:33:13 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b380fab06sm4426735f8f.20.2026.10.02.03.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:33:12 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:33:09 +0200
Message-ID: <20261002103311.77291-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925200003.3565628-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.5.11
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://news-web.php.net/php.announce/506
> https://www.php.net/ChangeLog-8.php#8.5.11
> https://github.com/php/php-src/blob/php-8.5.11/NEWS
> 
> Fixes CVE-2025-1218, CVE-2025-14181, CVE-2026-6103, CVE-2026-17545,
> CVE-2026-91765, CVE-2026-91766, CVE-2026-91767, CVE-2026-91768,
> CVE-2026-91769, CVE-2026-92842 & CVE-2026-93682.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/b2fb4c48609427e6024c97f3d805b3d0bbbfd8d5
> 
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 0b3d87fd97..0f2b6785bf 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php?source=Y
> -sha256  6a8bebaa4d5a979a38db29a9373e9851f60c6b11f72172c585947e78f3081957  php-8.5.10.tar.xz
> +sha256  d9be75c08e8c316f4c8f4194d8fbe1750a15f6a6d9d4e3fe72082abeeb800360  php-8.5.11.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index ac5730a22c..48525b7e29 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.5.10
> +PHP_VERSION = 8.5.11
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
