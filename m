Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43F8CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F41A402D0;
	Sun, 15 Oct 2023 20:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F41A402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fdj98P2FWfR; Sun, 15 Oct 2023 20:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11502414BF;
	Sun, 15 Oct 2023 20:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11502414BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B28671BF28F
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BBB641794
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BBB641794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOMQtvTDrR-P for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:13:04 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69F1D41774
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F1D41774
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso589934366b.0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697400782; x=1698005582;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0I8obKexnZmgClLvLoT6TWDxcVBaGII6+jRpU5K+rZg=;
 b=f8st5YwxarvCss7I0KJn5RXKvOfHcqUUT8q2msbSIe5hTNiMcPDAgj8eZ0mDA2WTld
 aV9z32ofUQ9Eza3U021HHi84S7dEusS3tAD5K+aOOfGOsfxq2FOfAVvQUqUkiac2GJam
 3zrLm+EqN1AzDDC0yFauIkZbSxMzKWlu6uKbavcM0ywQf5TPRpK+iWh3PeJXKjSN3vD8
 RfnUqH0BCaBh9HsWYL120oMLiLzxgbPKy5zblfVlvL4NjdNPCcDT6gOHZP2il8mpFlRx
 u/+ZuHhUXTSoHJGULcC/cHCELhnQVssYdUbXa2QTIozmvC81TocvGfWWsPFkpxt3M4wz
 GOuw==
X-Gm-Message-State: AOJu0YzRvMTuUOVIUfAOOkjsGy6+gvWgr3Fd67ERSh4WoBXLKz15K0Du
 InmjBUCOx47UIQOE1Oq1DIcsABPy83qF/pcFLx0=
X-Google-Smtp-Source: AGHT+IFBFzWSsfIHHG68+xGcMMbILC1xF3K3c5mPvUhqHo/Hawq73zr45aceJzjMTzqKZ9ZTYowVOA==
X-Received: by 2002:a17:907:80c:b0:9bd:a737:eae5 with SMTP id
 wv12-20020a170907080c00b009bda737eae5mr6960602ejb.9.1697400782522; 
 Sun, 15 Oct 2023 13:13:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 my48-20020a1709065a7000b009a16975ee5asm2674735ejc.169.2023.10.15.13.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 13:13:02 -0700 (PDT)
Message-ID: <c4afbd3b-c4b4-c060-4ce4-070f3019e1d1@mind.be>
Date: Sun, 15 Oct 2023 22:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20231015093310.1138805-1-bernd@kuhls.net>
 <20231015093310.1138805-3-bernd@kuhls.net>
In-Reply-To: <20231015093310.1138805-3-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697400782; x=1698005582; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0I8obKexnZmgClLvLoT6TWDxcVBaGII6+jRpU5K+rZg=;
 b=L69jmxkqKPuznD6dnyb2vAJH3U/yuAXQbsF8MR3cifMAGj7YZB4mbCiDVTFbdCPScR
 NztkSKmbxFSC6pGZ5ZoHyCoJ63CJ9bbh4tQqR0RrhTGeueixV7mDbWxZOkOHoUimfVBQ
 /7VciNGpaHrlMSHEg9a7KB42huSKYrcEOwlQbjkb17TzPW03XnfeQy9xIORgFH4xwyEl
 NQx4T8GIaSnmqeqbxisptTlw+uptPjfwLPna9msGGWwhbPjbIIY9IzjEyBMleIEp5A0z
 P1E/k1CjTWbfJIHvat6VFKcALXy8L+72uDymNpeYkstz39IA8kmBBWNTZX630L7OPwm0
 HoSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L69jmxkq
Subject: Re: [Buildroot] [PATCH v2 3/4] package/alsa-utils: Fix musl build
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



On 15/10/2023 11:33, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/5a0/5a03cba08bf24d61c816b8e2f257c18004bad3d7/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  The first time you posted this patch, you followed up with a reference to the 
Buildroot commit that introduced the error. That's very useful for Peter to 
decide if it needs to be backported, so I included that here.

  The other two don't have that information unfortunately.

  Anyway, all 4 applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: removed left-over from previous try to fix
>      http://autobuild.buildroot.net/results/e26/e269f862ebade30cf870d783a1006aba8fedc129/
>     (Baruch)
> 
>   .../0009-topology-include-locale.h.patch      | 33 +++++++++++++++++++
>   ...nhlt-dmic-info.c-include-sys-types.h.patch | 33 +++++++++++++++++++
>   2 files changed, 66 insertions(+)
>   create mode 100644 package/alsa-utils/0009-topology-include-locale.h.patch
>   create mode 100644 package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch
> 
> diff --git a/package/alsa-utils/0009-topology-include-locale.h.patch b/package/alsa-utils/0009-topology-include-locale.h.patch
> new file mode 100644
> index 0000000000..14a059cbf6
> --- /dev/null
> +++ b/package/alsa-utils/0009-topology-include-locale.h.patch
> @@ -0,0 +1,33 @@
> +From 8c229270f6bae83b705a03714c46067a7aa57b02 Mon Sep 17 00:00:00 2001
> +From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> +Date: Tue, 19 Sep 2023 13:14:29 +0200
> +Subject: [PATCH] topology: include locale.h
> +
> +This solves an issue compiling with the musl libc.
> +
> +Fixes: https://github.com/alsa-project/alsa-utils/issues/239
> +Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> +Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> +
> +Upstream: https://github.com/alsa-project/alsa-utils/commit/8c229270f6bae83b705a03714c46067a7aa57b02
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + topology/topology.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/topology/topology.c b/topology/topology.c
> +index 1840ffe..5d03a8b 100644
> +--- a/topology/topology.c
> ++++ b/topology/topology.c
> +@@ -32,6 +32,7 @@
> + #include <sys/stat.h>
> + #include <getopt.h>
> + #include <assert.h>
> ++#include <locale.h>
> +
> + #include <alsa/asoundlib.h>
> + #include <alsa/topology.h>
> +--
> +2.39.2
> +
> diff --git a/package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch b/package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch
> new file mode 100644
> index 0000000000..b5f8489703
> --- /dev/null
> +++ b/package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch
> @@ -0,0 +1,33 @@
> +From 0925ad7f09b2dc77015784f9ac2f5e34dd0dd5c3 Mon Sep 17 00:00:00 2001
> +From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> +Date: Tue, 19 Sep 2023 13:14:30 +0200
> +Subject: [PATCH] nhlt-dmic-info.c: include sys/types.h
> +
> +This fixes an issue compiling with the musl libc.
> +
> +Fixes: https://github.com/alsa-project/alsa-utils/issues/238
> +Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> +Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> +
> +Upstream: https://github.com/alsa-project/alsa-utils/commit/0925ad7f09b2dc77015784f9ac2f5e34dd0dd5c3
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + nhlt/nhlt-dmic-info.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/nhlt/nhlt-dmic-info.c b/nhlt/nhlt-dmic-info.c
> +index 3f6c64d..331555a 100644
> +--- a/nhlt/nhlt-dmic-info.c
> ++++ b/nhlt/nhlt-dmic-info.c
> +@@ -33,6 +33,7 @@
> + #include <fcntl.h>
> + #include <getopt.h>
> + #include <sys/stat.h>
> ++#include <sys/types.h>
> + #include <arpa/inet.h>
> +
> + int debug = 0;
> +--
> +2.39.2
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
