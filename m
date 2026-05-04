Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939F6FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64FE141B9A;
	Mon,  4 May 2026 14:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFiRBf_tyJ-U; Mon,  4 May 2026 14:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D4DA41BA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906039;
	bh=7RBhQ+v+lDpVo1WSLGWj163aFh3CqyoNmwHdK7xeSvY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KHXabxJGy2VOL3m5uxfX192D/rIzqW4e1VONPkwTY1RdrR+lI+/mEvgWpDDBZJlqJ
	 S+UX8I4lAx/4LlwQviUqTUDmn0LUVighHrfNSIFZENT+4xBg2GAMeDDw1JtFkdmPIi
	 MpMRN54s82BP0HBfWxNJy1xYrkus36LzSsyygndQwQTwSCfu1FXj7sz2yX9SETlt3T
	 uOTQgGkz9kT9TzvrHTlSli1NiWnXnKw66zDXZ4bqd3Ew0JtdveOpLz11SGmvhyeJDp
	 GObJSnGlW6JWain9ygibVohHWEctDGxFWGa+TIFq11PIBlG++smDn6PzZrY8njJgFv
	 H7Zi6q3UwqqiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D4DA41BA5;
	Mon,  4 May 2026 14:47:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25F60190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21E5D61503
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LXjQb67yU-T for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1441A61515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1441A61515
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1441A61515
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:13 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4891f625344so44354355e9.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906032; x=1778510832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=75rkPQ1ESaODPVzDSidlG0PBcafIBBr4rZ5+19zeFr4=;
 b=HXVHMtdKHSXFyqcwd0I3Nv02khWk3Uk2TnC/uCkAw8pYpK1mvrEBgBk75B4b6JZ9Xc
 XS1UOxPMmUI7VDk7xCvUcgoBehvRE4P2xQqdi/5YUynEtWI9ro6LGY98clcI0mxfnRr2
 mUN5rqNnuUj45kUd/Z1ApO1LUB0iggLH2TePioI/ShiXlFRnLVF4ITgc9LvdOFIgciQd
 E6Bzb9tvHW0BEzQRfJplM/gaL+Li/SEqNCaoganiu73R4152dFDDM0Sleg+NpS0Q8PVW
 MG17Mw45nlAEMypLqPHJKgKpYHyikjvlBc6H5BRL679Hd7IkOw40arbLNSG+zVOEtC/7
 lPDA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+yP5Ab//UNDzreUMXWmnEEbpdTllpNpksRZEhdoKTeeIs5QunOzZZnhyAXvdRp/W+STgFT3ZZgNPc=@buildroot.org
X-Gm-Message-State: AOJu0YxuF6+BHRdfVfX/o27kHfFawYlX0UFUjfylmncPb8KF+KDkz9xQ
 QX0GBObzhu0Brx3uaUy/z1RnU3mZh61o4oIza2BzSOnfvVuobpb3LHPUUCfaV8JZiAozoHBv+ZY
 NRJsl
X-Gm-Gg: AeBDiesBUjWpqtNGsN8TtNUlNyTs49LoGBWNz+FO4Q+T6GgpVzoKKD9s3zi31rSqJUD
 1qc8JlQJbHtTXNKqgS0MZpUNS7ra5BYHlugPvm8X0kmJJFZGXUlmdFg+tU6rQyUKOpDDUV19i8F
 ALvrdKuzernppi3yav2lQ+Qyxj851hwWH2L27fPz3fESnhe9x+58F6HpmnAlrHMNuxDsNqxLJgF
 yOSY4GOCgLi/GMgLGyJQ9FYhyWhrmgybpYLOmEThotYTbvX5oI4oi6GokxZ3mi6XPsCec0+8bzh
 K5PZkDEpZp5RjMieGCNqc2q6G5IHfCU2iGakd0y0HZNEZArabUpcx9pLjeDVlISrM8WzJ5gsosu
 a30Pftz+0DI6qPPbl3TQlqXCLg2GMvPSaSypTPP9GZ2NuaK/Ma/claiySGEgKwqZ4LOXNgWpmJz
 HcrqnpcESwPawerFwvRd8TJAXpDs1rGJylATOB
X-Received: by 2002:a05:600c:4f13:b0:486:faa8:9e4 with SMTP id
 5b1f17b1804b1-48a970fda7bmr171190995e9.12.1777906031989; 
 Mon, 04 May 2026 07:47:11 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fede418sm102482925e9.6.2026.05.04.07.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:11 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:10 +0200
Message-ID: <20260504144710.8882-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260211143236.4018275-2-buildroot@heine.tech>
References: <20260211143236.4018275-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906032; x=1778510832; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75rkPQ1ESaODPVzDSidlG0PBcafIBBr4rZ5+19zeFr4=;
 b=IJbb0S/v3Uy4xbP5F5oMB/2r48ECEx0j1YTzWuYISaqxbywzIZDMU2sMhnSHv6XOpx
 O56tYS03TiwyGE87sc9VIUwouCXwT7hFGq55/OwTsGof1AJwGiE2z4UZHA1Ze5befcQH
 ckqViqifePm+JFgMzo8ZR0cyuGgueB+uqEc6tUaaO/8vCstMihH8MiuHgI5WJY6GfNX3
 utzA7Je1eNoT7bqHEtM4xCt4WT6QRetF98NpVXNIiqfbg52uPDCyoaoVyZnS3OKeMCaE
 h4Eb5tRJ+9u12VLEvTW7Q2NGHQbOvZcvl+g1m/k2vSm7nepDk+FifB1fsoShbzsVWPMU
 NDTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IJbb0S/v
Subject: Re: [Buildroot] [PATCH v2] package/log4cxx: fix ENABLE_ESMTP flag
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
> commit cf686670b99ae0388b27867db64516c09b2de91f introduced a patch that
> was later included in a release which made the usage of libesmtp
> configurable. Later the switch was moved to the main CMakeLists.mk [0].
> 
> while the patch introduced the build flag LOG4CXX_ENABLE_ESMTP the
> change to the .mk file used LOG4CXX_ENABLE_LIBESMTP.
> 
> So correct this.
> 
> Fixes:
> CMake Warning:
>   Manually-specified variables were not used by the project:
>   LOG4CXX_ENABLE_LIBESMTP
> 
> [0] https://github.com/apache/logging-log4cxx/blob/rel/v1.3.1/CMakeLists.txt#L93
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 

Applied to 2025.02.x. Thanks

> ---
> 
> V2:
> - use correct param name in commit message
> - add reference to current CMakeLists.mk
> ---
>  package/log4cxx/log4cxx.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
> index f4fb3854f3..57f9b1e844 100644
> --- a/package/log4cxx/log4cxx.mk
> +++ b/package/log4cxx/log4cxx.mk
> @@ -23,10 +23,10 @@ LOG4CXX_DEPENDENCIES += boost
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBESMTP),y)
> -LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=ON
> +LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ESMTP=ON
>  LOG4CXX_DEPENDENCIES += libesmtp
>  else
> -LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=OFF
> +LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ESMTP=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_UNIXODBC),y)
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
