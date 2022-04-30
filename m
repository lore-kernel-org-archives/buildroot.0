Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC3DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 15:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5139940335;
	Sat, 30 Apr 2022 15:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HeMauurm6-s; Sat, 30 Apr 2022 15:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BDA74088C;
	Sat, 30 Apr 2022 15:52:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73B6F1BF28E
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62132607F6
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4GD-swySwiO for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 15:52:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B62360784
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 15:52:02 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a1so12199776edt.3
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VWehrI4eeJshNZBEM7JApAytlTv9KKDmbGqbt/UnEho=;
 b=DoyScHmFK241MQ9tNCT7X04Yuk4oZK1nnOCFj5K/nL9EWhhZ4cOPmVMEUWZ2eQ70yl
 CyhU/poTxucEa43o7Y2ZYxOEute/cNjm1YrUIkB6uj5xfgeswrlKznp8nds2+rp+NFb8
 SewxNnycOjJk3j6uK82bWwuncxII9qlYHZ7XpzS8VwZ2hHxIAWMkBkPpc8V9jBC0Uw9O
 Ajf2mr5BVqi3s2u58YDxKvWUzuXZNoL5KSwG87JRrrWW8TYsBfmqdI81UPnOXN5z/97o
 5VZFZ8vklehBp/PnZxjQif2VIsfuHgfwLTG5Xd13X2qbAxSva6069Dne/GvrVS0wY5XJ
 fmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VWehrI4eeJshNZBEM7JApAytlTv9KKDmbGqbt/UnEho=;
 b=vdljPxuQ6+ux3WTIrcmT+I8WVZ7speLoveq7t+6EhcB1wNdNkQBB4Lrte4xKG0GZiv
 P2kHS8errNKyh61T7v/dcf6rvViY5Qem1asiu8gVAJ2fm8ESI/G0SgBZ4BDhzfOTNeoO
 un9wPuYqc5uD1VCxdQEdpo/SZppC58hHu5uPBVeD98/e+PzL3djfa9GqNLQBGBKz+o5e
 xCY0ciTh6X9uAFENFFwbvRQfubwXIYQ1TdZxeT+ECESo5x7ovgSXKnYMpW4XnFOvZ/fZ
 2MxeUPnyTZLuxihOGI1/KGzw4OmO7EbrgL8AMEhgYik1PrXJopenMzex0aocoCveGtVZ
 B3YA==
X-Gm-Message-State: AOAM5316eE4WzxbflnWubecDa+kRJnVxbNMrp6dfplgKqIar9E5HGlvm
 rTI/GnjyuNAECBDi5iwGcEs53g==
X-Google-Smtp-Source: ABdhPJxH9Qym43g/LC0mjlnfQjdoh5QMfv7huV1UOGbfeRSOWeYnUTyX0VQaH3vmslbyw7niuwDPxQ==
X-Received: by 2002:aa7:cac5:0:b0:41c:c1fb:f5cc with SMTP id
 l5-20020aa7cac5000000b0041cc1fbf5ccmr4812562edt.219.1651333920664; 
 Sat, 30 Apr 2022 08:52:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 zd9-20020a17090698c900b006f3ef214e25sm1747147ejb.139.2022.04.30.08.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 08:52:00 -0700 (PDT)
Message-ID: <103621e3-e9ad-d6fa-c35f-a96e615f2153@mind.be>
Date: Sat, 30 Apr 2022 17:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20220425144213.3937-1-dariobin@libero.it>
 <20220425144213.3937-2-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425144213.3937-2-dariobin@libero.it>
Subject: Re: [Buildroot] [PATCH 2/2] package/libmnl: add myself to DEVELOPERS
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



On 25/04/2022 16:42, Dario Binacchi wrote:
> Add myself to DEVELOPERS as maintainer of libmnl.

  I've changed the subject to "DEVELOPERS: add Dario Binacchi for libmnl" 
(because 'git log --oneline' doesn't show authors, which make the 'myself' look 
strange) and removed the body (which wasn't adding anything).

  Regards,
  Arnout

> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1bb90f8f33..4ddbf5d533 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -654,6 +654,7 @@ F:	package/xinetd/
>   
>   N:	Dario Binacchi <dariobin@libero.it>
>   F:	package/davinci-bootcount/
> +F:	package/libmnl/
>   
>   N:	David Bachelart <david.bachelart@bbright.com>
>   F:	package/ccrypt/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
