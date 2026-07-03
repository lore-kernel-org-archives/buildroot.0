Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ECEC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF5941332;
	Fri,  3 Jul 2026 14:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvNv-1LteUcS; Fri,  3 Jul 2026 14:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 230A2412D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089181;
	bh=FQkDMykQtKK9sWkhxJMKM2P19Ecwm50JZgi9chHi930=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lDRckP+4FzfxJQB3lUP77Ym2AAXRm0ykB7em7tkrH7tgalFQMW3PBat2mWkOj8lag
	 NO6dTSEHN6MsXersHe8liC6cbx28Er1pDGyBwHVnUNle14Fmw0ZlQDNPCTIqP0iKuV
	 CZDS88GAag309sndV5p4azZU6/RrTvIF/OTsj13WskTCfTxD07NklEdoHGguZha4Al
	 Wdy1N/89Y1IzwYHGhUw6M15/FqyK5ICZIi0/D5stfCWTjPROdnEaq3LTQGCDOo7BZn
	 sqrpNUDxllwH8DSf5lkqj3YxU8TIO6HJWI6aBSQPLvMTVIjjcYIs3OTKUcLTwjATVd
	 jz1ujPTuCOdEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 230A2412D8;
	Fri,  3 Jul 2026 14:33:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09AE014F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 076F960EDE
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPmPVDo7hXe1 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E67E060EDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67E060EDB
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E67E060EDB
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so17006525e9.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089176; x=1783693976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fNDzk46d+sR5FIDwil9AXA+sV7yMFRNbDQ91oof8Pfk=;
 b=pQkHPKzhNUIKU/5M+gxXjkjx8rUVMZOu0HXGwAMyewNwTSeh9Dvh3SV7blfnp/6Fl2
 vJ0YbHcxPJrzxIySmL/zDfCs+C9YZ4phOHVne6hwaCqzcichbf6LNNcUhl9kYyUq55f4
 15NxUN2eQB1st4amM0zqwsE/w2YPqb6sO5Mpfxz0WkY1JLqVztCB8lCSsYACMWJFh4zS
 KzWJf0f2n6hAt38RzdcIzw/Ne7D4fVUQpnFoMe5u5IBH45hCKAl2kpXPSuySc0qrdGrn
 4VcY8EPVXBNefuPnq+ve89H8do27x1lk7R3zunsFN2cklbcpzmcFivHUWArTC7dDSkni
 1BlA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+DBrm24ps4gt7dB4SJKWFfmAb5kEa7YSm6PEChBzBWE5yw2BsLPBvf3dmtBXu33gWItOYRoMfLBCM=@buildroot.org
X-Gm-Message-State: AOJu0YwWlu0m7nbwUYDQFvpmV9fkeP79PKxx2J9Kzdx0TdCsA0uHAQRa
 xhrv7nMGr7GCKaopdbAsNe8N6W5OQjO+SRWzE2NADfsB4WlPZWIM/Ft/eppXTFNtDf9XJ7fe0zT
 K9evN
X-Gm-Gg: AfdE7cmCqyk9+eBnml2P8L5B8j67ucOnunM0WP1NxAx+Hp64kesbala3uzjWDqAENO6
 O8axEG8w+aqjmQBPGYBG4HFYXZQI9Qg+FCXDYz3mCw5kRhiNk/0VQIJV2rpWWQ8Lap65Jl6B/wD
 S1T9HbUObuEx0mNeGKelnxoVp3srrzjWfuYRCVbuBLb9QBpBcmb1Cwb3CnYhL5pRWq1XK9YRQhz
 KGPghVjNt+yvZnumT58raSGY1A39VqBwZWtf1FQ5m6rIVSfC8MEpQO7sNJZnBHjrVybUqfZjQ7t
 V+p+A+pXmfs0F0j95CCHuK2lnszBHBPnh4+VlJQL4zlx+cuHJ0RSGEF45wJlmhiv0YNYZUuOSPk
 mm2a8sc7lR0W03yQcqkEzxxEHguHsesqOaf1rAMq8/YrDuceWa9C7GaYOOGt+aVYsJBHoEKYIq/
 Jg0icFaOaX4faUsV8=
X-Received: by 2002:a05:600c:34ca:b0:490:b26c:64ad with SMTP id
 5b1f17b1804b1-493c9b4d759mr50868845e9.5.1783089175745; 
 Fri, 03 Jul 2026 07:32:55 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cfb6f199sm28348645e9.3.2026.07.03.07.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:54 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:54 +0200
Message-ID: <20260703143254.275251-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260620070414.86981-1-bernd@kuhls.net>
References: <20260620070414.86981-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089176; x=1783693976; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fNDzk46d+sR5FIDwil9AXA+sV7yMFRNbDQ91oof8Pfk=;
 b=SbeLj3LL2rwIXICWNuviBqxQSkgLDbIk3YsGySWxdTyeBfYGno+N8VqPhQnq4gg8Sc
 M2NC4fL9K/DZRQaiXJYt6BYGrGAjztF8CFN+qn8Nmp/iZnJAbnyRC6M+cNoenDYxvl9Y
 KDqOqhpy7gFI5LYsZhsh14YAXOGqXTJHoleXEOHbQtks9H9rYxGfP0VVc9CUmsbA7pJr
 lxdDnkQFr8cDVzMvB2EprfpSE8H1FQoAQU5fa+598/DNjzXGmVpZsPBVZAPmPYtymOxi
 BKZcsezxeF8vWxag12Qxu7sTAxVd2pdAEjUrni39ixXsI8Tzqy6eAW6A+BNU6+/ZfSXc
 DDyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SbeLj3LL
Subject: Re: [Buildroot] [PATCH 1/1] package/cpp-httplib: security bump
 version to 0.48.0
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
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.48.0
> - this bump includes a security fix for the Mbed TLS and wolfSSL
>   backends which are unused by buildroot
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.47.0
> - this bump includes a security fix for the Mbed TLS and wolfSSL
>   backends which are unused by buildroot
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.1
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.0
> - this bump includes a security fix
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.1
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.0
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.44.0
> - fixes CVE-2026-45372 & CVE-2026-46527
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.4
> - fixes CVE-2026-45352
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.3
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.2
> 
> https://github.com/yhirose/cpp-httplib/compare/v0.43.1...v0.48.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/8fcef356cfff282f19aea18a7ef8f1c214bcefc1
> 
>  package/cpp-httplib/cpp-httplib.hash | 2 +-
>  package/cpp-httplib/cpp-httplib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
> index f3e05951e9..842b96f3eb 100644
> --- a/package/cpp-httplib/cpp-httplib.hash
> +++ b/package/cpp-httplib/cpp-httplib.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  000832a5b50b67b82a77845c09d832f6e492011cd0ef1d4f72f808eb6a4fbeb3  cpp-httplib-0.43.1.tar.gz
> +sha256  d9ed142d319c6e19a961f477257e67f846909ce15288502188df2281941be84e  cpp-httplib-0.48.0.tar.gz
>  sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
> diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
> index e8bc0a56fe..94f270df94 100644
> --- a/package/cpp-httplib/cpp-httplib.mk
> +++ b/package/cpp-httplib/cpp-httplib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CPP_HTTPLIB_VERSION = 0.43.1
> +CPP_HTTPLIB_VERSION = 0.48.0
>  CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
>  CPP_HTTPLIB_LICENSE = MIT
>  CPP_HTTPLIB_LICENSE_FILES = LICENSE
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
