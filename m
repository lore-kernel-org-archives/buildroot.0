Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18B9107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8474A60F72;
	Sat, 14 Mar 2026 07:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hraxwe1oez2f; Sat, 14 Mar 2026 07:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5115A60EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474841;
	bh=JWec0KeRl8iPUAQcx0lxguQuKd1gL817LbzQ7uD3lA8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=egxN054ZTSMSqduoK68izLXV38jQNGJit15uda4IAHXIObK2hiWXemzPpyh76YQbL
	 DHtHQOaV0Sb9KNLnw4VDZkgeYYSvZVvukoMUYbbIBPWnwp6+xIoYKXZJmaTSiWWzcD
	 CY4lyjc1iJqJWkjWodWByU7lcfCtuSB0UW/IDN4ji7hBsKBSzcpZsAZwujfFRm5i6r
	 /1jkpGacbi5VUgQMdJ4nBsrC+waRHBX7ejVjHKwycstW/vF5pq7XQWAzCAczbYCe53
	 5ErA1aZ3omdUzf/FlaHp+xDmNzKbTGXxRIH48pE9+Jjn+JaRLKLu2LKcjfndGftvvQ
	 E+/QmqgjhzGgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5115A60EF6;
	Sat, 14 Mar 2026 07:54:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93D8D1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9062C40FEC
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQ4SGhKsvXee for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88595407CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88595407CA
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88595407CA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48534237460so31922915e9.3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474836; x=1774079636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7axLCiw3yDqg8Wx5ZUpD8ivVsgimzhSovZ2urgQxpmU=;
 b=pW2xF2awmuJmayhHfkBMy1Qz7wJLzoyol6vC0N2jPRJftxlY3+OvgUU+Supp+VnklX
 NKpitCg8p0YWT0qoD7UbwB+1rwyOKTSjYrlgWklUfT8KMAdeX4P1lQsgV7lE9Gpu6IYy
 xmjHkn3LOoenFMyHERQeXtfvNU0lzsNV6NQhX1gFgcqepI5nt7yPL97zVddpTVThrbcB
 wpMJVetOBxdeaMMv9oAEU5RnHjPlkwP9DiDcBILF4kU6CpTO5Be/QWwbSnZ6f0GOA+ka
 dlH8qTIxHoJkml9/xaqHqJGm+VKxW7RJuObFecTFr4pSFOnuVDiVpiE+Ott6xkn+8Mxn
 SLCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUquQGqLTEKE1wLQtwP7BqM0GsV/M/3ejtswKuxMOSc2Df4iMBv6G7hUQUs5rLUOD3oSNYb8Sj7aBo=@buildroot.org
X-Gm-Message-State: AOJu0Yw7UMuTM946MRz5iPaFClaNm5imNALuNP3C5iQ4YCmN+VfeAALD
 ZxPB7ow0VM9q9tOU6sNLaWTpkplN9Cg9yL9e8srSue22/5yXda63a1dHDB4OFj9ujRNM1/0F5/g
 KXQKr
X-Gm-Gg: ATEYQzxavyqFZF7J/1DYfHfUIh60SCINunGlQ+RgcD9zzzqBXwhUMHtVKc6L8MRcWJP
 z+fHvLVOe1hT9v6iQlTos6bDjfIntGFKmuuUF3aHTGfgFsT+HR1TsnQcMnwO/ksK7WxRfqD7gI9
 1obPO7WHuwjgDNcwUbsHvEtxgSVP7H2zQuStRmX1p9LLETsgnSzXrW/GICvSXCS5RftfzMnFUYb
 mQzSOb3Ahngg0yaEOKftSqZIfsobIK3brzxNx31LKnrUGpmblDhp0WRCSM4mUc9M3Z9iMdjflsL
 5C/zBjegh8BPlIyAL4zH/ISN2sVE1m1sUT2Pc1HlPhA7i/DlGDY0wJJVL2GuNC3FHvjLET632We
 mR3KQmtyPTos02gsUrewKVvjEK6z8cqb99UqYfMMF/zyR89qXqSGtk632qQ5SJi88JGfUDcRcAp
 rRBvJuzy9IrwDkbOY=
X-Received: by 2002:a05:600c:4fc6:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-485566cfccfmr92492595e9.10.1773474836263; 
 Sat, 14 Mar 2026 00:53:56 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48556401521sm41688495e9.2.2026.03.14.00.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:55 -0700 (PDT)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:55 +0100
Message-ID: <20260314075355.14952-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304093057.3638503-1-aperez@igalia.com>
References: <20260304093057.3638503-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474836; x=1774079636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7axLCiw3yDqg8Wx5ZUpD8ivVsgimzhSovZ2urgQxpmU=;
 b=NTd/ncCpFnBfNtSn8GJLzwXCKt6r9kSnFV74x0zPxM7iZHnUk11EEiutzAF0Riavip
 +mNrPXFxt3/dLCunnn0yg9G5KE8A5w3arO0dh087lzE82PFmEJGsvFtCBAo+AC16A3tA
 C/g9HJ9HyRaZ0KJEO0BBkguobwarD+lzwYY6rdR19tK9+vQjhTSD7aAPxYVO7CoFHrlt
 geUOowFlxh5QyTzi8BoAWU52kqNAkySp8S9vkYSZpSCO3wPjcKmqDE1HuksPAC6bpVHt
 tuweH+Zd3+nMpLlHoNLhQuF7r5PMBuQCxITjbcgb/IYRoz349Ic/3N3uuhai0ZLmLQPW
 a3eQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NTd/ncCp
Subject: Re: [Buildroot] [PATCH] package/libsoup3: security bump to 3.6.6
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
> While there is only one CVE numebr assigned (CVE-2025-14523) for one of
> the patches included in this release, the bulk of the the changes are
> security fixes.
> 
> Release notes may be found at:
> 
>   https://gitlab.gnome.org/GNOME/libsoup/-/commit/25eac153004f777581ca2d95e31a02ca96844332
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x, 2025.11.x & 2026.02.x. Thanks

> ---
>  package/libsoup3/libsoup3.hash | 4 ++--
>  package/libsoup3/libsoup3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
> index 32aa7382fa..c0b860875c 100644
> --- a/package/libsoup3/libsoup3.hash
> +++ b/package/libsoup3/libsoup3.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.5.sha256sum
> -sha256  6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234  libsoup-3.6.5.tar.xz
> +# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.6.sha256sum
> +sha256  51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740  libsoup-3.6.6.tar.xz
>  # Locally calculated
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
> index 0db587a93a..34a9ed2741 100644
> --- a/package/libsoup3/libsoup3.mk
> +++ b/package/libsoup3/libsoup3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBSOUP3_VERSION_MAJOR = 3.6
> -LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).5
> +LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).6
>  LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
>  LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
>  LIBSOUP3_LICENSE = LGPL-2.0+
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
