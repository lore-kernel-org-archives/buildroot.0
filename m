Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF9CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C5CB8239A;
	Sun, 19 Jun 2022 15:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C5CB8239A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6thzqhbcpuI; Sun, 19 Jun 2022 15:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CE4B81BF5;
	Sun, 19 Jun 2022 15:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE4B81BF5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 803281BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68A8D60B1F
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68A8D60B1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moTvB0D5y6MY for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:44:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6664360A98
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6664360A98
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:44:10 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id fu3so16830264ejc.7
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3OZVA8eiQUP33NXhIquvt9Q10C56fJl0WqeRGxhAZkI=;
 b=B3FabOCUgumJiZGsSXu+9Q12OAfF2nvDSdVCqCDnSOJ0COX8sW+zCPVAx6ehzI+uk4
 r7jqM7+0hH2O0sFJcU9GCMQVk0mgx9jwSyWj5e7C5XyM9uUaHlW9kIkhd6aSKI9y1umH
 ogFAEEvNl314zZ36EtNU1ZeiNJOY7CWQRJHIy89h2UwuA2wdkzSpKn4krnqpjZQF5uZ/
 xsj4otXc0HlMUFejBpLFih7E1v7hT4aDQOTRe8P4fPJS6zB03fVpG7xu0xzX0fkX0PfV
 VGF5Mfs4h2CYYd0a7e/cNrmJMgXTYsDnVEHp06QcgmSKEGSzuaF4i9411UUM5HBkFdsq
 HJZQ==
X-Gm-Message-State: AJIora/jGJOwt4gdrWn05im9kfnCR3FJYPRj8eBUtd80l2DQ9BWsUkKQ
 qntvi66jk8b0inxBHN9qjL55wg==
X-Google-Smtp-Source: AGRyM1sIy/zW9wpwl4Pl/OdXetmBHlemtczmWmWi1wVyP+Y9A6+RdwmL+nHyiILbkRL0FujeqO8/SA==
X-Received: by 2002:a17:906:72d4:b0:712:1fa8:a685 with SMTP id
 m20-20020a17090672d400b007121fa8a685mr16862193ejl.709.1655653448601; 
 Sun, 19 Jun 2022 08:44:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170906304500b0070f7d1c5a18sm4691794ejd.55.2022.06.19.08.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:44:08 -0700 (PDT)
Message-ID: <a4318d9e-79c5-86af-a4bf-a0722d39f1be@mind.be>
Date: Sun, 19 Jun 2022 17:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220613195559.291427-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220613195559.291427-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3OZVA8eiQUP33NXhIquvt9Q10C56fJl0WqeRGxhAZkI=;
 b=eig82sn4Tfyl9oIyErhCHGvByJq2u6vCgYqAu54zV2HuIkD+2X+YOj2GTDbFN1jdyz
 o43shnIpWitjH+hZ8hh8h8NRqFZYTlxmlbkeUPk3IN2RcTIeH8gH+N93SO5eHKbe3uc6
 mKULSWtrHlsVSxZX81inwFUNO1yH8cxVXJOpqTE7CU3VN6haOgMLMST6njjPqNO2ItNE
 6lMD3AuVFxqshsbZx20hIyuumPq3JkXKzKbRNP/2Ac+zSi888A80x03+LsB84dnuFexH
 az0g0pnAeXuBzluzOxPuuU+2Enp6Gt8gfCUrkZdkKyQYGE801rj1IIFAEEQbQ+mQT4X+
 3lnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eig82sn4
Subject: Re: [Buildroot] [PATCH 1/1] package/procrank_linux: fix static build
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



On 13/06/2022 21:55, Fabrice Fontaine wrote:
> Pass TARGET_CFLAGS which will contain -static to fix the following
> static build failure:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/bin/sh4a-buildroot-linux-musl-gcc -Wall procrank.c -Ilibpagemap/include -Llibpagemap -lpagemap -o procrank
> /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/10.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
> /home/buildroot/autobuild/instance-0/output-1/build/host-gcc-final-10.3.0/build/sh4a-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8eccc34c99a75501179fe93a80646cc684261ff4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/procrank_linux/procrank_linux.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/procrank_linux/procrank_linux.mk b/package/procrank_linux/procrank_linux.mk
> index 7e743194fc..415a4e41b7 100644
> --- a/package/procrank_linux/procrank_linux.mk
> +++ b/package/procrank_linux/procrank_linux.mk
> @@ -10,7 +10,8 @@ PROCRANK_LINUX_LICENSE = Apache-2.0
>   PROCRANK_LINUX_LICENSE_FILES = NOTICE
>   
>   define PROCRANK_LINUX_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)"
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" \
> +		LOCAL_CFLAGS="$(TARGET_CFLAGS)"
>   endef
>   
>   define PROCRANK_LINUX_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
