Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083A4C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 651704064E;
	Sun, 24 Mar 2024 14:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVjCvywS33wg; Sun, 24 Mar 2024 14:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0BE440639
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0BE440639;
	Sun, 24 Mar 2024 14:57:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07DBB1BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA2E781DF4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0qBp5pEBLih for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0709781D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0709781D72
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0709781D72
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:57:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34175878e30so2501152f8f.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292250; x=1711897050;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UKW8Wxxnd1PSbblLYc+JOfxqfA+Zgamx//IN+aezjXE=;
 b=WbeFiGrUL8DJbMKd9+VEPMM+M03yKTzWkImERZKW5Yn/HMvxe28nxbr93TMOeqG0W/
 E8QFGmHXy4cumcBHidHwz62HwkbMc+rkLSzODgYS6tv3AZL31aXBU2IrWPLuVD+zXSKn
 sPQRMdu/LXTqOLPYbH0rVoXZhO/uA26ALKmAAry01yQHIuhLqM4c5cpubwK9JXlANV/c
 IwngyOse0WpJNr7ElcIqZi/VOh+VVoHIT1NmjOu6Js7l4+eN45kigY50e02DexVt90nw
 Z/S+QPeGwLgBNQS4uWR+TvPFeytP611BLVmN4yf7lpc3GigsLvNMXWQ+DqJGMa01wnIP
 593A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/gfzgaa13uRAwaUs2YzP0O2PpSJ8yzg5yF17Ih+S6ov4JZ59VvaFrJYs9EmQuWhgx8AQw7K/rXdpgN9MZFa0Csln6XjPDow==
X-Gm-Message-State: AOJu0Yze4UTpUwWsL32jolPwWFt4xQI1wMCku0bzrYBMBmhXIzWyZOtC
 mabBUv3CLsHETBiE0MbyHCWEhpo/9D7nkruriyIRwCDHsfzjUtmLiJQQd7Auu5Ed4RBZiQSEcyZ
 /
X-Google-Smtp-Source: AGHT+IGloLA/J6PwZHKJag2E/8hnP7idL5KncWtaWTiAYh5odXlK01D1ypNVzK4rXHiPLwu63bq6VQ==
X-Received: by 2002:a05:6000:12:b0:33e:1ee1:ef92 with SMTP id
 h18-20020a056000001200b0033e1ee1ef92mr3670609wrx.67.1711292250125; 
 Sun, 24 Mar 2024 07:57:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:57:29 -0700 (PDT)
Message-ID: <ff67cc1b-1775-44d6-a6a5-fa137c46ecca@mind.be>
Date: Sun, 24 Mar 2024 15:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240324123159.527191-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240324123159.527191-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292250; x=1711897050; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UKW8Wxxnd1PSbblLYc+JOfxqfA+Zgamx//IN+aezjXE=;
 b=hT9fpY+2azfFdabspzUshm6Gz2SpDEh2q9QQBRifkB0lbBlKlDzHYB8zylnfWOOTe+
 3XcAC7FfQFXGxd04p2CqDgCw9zKDfYpZW3c5LDsTYEN6sfE1jGNgJ4srd6zMiM38ooXD
 xmqZhm785TWUmFduru0XX/vn62+wOcjIET0pP5WHKK5B9gVAB6t+N2uxiLORzESFy4gM
 aHl5OH7scadYhvnS6aUT7R8tLSfKHY5NuvA+d9D6Jx2YVk+wc/Jmeu5bLGKD8qRbQlKb
 iPh12z9ba0QuoA2D2eTQ3hnNOKe1aDIueqWvwueGymjiLCFW9F3xYPq3WVCL+Dje2Foc
 c1PQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hT9fpY+2
Subject: Re: [Buildroot] [PATCH 1/1] package/neon: drop unrecognized rpath
 option
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



On 24/03/2024 13:31, Fabrice Fontaine wrote:
> rpath is an unrecognized option since the addition of the package in
> commit 59a9c02e1355bcd630a207e8be319a044597ad1d
> 
> Fixes: 59a9c02e1355bcd630a207e8be319a044597ad1d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/neon/neon.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/neon/neon.mk b/package/neon/neon.mk
> index 96ee608780..93870b9966 100644
> --- a/package/neon/neon.mk
> +++ b/package/neon/neon.mk
> @@ -10,7 +10,7 @@ NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
>   NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
>   NEON_CPE_ID_VENDOR = webdav
>   NEON_INSTALL_STAGING = YES
> -NEON_CONF_OPTS = --without-gssapi --disable-rpath
> +NEON_CONF_OPTS = --without-gssapi
>   NEON_CONFIG_SCRIPTS = neon-config
>   NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>   NEON_CONF_ENV = ne_cv_libsfor_bindtextdomain=$(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
