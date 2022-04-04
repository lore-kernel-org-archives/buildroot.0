Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5475C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9448982668;
	Mon,  4 Apr 2022 17:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPWDTDkMX5VF; Mon,  4 Apr 2022 17:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAAF282605;
	Mon,  4 Apr 2022 17:40:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70D031BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F04C408B8
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbEDvQ8K9ajE for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:40:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1992A4025C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:40:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id d7so109065edn.11
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=22daEEHk0Yuc2G420t3JzxjnhHtj+qsDa9cKYk0jQGE=;
 b=KqXJlvCe3WipPIRiN/JOCn0yPa69IFf55nqn+Inn/Jx4/d5m1gvBznC7caMXgY2xXM
 r7RoY3XTMJbkcKwKTxH8fGG0KeP27f+xHG9uUlr7tjMREzM43g9Yktq393arWDLXfrKX
 LFRAgRKRWUtYSfrh2zEvT68r6anEz6ZAZqLeaTXfSRLgZYLggdZaDsj97MkQCqObHa0M
 +IgGRNdrqdDCmUvhzy9it4H+8OelatxsyIysHDA8fLD+v7PxkV2VuSRyBZ9x3jEJ453C
 r1SJEilhr1wzJvBZlglrw+PRkbuWrp3mYdRjI2cXNmxAEZGqzcwZn2cryYYktoFr36zR
 djZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=22daEEHk0Yuc2G420t3JzxjnhHtj+qsDa9cKYk0jQGE=;
 b=cutNyRgjeiJVjypU18D7iXhFozc+WJt2/vVz1hsAJhzU2OQ7N6oK5jAgyL7SN7JF5k
 fWgxga1xzpb6ideOiNSWQuRLHYtohG1MUqBMI+YeUO8t10FCjXyiEH3u9NhUn6NyVktf
 GbaRrVGyNOzEE8R6CBxYdkpessGMFYWrPSGzoS+maQKE2J9c4NJuA851S7s8Xawpk1qJ
 p5M8Zhs5xRPiG/leW6WxjEG8oVk+kZ2TZF8b5oTUyynP90ufsdUDEzCc7TjBy2ZwVFJ9
 xsFJSXLQZJbep0qUXs6WwQgyvfu2pQJb/u6e6PXhAmX/IzFV6VQXQEM04AWBxkQipO6A
 kwNw==
X-Gm-Message-State: AOAM5305bF4VygLASI+hTy3JK77P6gc384rykU7zEo6R9FFM8bgHKTl0
 1owmUXfoVY+LrSbMFy48XzHQiA==
X-Google-Smtp-Source: ABdhPJw+irc56f4v8g6bps/MO8cZE8OkhT5eZ5WX+WCy0ZYTs3ZnJn2VsOm/xG4DroquHv0c3th5sw==
X-Received: by 2002:a05:6402:5162:b0:419:2d46:c8c3 with SMTP id
 d2-20020a056402516200b004192d46c8c3mr1377539ede.150.1649094052349; 
 Mon, 04 Apr 2022 10:40:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a50ed16000000b00419366b2146sm5776515eds.43.2022.04.04.10.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:40:51 -0700 (PDT)
Message-ID: <07bc503d-9fb5-19a9-bf1a-7ee26b6ada0c@mind.be>
Date: Mon, 4 Apr 2022 19:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220331212925.39676-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220331212925.39676-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ed: bump to version 1.18
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



On 31/03/2022 23:29, Fabrice Fontaine wrote:
> license has been switched back to GPL-2.0+:
> https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00002.html
> 
> https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00000.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ed/ed.hash | 6 +++---
>   package/ed/ed.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/ed/ed.hash b/package/ed/ed.hash
> index 90d467d1f3..36f9b9c1e4 100644
> --- a/package/ed/ed.hash
> +++ b/package/ed/ed.hash
> @@ -1,4 +1,4 @@
> -# From https://lists.gnu.org/archive/html/bug-ed/2021-01/msg00000.html
> -sha256  71de39883c25b6fab44add80635382a10c9bf154515b94729f4a6529ddcc5e54  ed-1.17.tar.lz
> +# From https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00000.html
> +sha256  aca8efad9800c587724a20b97aa8fc47e6b5a47df81606feaba831b074462b4f  ed-1.18.tar.lz
>   # Locally calculated
> -sha256  f03a12bef9dfb7281864a0dd965166d4f4ec7a66633df2bc72fa4363e57de02c  COPYING
> +sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
> diff --git a/package/ed/ed.mk b/package/ed/ed.mk
> index 975cf3be10..645cfb7696 100644
> --- a/package/ed/ed.mk
> +++ b/package/ed/ed.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -ED_VERSION = 1.17
> +ED_VERSION = 1.18
>   ED_SITE = $(BR2_GNU_MIRROR)/ed
>   ED_SOURCE = ed-$(ED_VERSION).tar.lz
> -ED_LICENSE = GPL-3.0+
> +ED_LICENSE = GPL-2.0+
>   ED_LICENSE_FILES = COPYING
>   ED_CPE_ID_VENDOR = gnu
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
