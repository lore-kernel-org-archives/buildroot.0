Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7842EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0714B41545;
	Mon, 25 Apr 2022 19:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADfgPRDxNrY5; Mon, 25 Apr 2022 19:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C82941296;
	Mon, 25 Apr 2022 19:31:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E30171BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA7FA81D0B
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7rkvaBozeDO for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:31:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB9A981756
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:31:50 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g23so12673616edy.13
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=OYT7VOOlyIH23/6RblLZxRtQ7NZ4n3whsmYA3hN22Ks=;
 b=ggxQvCEGsagn9/SskXTFAB8U1AmbUmcaZiMKnDbWPi+gamDB/VItDgUaCOFrtKyZbg
 48F+KxxOqgDo/su1ZP9b2auIXBP5m+ZaboJTyLx7QLSW4FEKjZoRLDHtQerBFOSKzyWc
 UjyMHmHHpYvut7BqnHumJvCkI3hplPbjCWP/DpdhQ+5jdxgCZ1s4AKuF3xLjh105yPid
 NYYOhthN9haJk/Od7B1VeJ7jrODuw29wACvWHIv3WvjP8+EwxOze+qcDvSE6u8Jh3P4W
 lOoG/ZIN4sAwEyiua56AEJVHaidKNcGIkIL4wk3qxn+S2emyXe2+Bgv8glwi3trxs08k
 lsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OYT7VOOlyIH23/6RblLZxRtQ7NZ4n3whsmYA3hN22Ks=;
 b=eBMpp+vJQgehCmRHaXj7UQB+DlRZm2hbx90Yi77kELHNRX81tok0xuEznki+XH29JH
 jPCgjYx0mThp+VzLIPZqNRY1MTrUInIfxk9M6zKOGCZGk+Jiz7FIj5jVmzR7EOYWKbmD
 TWqI1ZCcgXfUrqPr581Obnj66SXnxFLrRYd/+NsswOJQ/dX8g44DFECjkXXuZeDgmZ/X
 mu+TOMdenNWV3jIMPinW9AOhlCIMeco7zNIGnXPb9BB9CklbUzuC9kUx4A90GjZ/8FQB
 ng7i6L2oAYhb5kpYM+ySMWTQ9Ox8CGsjOoyWfsfPOwptbowv6keDMCc0/I4MbfJIlDLJ
 cTWA==
X-Gm-Message-State: AOAM5316RioRv6RliS847F1QAZiG0H2nwHx8DsrmdjMBj3nTIbS1f5Z8
 DlZ+Gbg/pqF4PZBQ1d5luTnJnVR0+aRsrg==
X-Google-Smtp-Source: ABdhPJzbX/zZQcOUbbHgU410sQ0cZd8W3x4VM2L2Nwb+MuBXoturM5YFRD7r/lg/Rv+DX5Bupd0y6w==
X-Received: by 2002:a05:6402:51cb:b0:424:1ecc:81da with SMTP id
 r11-20020a05640251cb00b004241ecc81damr20774966edd.55.1650915108687; 
 Mon, 25 Apr 2022 12:31:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a056402231100b0041d98ed7ad8sm5052677eda.46.2022.04.25.12.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:31:47 -0700 (PDT)
Message-ID: <1d3f65e2-4de6-0268-dec5-467307a11290@mind.be>
Date: Mon, 25 Apr 2022 21:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220422185015.3486540-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422185015.3486540-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.36.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2022 20:50, Adrian Perez de Castro wrote:
> Bugfix release, with the usual flurry of correctness fixes, and a patch
> to fix the build with the accessibility support disabled. Release notes:
> 
>    https://wpewebkit.org/release/wpewebkit-2.36.1.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wpewebkit/wpewebkit.hash | 8 ++++----
>   package/wpewebkit/wpewebkit.mk   | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index 1e1aa62117..3923c32111 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.36.0.tar.xz.sums
> -md5  b7b951cd7f6eb4a8585338505ce71234  wpewebkit-2.36.0.tar.xz
> -sha1  904629a9ce3a4ab67d47315b008dc3152d504205  wpewebkit-2.36.0.tar.xz
> -sha256  096aa9f87d9bfbfc80f558388a86721cdcc508b42ddef10bd270aec9aee96d5a  wpewebkit-2.36.0.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.36.1.tar.xz.sums
> +md5  7ba1c7fd0f67891ad137d11cac12f7a9  wpewebkit-2.36.1.tar.xz
> +sha1  0918a4daded01f42e65ec02a69f21cd6705311db  wpewebkit-2.36.1.tar.xz
> +sha256  ec83d8b2f8c3479ce9950d69440f3b9876ab70200fe6f4e07686054a0cba5723  wpewebkit-2.36.1.tar.xz
>   
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index df29d6f170..9c9a9a2838 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WPEWEBKIT_VERSION = 2.36.0
> +WPEWEBKIT_VERSION = 2.36.1
>   WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
>   WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>   WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
