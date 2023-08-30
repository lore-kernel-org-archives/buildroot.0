Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE0CC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAA91417D3;
	Wed, 30 Aug 2023 20:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAA91417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPLgNDlPZrOB; Wed, 30 Aug 2023 20:31:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03F75417CB;
	Wed, 30 Aug 2023 20:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03F75417CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 752961BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B509417CB
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B509417CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_Cw2BpiyC3I for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:31:15 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 543C2402A8
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 543C2402A8
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52683da3f5cso46826a12.3
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 13:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693427473; x=1694032273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mSMKRlw123NvJ5mO190GTHGYErO3DNH32t6IsqaP7TY=;
 b=gsojzWjP4Lf4SsU3Xuy5Bun6y9tiRUvRQTqYkdYIq0vFCuIIL/swhvNbG/xbsDOtru
 jg/6WZsMYYxIFdifG3Eq5ZSNrQ6jrmQme4eW8jP2IjLUPBUwviepWUhquDUVLdq4+YAS
 gqLps4EdjoisbYcAhRown3/jydtptL6C3nTiUh4y7Vtm4rbH2iTi9m5c2Lf+LmctNmsm
 TILMII/1dw4e1uzGhZvZeMFUDHatkJWMUkxxDTdxmdguhO9ygFm3I8WCSCA9YXKr8jfh
 2D67S8pQsXDNPcGUwVrEdY5dzwObQSU54w5Ecdw/Ahf+un/RCf9Rypxez5QAsLzvB+TS
 hxsA==
X-Gm-Message-State: AOJu0Yx4FT8mgkrJ2Os/C6zwD+Gd+97L0CBGEF8p74aBLwvcmbxc5jqG
 X8VDfeHb3M0vY9rKOlYfcb0jaQ==
X-Google-Smtp-Source: AGHT+IGXYCzhbR+P6xyaNWHrky3fqPEOG0RlDysVVKI0wWZwSbGLLMUFBh2EPWavfsE6PfVlhHZeBw==
X-Received: by 2002:a05:6402:164e:b0:522:cef7:83c3 with SMTP id
 s14-20020a056402164e00b00522cef783c3mr2783026edx.8.1693427473031; 
 Wed, 30 Aug 2023 13:31:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 y12-20020aa7cccc000000b0052a3c7c9e8bsm7181671edt.56.2023.08.30.13.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 13:31:12 -0700 (PDT)
Message-ID: <e3f7824f-52a2-5de0-b932-1cbf66f49e70@mind.be>
Date: Wed, 30 Aug 2023 22:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-2-dalang@gmx.at>
In-Reply-To: <20230812192842.135682-2-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693427473; x=1694032273; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mSMKRlw123NvJ5mO190GTHGYErO3DNH32t6IsqaP7TY=;
 b=VkSKKiqvRvbqvbtYPNC63VyCgVu7gnXXCf0oDeE94/zlxmiYL/V6uekPryCxcwMdv+
 bCt5EJNLxTvVKAGlW4NvkAZx3GZYWfpnlpk2T324Du8WqKM/2NdfG7Vnc+ot8mW039zt
 1YC7wkKWTgPffo5rKSO0f8CGnfmZtLCw52owVzg/lECgGzEzfK8npcsX2qKYOAe4pCjq
 oR1gaFW/yD+B1Ts/OLS6hDEHrYaN5Bwra8jOywVGeutmWqwtC3EaDqfpdEt55P554iEe
 1yi7jrwq4SpB4JC47tL933jW0npUmi4i+vUUTo01sCAx9uQ4QGjCytIdtTov/EQhUobR
 ojdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VkSKKiqv
Subject: Re: [Buildroot] [PATCH v3 2/8] support/scripts/pkg-stats: ignore
 llvm-project.mk
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/08/2023 21:28, Daniel Lang wrote:
> Fixes:
> f6eaf60 ("package/llvm-project: new group for llvm packages")
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>   support/scripts/pkg-stats | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index eea900124c..1ac538f5f9 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -345,6 +345,7 @@ def get_pkglist(npackages, package_list):
>                        "package/gstreamer/gstreamer.mk",
>                        "package/gstreamer1/gstreamer1.mk",
>                        "package/gtk2-themes/gtk2-themes.mk",
> +                     "package/llvm-project/llvm-project.mk",

  Why this specific one, and not the I-don't-know-how-many others that are in a 
similar situation? E.g. qt6, barebox to take two examples.

  Regards,
  Arnout

>                        "package/matchbox/matchbox.mk",
>                        "package/opengl/opengl.mk",
>                        "package/qt5/qt5.mk",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
