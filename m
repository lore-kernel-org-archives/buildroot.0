Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6801C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8989D40346;
	Mon, 22 Jul 2024 08:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COsjIm_C-arB; Mon, 22 Jul 2024 08:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B885A402EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B885A402EB;
	Mon, 22 Jul 2024 08:03:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E18711BF29F
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF64140324
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYp2ij1vsowr for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:03:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC5E9402CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC5E9402CE
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC5E9402CE
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:03:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4266f3e0df8so28151395e9.2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 01:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721635398; x=1722240198;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=80o8VHNGST9Q4bNE32rVJ7XxjJeGYQaQbxm+juF+3KU=;
 b=eov5rxL5B2hXS40g3HgNWnsuAu5RJmGlvW+mO0jVZ5di9bKKuLxWUcE3FoV6ntZ0q3
 f9+Lbzy8p9LV7zGCnC0i27ObjQldW+4rjzwj4cc9JsR7SqIroy0qEktAJl/v5CGzCiw4
 TpEcvkra3mvvhAqPN+D9WQQFol0EbF/+xPkNnKFJJvG/XyKKapyhPzzDHf7otCXqLAUd
 8BCxHlO5DVVt8nFS7DNu4mx7wSz+TFJMQLmoiuQDdwreP8gGdkSMyVR3wiDMvHYvpehH
 H02UEOZJbokx6y4oS+4PBZgRZi4lW2qxZEqplEbuueXGmCxuWBf0LLAdlupRXANgubfO
 kMBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNHUBzc7ChweiLM7UcPCMv703FTvDHIsO+10UwnDpg5q1AbQHfk52ntiBDmO0JKY3AYqQKtmk+2FUDVXt2BByHWYG2Ujb5Iw==
X-Gm-Message-State: AOJu0Yz43KG4IFYkOqf1Wapxjago8QBweHVgl5vZFN3EgqQVnFs4Igci
 bigGPvL/dbDogHwTON1hAW4YY9d8BFajqwJCtFveTcUnT65qFXJmNemXuPcDF6VpN+WYTUAsrlk
 O
X-Google-Smtp-Source: AGHT+IESt5ZAgpMLKJFM/cIQocigE3K2c24kvNBUpOeyssswHXANkEsMtfFhtnTj/6qyo1vqMllqeA==
X-Received: by 2002:a05:600c:3149:b0:426:622d:9e6b with SMTP id
 5b1f17b1804b1-427dc53b391mr39809065e9.23.1721635398705; 
 Mon, 22 Jul 2024 01:03:18 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a83f8asm106900565e9.1.2024.07.22.01.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:03:18 -0700 (PDT)
Message-ID: <0a8fbf9a-410b-4de1-9dc3-7e4e49810a20@mind.be>
Date: Mon, 22 Jul 2024 10:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240721212650.3542775-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240721212650.3542775-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721635398; x=1722240198; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=80o8VHNGST9Q4bNE32rVJ7XxjJeGYQaQbxm+juF+3KU=;
 b=Ly2SpUiBvbTe+X3TYQzsG5PkVZBpQEN2AC36Mly4ZIoW63mJbWRY2DufloKHrTAJa0
 IYGe7T1fqjgWkznJjogydj7dx1G1noP5IdXkJPYJgOh9xdBksgUjjFD5F0RtFxQQYlnw
 B5uh+HfDNZlN+bGokVe2WmfENvZGlMs2AXCMDyfK7OGcZs9L8RelJRDngoyGoEuVPf+t
 CD2cdjLeSF5uifavILxpLWJwFmtxqkaNJtoptyIdT2YBMtI2aDyzqLN7/WEj2JWz7zXn
 cu45imlaGOnxDnOLM/yEoHLxWM29N5KKooNvEA78o/RlPVFXt3vc9kWUFJZ7hqIdB/so
 9WFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ly2SpUiB
Subject: Re: [Buildroot] [PATCH 1/1] package/libbytesize: bump to version
 2.10
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



On 21/07/2024 23:26, Fabrice Fontaine wrote:
> https://github.com/storaged-project/libbytesize/blob/2.10/NEWS.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libbytesize/libbytesize.hash | 2 +-
>   package/libbytesize/libbytesize.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
> index 7dd572842d..a52a2803e5 100644
> --- a/package/libbytesize/libbytesize.hash
> +++ b/package/libbytesize/libbytesize.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  8bae8287af6ef5624c320f70defdcd84ddc0c2057d3b59a5871897f27697811e  libbytesize-2.7.tar.gz
> +sha256  1d1ce3be8ac59fd59511d0794c7327d5cf33f1e83496837b17e19ac49400cad1  libbytesize-2.10.tar.gz
>   sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
> diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
> index a95ee08357..7f56cbcb79 100644
> --- a/package/libbytesize/libbytesize.mk
> +++ b/package/libbytesize/libbytesize.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBBYTESIZE_VERSION = 2.7
> +LIBBYTESIZE_VERSION = 2.10
>   LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
>   LIBBYTESIZE_LICENSE = LGPL-2.1+
>   LIBBYTESIZE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
