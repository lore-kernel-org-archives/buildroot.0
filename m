Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E924C54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 07:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D705D81753;
	Wed, 27 Mar 2024 07:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwuHWL5IAWRd; Wed, 27 Mar 2024 07:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2B6981762
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B6981762;
	Wed, 27 Mar 2024 07:30:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14CBD1BF42D
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 07:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01F5840BE9
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 07:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GV4rfe44KBvE for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 07:30:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50B05403BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50B05403BE
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50B05403BE
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 07:30:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-34005b5927eso4471177f8f.1
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 00:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711524613; x=1712129413;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=97YH4yV88Mox7Wg4fBYNPJ7GssR7ufOt1fD3rUxRctA=;
 b=AwyO9v1wnxHU3Kf8ql1N0bElpUNB+mivLnE8gF7+oqDasTDWBhn8wnWrUruDo8xl92
 Gu3xmi00Jr59C0rwPLM8y0uH/WGSvX/T0dAtBcCBWy0Thxf0Ebod+quZ43PFd0Zbswau
 CJirIvWh/pm84aXg2XsGrJxs2j2pUEIIvDE4L7vr8CN3qZvvClp7XesAELsvLvemd9QP
 hfbnUs7Ql2JZg4lx9jRtiq9uGkE8XrLILSnNy1cb/Wm9FiD1NhxTYaAIZ9n+RpwVb9aq
 ybxGXmffVQEmCs4NxtxnzoCFc0Tb85rUaMKVtXexoIBnhDW3uiHyKwFFA6tj2mpFwrZ6
 buug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx1KBaU9Jbz2pYJqed3p3ut9EDuUfy+XGX7w+3Atqiss/9WR4uGzIDI6gZyCVWKpDCDqNn2JuN4IvXQffzYqtmjEpAWA30Ew==
X-Gm-Message-State: AOJu0YxEvaTemzCfZKRwTfTU6ab70OmIbweehG+RDCYuGYqPfLbZZmSL
 u2KCmJKvqpUZFKmu34cZvIvl38G8oLJxqpamh9+bzlDAsS3M8vAfosASE/CC0lU=
X-Google-Smtp-Source: AGHT+IEQpJomCZ8aVhZ9seHfyS7tPEvkrDxfipchqRXjnxdQen+JLQLvq2uHQoZ+WM5MlwqRU6CCyg==
X-Received: by 2002:a5d:4247:0:b0:33d:a2f7:ab33 with SMTP id
 s7-20020a5d4247000000b0033da2f7ab33mr2350362wrr.55.1711524612607; 
 Wed, 27 Mar 2024 00:30:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bk3-20020a0560001d8300b00341c9956dc9sm9123602wrb.68.2024.03.27.00.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 00:30:11 -0700 (PDT)
Message-ID: <22517cb3-8448-429c-a79b-0efb5ca892cf@mind.be>
Date: Wed, 27 Mar 2024 08:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240326174059.499034-1-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240326174059.499034-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711524613; x=1712129413; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=97YH4yV88Mox7Wg4fBYNPJ7GssR7ufOt1fD3rUxRctA=;
 b=Aw+qZczgfWWQgt9e+2fS7fU9YhH/W5yai85MOM212GPzjhflW6AsUDa+PwR9LiIBvC
 nZ9ozk0oDli5AAkg6XgrMZ6B3FEiTWM9Ivpk4VNLul6zQ7iL7/2yziVHpjbz3OqYzZTU
 Rl4SdeRX3tKhXF7VWZ+N9JaKir4xb7MwNl0RT/XJwBblJZXFrbPFoWGEdagNMBGCtz0g
 GnBHdKme3LTqsJE3b3bg7qsRTVOSUSRb72nPLm15Z2tsudB4Z3H3NlvSQvHVa2p1ypY5
 sbDj3aVA2FAEjyGGL9R9ZgW/TXJXKQVWTcV+6y53Z6gbp06KY3UIFCSwoj4HhNaQ41Bh
 lO+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Aw+qZczg
Subject: Re: [Buildroot] [PATCH] package/flutter-packages: bump version to
 ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3
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



On 26/03/2024 18:40, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   package/flutter-packages/flutter-packages.hash | 2 +-
>   package/flutter-packages/flutter-packages.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
> index 994434e25c..f124302a02 100644
> --- a/package/flutter-packages/flutter-packages.hash
> +++ b/package/flutter-packages/flutter-packages.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  8276276e050c1ea45787f74b0f8c915b8cf2162b6af8537ffa9886bd423f2828  flutter-packages-947e34ce9fedcdd6750b54eb1cc74b854b49ab48-br1.tar.gz
> +sha256  2e1e19713ac74b6e00a6f5ec516e8ccda5e5ba1fc8b249d40abcfe4cb50dff87  flutter-packages-ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3-br1.tar.gz

  Did you find out why the hash was wrong in v1 of this patch?

  Regards,
  Arnout

>   sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
> diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
> index 4beaa39325..c1e7a14f85 100644
> --- a/package/flutter-packages/flutter-packages.mk
> +++ b/package/flutter-packages/flutter-packages.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FLUTTER_PACKAGES_VERSION = 947e34ce9fedcdd6750b54eb1cc74b854b49ab48
> +FLUTTER_PACKAGES_VERSION = ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3
>   FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
>   FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
>   FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
