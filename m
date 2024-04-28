Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D27C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 106D360686;
	Sun, 28 Apr 2024 18:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0481i46n9to; Sun, 28 Apr 2024 18:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23FD360633
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23FD360633;
	Sun, 28 Apr 2024 18:12:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB36A1BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E02A40318
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1-S1oSLJHWn for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:12:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BE1C40304
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BE1C40304
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BE1C40304
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:12:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4196c62bb4eso29182945e9.2
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714327937; x=1714932737;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=568hY82jbMpT2OG2BiplJ9fp0xPMGszapBjNzoceatU=;
 b=dTDI21oyxg1WA4mHih9t123wVQ13s0+V/dYXU1dTgO4uV4+uRVdZ58ueU4eI5uqXAg
 R6RK2NDSgqDx7MhOIWVEkJBOS1apNG4VTySQMN5mlo1lNPbflOPN5ctrb/xNcBfy+bpW
 X3t0jjsl+rFA7p0y/OTajhPsStTnUvXIc06jVBaMoRHtZdxL0be0DOMHUQYZ+NCQlcMs
 lvhhY9NSIl7gYCYLT24SfYbMPp5XO77+kyIXovgWMUw40QZ6yIvsdv4DXQNokbq1eX/o
 v9Y1OW0fTnCpc4m53rqW/9bc2iQWgETOqk6iUkwPGwV2+SnvbJ7iMy7tA+/RyTguk01a
 rIXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgZApjzwRnyAxPTWh3ZMyVHybNxP9/VmJR2m9WHSFR8BluGm2TpFNfiXAlFpDYvp1CYJEQXXGHp8cVkiY6KG73kDXWCtF9IA==
X-Gm-Message-State: AOJu0YygOpSpgyoJJV3k8Sjeemw9nxehK96pZEuCPqVm5PrKA3q4fFr7
 rT7NRGYpU0G3gb7FMPacnWZLowTeZFL35JihgDLdkxCEgPt+cYHJCzxkT+fgRemB+hVy9BIPI9Y
 l
X-Google-Smtp-Source: AGHT+IEsCnBNnHW93cGkCYIhX3+Aall67kAE9O9iveLEdFMNYYHGd5lkuLaEd/NB9UlzIvL9XcM/sA==
X-Received: by 2002:a05:600c:3548:b0:41b:bb90:4b9 with SMTP id
 i8-20020a05600c354800b0041bbb9004b9mr4214380wmq.4.1714327936920; 
 Sun, 28 Apr 2024 11:12:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b0041902ebc87esm35378206wmq.35.2024.04.28.11.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 11:12:16 -0700 (PDT)
Message-ID: <92d508a4-ce55-4eb2-a7cd-2a64729ce20c@mind.be>
Date: Sun, 28 Apr 2024 20:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZhuKWDZALDt+xUcI@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <ZhuKWDZALDt+xUcI@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714327937; x=1714932737; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=568hY82jbMpT2OG2BiplJ9fp0xPMGszapBjNzoceatU=;
 b=EqwkLCYoxfLC21fC+WtiwiCJTeo5HyiTRFX6GWcWAkr9wqQVCI+YBDOVXDg2n2Lfm+
 6JOEaadsIQMcvfOdgO4kCKpeNEwO56m8joKZhLpNzZAbD3al7EB5DmIUnr9PKKtW9H9n
 TE08wak7Jw4A2WxEeu/fnr2JFpouu/PS5ruhy/YlpBpdG+4SYMNXdnDp8WVm7pn1ruDj
 p2T9wES9CYjr1xNr6x0jiKAA+4Fy1fsJDAAR01of7jFKyJqkb4LuCtJGGZ598hOv7c87
 JOAoAxotuj+bgy3vKIZxnyQ5aCxGT3K8iiv5X5nnqMA4REYt0mZNH4zuQY7ybvSTX2tj
 SIAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EqwkLCYo
Subject: Re: [Buildroot] [PATCH] package/asterisk: bump to 20.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2024 09:48, Waldemar Brodkorb wrote:
> See here for changes:
> https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-20-current.md
> 
> There is still an open issue reported upstream:
> https://github.com/asterisk/asterisk/issues/671
> 
> But it seems it is not reproducible by the asterisk developers, so
> update the package so others can make use of it.
> 
> Use the external pjsip package, instead of the bundled one.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/asterisk/Config.in     |  2 ++
>   package/asterisk/asterisk.hash |  2 +-
>   package/asterisk/asterisk.mk   | 11 +++++++----
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
> index c52456f8fc..ba5a574042 100644
> --- a/package/asterisk/Config.in
> +++ b/package/asterisk/Config.in
> @@ -10,6 +10,8 @@ config BR2_PACKAGE_ASTERISK
>   	select BR2_PACKAGE_LIBCURL
>   	select BR2_PACKAGE_LIBEDIT
>   	select BR2_PACKAGE_LIBILBC
> +	select BR2_PACKAGE_LIBJWT
> +	select BR2_PACKAGE_LIBPJSIP
>   	select BR2_PACKAGE_LIBXML2
>   	select BR2_PACKAGE_SQLITE
>   	select BR2_PACKAGE_UTIL_LINUX
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index 246f4219aa..8cb5468249 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  9def260ac8745a5eac7aceabe1c22f84a283b7812f0eccd760f87ce9eb991d22  asterisk-20.5.2.tar.gz
> +sha256  62adff44f5bc415627e16957e6bd528e1782a892e116ff261c46f96ca87c342b  asterisk-20.7.0.tar.gz
>   
>   # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
>   # sha256 locally computed
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index d1f3ea82d3..33d2e78bcf 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ASTERISK_VERSION = 20.5.2
> +ASTERISK_VERSION = 20.7.0
>   # Use the github mirror: it's an official mirror maintained by Digium, and
>   # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>   ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
> @@ -27,7 +27,7 @@ ASTERISK_SELINUX_MODULES = asterisk
>   
>   # For patches 0002 and 0003
>   ASTERISK_AUTORECONF = YES
> -ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson
> +ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson -Ithird-party/libjwt
>   
>   ASTERISK_DEPENDENCIES = \
>   	host-asterisk \
> @@ -35,6 +35,8 @@ ASTERISK_DEPENDENCIES = \
>   	jansson \
>   	libcurl \
>   	libedit \
> +	libjwt \
> +	libpjsip \
>   	libxml2 \
>   	sqlite \
>   	util-linux
> @@ -89,10 +91,11 @@ ASTERISK_CONF_OPTS = \
>   	--with-jansson \
>   	--with-libcurl \
>   	--with-ilbc \
> +	--with-libjwt="$(STAGING_DIR)/usr" \
>   	--with-libxml2 \
>   	--with-libedit="$(STAGING_DIR)/usr" \
> -	--with-pjproject \
> -	--with-pjproject-bundled \
> +	--without-pjproject-bundled \
> +	--with-pjproject="$(STAGING_DIR)/usr" \
>   	--with-sqlite3="$(STAGING_DIR)/usr" \
>   	--with-sounds-cache=$(ASTERISK_DL_DIR)
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
