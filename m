Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85187CF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B5A240480;
	Wed,  2 Oct 2024 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jQTBH4BMBi1; Wed,  2 Oct 2024 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0751F409C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0751F409C4;
	Wed,  2 Oct 2024 20:58:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC8B1BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BA04410BA
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3Lv12WINs-A for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 238FD40D93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238FD40D93
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 238FD40D93
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:58:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42cd74c0d16so1645175e9.1
 for <buildroot@buildroot.org>; Wed, 02 Oct 2024 13:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727902725; x=1728507525;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eQd1iN6R1GUFPm58OXORfc1yO7c9dF9eBYMDY6PDQIo=;
 b=QIY3vRmSTKirICAzBwJhzt0/ao2qJ/pu5yuNXb30QcXfJZzQqGFowfkl3FwZyBzRxB
 D6qSFd5nT/nKYYb/BncZ3AXRz+EVsOhR/sWVRXEA78CPMR9i9NcA8hX72AnjAAKcxwqh
 INaGyl/sr8fhxPCGQvI82QIKbPaF8QdySWgzES0d9Fi8ub1TYNt4MGkYRTd+K2MWvSus
 P2B6mAkJmMxy5Ib2wmf6jOwYLXBNS9F9iMlT0HWArHkbzmMB6wUu8o5VaOgIwpETiQN8
 Lyi2wzFCNeHtIvmNrsSzfF+Rqd+NoBtpAcqP+t/JmOha4c3VRkbg21lP14RBgay6QYwv
 1ARw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE72/rSS3pnbVwxrFiOSk92nI9m3y872se3PzHZV+gf7TY/O75FU7tNpBNblc5Zk6xDUgG1GVrRFk=@buildroot.org
X-Gm-Message-State: AOJu0YxgjWDmFjWIuFO3/hk5im/EQoPTUEwl1BVdA9LonSl2P4QCusUE
 uCCcOxI7HBcxST1gdi3nyEkvLWHBli4jk+vEDiT/QKO6ZV4pOBQHIy9LTH+NxW0=
X-Google-Smtp-Source: AGHT+IEdEKzzwC7AAAvL9uxEZzL7xrlySMS5+kVIJCM8S+8Y5HmW2n0cmv16gwAnzJuIxUP9fS2kXA==
X-Received: by 2002:a05:600c:1ca0:b0:42c:b180:d452 with SMTP id
 5b1f17b1804b1-42f777c31b1mr31051075e9.19.1727902724803; 
 Wed, 02 Oct 2024 13:58:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f7a02eb07sm28115105e9.41.2024.10.02.13.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 13:58:43 -0700 (PDT)
Message-ID: <a4ea9e57-79f3-4093-86b7-9e75e78646fc@mind.be>
Date: Wed, 2 Oct 2024 22:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240904142509.3295502-1-adam.duskett@amarulasolutions.com>
 <20240904142509.3295502-4-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240904142509.3295502-4-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727902725; x=1728507525; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eQd1iN6R1GUFPm58OXORfc1yO7c9dF9eBYMDY6PDQIo=;
 b=QccBJlCUWpiuLIKALSRYYkBCMHrt7PuBf7ZMkiW5Bp7trKIBDc2txlfFfjbwuQUNHq
 VGlhsNzTbyfeeuzkvN0WgbiKpgm+Fz7z8xGDLglKyKs+TzbPu23STVV61+uDVUA9AuQS
 xD01S8/odtCOEbHYy+bFDQckjlu6NDcThAxu0XbegpRxysn+nyx3on4e7VFnObEsMHO5
 olC6tN/vpkauM4dtgW8fWkxR5ZL263ovDF0epVEUTfYVx39NwlTqwEIb8Cm5xnes4dY7
 lp7A6kwQM+KY/wzVRT+kFurzkDRQS0mSG58DxHb5ieHF17hzKcRtYS111lFfWWIrrLfA
 7leA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QccBJlCU
Subject: Re: [Buildroot] [PATCH v2 4/5] package/mender-artifact: bump
 version to 3.11.2
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@paral.in>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/09/2024 16:25, Adam Duskett wrote:
> mender-artifact now explicitly depends on host-openssl and uses host-pkgconf
> to find the correct libraries.
> 
> Use the same variables as defined in HOST_MAKE_ENV (in package/Makefile.in) for
> HOST_MENDER_ARTIFACT_GO_ENV.

[snip]

> +HOST_MENDER_ARTIFACT_GO_ENV += \
> +	PATH=$(BR_PATH) \
> +	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> +	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> +	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> +	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig" \
> +	PKG_CONFIG_PATH="$(HOST_DIR)/lib/pkgconfig" \
> +	PKG_CONFIG_SYSROOT_DIR="/"

  Perhaps this should be done in the infra? This is relevant for all host go 
packages, right?

  Cc Christian, what do you think?

  Anyway, for now, applied to master, thanks. The rest of the series as well.

  Regards,
  Arnout

>   
>   HOST_MENDER_ARTIFACT_LDFLAGS = -X github.com/mendersoftware/mender-artifact/cli.Version=$(HOST_MENDER_ARTIFACT_VERSION)
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
