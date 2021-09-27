Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D91AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:35:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20CAF60FC0
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20CAF60FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A34A940285;
	Mon, 27 Sep 2021 14:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWayMnBFyHPn; Mon, 27 Sep 2021 14:35:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEABE402E5;
	Mon, 27 Sep 2021 14:35:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 628731BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD8780D24
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkBJP3ttZ3yI for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:35:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E75E580D0C
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:35:03 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s17so51518303edd.8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TKGZYtUZTHd8KlzZsbJ1MXJKPnBsz6vs6tzOZv9xs0A=;
 b=hCOlO7wHYNp/wwMNCHYluCYcaITHDpKEnONDVkwu1W1NEcsy/Ll0jPlxGdQhku35LM
 MLlAxk6wyw9LOC0/ekQICwbRdYMMGJlfpmqkBeJHSeQA9bm4m+HWtneWmqnfP0leiMVR
 X2U5dZ6cax6l/vc715sQiKVzTGjlvZrEIkDhQpU8Y7u8+LIHX5YEGE9Z0vjTNZKz/hEb
 EXhcxZMoJLy8O22wPDuL3HeK2rgnjsYYniq70WKSbze4gYezWsc8IBIYBheuciUfipZm
 /3xmO2h1a8RFKjupfqWei278J4gv/fGUWiPRK8RgCJyqaA++WdB3T2jaBIFSkbJILmi2
 8Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TKGZYtUZTHd8KlzZsbJ1MXJKPnBsz6vs6tzOZv9xs0A=;
 b=6aFBqWaeuv4lbZJkMHLG/HmNLad1qc/+elIeO9Ov1xEmZjaPIhaFRtR9HSkVr5KIo3
 naVFTbvX7RsAiRAUytWUGHFuDg4s4ey+suLnJj4GjVg1o56M5CKg8P37G5FiYlGuqKva
 yOB0p4TCpXR/tM+yHkCdS4+8gmBoTTol110iFg50nuzFMqMaKX5SNzYprN03DILH2zJu
 F0QcMIKB++yJeqOKfLJE5PKrMRAGXAITQ0+3761PRbk92YZQh0r2Hewc5j4NWg7SisRd
 UpimXPPLBGNuL003EX4wHiRdqytNWYf87dHwjToYi4M4NA055salIVcdJgcSsx0HUkoB
 y1qQ==
X-Gm-Message-State: AOAM5319mNSvsw8Etcot0ie+SsZOa61ZQn1cKKSDNClg4k1nqMLE+8h/
 xB3SHmbhB4mn/80HZXjVqP5h4g==
X-Google-Smtp-Source: ABdhPJw5PXu24WEq9IOTS+A56Lk5Dm0NBGZuMfRu0quA36eOOUK32EEkhF0li8IlbSuj9AZybSr7RA==
X-Received: by 2002:a17:906:f15:: with SMTP id
 z21mr363167eji.177.1632753301988; 
 Mon, 27 Sep 2021 07:35:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g9sm8951857ejo.60.2021.09.27.07.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:35:01 -0700 (PDT)
Message-ID: <fafa164f-8b15-d0a7-2aa9-ab72ef87df20@mind.be>
Date: Mon, 27 Sep 2021 16:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210926203429.261419-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926203429.261419-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v3,
 1/2] package/lvm2: make a standard install for host
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/09/2021 22:34, Fabrice Fontaine wrote:
> Use the standard install for the host, so e.g. pvcreate is installed as
> well. pvcreate is needed for libvirt.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Both applied ot master, thanks.

  Regards,
  Arnout

> ---
> Changes v2 -> v3 (after review of Arnout Vandecappelle):
>   - Update commit message and drop HOST_LVM2_INSTALL_OPTS
> Changes v1 -> v2 (after review of Yann E. Morin):
>   - Use --with-confdir instead of DESTDIR
> 
>   package/lvm2/lvm2.mk | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 3a94aebfd4..70da10696c 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -71,9 +71,8 @@ HOST_LVM2_CONF_OPTS = \
>   	--disable-dmeventd \
>   	--disable-fsadm \
>   	--disable-readline \
> -	--disable-selinux
> -HOST_LVM2_MAKE_OPTS = device-mapper
> -HOST_LVM2_INSTALL_OPTS = install_device-mapper
> +	--disable-selinux \
> +	--with-confdir=$(HOST_DIR)/etc
>   
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
