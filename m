Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40713C54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1400E81FAC;
	Sun,  3 Mar 2024 16:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jn4QEG_8r9RC; Sun,  3 Mar 2024 16:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12ECC81FB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12ECC81FB6;
	Sun,  3 Mar 2024 16:48:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 873CB1BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 813E640135
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6R2I753_MwRK for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29E4A400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29E4A400E5
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29E4A400E5
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:48:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-412e4426e32so100945e9.2
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709484479; x=1710089279;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K7XA32YRzYsL0dt2LSrCY+A9q2lC93vzf6TkyFG5giA=;
 b=cPXwyAdxS3ujO2qkYCJQkXfUw3ubc7gjTeEHk4z1DThdVChabAWSyXpLy/LYRT+pRH
 2IlkI6Atj8G4U5tB8nw5WcMzASZDBnrS2aNXFhCd7TqeyTuwoPmcBfceQBqWOVHJStuI
 uSMc+1aEH6pvUgnl0K8+Z/dIawuYOx/yDqAGLdWws2om5SzaZXTzyTwrZYV0wz0ULcnG
 YLFPF7SJKaW7Z9GZAbAtPCXUBc0PC3N4gN/sbWkOzsi3myK4yuT9snfqezNyKJcomHGH
 yloSKzK8M/qRP5Y4Jzft2Dvuspw0TX/UShdE78ERKb0nIYNxjzOhMcYWBmznJlRd17t6
 wzMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq0rvJbJwUbBB6K5CqlI1bppxAcpiHEWDhe23ojR4Y5A3wm6tRw7xqIT0hfGaIfF7h/9FbMsbcdNJiWQuTg7LUIAGCvpFneA==
X-Gm-Message-State: AOJu0YxGgYt9Ez2n2Wbf3kBmbRfcz3wOcEQtD1oSfOAUQxvsFiNDWVHQ
 vE7Y+mLon+foJ8jASMktyZc+yP0/qPECuzORE2WVXc5ZEFfZXbJBOi8CqLZhR3o=
X-Google-Smtp-Source: AGHT+IEz93P1rpsSk+Gb0ENNm/mCcY1W9aS/o7ZERQXqwXDxjFZRhXn8UySAZqhbevaeL1bBgidKhQ==
X-Received: by 2002:a5d:4086:0:b0:33d:5e4d:51c0 with SMTP id
 o6-20020a5d4086000000b0033d5e4d51c0mr4976593wrp.25.1709484479156; 
 Sun, 03 Mar 2024 08:47:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fc10-20020a05600c524a00b00412e38ad377sm425458wmb.15.2024.03.03.08.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:47:58 -0800 (PST)
Message-ID: <d4aa2b8a-6d47-4aca-b6a3-971bf173036e@mind.be>
Date: Sun, 3 Mar 2024 17:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240211214751.2522403-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240211214751.2522403-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709484479; x=1710089279; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K7XA32YRzYsL0dt2LSrCY+A9q2lC93vzf6TkyFG5giA=;
 b=X28dKNoV0KNDusILJpGw0beDjqUUuHAKfbAuHQY9CMCrcMIuUIFVV17NupLb7C58NY
 BGMNwYU/H/aRrypWeeZ+/Sgkn8dJ8LCtO73vZfSQP5ZKzqPED5sqwa4WVKMbJwtdGYGx
 L3H8jFMrYvHMK6tMijpmTcg0JGgVHKhl1Cg+u9LVXs2lvuLicLgsWShURaEU+yO8tEv6
 lnhV3E9P8IgxkFLnEwPO1quDsWR2uwDzTbFI+Wlyc3fdPX6dprpyQs1RqyDK/krijXwd
 eY2X+onEHtp9fagdSo97YbMpU68IPSnQ0B9Nv2GHN90mJVR9EagijKOIyuTLi7shTzPk
 /Jdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X28dKNoV
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: drop
 BR2_PACKAGE_SHADOW_UTMPX
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/02/2024 22:47, Fabrice Fontaine wrote:
> utmpx is not available since bump to version 4.14.3 in commit
> 8a01774d9897310c00a0945865f5a6d5167dfca3 and
> https://github.com/shadow-maint/shadow/commit/3be7b9d75a6b73fe24394d7ac1e315d60d45b5ee:
> 
> configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --enable-utmpx
> 
> Fixes: 8a01774d9897310c00a0945865f5a6d5167dfca3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy         | 6 ++++++
>   package/shadow/Config.in | 5 -----
>   package/shadow/shadow.mk | 6 ------
>   3 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index a869279af7..576148c4af 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>   
>   comment "Legacy options removed in 2024.02"
>   
> +config BR2_PACKAGE_SHADOW_UTMPX
> +	bool "shadow utmpx removed"
> +	select BR2_LEGACY
> +	help
> +	  UTMPX has been dropped by upstream.
> +
>   config BR2_PACKAGE_TINYMEMBENCH
>   	bool "tinymembench removed"
>   	select BR2_LEGACY
> diff --git a/package/shadow/Config.in b/package/shadow/Config.in
> index e85e5884d2..230271af7d 100644
> --- a/package/shadow/Config.in
> +++ b/package/shadow/Config.in
> @@ -31,11 +31,6 @@ comment "account-tools-setuid needs a toolchain w/ dynamic library, wchar, local
>   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
>   		!BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   
> -config BR2_PACKAGE_SHADOW_UTMPX
> -	bool "utmpx"
> -	help
> -	  Enable loggin in utmpx / wtmpx.
> -
>   config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
>   	bool "subordinate-ids"
>   	help
> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> index 03eb16a3f4..1e7ada6148 100644
> --- a/package/shadow/shadow.mk
> +++ b/package/shadow/shadow.mk
> @@ -43,12 +43,6 @@ else
>   SHADOW_CONF_OPTS += --disable-account-tools-setuid
>   endif
>   
> -ifeq ($(BR2_PACKAGE_SHADOW_UTMPX),y)
> -SHADOW_CONF_OPTS += --enable-utmpx
> -else
> -SHADOW_CONF_OPTS += --disable-utmpx
> -endif
> -
>   ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
>   SHADOW_CONF_OPTS += --enable-subordinate-ids
>   define SHADOW_SUBORDINATE_IDS_PERMISSIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
