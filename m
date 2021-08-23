Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A74C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:13:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723BD613A6
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 723BD613A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C41460664;
	Mon, 23 Aug 2021 21:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xcyk3eS0uZmO; Mon, 23 Aug 2021 21:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E24060669;
	Mon, 23 Aug 2021 21:12:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4579A1BF32D
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 352B080E2B
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erhMqWzVOcm5 for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 21:12:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B669580B29
 for <buildroot@busybox.net>; Mon, 23 Aug 2021 21:12:53 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id me10so11424939ejb.11
 for <buildroot@busybox.net>; Mon, 23 Aug 2021 14:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6ORvbh21K+oPxbcmXjt//Fcs3Bnp0pQ9N0tuc+akzmI=;
 b=ifEb4BKE2lJl3bnpLPqg1m7u0XnFRTPamUPaxhBqWm+JM7GJc2TZ5qk3VRYnCKEwwd
 fWidLTfKapkFfYO02pGlasSfcDubL4MaiYwQPwTpdRKAqHHJKX6eicL8wABxd8g/x6wi
 X74DKMykoSC9Mbw+dJNPs6Ny8G10GbiwqbMHgwtE+JaJkKLI7OrPC7ULtmTg0kKgzZvK
 FzRt0LHbnHCrRX04jfkw7VRJ36ZL+myZJOFjS9NjxFA69la/vibvmGlooP8nSHETbSib
 cVfAYVN3489a5WEiWifnOlVApJsn3BdzLDJebTplzSWkii06AKQ+jc36hILsFYpHS7ZO
 0MUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6ORvbh21K+oPxbcmXjt//Fcs3Bnp0pQ9N0tuc+akzmI=;
 b=qeeHdyF2uISVS3pY/97j6NinFoazgoEPZ8N8RIOl8Syr9QbBZh94VvoeudIfWlTpYr
 gnb9fHjbhWeIxX4vQlyxJjeKhKOgo0xskVTuabpX/bpyacFTdGsOZIahiy8lyw6tdtyc
 5tyov7SdAdy610Znw3SUaMR3tYfNffz/rWgxIr+sPv5a4bV8ET+fx4S9O48m2KN+0++m
 MMODTqKsFOZYjIKnH/RtxRXqp32hsbVUeHasKxZkUDYxNbvTCfJ3XzA21vMyivqq4eeu
 ZaqofQvrxa89YOJzTeaUIsNcmJjoELL+G0o57mi60qv9xZW8NCMptymEsDoDFMabdCHJ
 L0Sw==
X-Gm-Message-State: AOAM532jITzZziZ5a2u8psWGxJyB1AqikzQiBf0iUBJlTfqpozYIK4JK
 V3Iy68fimOAxRJkdWposduXIy/KKZ6YjiA==
X-Google-Smtp-Source: ABdhPJyIAmFdSMNQkVl4EiSpuwOFPPcUmspR+x2ktZ/qaIx7gBtq8YS7pgSna1+sFBf1XRDoPLMq0w==
X-Received: by 2002:a17:906:5a98:: with SMTP id
 l24mr36539260ejq.540.1629753171797; 
 Mon, 23 Aug 2021 14:12:51 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id fl2sm7892501ejc.114.2021.08.23.14.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 14:12:51 -0700 (PDT)
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210821072412.283941-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <0e7a15bb-5f8b-c33b-4eec-06f44f76d1d6@mind.be>
Date: Mon, 23 Aug 2021 23:12:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821072412.283941-1-francois.perrad@gadz.org>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v5] package/lua-lunix: fix sys/sysctl.h
 detection
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/08/2021 09:24, Francois Perrad wrote:
> Fixes: http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090/
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Not the best solution IMHO, but definitely better than the v1-v4 alternatives.

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  .../lua-lunix/0003-fix-sysctl-detection.patch | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/lua-lunix/0003-fix-sysctl-detection.patch
> 
> diff --git a/package/lua-lunix/0003-fix-sysctl-detection.patch b/package/lua-lunix/0003-fix-sysctl-detection.patch
> new file mode 100644
> index 000000000..18656b192
> --- /dev/null
> +++ b/package/lua-lunix/0003-fix-sysctl-detection.patch
> @@ -0,0 +1,24 @@
> +sys/sysctl.h was removed with glibc 2.32
> +
> +Fetched from: https://github.com/wahern/lunix/pull/20/files
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +---
> + lunix-rel-20170920/src/unix.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lunix-rel-20170920/src/unix.c b/lunix-rel-20170920/src/unix.c
> +index 272820a..fa00876 100644
> +--- a/lunix-rel-20170920/src/unix.c
> ++++ b/lunix-rel-20170920/src/unix.c
> +@@ -165,7 +165,7 @@
> + #endif
> + 
> + #ifndef HAVE_SYS_SYSCTL_H /* missing on musl libc */
> +-#define HAVE_SYS_SYSCTL_H (defined BSD || GLIBC_PREREQ(0,0) || UCLIBC_PREREQ(0,0,0))
> ++#define HAVE_SYS_SYSCTL_H (defined BSD || (__GLIBC__ && !GLIBC_PREREQ(2,32)) || UCLIBC_PREREQ(0,0,0))
> + #endif
> + 
> + #ifndef HAVE_STRUCT_IN_PKTINFO
> +-- 
> +2.30.2
> +
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
