Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABD5C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D96E60E10;
	Fri, 25 Sep 2026 14:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbgrUKrBME-Y; Fri, 25 Sep 2026 14:46:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9B5AB60DE2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347569;
	b=STlLD0vkOX4NZLdwo3SZKvvZxXtWYzdSGd65v2Z5yWCa1qniO+aGRFMQ/o8NrAT/rRGe
	 OJEj0NWG6dPHhIYtzTR2zE6htkqahv6Wo0CiPfl98DRcSlpq7Ib5w110R4BXCtQoMqiPA
	 oUbqSIMByr+D3Rv5cDKC8JBqSF7lCHE+7VNbBIq/pPf5lbxxq8qLbvpt6TFW05qVOdrrJ
	 TMVRXwLWiHJLesz21NqfPliXBrEvB+tb649u4j+5mtTKHNCNUKUbJsj6Qh2KIpd+LcC9n
	 Gs7CepvGehA1Tb/Rm5Zv5O0b1E/A3YnbGecPUJLCNwAbzwTbSXzJY9SAxLgoiKzQPdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347569;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cO/feBMUBXrp24av0dIAyYUPa+nP2RRfORGRSg5GFHY=;
	b=LMGOU3+MO5Z8Lxi6UIKeFK5ROVHc9ple0weQ/ZvnUD1GmDqvwbmSnwJkjcCjyCHka3Ff
	 LGBEVKdJc+d3LfYyb5wl9a7qN3xO38WXGdJwjY0oFeRg6Z8XOU81v1EuOPA3Q4DV6kLm2
	 /fe5SGMrIBRdz33+kse0HxXVLMsV+mI58jMpVcqUYZNqIaEDrsmFkwM9VfaJQmfxF8QPZ
	 6Om/vQwUB5OcLNRyiXmWDCRwYssWHaNZDz5Drmw/sZ391hSJNHPzxqpnxW8L9SwBWRXJi
	 r6bkc4nHCcLwFXvIHTYMqpq7yT7ag51OwOy+RkJu5zKUg2pbrWIyfw9bHfgTjYEkljw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347569;
	bh=cO/feBMUBXrp24av0dIAyYUPa+nP2RRfORGRSg5GFHY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EJikB2GHnNNXDW/v5GGnEwYkWZ0P4+eT2nnaLURYeLI2FtgM9cZFoKMNkIi8TObf0
	 orlY4KJJLhvPlqM1ZZletTgGCbocBqRRMwKuC5ve4q2mNl1BqigqDrXwnDRV2RhAfk
	 BfzsFFqWqSnS+x8uxOWtyB7LnE2X2wPSCNUdzmnn/H+7JmWktS5jN6SN1+i6R0V9S9
	 yAGgfsq4wH+1bvDJgbTfzC4C/jX10gPWoKmIe3iku/HZ2VnTky4Sof/I54IM/cAJgI
	 QfRg638tOS5JP+ytINHh8GXJRPH2Y9FnAoMwScFgR4Iz1+Sr+/SnWlErEjFXyViuf2
	 1pfEXUlTajsGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B5AB60DE2;
	Fri, 25 Sep 2026 14:46:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E233332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FF5D81327
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjihXEHXNkH5 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4195481352
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347565;
 b=itxewUZ9E4n8Tb4mqrEzH75nQSvd8uZGER4s4CyBX2oqAEw8ALIevCCFMql9W/beNDEe
 sZ/GVMssaTnA2A1+iR75dEh04jxRPg8qpZVi4DRhFNmkpVL7cbTtUm3N1zAk4T8ShJb/w
 +EiMbBRMzgmns+lHnoZpGQoqTgw/uCC8RngPFvcvqFE8nx9fqdwbQ0g56D+O+PGZJb9Ta
 TT/axt4YOS28TRfgyb9SqmCNPx6lCFWkXxyd6LfNAQwHbJ+nuuaqFEcwxs0MWSPsjKpLm
 J5qtDao6eXixkSNuLScg5m8nsupkczNRQF09Y9SJR/bbJ6q6TxNNOD2p/z709xQTVeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347565;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=O0oA4EJpS4dtYXmf5XDO4pa8CrLhQKLglFqxBTzRsYw=;
 b=Ic/wml6+6BawWOzDSG9j/e7SYRniPox72B1qGVbd9CAbWWi7xVy8wJlHrqesAimu7bIR
 uuOmdKBGON2Ih9SWqaUHudNF3oTxoos9oawAQSSzqGWJ70L0LgVVw0o6TSGI4CwkQyD8X
 BkpG4ElIV4U8iWcdD7e2lfUcEM5MYCiOrEEtk+/HJ6KHuYs9nhVtCc3yB47UGhPHzY9U4
 80jRu8MIt9N13nQ52wL8yUcy2EKxq6kTFFEGNm3wzLTnTxJ9bNbTQcmPBOCCflweQu8Wu
 YqsuQkWxLdUF2FYPHDSAkKmh5V7iHhQqBhrp+/Lk/bzjqp6+DChlwaBLayzSWsZ9JBg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UprtCRpn; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4195481352
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:04 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912df756so8194365e9.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347563; x=1790952363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O0oA4EJpS4dtYXmf5XDO4pa8CrLhQKLglFqxBTzRsYw=;
 b=nyQB2ekZ8lV6dFcKgJa2gBTuLTGKRAVOnW1+c+5iJltYK4Y9Gq9j709dtdyx5Wiwk0
 X3GkUBjXwoOXqyar10DCM2CAeRS+9//pb53uSeDDOsCSq15DrnC+DFo7pgW/Qb+vmmMD
 sfmzBhkUZ4+WGOxfF3ToqudGNw5w5v3ymC3NPBX+Mm2QEscuolTNK/ryIGFFJYOC9Ehx
 x70cVArj/wXnRsCvabLlKmqp/YxSL/s6sxo1TI5pdh3JJzse+06SLjU6WfOFZYDShRkD
 FhF3+v/GO+TYCNTxme/hEfYFgFCLUYoQu+94OqLmGpMB+D9fpg63vbTSNf63fWi9wI/C
 umeQ==
X-Gm-Message-State: AFuF++mu6dq9JyOTB6B+JYwQi+qH8OcoqJkbXzv+F4lu4Y4spt5KQMu2
 TQsOdeerT+QNsoZM0nVfq1RyHGSaeUDd/RSVczhon8v5/mXEaSIr8cgBh1F8PoXKTpmit7OYIRS
 ZYlP0G0Wlnw==
X-Gm-Gg: AYBFou2sS1y2NcjaMBgV11ucHSdCbyh5s6IiKM9Lr6mVo/zVGtgd080kqWfoMIiuoGw
 Hx+yj55Pq6W7NiszwOhaUAW7e5gY1eKpAj4woI1QXiax7GBjkXjrCh8BVJMcRmi5NhTiCgOSECK
 S7c4EXhzSfyWGonKMm2+AOBN3Idcc2uHYgIEUby04Fcsok8f2z+r1iIR89QKt3UyAAf3W5fubPR
 ExjP0s9YM6eDoSAX5Tc88o7x8GrvTxKVbijW2C422T9CUK8IEX2ndGQGnisldlmlNX1jKvjQgtg
 vO2oXIZh5IicAqjMtLbcJ0uYiRtImtrk1d6d+Bvb5nyQIl/cSw78cMqeQEsz8h4xXw0fthgH+Ou
 WQi/WgKl6/ALrc5VetzhDu3KVNWpnpDU4l5BBSSLNdWw46iTYhxlkJ6B98Prwufumqak3Hi/qwF
 ITi6dnr80cr7siNO1Rpeh070TiE4TI/X/VHvK77Qgb/2moi4cONVRqLt/xuHh/UgX7bme9EsNfR
 T5gXYhccaMbyZ9EmfBGTHytZCt2RdRpNjCvzQIBEg==
X-Received: by 2002:a05:600c:468f:b0:49e:799a:8952 with SMTP id
 5b1f17b1804b1-49fe66e89e1mr112417725e9.26.1790347563068; 
 Fri, 25 Sep 2026 07:46:03 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5dff204sm230633255e9.14.2026.09.25.07.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:02 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:00 +0200
Message-ID: <20260925144601.4098649-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916183948.4069138-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: security bump version
 to 1.26.1
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
> https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-1
> 
> Fixes CVE-2026-81642, CVE-2026-81634, CVE-2026-82717, CVE-2026-77955,
> CVE-2026-78227, CVE-2026-80225, CVE-2026-82720, CVE-2026-85501 &
> CVE-2026-77860.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/1665366ca9bbdfdb6f946cea8aa8715716cab704
> 
> tests.package.test_unbound:
> https://gitlab.com/bkuhls/buildroot/-/commits/22010cc83461529031ad024e6a778233737055ed
> 
>  package/unbound/unbound.hash | 6 +++---
>  package/unbound/unbound.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> index a6bab2218a..5a0a52a7c8 100644
> --- a/package/unbound/unbound.hash
> +++ b/package/unbound/unbound.hash
> @@ -1,8 +1,8 @@
> -# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.sha256
> +# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.1.tar.gz.sha256
>  # After checking pgp signature from:
> -# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.asc
> +# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.1.tar.gz.asc
>  # with key: 231018690C4D903EF419146AA144323DEAACDF45
> -sha256  77458a7156e275c0b7b17fabcb357cb12445d95cfcb26fb9bb7d5ecba45e0b63  unbound-1.26.0.tar.gz
> +sha256  35a6dc0e425a9282c3426d9a3043144011bf0534aed4b73ab62c52aee0af1503  unbound-1.26.1.tar.gz
>  
>  # Locally calculated
>  sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> index a3a1baaa94..d6886d4a5d 100644
> --- a/package/unbound/unbound.mk
> +++ b/package/unbound/unbound.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UNBOUND_VERSION = 1.26.0
> +UNBOUND_VERSION = 1.26.1
>  UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
>  UNBOUND_INSTALL_STAGING = YES
>  UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
