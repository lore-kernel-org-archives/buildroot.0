Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B22C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD58D40AAC;
	Mon, 25 Jul 2022 22:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD58D40AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuvSMlOoDRJX; Mon, 25 Jul 2022 22:26:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D52B040545;
	Mon, 25 Jul 2022 22:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D52B040545
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52D751BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C15460E57
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C15460E57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OtdKBOf__DU for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:26:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B4D060D4D
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B4D060D4D
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:26:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m17so17565077wrw.7
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Xqv75Npyar+e2hcYirCLqoCjPyiLZuIfRmPuf5W4c7I=;
 b=ThNl9+rzYdO9cAHDmS95y3jjXsz6RL1qW+Xw3Pnn+EBkKeMeoEP48G+lOxLCp0H8vN
 ll40caaM39kAo5RnAvww3ljAN8Sm/CZjuep4kma1yW6qjzNv9bR3voxcO3wcCSnlTPhs
 hes2GX5eG/X4gI2n0FwRZoa8YqRT+dIMZMqRdgfThImEwKlnRleKqIawTpwJA6oO15+V
 fFDS4wg6qgvS+tXnpSa6Ze+0RQ+gjKT9U8p7XAeBpPZ6BdC4EfAFQ3dI4rneqXR3jLrD
 5u7VlJMdyNqrRauj5cfckrmNoDNaSFsxi5+7ApLyyTZaO6mWTdHTTD7FvguVwAosb3bE
 ELFA==
X-Gm-Message-State: AJIora+yk3PnOfEaVNHtz9r0U3L2iBvWs4EtbHhr6ll1IJt7Q7ekTJKJ
 J8+bRcJC95gJeLIGdumhMc+WU5yS/7L/aA==
X-Google-Smtp-Source: AGRyM1uXQmq4pI7aOfM1AskYe9yFqT2P/ro6CO0rXkW2xm1wa+Xge3xUr3hC1LV2Fofwyi22O1I7/w==
X-Received: by 2002:a5d:6da4:0:b0:21d:7e96:c040 with SMTP id
 u4-20020a5d6da4000000b0021d7e96c040mr8751483wrs.417.1658787985292; 
 Mon, 25 Jul 2022 15:26:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c1c9600b003a2e5f536b3sm20418610wms.24.2022.07.25.15.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:26:24 -0700 (PDT)
Message-ID: <d31d455e-9e34-fa04-9f25-755dfee7fe67@mind.be>
Date: Tue, 26 Jul 2022 00:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
References: <20220725185349.473792-1-marcus.folkesson@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725185349.473792-1-marcus.folkesson@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Xqv75Npyar+e2hcYirCLqoCjPyiLZuIfRmPuf5W4c7I=;
 b=TveXxCwFsOtSJiLb/M4ZKaguL458WV4rFtEp2MpP5H7lAc7//874dPDkk6w4iEPBxq
 62s947hS8/D2f+2Ab9G5OKEQcEfEtS+eU6RZcUM0Dip9ZesVA9Y7ztdLrIMMXG0bzLbg
 jFgCIEgBGvFAj1cwnkpITW+34NA0DQfzxGCezZN179lgLKOu7NxUa0jQpeUYwJrmuteQ
 FsKM53s/M2qMQLvtgmoypIYDPIJPVk0oCquaywptQJ1Dd7leB4xZXuyyIA6GsqpBvTWi
 TkDSqSVuiTLUWJubQZGgW/aylHlgkLZrnZfuTQwy79ANp1lXW5IgHadCIL4o6iCeYD5H
 JV9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TveXxCwF
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2022.5
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



On 25/07/2022 20:53, Marcus Folkesson wrote:
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libostree/libostree.hash | 2 +-
>   package/libostree/libostree.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
> index d85b82f35c..6839d5439c 100644
> --- a/package/libostree/libostree.hash
> +++ b/package/libostree/libostree.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  14bbd351a95066f68c3b283e0bd0ddd03562e862af66f6f6d894c6c328d7eb81  libostree-2022.4.tar.xz
> +sha256  914c4d993bc111d7dd30ae9721b6ffe8ab56eb1fd6e81b097b09f400cc1b053f  libostree-2022.5.tar.xz
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index 3210ed3707..e0c955bc9a 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOSTREE_VERSION = 2022.4
> +LIBOSTREE_VERSION = 2022.5
>   LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
>   LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
