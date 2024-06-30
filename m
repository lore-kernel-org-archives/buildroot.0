Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83705C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4286881091;
	Sun, 30 Jun 2024 14:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqsVdj1yCdJP; Sun, 30 Jun 2024 14:42:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC6581CE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BC6581CE1;
	Sun, 30 Jun 2024 14:42:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 781111BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64BAB405DE
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaxhz__hOTrt for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21C8740541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21C8740541
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21C8740541
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:42:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-424ad991c1cso19957405e9.1
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758574; x=1720363374;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=37C9aWtvDG0on0M0eiMv3gqzruj7Exe1AwsigRt4vFg=;
 b=WBtnVmMAKXdQg1rCxG0pceT3Vez3jc38uy7fChOGVxM3z6oaM0mEWotfgdy0hILID0
 wzYe5t/dTXsoxA0qQ8uyNeenHiyVA1TwZKBkaU9nxNd4RCn0TLOsPVVikTVSm68eJimL
 3COBCocjRAMbLwWxFwjjwz7gBx4cP21aMA67WDwxzq0YtoYOZmBkZpRRVB6FRL4+CBtl
 kHtAI8EahhXL61xDe50RCW5snJKbJXRpjNL28k9vn7PnS9bOFGLsowCpsu+5twVLiREG
 qs3rSp3Y6IPZKyug7N9WgiVzh9KwmtLvlvMQPVTX+4OyG0IgLReK7+S9T1B7sStjihDK
 2jbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+tz9HHLdtRtQ9ZF9EJa4tsCAmU5mh7KU0R98imW4dOaCggGT1TYPVpX7xz7klhWL3cH7jREzCE9N8S6qT1bG0Nw1ntND8bg==
X-Gm-Message-State: AOJu0Yx3N/dtuVwIQOL34WUdGFph744UFdibbphLAp/IqXAbV1aiBTjy
 UbFzoMc1fH9ytqQ49IQdQ46xPGPJfMAzP6Lmpf+jKbSR761XLV0RbWLHMd4x6hAno0zRwBuH1dZ
 5
X-Google-Smtp-Source: AGHT+IH27dwPIRTsYeXBHHMdbJEhd1xxZ0tc7fX5Av9TOqa9Wgtq0wmeFOPM2k57ew1hJtMVaqADrA==
X-Received: by 2002:a05:600c:26c8:b0:424:a587:4392 with SMTP id
 5b1f17b1804b1-4257a00bf07mr26733495e9.18.1719758574093; 
 Sun, 30 Jun 2024 07:42:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b063485sm112145595e9.21.2024.06.30.07.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:42:53 -0700 (PDT)
Message-ID: <f298b9d9-fffc-47dd-820a-f5090ab8705d@mind.be>
Date: Sun, 30 Jun 2024 16:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240628164740.11188-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240628164740.11188-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758574; x=1720363374; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=37C9aWtvDG0on0M0eiMv3gqzruj7Exe1AwsigRt4vFg=;
 b=ACkYdhX4tPdihh3tVbS+lrrThQohIt6HD16efYDZMsNv6k8mebtHt6LN3c+dgXWrez
 GIlmk9tXlAoxL3YGKGX4alTdkkCghg4T7iInzv+7Z1BHQ6LTETVw4oAKdrXXX1wDQjAq
 g4WHWzu6l45GiZG7TOcphmHzcUSTrDBQmckGMSeQ2U8ZPFbNRc7Bd0NKT16WBfQ13AGO
 78+bAnE5mXTb9ivb4ZoQrIhPgqWyiQlV1N8ed/QrBYJFcCb/9SUObNHhdRuLoQ+8nsII
 ICUKcixFBhd2IvvFzgRcqqXLwMtiuMUHzJ9OIQ8dSQJjWn0GCkPuNllkzXcOUnpye/od
 igMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ACkYdhX4
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.4.3
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



On 28/06/2024 18:47, Bernd Kuhls wrote:
> Release notes:
> https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dav1d/dav1d.hash | 4 ++--
>   package/dav1d/dav1d.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
> index a62193810e..e0ca8f1e88 100644
> --- a/package/dav1d/dav1d.hash
> +++ b/package/dav1d/dav1d.hash
> @@ -1,4 +1,4 @@
> -# From https://download.videolan.org/pub/videolan/dav1d/1.4.1/dav1d-1.4.1.tar.xz.sha256
> -sha256  8d407dd5fe7986413c937b14e67f36aebd06e1fa5cfec679d10e548476f2d5f8  dav1d-1.4.1.tar.xz
> +# From https://download.videolan.org/pub/videolan/dav1d/1.4.3/dav1d-1.4.3.tar.xz.sha256
> +sha256  42fe524bcc82ea3a830057178faace22923a79bad3d819a4962d8cfc54c36f19  dav1d-1.4.3.tar.xz
>   # Locally computed
>   sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
> diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
> index 18cb81868a..4e3e8fe1cf 100644
> --- a/package/dav1d/dav1d.mk
> +++ b/package/dav1d/dav1d.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DAV1D_VERSION = 1.4.1
> +DAV1D_VERSION = 1.4.3
>   DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
>   DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
>   DAV1D_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
