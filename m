Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15B5CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 19:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C154541759;
	Wed, 10 Apr 2024 19:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWLQF3bfIMXX; Wed, 10 Apr 2024 19:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC42C4176A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC42C4176A;
	Wed, 10 Apr 2024 19:42:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 440361BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E5D060E5E
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTS1h1vQ42lS for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 19:42:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8ADF360E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ADF360E4A
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8ADF360E4A
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 19:42:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4165caf9b2dso39899535e9.1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 12:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712778143; x=1713382943;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WvmI4QT6SU4Q0UGh7e0+R3SLKM3gRbfEIXaA7WAzQkA=;
 b=vXG5b9MdbHcaowo5CJ/y23V/gObd74HO74ffDb6Z6cPXiKmMlr1IqnIOS7BeDpFdgL
 foQ3YJs2/CbdqyfbqvCh1tA0FvLRrXDg5Ejz9OuTcot6FuiqsLa5rBBLdVezdVw/kIjF
 jjwl9FwfN7X3vuLQlTfqt0Nm2yTpKjPEntI8lpAqwDeowQEGmYH+q64yJuERSnec5PTG
 UhHZjekYIq8cTmTYI8QvDLi6z1Y4SbV3RKudZNRSHqpr/TIoqPXcPC2qzPvlbWDW61v+
 kQ12FTPlb+5ogN4zWWpgQEPBj4xLX6Gsa6LyiT8IgZPWOjZA5wLql81f7kyMJktLszbF
 cKfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuQXECOreYKRX8lhryn8hftIQBHw3mfZp/T71+GnxGN10TWHVXXIhydn2lD0nVe9f7nmDiNgHTwQVXPFgVAbpRn3Yv5EzQdA==
X-Gm-Message-State: AOJu0Ywp5INeLIvhvNMWnR5sQm+4IKVlg5QzrIsY5odgTQHc6eCsAOMq
 WJ5uHHKRDUR/nQhrMDVU82DXHFNfZJx3c1HTXpycZ3vc/qhH7UDmFI9nMW47fV8=
X-Google-Smtp-Source: AGHT+IH363uiM1EZ9RhcO8GbmZMb/tQjPaVfqLKbw9eWjujrd4bbr5p+I8AfiMS1i8dLW6mGOxUt2A==
X-Received: by 2002:a05:600c:3b9c:b0:416:8efd:1645 with SMTP id
 n28-20020a05600c3b9c00b004168efd1645mr3652312wms.7.1712778143255; 
 Wed, 10 Apr 2024 12:42:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c4f9200b00417caec4135sm44807wmq.4.2024.04.10.12.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 12:42:22 -0700 (PDT)
Message-ID: <b3c9aa8e-3795-479a-94c7-978388dd009c@mind.be>
Date: Wed, 10 Apr 2024 21:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407195624.3362430-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407195624.3362430-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712778143; x=1713382943; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WvmI4QT6SU4Q0UGh7e0+R3SLKM3gRbfEIXaA7WAzQkA=;
 b=amWA4irm0RjtdwkxRSiSDDmBX+DAadrn0ObKqk9rAq3+A6R0UBNCk2CBbwrQQQsKCe
 F1oW1oNtbXwcpVPMoTle21WZ20EdEoG4L/TqgWVf1GtW+J6s2/Za0HmsAXWFB2KPAEC2
 TAWAPIjtdXemGtn04khUPbwC+2AA+T70AYhgtiaJQkBsU+kLUZuMD+Q1iyrnkX9CH8cc
 Rn1kkbX1E3L2GHmS4nlTT5mu6qBre0rNNuzsyR3yOuXERQkJMf44N8MYqBKWAFZPY+In
 KOVboUjzT0PhxP3haca90YauJ1Ack9qRBEcDvY8CMbDsZz+fqRz5ZYD10iTiLisOax7l
 Kpow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=amWA4irm
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: add zlib optional
 dependency
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



On 07/04/2024 21:56, Fabrice Fontaine wrote:
> zlib is an optional dependency dependency (enabled by default) since the
> addition of the package in commit
> 8aaa7ecbce1d10cbcd880c3da5e429988f96176a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/opensc/opensc.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> index f4dc2206ea..008de9d4c2 100644
> --- a/package/opensc/opensc.mk
> +++ b/package/opensc/opensc.mk
> @@ -20,4 +20,11 @@ else
>   OPENSC_CONF_OPTS += --disable-openssl
>   endif
>   
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +OPENSC_DEPENDENCIES += zlib
> +OPENSC_CONF_OPTS += --enable-zlib
> +else
> +OPENSC_CONF_OPTS += --disable-zlib
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
