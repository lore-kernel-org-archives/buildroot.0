Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676B3C3064D
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31CB081E41;
	Sun, 30 Jun 2024 14:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTbt0ky150CC; Sun, 30 Jun 2024 14:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 427EF81E51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 427EF81E51;
	Sun, 30 Jun 2024 14:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB2981BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A909B60784
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skKP83RDdA8x for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2A82605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A82605B1
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2A82605B1
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:57:45 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42574064b16so12338855e9.2
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719759464; x=1720364264;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8W+IeUSBInpYaS+qbuERxLFNDmjhr0IPRpXZJuCUFA=;
 b=N6EkQXentc6Q8wxAvGAjNmmCS8FtbZmS26JMB/p90PfpXBRIHRM+rEI2wdhO19lapO
 T97eGDUmjS129Nkvnu9VmJd8bO1JipZKY6A1XtNLi8uA08INPcscs9xm37BE2QZObPAk
 ADz1tjycRylEnjY20CBNPC6n8Zv98NdbxVyvDaXZQ9JhaJCFKfYAvrLzGUQGIb9mDE2o
 Xzjfv3HyLKnyn6WoOYu6ZnZvDrU84J01tx5vSVnXmT3WXcUVyWUMktFI2bhZLsklZJ5Q
 dOYgwklMYawN+HimYb2gjz7cYkfHcoBRwhQaoRnTmdXNzExu8aFNaCGSJSQ87TLj9l9a
 v/Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJtP0XKB7cjPn5XKw9VfTyi+JkKSmnhY4IAkzKgn9WLJMHBMVxygeWvlRzAidMRTfJjIGeYasciNBg7QeE25tMrZVUKP0Efg==
X-Gm-Message-State: AOJu0YzqepuVRMLURQ+TwA8HrTkIRlZs8hZFkUaKotDm5Xl9Jcb5jMBd
 9PSVpckieTAQagIsTXxs9ZrUFxm7x676qBJgQ8aSKde2wXN/FU3FGyS2hSzMCKM=
X-Google-Smtp-Source: AGHT+IF7pfXx8z27jZMHfL7Id03+5gIjZfgsORGpib+Lj31uoGyPL/DM6J/BjNQBcGYG1pQisK+I+A==
X-Received: by 2002:a05:600c:705:b0:424:a4f1:8c3e with SMTP id
 5b1f17b1804b1-4257a074b50mr26314955e9.34.1719759463563; 
 Sun, 30 Jun 2024 07:57:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b098b4dsm115182275e9.29.2024.06.30.07.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:57:43 -0700 (PDT)
Message-ID: <ad9710c7-7425-4981-bb71-acbe94a26635@mind.be>
Date: Sun, 30 Jun 2024 16:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20240630123622.3355670-1-neal.frager@amd.com>
Content-Language: en-GB
In-Reply-To: <20240630123622.3355670-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719759464; x=1720364264; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z8W+IeUSBInpYaS+qbuERxLFNDmjhr0IPRpXZJuCUFA=;
 b=VAN3OMzibSx9OrAR+H1fejJTHZRJqSFOt+T5HSzhgV8SZPpqSaYzsldqqgNeffq+/f
 lbvjrV88OEmjtDwuutkbDQAfdVgQDWeEUpnjEvj+JzQ1REsOOpXgD3/fBaq9XL5Cxkro
 AFj63DcXiSVNcPp8S3FjuSs9GLthHfYQVwMtdd6f15nnKSFKRwEdULJSDEIwJVODTWCm
 z3P002F7px1eDx43bPNlINrE9FXFjTO/ZnIAmqb8SUQO9pdw0skRWzdp8MYLWnV9Ljnh
 8kS9N+d/doZatdaFNd1SC7/T8gys1Go0e+am75IsabhI+U7fnn2+aLqcdNiChLr3AkVR
 HsZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VAN3OMzi
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: fix comment
 typo
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



On 30/06/2024 14:36, Neal Frager via buildroot wrote:
> Correct the spelling of the word 'there' in the comment.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/xilinx-prebuilt/xilinx-prebuilt.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> index eb78ed10cd..0ebafd6a4c 100644
> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -18,7 +18,7 @@ XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAM
>   
>   ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
>   # We need the *.pdi glob, because the file has different names for the
> -# different boards, but htere is only one, and it has to be named
> +# different boards, but there is only one, and it has to be named
>   # vpl_gen_fixed.pdi when installed.
>   define XILINX_PREBUILT_INSTALL_VERSAL
>   	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
