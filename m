Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA33C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A86306103F;
	Thu, 24 Mar 2022 21:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F6hcynHDIf1H; Thu, 24 Mar 2022 21:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A35646101F;
	Thu, 24 Mar 2022 21:31:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9E91BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BEA96101F
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXda6Mv8RTXe for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:31:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88CEB6101E
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:31:36 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t1so7119300edc.3
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=f/ibd433Ra1EW/VpVOhC4Fxg7TyxkjqtKQmsTAKsAe8=;
 b=Qh2uAMPKjnI5KttMOM0XsCgBo4BpEs/d6pOcNlEFsEpFQd+3QPATjJ/dlMZokQKShM
 6Aj9fdhMBlg/MPmzvdDqWxX4VH7Yi3BrYS8Hgj4dgR2Q4jf3D0xxzvHAbdXAKKRwgiX9
 kX0/BUyB16TG/+WdWz1/sxd8OLHZVa3eLWKJDhXmK9iwzzMk2Wmm6sFUxj/8Vy3Dic5K
 NRXMXhiumPHPbcV1Rxmb0ApcdJMEqk+0PKJcQokkN4sEBmZQJOz386zVobvyduz4Zuwj
 gQz21O9VZlh9u4eqdEypXZSNpzcGNlRlANgFZ/DV+nw4y+MvCFmze7Vmm4jhkIDj+Hsr
 hScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=f/ibd433Ra1EW/VpVOhC4Fxg7TyxkjqtKQmsTAKsAe8=;
 b=esXS7vpJLWU/mhFPLtc9Dq8Pbe4W8HTAhy1+gF8HA/LIvL/MweXD5/La6xg7oH7icB
 IHOO/GfwNQp2ibz0eTINBHth0XSjeIMWwIKgrAAll7Rm5nGdjW5bmTBNLjs+cbBSGz8x
 b57h2/tjGkzuy4mbO7ggryzgwNeYdJ0W6LqjQxI/hNtN0ld9y4Qy1oAuLeeNkXsPyEsb
 2XN46JZxhsED+kb2F6x2k1I/ZcvnYLsfLQYkYTIH8f2AbxBY8OsimEaPtOt/n+sGWNOF
 q3Qk4SGYn9hfWmky7Jd/G8Pj5aU/P1F/0fJMCBulEzfCQMfz/NzB5BEAGc5JrBq/usSK
 iuhA==
X-Gm-Message-State: AOAM5312lvGk9bRW2coa/d8rPFYemHD1o+/QFgmmAl6OvAt41UN2OEwF
 udnTIXNy1MeMEU+OKvlbBkS8pEp21yxtwA==
X-Google-Smtp-Source: ABdhPJw+y45LGHqz9uBbbWpwJZot2KKENvHImRqEXClvi2eYj46zp+s5GV7/bqKheUCCdBbMTI+9dQ==
X-Received: by 2002:a50:d64f:0:b0:418:f142:5d1c with SMTP id
 c15-20020a50d64f000000b00418f1425d1cmr9170471edj.192.1648157494565; 
 Thu, 24 Mar 2022 14:31:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b3-20020aa7d483000000b00419209d4c85sm1901632edr.66.2022.03.24.14.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:31:33 -0700 (PDT)
Message-ID: <b4ebc447-0313-612c-1c63-d8db902e86c8@mind.be>
Date: Thu, 24 Mar 2022 22:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Johannes Agricola <johannes.agricola@work-microwave.com>,
 buildroot@buildroot.org
References: <20220317075909.3705760-1-johannes.agricola@work-microwave.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220317075909.3705760-1-johannes.agricola@work-microwave.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: bump to version
 4.3.1
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



On 17/03/2022 08:59, Johannes Agricola wrote:
> Signed-off-by: Johannes Agricola <johannes.agricola@work-microwave.com>
> ---
>   package/libwebsockets/libwebsockets.hash | 2 +-
>   package/libwebsockets/libwebsockets.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
> index 1761a7658a..f92c66018f 100644
> --- a/package/libwebsockets/libwebsockets.hash
> +++ b/package/libwebsockets/libwebsockets.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  6ece1f422c6d38aabedec2476f2ac12e9aede8691b08137068ad85545ce3ff78  libwebsockets-4.0.21.tar.gz
> +sha256  8fdb1454a1b34cd9a6351beaab237a485e6853806101de7e62bd2bc250bb50af  libwebsockets-4.3.1.tar.gz
>   sha256  5756db345eb9c21cb06dd7cb69c38ec234657a233f9a186b4f5fa453681bd394  LICENSE

  Hash of the license file changed. Could you check what changed - in 
particular, if anything changed about the license itself (usually, however, it's 
just an update of the copyright year). Document your findings in the commit 
message. And of course, update the hash of the LICENSE file.

  Until then, I've marked your patch as Changes Requested.

  Thanks!

  Regards,
  Arnout

> diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
> index c25686d385..152659cee6 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBWEBSOCKETS_VERSION = 4.0.21
> +LIBWEBSOCKETS_VERSION = 4.3.1
>   LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
>   LIBWEBSOCKETS_LICENSE = MIT with exceptions
>   LIBWEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
