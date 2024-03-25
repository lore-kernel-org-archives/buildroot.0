Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D10C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F4D16087F;
	Mon, 25 Mar 2024 23:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRG23v8xXl27; Mon, 25 Mar 2024 23:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2226260891
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2226260891;
	Mon, 25 Mar 2024 23:24:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F17361BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB35781E1D
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0igDs853_Kx for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB8B98179A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB8B98179A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB8B98179A
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:24:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4148bd1d000so5931285e9.3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 16:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711409079; x=1712013879;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nkt9NEGKBQ/6ySlCj+v3Xv9angTSjVcM4bFSYiDZL5w=;
 b=agnNI6umMe9B680nXQqGveaxx5z8RNzu25RV2AXY3fH+536b64Vo6hJM+DO9v8pXa5
 B4dOtGhDIG8ydzdgCX+yt/s38q3X9hYpczo/4D7+J/BXITmUU/+dg2jfqf/8yhnt9axc
 XA6G37RGBTGke5nxfL5cZUOuZcFd2Tn1Y8xAX5XrOkmcSIz2D+EYybDsulkN895WHkGv
 NoWgUoAfpqBNOr2HXyamKg5i/A+lq+KJab5X0kzifvjmV7noc+jySGW7QqWWEMzINuJg
 bNAA0xIEUMbDtFE791MeNcf4i3Ea8WJoK8a0BmCuzrOAmca6wwpzZr6bIeXzLTWZ3X98
 yOaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNhNTHq4UdvAFUV1bAKj4iiAt4Gh+IfM+50Ec2o8D6xodrfjqKAAf2caB3xvd4L1Fgnzzj0HQyoRrHb+l0x958Fc3MoCIz1w==
X-Gm-Message-State: AOJu0YyvidDwkPfhw1+kmw6XEHxf+HYou07mbI3+yqf0T2IVsduG+PsG
 0F8WCKAyf+xF6iXXBabb3jdMrP80q4lmmqCu6QOr7i72yhBmXACwEta5ZOt32heDAgX0GvCIizk
 8
X-Google-Smtp-Source: AGHT+IFO+yPjKl2bvT5oZroK1O+U4TU/jnvjvrdpbsJ+PLlE43ckxRYtPMsKNk3FDmAp9LPGpc4I2g==
X-Received: by 2002:a05:600c:3111:b0:414:6164:f96 with SMTP id
 g17-20020a05600c311100b0041461640f96mr709420wmo.37.1711409079327; 
 Mon, 25 Mar 2024 16:24:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b0041409db0349sm9748578wmb.48.2024.03.25.16.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 16:24:38 -0700 (PDT)
Message-ID: <a867036e-34b8-45b3-a4be-4d429f7d83be@mind.be>
Date: Tue, 26 Mar 2024 00:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
 <20240325223424.108702-13-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240325223424.108702-13-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711409079; x=1712013879; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nkt9NEGKBQ/6ySlCj+v3Xv9angTSjVcM4bFSYiDZL5w=;
 b=aNY2nfWioUzXaA0YqLPvTWLpQNkt2aOYeg9hR0LPxWvtN73L+oSjMKcQqTuL0JQH5p
 NlN5Quio16cZsMulJYDGbI9DBJWcsIpWgkU98LUzMT8aAQdu/H8hxU94K0KpbJSqg7cQ
 IngKzaprXibefV1L8BJ/2gWb5aA0qVZH5IAIWWl9J2jyb9qsprEwlZ6GFgY+FtDUhJHb
 dj/ofuSO3j5zVX2k7tvW73E7prptKs9GGBJjfd15ErP5rA9ara7AujxgoRmTmCgItGOW
 6NZ7NspCswz0x955HxNWjG+KNxBIRoTzWbekwK9/nQIsUevCElBcDyI7P3ikmypsRnzv
 iFeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aNY2nfWi
Subject: Re: [Buildroot] [PATCH v2 13/13] package/flutter-packages: bump
 version to 611aea1657fbfc0d2564a14b08e12dffc70189bb
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



On 25/03/2024 23:34, Adam Duskett wrote:
> Now that flutter-engine is 3.19.x, it is safe to bump flutter-packages to
> the latest commit.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   package/flutter-packages/flutter-packages.hash | 2 +-
>   package/flutter-packages/flutter-packages.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
> index 994434e25c..eac58e608f 100644
> --- a/package/flutter-packages/flutter-packages.hash
> +++ b/package/flutter-packages/flutter-packages.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  8276276e050c1ea45787f74b0f8c915b8cf2162b6af8537ffa9886bd423f2828  flutter-packages-947e34ce9fedcdd6750b54eb1cc74b854b49ab48-br1.tar.gz
> +sha256  a42e39a920d72183119b0e0bb7399513369a2aa7472f25da57ae95aad32e022b  flutter-packages-611aea1657fbfc0d2564a14b08e12dffc70189bb-br1.tar.gz

  Not sure what went wrong here...

ERROR: while checking hashes from 
package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash
ERROR: flutter-packages-611aea1657fbfc0d2564a14b08e12dffc70189bb-br1.tar.gz has 
wrong sha256 hash:
ERROR: expected: a42e39a920d72183119b0e0bb7399513369a2aa7472f25da57ae95aad32e022b
ERROR: got     : 9f9c0d1492cb52719eccd06231115dd72d2e4f0cb74db62e38aae6e66d1f8d44
ERROR: Incomplete download, or man-in-the-middle (MITM) attack


  Perhaps the directory changed? In my downloaded tarball, it's under
packages-611aea1657fbfc0d2564a14b08e12dffc70189bb/

  Regards,
  Arnout

>   sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
> diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
> index 4beaa39325..ef29e0aa98 100644
> --- a/package/flutter-packages/flutter-packages.mk
> +++ b/package/flutter-packages/flutter-packages.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FLUTTER_PACKAGES_VERSION = 947e34ce9fedcdd6750b54eb1cc74b854b49ab48
> +FLUTTER_PACKAGES_VERSION = 611aea1657fbfc0d2564a14b08e12dffc70189bb
>   FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
>   FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
>   FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
