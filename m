Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E9CCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15F2A41499;
	Sun, 15 Oct 2023 18:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15F2A41499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVFT1HRyXVzJ; Sun, 15 Oct 2023 18:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78FE04149E;
	Sun, 15 Oct 2023 18:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78FE04149E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5D41BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 346A46117D
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 346A46117D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uie8xXy3Xz9N for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:53:36 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD70761173
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD70761173
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9bdf5829000so296426466b.0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 11:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697396014; x=1698000814;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6z3ZyoqwD+Fwz4FTX6Oq7x+yFYaN+8N2mo61m6TewfE=;
 b=rCWMizUTemQGHnfrR4YTpg/2fhtI40UDQHXHHrxwh3MDvEGPrcQ0OanuF0dd+B2M1t
 ALtjSEMldzIErBfTjF8goh+WuNYqHgND5zM4apdDnA4J1JZSd3iZSgJt0msOHAv4g/Df
 vP4d2ZolyiqPO6PbkvDo9h86mCqAFGQUaWCnJgHDaeP9G4mhhGcJxNdIZpCzKj2WwFpZ
 DhS2hLQMx5jsAUmjw8PCYgCq8RYsrG/5r3/v9KYCNjx5HkRrn8okdo5YjpKe6NNMJMZ6
 oril5wKjFnuvlJUbN2Z6sBk2HyKnA1mQRiasEHX34zBkFgKZa+89ra6+3jWc4hs495SD
 Bj1w==
X-Gm-Message-State: AOJu0YyIfxJVyMKwFi4nG4zWU/EjO8f3EfWWol41fixgx9JURU74kPmJ
 zQZUQAFlgylcpKn67qj4PFj7yGV2U+kMnBYNfZ0=
X-Google-Smtp-Source: AGHT+IGzsZ91lrkQQyOmcanACBR3fPxIU1cCTl37jtRqnorGvibKXnvon/PcJC/y1JPZutVtvdn+cA==
X-Received: by 2002:a17:907:849:b0:9be:a170:81d with SMTP id
 ww9-20020a170907084900b009bea170081dmr3818580ejb.25.1697396013838; 
 Sun, 15 Oct 2023 11:53:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 26-20020a170906101a00b009929ab17be0sm2611948ejm.162.2023.10.15.11.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 11:53:33 -0700 (PDT)
Message-ID: <4fb78d21-73ee-d85f-8b53-12b4777c941b@mind.be>
Date: Sun, 15 Oct 2023 20:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
References: <20221125123801.4233-1-wdouglass@carnegierobotics.com>
In-Reply-To: <20221125123801.4233-1-wdouglass@carnegierobotics.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697396014; x=1698000814; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6z3ZyoqwD+Fwz4FTX6Oq7x+yFYaN+8N2mo61m6TewfE=;
 b=Xs8jraH7gwVPU3CRCaf0gVxM+15TlwaMdP6DON7J3syK2qHrMyJEsdrZzOiuOlEYwX
 BOd/YVegRsoQiy/QhmOiexWz79GG1CaqywdkB5yygG6vX5cykB/r7VT51ZfjMNEyMKny
 9gJECZ7Q6r6oj2GC9UxVQ1VQLb31E7YPMMYe8/4UDHElQzbtpX4IFcf73Dw9pJ76KgCJ
 +XVnU5S+gVkj1Lc41UOx0taug5R8/QL0oxI8Mwm/vF5B1beHneCerhrlciDbmTjGAfnm
 NzAikkPX97e9F0XG61M5jr+nSTPSr6ZW4Ow6EVZ+aN3U7uiI/F7CsFxm38g4gZof8Dgs
 o6pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xs8jraH7
Subject: Re: [Buildroot] [PATCH] Properly note many dependencies for opencv
 modules
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Woodrow,

  The subject of the patch should always start with "package/opencv4-contrib: ..."

  Applied to master with that fixed, and one more fix...

On 25/11/2022 13:38, Woodrow Douglass via buildroot wrote:
> Also, add myself to the DEVELOPERS file
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

[snip]
>   config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE
>   	bool "face"
> +	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECCT
                                        ^^^^^^^^^^ OBJDETECT

  This was detected by check-package (but perhaps at the time you sent this 
patch, that feature hadn't been added to check-package yet).

  Regards,
  Arnout

>   	help
>   	  Face Recognition -- Face recognition techniques: Eigen, Fisher
>   	  and Local Binary Pattern Histograms LBPH methods.
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
