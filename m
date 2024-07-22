Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B02C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAD47402CE;
	Mon, 22 Jul 2024 08:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAWhSljuyXxM; Mon, 22 Jul 2024 08:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2042402D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2042402D9;
	Mon, 22 Jul 2024 08:02:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 348EA1BF29F
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 293074036E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daN5xekU_kiv for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFF3E4033F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFF3E4033F
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFF3E4033F
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:02:56 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-367e50f71bbso2200404f8f.2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 01:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721635375; x=1722240175;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8cMECnyBJzLp16lEGfCcUwjVjff6M5qLg1EOZhTkes8=;
 b=Bg8IP7foBI7GnjA40AkY5MlAy1Faheetl7QhKTejt1+AbnIsz8pq3KEpn3ESoE6smB
 b6KKUFhftLaVkmSgxo9roIOu47stZfgUh0XzILvilsVe6VJ+dBUZVUJMcLRo8eq8cDxg
 ctASPSkdP47JOnB66k5i4KJc5veqo4gO+WQ51wCSHxSOuhL5OBI9eYp0hG3QKp/TqQmZ
 0ryX1H9K5gTXjuavEjAdJ0fzJMXJJqCE5dUXyZv1Q+eP1C5897nvXrkMuePzcZZeyK//
 8Ujgdw7cFZWP/jWwNZGUu5wceuXQSlElDDgsFFI7jTJaZ0dhdYzSCmjqLGN/BEglPfQ3
 NTcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3eCuyhVA8b5Sqlu/9Z7XsbSkgoaD+VpLfkW/GSQGiwGLhJN54ABVDsuzYqNczQw+Hd0ngLzttGqtbBrmnmY2+zZcnJIxNcA==
X-Gm-Message-State: AOJu0YwlirBrnLmj/cRkjsHqiRgDiLDJYP5bsjJR7o4URgOtvWiTXukX
 Yo+mlj+9RaIc9HdCfepBdrUe7hICXhkJLTXGN5BRk68y+MNtjr5RBczzHvE1/EI=
X-Google-Smtp-Source: AGHT+IG6R2B6DxFQDOcZNfbVHVRjLcC0gnXOxmJoOVheGP8rMmi7wBqCq4llbyGZFSvToMn2mP5hXQ==
X-Received: by 2002:a05:6000:10d2:b0:367:2945:4093 with SMTP id
 ffacd0b85a97d-369bae6b604mr3433214f8f.40.1721635368235; 
 Mon, 22 Jul 2024 01:02:48 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6937fc7sm116989955e9.46.2024.07.22.01.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:02:47 -0700 (PDT)
Message-ID: <92836aff-4b2a-4d82-859a-c9eef4070868@mind.be>
Date: Mon, 22 Jul 2024 10:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240721194739.3040259-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240721194739.3040259-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721635375; x=1722240175; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8cMECnyBJzLp16lEGfCcUwjVjff6M5qLg1EOZhTkes8=;
 b=OMmYMBXClyklmT1TxlhJpMY9hJcFC+v7ttaYI1f3dWK5ZQ34dwb29KSWpmxhlsHxf8
 zaR4bXa8xkgkwpAM7VRCE7CxogD5yIFNe02u2Vewfrp4n6XwRRaHR9FvhGLEzqY4xe79
 pDZ1cw1yhvYmfhwQNKzJjaKoV+1RVgCTMSw26PPrbyYtXn1YTBT10uRTMptwUmnxR5Qy
 sxbiTStXL2FrllfVpWin8Wi4DPBd+9P/h8GtVHjUAx4Tl9Hwv3bTh6SqS2+f0D4JcFc+
 6KlPKGcA5/kPOPsD9rYkPgm3YO1Nkhf/s1gWBIy8qy+JbB1siQoTaOpqTS6zqaYuxENE
 mkBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OMmYMBXC
Subject: Re: [Buildroot] [PATCH 1/1] package/libp11: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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



On 21/07/2024 21:47, Fabrice Fontaine wrote:
> libp11 unconditionally calls the (deprecated) ENGINE_* logic in
> libopenssl resulting in a build failure when
> !BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
> 623d3bbe43e9193aa8e3395367d01af59071b859:
> 
> eng_front.c:25:2: error: #error did not get engine.h
>     25 | #error did not get engine.h
>        |  ^~~~~
> 
> Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
>   - http://autobuild.buildroot.org/results/b03cc27a60f9e6794b3341517196fbf8dc3ec2d4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libp11/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libp11/Config.in b/package/libp11/Config.in
> index 3c7ccdee27..3bf13a6051 100644
> --- a/package/libp11/Config.in
> +++ b/package/libp11/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBP11
>   	bool "libp11"
>   	depends on !BR2_STATIC_LIBS # dlopen
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBOPENSSL_ENGINES
>   	select BR2_PACKAGE_OPENSSL
>   	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>   	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
