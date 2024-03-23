Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EABC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD40760759;
	Sat, 23 Mar 2024 20:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDIiTsICRtOF; Sat, 23 Mar 2024 20:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A57B1606DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A57B1606DB;
	Sat, 23 Mar 2024 20:29:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0551BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C9A681EA3
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wo0_sg3sCo55 for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:29:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBDEA81E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBDEA81E4A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBDEA81E4A
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:29:48 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4148090ca8aso4130795e9.1
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711225787; x=1711830587;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SRzcp1bF8CUBOPEXaaZKp2az5jUcqR1mcvSqlq1Ka+0=;
 b=RSMas74syWaOWV+2avBT0gG6u1/hKMqLeXKnAKBIIFk/uPi1/E7VZfo1uWWfuWa7/7
 TnQZFHrUccPFK47URd+CSQrGPgeeKXWoFwJYUJ/lWRqEYdCa4xnmKvO729fJ5co5HtUW
 3cq6g8NWICSL/gnLgFTzT745R3FB/unBBHo5Y50fuWQt1g5Deh16AiBzi5ijB2d6mrLs
 ZEYcmUjvMd0s1nfZgr1/H95cZj9dKZDwMEv2pQ6BLdhejCp0hNQn7o+fjPh0NHagxQYx
 RQO4J9adJ7g87wV0Vnsmj3k1g0zoZDolueMkxC6P8CJwoUeaKHrSSBmig5WLs+34BHRu
 YXEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUswTfbYRT1gF+z517poOfuxv23YkJXsqj7cKj9tfaiVpOU7ruZlWEdO53anBZZ5h1RQk5Wm2V9aZiJTY3XyL+HMhCX1pD0BA==
X-Gm-Message-State: AOJu0Yy47P367DEVCNUuE/xZmiQFvLS2ZNLNi6JAfl692bSafi9ZpF35
 MqSBPwQUdi0id+Uwm2HKWD9kIVVTw0GtcRn9eKKQnLHH3zRoR/Oinhm1XY+FZEY=
X-Google-Smtp-Source: AGHT+IGCVANP0l0yHAo0I2lO9PdRA4sZkoAYn2myv8TSNIZEDOZazHsCg7Kc/N6YzKMtguuS+DqAow==
X-Received: by 2002:a05:600c:4706:b0:414:7eab:3607 with SMTP id
 v6-20020a05600c470600b004147eab3607mr2170265wmo.2.1711225786226; 
 Sat, 23 Mar 2024 13:29:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b0041413aefeb9sm3350153wmq.48.2024.03.23.13.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Mar 2024 13:29:45 -0700 (PDT)
Message-ID: <b627f8c9-56a4-4808-b045-f0fda54d57e7@mind.be>
Date: Sat, 23 Mar 2024 21:29:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20240323160120.1276293-1-fancp2007@gmail.com>
 <20240323160120.1276293-2-fancp2007@gmail.com>
In-Reply-To: <20240323160120.1276293-2-fancp2007@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711225787; x=1711830587; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SRzcp1bF8CUBOPEXaaZKp2az5jUcqR1mcvSqlq1Ka+0=;
 b=NPi5+mWmptX0k+wj/22ZqAOjDVCjyYP2bv7dJ73meLrL1N3EYWQgF8NyLXGoCUQzKr
 /VvyBnr/libIR4hqRdvEI1iV0r/pq1bs8AjrfX/empZ0ll9AVtK692m0AYy4p2VWcol1
 0ZmIIb+kWRytKFRI0LQs0HzjFbwZ54xK/phLceiHOc+mSvxleMeK/yC9Ptb5lpJj5Y7J
 ZWB9Z49P/aqWgn7cu/C+4lGOenHCzOCpnqVzc0f+KULgzkMIX0cVKFZKJfUN3otJhyqw
 Xm37ITplHHJckFMbeylfYcUrDswOKY9If+Su84pwosB9jBQHAAzIhXOTeb6mb3rpYrnm
 rB3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NPi5+mWm
Subject: Re: [Buildroot] [PATCH 2/2] package/owfs: add missing slash after
 the OWFS_PKGDIR variable
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



On 23/03/2024 17:01, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

  Applied to master, thanks.

  It now has a double slash, but that's no problem.

  Regards,
  Arnout

> ---
>   package/owfs/owfs.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
> index 986dca921a..6b22282486 100644
> --- a/package/owfs/owfs.mk
> +++ b/package/owfs/owfs.mk
> @@ -28,7 +28,7 @@ OWFS_CONF_OPTS += \
>   	--with-fuseinclude=$(STAGING_DIR)/usr/include \
>   	--with-fuselib=$(STAGING_DIR)/usr/lib
>   define OWFS_INSTALL_FUSE_INIT_SYSV
> -	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S60owfs \
> +	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)/S60owfs \
>   		$(TARGET_DIR)/etc/init.d/S60owfs
>   endef
>   define OWFS_CREATE_MOUNTPOINT
> @@ -78,7 +78,7 @@ endif
>   OWFS_MAKE = $(MAKE) $(OWFS_EXTRA_MAKE_OPTS)
>   
>   define OWFS_INSTALL_INIT_SYSV
> -	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S55owserver \
> +	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)/S55owserver \
>   		$(TARGET_DIR)/etc/init.d/S55owserver
>   	$(OWFS_INSTALL_FUSE_INIT_SYSV)
>   endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
