Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F251E7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3136820DC;
	Wed,  4 Dec 2024 21:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2afYgw99zb2; Wed,  4 Dec 2024 21:14:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16ACC820DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16ACC820DD;
	Wed,  4 Dec 2024 21:14:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B45411DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94FF5606BA
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBb9fETWkWlP for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8252B6064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8252B6064F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8252B6064F
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:14:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so1547165e9.2
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 13:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733346843; x=1733951643;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ut79Gh8UxhWGRWYNstDsm9lhWQrrUBrxV+95ZQqTT+E=;
 b=gB1GWByHCvkWaegYlZlzHDoXJU7Z0G9NAmbJIQ0h868iNVzhQYo//uYYVwimGe/oE/
 Zvw+kCgSK3hzvUwQGTzQFFDAvpRC8grQ2lLulr1JBjtoL93zYbMHJVkJW9dFFCrzYDCs
 43jfxH/JBaMiPC/JN/lx7mgXLjqRcqzJJKDUMn9IC6uC/uog/PwvPBrttZ2XWZN99+LM
 9DYU8d7WzKE+bgDPG5e0C7bNsTzPGU+P5V6IVoKoTIW5Mx/JnMJCnrQOk1cw45eUATod
 dxrOnEhW2OyhAK3RUk4VW8Wr5nHJOjJ3qGiSrqDU5c0V9r6nmxKubQRf0g1xfukp61rK
 Mi9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf38fPVbMN+aDRcr3IA6d3NcO5j+F35Bp01ML7HkwMiC39ihUW1C/DsHf7a1YmHGW907jllj7sFrM=@buildroot.org
X-Gm-Message-State: AOJu0YzxuBpE/WgD91ZMzqI1YE88qnM2n87S1AZvfiS7b8nQ8VnUNh0P
 6vab/cAfGJW3VPlHbEwF9Q4j3KQ+RFaEbwPkduhWK7s4PS2QIgnvszogmUF/0A1IgMCw+woUo9W
 N
X-Gm-Gg: ASbGnctpUFfyqMXTvNfuxJQ8bXP3thTHu1i+QIo2R/6Hs4bcNoJ8gJwtbd77U8Q1+uQ
 1GKd1cF0idOPZOY9D94mwXx0hmJ9oOiPueWYTNhS0DY4AjVTYey21K/Nj0/qZ8E+6v/mz3+SZj0
 TcRxv/WmXbUK8vxj/Q7Qn2smVZ6E4B31PZzB3wvDYGN+bgf8z3EWUHEXrNcFl1jMhwtmhT8kOYF
 amJXINy55UGhLl9071lk2WqZeHQsUhBC1Gk+XIj+UhUATgATg5UEzgicY7Ias9UlqQIdwc8xwGd
 UzcFNYydzDuAgJMsKkMi7jYMM4W62OfCcqPVIUNTkQAdcM1PxT5AkwskkdQDYb6XU/o6jmPD2ym
 8ZLTJ
X-Google-Smtp-Source: AGHT+IEacW/A2E+IyF/CCseeAcOAhN8Im0hOZm9TMKdAe0sHrJTIjHW6MCL17Q7TLoDL+UdHSv6wUQ==
X-Received: by 2002:a05:600c:1d05:b0:431:54d9:da57 with SMTP id
 5b1f17b1804b1-434d0a1d2f2mr76909215e9.30.1733346842605; 
 Wed, 04 Dec 2024 13:14:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52725b2sm36213105e9.5.2024.12.04.13.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 13:14:02 -0800 (PST)
Message-ID: <b4f0a2f6-c14c-45c1-808d-2686c5ccefb9@mind.be>
Date: Wed, 4 Dec 2024 22:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20241110103624.1041337-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20241110103624.1041337-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733346843; x=1733951643; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ut79Gh8UxhWGRWYNstDsm9lhWQrrUBrxV+95ZQqTT+E=;
 b=ApGj0yOrXe7poRAOlzw/w+rwhsrtO3c4QF5EXz4dKdqFynfxQ0jUQSIkRNC3GtiyGV
 i8GiIb8y+T8Su5QGnFURVmX1CGnQxquGjnlsHkO7An/eCHuh+K/2Jb52jy1tPjgu6jrM
 wvxRDcNC5i6jhZmDNWVyv/rGjwC0TW6pKAvhxkG8SJDCsF29uaP1YpAjg0AZ3dFEy+8G
 liK1euMP0tgWSkdOz9hLc/in6yHCP3tnkgwykcbZi29of9iQRJygkvdUTPGw3bQ1nCyB
 z+MBHbmdOnQ52cKpMYxaUupB0fKOPMFu+7poFj6/NT1sjPlrfXPnYGuQgBvKMSqFfdN5
 Q2Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ApGj0yOr
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpl: not supported on mips64
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/11/2024 11:36, Bernd Kuhls wrote:
> Although adding " || defined(__mips__)" here:
> https://github.com/intel/libvpl/blob/main/api/vpl/mfxdefs.h#L71
> 
> would fix the problem, libvpl alone makes no sense and the only
> dependee, intel-vpl-gpu-rt, is unsupported on mips anyway.
> 
> Fixes:
> http://autobuild.buildroot.net/results/50d/50d64ab2d547c70b39e2421ee2763d8309873125/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libvpl/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in

> index b9e9a20fd7..5a370ed2e3 100644
> --- a/package/libvpl/Config.in
> +++ b/package/libvpl/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
>   	bool
> -	default y if BR2_ARCH_IS_64
> +	default y if BR2_ARCH_IS_64 && !BR2_mips64 && !BR2_mips64el
>   	default y if BR2_arm
>   
>   config BR2_PACKAGE_LIBVPL

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
