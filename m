Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCF0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:38:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2536660F70
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2536660F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8AE0407A6;
	Thu, 14 Oct 2021 20:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oabKvHLMiDcB; Thu, 14 Oct 2021 20:38:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521BD40798;
	Thu, 14 Oct 2021 20:38:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 563031BF599
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40A904057D
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHGxe2V8UchW for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:38:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20EBE40125
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:38:22 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d9so28925736edh.5
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 13:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UdpFytLZflH+rP7STYARVhLbRFxvhtNFLb40WOqcisk=;
 b=Elgn8e9RsFIQmvW/hVdk9I5T0NYXylVIm6xyvCiPEaswe9kftilJqzmRc9Sh5gav4M
 krwPvmO3Q+ITofS3I1C02+H0nutF1iWxQpv6gnwYzGnP7MKHVIot0jGY5xBnma8m6h4T
 TcfllWzYFvEeHHYqzav2GpPlG6VTNY+hQnhe0rsPjV3KsM1w+ys/oKjZmkQN2uRQhcL3
 h8qnr4mzvkWcb+ZUExBJKNEFRzGsdL8+dtH1kGYRUJDQsidUgQHlZO9DlBwde7HLVOSg
 /HtH961ItxrbRc2mFHbD0U0D4oNVkDWah/mXnkPoHnk2fRxFz9MiomwBir7L22qHHRuk
 AJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UdpFytLZflH+rP7STYARVhLbRFxvhtNFLb40WOqcisk=;
 b=XDyhhtyKgdvu6sr1GNbG4gpHFjNbBOuW53W/F0Fg4lIOaPdzgeuaUm0NSoBWyti4oB
 Q3Rj3mezkniWKiUxPdJtHHVWZkY1BuZYCSsqAY5NStKVJW0wiBSBIp4pESutBekL+ooW
 QnZad1YELoP1VaBrLj5hKfy2+BJqAQ2pKuCEP+QVqgSKpbsuPhzbeLgKK+l1lwpn7uf2
 SoAAgqWOvntAsldaFhnQYPjSb/QOaLqKiAgXNA8OzGdq3gzYbB9r26UJqWzWusPa2y+t
 7/3Gpy8VBU6kxk+4gH+Ci4MFyOEUZWVIArj5tsuTCiufHqych3lRcd4HcstBAF6s6eC3
 N7zA==
X-Gm-Message-State: AOAM533QC90BOJqQXZnD0yZ6/LBSI2IDKw97ZcNnxfRgONBePLtwNhl3
 jhspIRZqqw6W2zTGZQirf/IvrQ==
X-Google-Smtp-Source: ABdhPJz082aD7TdXxoYQmLeLTaSooRtwjvATk46Q4WqisMYTyRjbQQYfOBWhZM//d/CA+D7mpkdjYA==
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr11472707edd.129.1634243900314; 
 Thu, 14 Oct 2021 13:38:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q11sm3081032edv.80.2021.10.14.13.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 13:38:19 -0700 (PDT)
Message-ID: <80fe9a5f-1662-0c10-f97b-b3118fcb5f83@mind.be>
Date: Thu, 14 Oct 2021 22:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211007160957.3469451-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007160957.3469451-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-decorator: python3 is
 also needed for host
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/10/2021 18:09, Fabrice Fontaine wrote:
> Commit 7bfe142e0d84400e386286347afd6e26f90b8aae forgot to set
> HOST_PYTHON_DECORATOR_NEEDS_HOST_PYTHON
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d11433a8076798d6088f92716608ebbe1c6aee9c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-decorator/python-decorator.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
> index a61f045e2a..a7e338bdc0 100644
> --- a/package/python-decorator/python-decorator.mk
> +++ b/package/python-decorator/python-decorator.mk
> @@ -12,6 +12,7 @@ PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
>   PYTHON_DECORATOR_CPE_ID_VENDOR = python
>   PYTHON_DECORATOR_CPE_ID_PRODUCT = decorator
>   PYTHON_DECORATOR_SETUP_TYPE = setuptools
> +HOST_PYTHON_DECORATOR_NEEDS_HOST_PYTHON = python3
>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
