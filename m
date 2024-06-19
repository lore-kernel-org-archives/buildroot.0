Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEF6C2BA1A
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF256401FE;
	Wed, 19 Jun 2024 20:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kygSPXpNxti; Wed, 19 Jun 2024 20:19:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C85E4036F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C85E4036F;
	Wed, 19 Jun 2024 20:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6861B1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5631680FB3
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzExqXpKHzR3 for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35F5B80EA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35F5B80EA3
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35F5B80EA3
 for <buildroot@busybox.net>; Wed, 19 Jun 2024 20:19:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-364a3d5d901so79538f8f.0
 for <buildroot@busybox.net>; Wed, 19 Jun 2024 13:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718828338; x=1719433138;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=21s49F6xAh9kPmn8zvErEUUJGAmrLXEOmZtpeoU5i/Q=;
 b=EPtDU6xZ1MX0zHj8jeZVDiXQkekq1cX4PmXT1g5mO9gN85BmBxHEOeS5Wz3+DgFB+2
 sNSirUaatZIwNVb+MkDnVbshAAVRcwuyIQHpqSOhByN4lr3JE4s7Wt3ZJ4sP8Z3ewA/v
 tR6ZNpC3yjQ5Ek9+Is0cWmNAer7uNLt0EcP6O3TIyPutDqOPFz7rGpkiFZetJnq3IWXM
 hqxG9zPOet7/p7v1Xidebe39RbOEvKMQ1hUvaECa11pfJ0XMSNR8cpn7YaA44v9WC2Oa
 hoj1PnL0rklm9L9jmSkZWs0c8Isc5eAJcxJKLEMRwvtToEXu8aT5u7W917Cka33VmFzE
 76nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkaJa3VZpOi1BlT+8GOhWYcpJuXv9fimtU/4TkqY5pCeftbWt/HoXgyYbsvZrRZ/gtLYX4lvhBiwbXANzVNyhm/UlGBb0=
X-Gm-Message-State: AOJu0Yyhgp/cLDZwUoQgiaCxfx5HYkIimHZRDqi/3Wt6LGIkzHhG6rmf
 2DSe765eq+aYA1rADrVntbrbTB8wjdNX1iaJpFmkAh5RXS9CBrDsq4Nzt55MuUI=
X-Google-Smtp-Source: AGHT+IGrq4gdQJa9A+q2ORlGyeLmyh9PsZw1xn0DxVvFjsIRHHeEpkDFfWjKe0UojrHPaI2MNtIveA==
X-Received: by 2002:adf:cd0b:0:b0:360:8769:2bcd with SMTP id
 ffacd0b85a97d-363ec4f3a35mr1480013f8f.22.1718828338101; 
 Wed, 19 Jun 2024 13:18:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-362a5ff6085sm4397382f8f.106.2024.06.19.13.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:18:57 -0700 (PDT)
Message-ID: <47e2be6d-fa5b-4b8a-9433-1368aec3b39c@mind.be>
Date: Wed, 19 Jun 2024 22:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20240605081551.1181658-1-francois.perrad@gadz.org>
Content-Language: en-GB
In-Reply-To: <20240605081551.1181658-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718828338; x=1719433138; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=21s49F6xAh9kPmn8zvErEUUJGAmrLXEOmZtpeoU5i/Q=;
 b=iKzpXqPeSaHwHib5r13i+V8YLL260KobgdUenzkcthSUCWq6qmRkyzuZg9ZAtitE0A
 2SHce2X/BYqkJDbe78fPM4lLe2/JQfC0EPISmOs2Th9erbFkCL0GOJ+GcAw29z5sgSbx
 qf2XNfod0TVE60ZuIoX3qz/z/57r2oWUjKLNFGOj2/aguOPYZUJFlhEwTnEsNYZtbR8P
 T/Qjvahbu1svhAS5ubcvvGpeQx63nNjZ+4XyVCu1XvWoP0gV/PSgujX+qtIxLhhHiJSQ
 ism5vWQoI7x9tUgLeAHG4NYE1N3t1kQpHv84KprPL4WNiqy/WnFW6bwy9tuocUr1897/
 +ZjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iKzpXqPe
Subject: Re: [Buildroot] [PATCH] package/ntp: bump to version 4.2.8p18
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



On 05/06/2024 10:15, Francois Perrad wrote:
> diff COPYRIGHT:
>      -* Copyright (c) Network Time Foundation 2011-2023                     *
>      +* Copyright (c) Network Time Foundation 2011-2024                     *
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ntp/ntp.hash | 6 +++---
>   package/ntp/ntp.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
> index 96e21bf2d..44f3486d7 100644
> --- a/package/ntp/ntp.hash
> +++ b/package/ntp/ntp.hash
> @@ -1,4 +1,4 @@
> -# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p17.tar.gz.sha256
> -sha256  103dd272e6a66c5b8df07dce5e9a02555fcd6f1397bdfb782237328e89d3a866  ntp-4.2.8p17.tar.gz
> +# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p18.tar.gz.sha256
> +sha256  cf84c5f3fb1a295284942624d823fffa634144e096cfc4f9969ac98ef5f468e5  ntp-4.2.8p18.tar.gz
>   # Locally computed
> -sha256  06246b8c15ccc1a1873c78525c810f0802e68f383e79ee041e06d1ab9cbf80a4  COPYRIGHT
> +sha256  45b6e5a0a5f0ac4afdd9e23caa2241779e4da463e4dba32a41b4dbd61577b2a3  COPYRIGHT
> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index e64f6308e..1a7c7e793 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -6,7 +6,7 @@
>   
>   NTP_VERSION_MAJOR = 4.2
>   NTP_VERSION_MINOR = 8
> -NTP_VERSION_POINT = 17
> +NTP_VERSION_POINT = 18
>   NTP_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)p$(NTP_VERSION_POINT)
>   NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
>   NTP_DEPENDENCIES = host-pkgconf libevent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
