Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09C7CD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 19:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74CC94053E;
	Sun, 17 Sep 2023 19:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74CC94053E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3szLas0dtI0; Sun, 17 Sep 2023 19:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 127B74056A;
	Sun, 17 Sep 2023 19:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 127B74056A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 222081BF2C6
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAC9560B48
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAC9560B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vCnEKOckK7A for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 19:40:03 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 138B860B19
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 19:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 138B860B19
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52889bc61b6so4610891a12.0
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694979601; x=1695584401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VCySkO93LAFr1rad/JRKK1+AwtEKGtItormaSvAckbY=;
 b=UNkdakNnyUHJ59FtmrP9hS8yLwvJbTgepndxOnYs+n3qs3Z4wed64DFODumBp0cO+7
 VYjK6InmW30fsrd3OLhnL4m/Vnm004As4peQ5PwoFcxD+iUVyTN3l8kT8qlaXb+LbatM
 dWFP+4+k1dei/63K/MVFkHE/jGV3VZxEWt+KkjNfSDAEG6MJgwptfzB7WEcn2Wp/Yk4B
 4S4KJFz2fVRgsjuGUAJILDpTM30euacbPqUxgNfU3Xte9OvqGR8ZJd65ae3X/vI7PDy9
 6fbB2+LU8M9Q/Ov9q7iAJyCEOAdG1REPR1f1NB8MxMRi61mOziCsuD9bw871ye5pQ4R6
 5Xwg==
X-Gm-Message-State: AOJu0YzLn5stdd5Ch7tmFkuPjpnVcfloPHS2Oo/Y9wm5uPjgQfwnbF6t
 NYelwGg6sQ7EfTuGNyJFtvURvp+J5qAaXfAbZE8=
X-Google-Smtp-Source: AGHT+IEezWDUrfiOpwpKiY5icPFhrZ7n1NYC7QQ3n1iK9DqQUiX4m7Vtrf2+lMOrK9LbrpfAaXP5Rw==
X-Received: by 2002:a17:906:53da:b0:9a9:e659:a8aa with SMTP id
 p26-20020a17090653da00b009a9e659a8aamr6204197ejo.57.1694979601082; 
 Sun, 17 Sep 2023 12:40:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a170906199800b0099364d9f0e9sm5369588ejd.102.2023.09.17.12.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 12:40:00 -0700 (PDT)
Message-ID: <7d17acdf-5f84-ddba-40ee-1b5afcc209b6@mind.be>
Date: Sun, 17 Sep 2023 21:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
References: <20230915215211.214167-1-christian@aperture.us>
In-Reply-To: <20230915215211.214167-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1694979601; x=1695584401; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VCySkO93LAFr1rad/JRKK1+AwtEKGtItormaSvAckbY=;
 b=DrsX/fNgToSzos3b5Rz1oEH8S+sye7HrYMHQASqUNTkB5Hbse+zhlp/MhJgP+4AWGE
 lA89guBFj75B+yl7j94s8Wo9R8ww050u8bnpR91D05hkmtq97TMooze9cN483W6s8yz2
 rGrrxXSxCu/wi8oQgWrBs2u3JBDweWrzuMIq6P5k+t9/HbhAZpYbN2gVKsc+WHLFfl/Z
 p7YDRfKQ82l6wxyaF9ditrE/fm7TwsOPu6A9LRWCjyaMN87fhNPMtOEblepkPgsQk83F
 qUiOki3jwBdhWcZccrJdZbLYKxfx2jcRgbMrGK9bJCx7irZ/fR8vcWSK6gH/ajvn/OY+
 BJWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DrsX/fNg
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump to version
 1.7.6
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Stefan Agner <stefan@agner.ch>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/09/2023 23:52, Christian Stewart via buildroot wrote:
> Bugfixes and updates.
> 
> Containerd v1.7.x comes with new features including container sandboxing.
> 
> https://github.com/containerd/containerd/releases/tag/v1.7.6
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/containerd/containerd.hash | 2 +-
>   package/containerd/containerd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index 8404675e30..d5e0ef4517 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>   # Computed locally
> -sha256  b109aceacc814d7a637ed94ba5ade829cd2642841d03e06971ef124fa3b86899  containerd-1.6.22.tar.gz
> +sha256  084a62f78f96cb5fda02221425f14df09d3e0acd093e4d4b3527900e3ff94677  containerd-1.7.6.tar.gz
>   sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index c4a6d854c3..0591400709 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CONTAINERD_VERSION = 1.6.22
> +CONTAINERD_VERSION = 1.7.6
>   CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>   CONTAINERD_LICENSE = Apache-2.0
>   CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
