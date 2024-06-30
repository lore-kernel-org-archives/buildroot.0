Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF84C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A88B81CA0;
	Sun, 30 Jun 2024 14:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0AOuVp87Ayw; Sun, 30 Jun 2024 14:38:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3376681C6E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3376681C6E;
	Sun, 30 Jun 2024 14:38:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC8261BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E355940576
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvsKQ4X-Dyel for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B136B40568
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B136B40568
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B136B40568
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:38:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42565cdf99cso19828805e9.3
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758280; x=1720363080;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b9kFMfsn+AR+I/WW8NP63lfdlsRanxy9hwrvFXtm0Ho=;
 b=nH9UkJJ/sTrZiFb08klGexNSGiVX8N28VuzuFgoC9zvG1jGHwc+ZPRuKE+wtsFLoba
 50+G7fSOg3syK4Avq3nXTgT5lGvbr05Gbg0sJwj82/hlTXyJVH0C8FPpvJPpnH7HLf6m
 UnTiLsLOScLoTMQ8zaeEyzkDfEg3+j+MhytP0nWBGx/I50xYJz6LkvR+PdpZHzvz1JGl
 Z5lznyZn0M0O9+OQ+aX1eye7tpdD1FHx5nI6wLcprFlAcY1Y1BRRylu9+L+Swdaluf8c
 6j1Q7uwcfrXUqMe+WrvtZmDQn+C1kxZAs5Xm0CBiokLnYXWACEcJHK058HXMFi1SVYeS
 HKhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdyJshUlNlwrTjpX6VrqEQFN0b8j8nmGr45G8KHo3JH7WHDtDq/8owbhkyrvTRhwIvQym/cygX5uzCVv2PHSbfniCSKKmNWw==
X-Gm-Message-State: AOJu0YxRoVYblnvK0EzPUneKK3sse0XAIWfLAQpvglKUKqad2jH2IY+2
 58aUtNdNOfpaZQoWcyt2iwi3sDme7lEVDrg66oq1NKowWtm+poTfn9lnfKsweYA=
X-Google-Smtp-Source: AGHT+IG7IcAFHn0mFFUYjJrIyPDwigyILlQIxMv9qmkJ6tuErwzVi3UxqJW7EzsEERgSo9PES+vMKA==
X-Received: by 2002:a05:600c:1907:b0:425:80e1:a6b4 with SMTP id
 5b1f17b1804b1-42580e1a721mr8205635e9.19.1719758279650; 
 Sun, 30 Jun 2024 07:37:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b098b4dsm114659815e9.29.2024.06.30.07.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:37:59 -0700 (PDT)
Message-ID: <f3c3d984-388a-4d28-8fe2-31c1391e7217@mind.be>
Date: Sun, 30 Jun 2024 16:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20240628152105.2233086-1-neal.frager@amd.com>
Content-Language: en-GB
In-Reply-To: <20240628152105.2233086-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758280; x=1720363080; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b9kFMfsn+AR+I/WW8NP63lfdlsRanxy9hwrvFXtm0Ho=;
 b=XlW6S63W9O0RcUpjNxt4Ay7wXRYML3xDs0usHaEVmARmx00HGdOiSA/4cqxQrvGpiI
 60KQeflL94ccZCkyDGSuI7sMC3jNGLrRMXMOtfwB/jtVVl7wLWqVkXyys8teKXFmPRee
 GaMSW69GMzdifWj93gyypz2crqi2b0nfv7paDk/aEXwN26prKefaWv6PRvwgdiQt4XQS
 hGfyh9Jt/lD9zHJ5JLriwB4XPD/UGBOzCnPGX4ERT3t2FwQUtqZYgrFSd2LGNxtlGEBO
 vIYlz6128kllA7SUWac/DzOvcj1UNDmGseq5Qg4XiLhZxjRiKnDaWVz0ceWDPVJucDph
 b8pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XlW6S63W
Subject: Re: [Buildroot] [PATCH v1 1/1]
 boot/xilinx-prebuilt/xilinx-prebuilt.mk: simplify variables
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/06/2024 17:21, Neal Frager via buildroot wrote:
> This patch reduces the xilinx-prebuilt package to a single install variable
> that changes depending on device family variant.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/xilinx-prebuilt/xilinx-prebuilt.mk | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> index eb78ed10cd..0c5456f577 100644
> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -20,7 +20,7 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
>   # We need the *.pdi glob, because the file has different names for the
>   # different boards, but htere is only one, and it has to be named
>   # vpl_gen_fixed.pdi when installed.
> -define XILINX_PREBUILT_INSTALL_VERSAL
> +define XILINX_PREBUILT_INSTALL
>   	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
>   		$(BINARIES_DIR)/plm.elf
>   	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf \
> @@ -29,15 +29,14 @@ define XILINX_PREBUILT_INSTALL_VERSAL
>   		$(BINARIES_DIR)/vpl_gen_fixed.pdi
>   endef
>   else # BR2_TARGET_XILINX_PREBUILT_VERSAL
> -define XILINX_PREBUILT_INSTALL_OTHERS
> +define XILINX_PREBUILT_INSTALL
>   	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
>   		$(BINARIES_DIR)/pmufw.elf
>   endef
>   endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
>   
>   define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
> -	$(XILINX_PREBUILT_INSTALL_VERSAL)
> -	$(XILINX_PREBUILT_INSTALL_OTHERS)
> +	$(XILINX_PREBUILT_INSTALL)
>   endef
>   
>   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
