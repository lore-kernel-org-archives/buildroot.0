Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF203C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B66AF4034A;
	Sun, 24 Mar 2024 15:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1c-NtVbd4o8; Sun, 24 Mar 2024 15:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A529240490
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A529240490;
	Sun, 24 Mar 2024 15:47:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D2F81BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3829240490
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpRs_vTseuNK for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 370F540469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 370F540469
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 370F540469
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:46:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41488f9708fso1507515e9.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711295217; x=1711900017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P37Hz6CWnlwo37+xtM7BSnIRLHYADM5cziZ+433vLmg=;
 b=LFDlisgzMWqqinl8M+3wEhQmm4Rtaeo4w8HK4OuvgCGeVXk884eI/r+90ORRAqVcaD
 60d9TLVdvzH7m8zMr+lgkDz4EMxdCnPsuNc4kDGl2twZS2s0H1RuHMmD60Lk457vU3nh
 4jKjHQ5+Ue+kVSc5eCAj7q11ln6wudDjBtZCRtiS/r7RLYT2RXn27f/f+O2eNZHKgZkT
 dOVlHb/X7zfabEuzhM8lg5QUP90OmtNhSnglkDH/qFCKTd1ll8rzfv3H6AqQUXfLXV29
 M1p07YwxFqLPBcmla2Gv2FGS03bad7m5sKSHWez5b/rIKB6KEfp0z/MFKgiwzfY0YXqV
 5wPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmAK3gQqOo1WLLBxK09IWFXva5V7VfmPtFzLD4RMbSHx1gyb8Ut8YOMIwxb6uZyqLXxSWGnmK5LAPt05w+g3v3hnl7nAk20g==
X-Gm-Message-State: AOJu0YzW5Bk++asHeI/939ISR+7M++yusCiGSrl1PHxTym5OuI+I+1es
 VSC7/mNd44kny3pdUVgJ0MWcNixBw12tRPUN4jY8hzyLtZfdjz6nYZYv9G5sL+44OBks2TrF1NT
 2
X-Google-Smtp-Source: AGHT+IE4K10WSHkaqZQkquT1kjf2wh0Ld2aL6Cy70ck8Hm9iaBCS+RSuNmh9/fFYU6jE8+HxS+IaPw==
X-Received: by 2002:a05:600c:214:b0:414:9d1:d67b with SMTP id
 20-20020a05600c021400b0041409d1d67bmr2774128wmi.36.1711295217231; 
 Sun, 24 Mar 2024 08:46:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fl15-20020a05600c0b8f00b00414881b2ecbsm1926026wmb.3.2024.03.24.08.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:46:56 -0700 (PDT)
Message-ID: <76f1fad4-c120-4d07-b825-3f8283031262@mind.be>
Date: Sun, 24 Mar 2024 16:46:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240315214712.4897-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240315214712.4897-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711295217; x=1711900017; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P37Hz6CWnlwo37+xtM7BSnIRLHYADM5cziZ+433vLmg=;
 b=YOqTo4kLSqPWEieyX5LawjwUMwbIp4u3dqdK9WBoo/YmH52A8d/sfYtBO6MatVPAck
 HPt4IYncUPG7yRJsQG3ktcu3STWUhcV8nHTt2wudZCJk+7qd5oEiuN1iXhAgRzLe3m7T
 LFoBsXu8csxGYFhO97m2vPJPe6N/J6dXZYWSYs38FXkM3WS1lMoizjvI3skNmH5QokB6
 BJLTSwXGVtKq6aggG1amG92WmmMOScfYvWYkStbke+qqeWqSqCFeDq7A+t7b+932f+XG
 G+MSrBOqFm/srBL/52NAorg4qCyrtr2bO5PAmgj2/YDi7252WeAAVJ2c8Q+4RV8GwkYA
 0wZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YOqTo4kL
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: drop README.md
 from license files
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2024 22:47, Fabrice Fontaine wrote:
> Drop README.md from license files as advocated by Arnout Vandecappelle:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240314211117.9103-1-fontaine.fabrice@gmail.com

  I've added a little of my explanation from that mail to the commit message, 
and applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/multipath-tools/multipath-tools.hash | 1 -
>   package/multipath-tools/multipath-tools.mk   | 3 +--
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
> index c1f32e7a3b..03a2867144 100644
> --- a/package/multipath-tools/multipath-tools.hash
> +++ b/package/multipath-tools/multipath-tools.hash
> @@ -4,4 +4,3 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
> -sha256  9c69bb0089aa0b82b10a25095c04a7c4aec6b5bbf0776b7129123c8459fe7725  README.md
> diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
> index e62e85e14d..164d850600 100644
> --- a/package/multipath-tools/multipath-tools.mk
> +++ b/package/multipath-tools/multipath-tools.mk
> @@ -16,8 +16,7 @@ MULTIPATH_TOOLS_LICENSE_FILES = \
>   	LICENSES/GPL-2.0 \
>   	LICENSES/GPL-3.0 \
>   	LICENSES/LGPL-2.0 \
> -	LICENSES/LGPL-2.1 \
> -	README.md
> +	LICENSES/LGPL-2.1
>   MULTIPATH_TOOLS_CPE_ID_VENDOR = opensvc
>   
>   MULTIPATH_TOOLS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
