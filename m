Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2403ACD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC232401E4;
	Tue,  3 Sep 2024 21:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFIcoDV1CWmO; Tue,  3 Sep 2024 21:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84FBC40267
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84FBC40267;
	Tue,  3 Sep 2024 21:10:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 027E31BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3E6F40198
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oElf0ZPAZzG for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85B5E40182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85B5E40182
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85B5E40182
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:10:49 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42bac9469e8so314355e9.3
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 14:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725397847; x=1726002647;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tv7K7A5ZqZRdGIBMHQPUEypJwkk8Xz2TtQospgBJ+G4=;
 b=Ia4JnnlwxsNYNzf2gXCCYj3q8UauJSSCW+ea2rozVMk71ETZcYPNTJVUjJ3xahLFpz
 Br/JuYod89hf12rSJ2vYUl1aEiYxpe9qVy+Mw0tox1OG5zSJCMIaza9cUFjmd1usCjjy
 i8o25vUjgfw77FWrxNpNpbL90rtAJ7+j3eKUNdQcQ2j6uOYMS7YRuHibTSZYfOjNJmSX
 /up0A6BUEUhBHhnfFLsyJLk9r2QUGqX6zLBZyKVVeNo8VGqppadVwptFIQS08y0u9oMM
 vQi3Bd0JYRzM+pNA60t/FUsPjTB/4Iwc/5zEQyzR7fx1pTXScFssvEkFSFeS+Y0YLFJm
 yfUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9TurGxaduWmp6Xe4eoKQ+xFvDQYA8bFqfT4fSAnsU9/YGNV4CbKoO7x9LMPblI8M1LFqe3hJOkRY=@buildroot.org
X-Gm-Message-State: AOJu0YzrDSJvzjUHWoq4/MrlfPq0vt+mZB/jaGVKM5k+FrY+2NEf4Ykv
 rU2zq/459gOYiob/Q5hMA40cdL2eCkPhw2h/9iyhtZDp0DJJ4sWQng2xA4AnnnPmZVNI6pFcQ0Z
 q
X-Google-Smtp-Source: AGHT+IGEoxq4Yo7h2O9cvWq3M/UUO5pZAelWB7qWJznemVxWjeSkkhxhRxRCZQVsdHFlV5JTshMG8w==
X-Received: by 2002:a05:600c:3b8a:b0:42a:b62c:8c86 with SMTP id
 5b1f17b1804b1-42c95499626mr1234985e9.32.1725397847161; 
 Tue, 03 Sep 2024 14:10:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bacaac810sm202426205e9.33.2024.09.03.14.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 14:10:46 -0700 (PDT)
Message-ID: <12031021-a104-4ca6-b4fb-669b6892e69a@mind.be>
Date: Tue, 3 Sep 2024 23:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
 <20240902104433.2561797-4-niklas.cassel@wdc.com>
 <20240903212611.613c6d42@windsurf>
 <a31976ae-fdf5-4a62-aece-52fb70775b39@mind.be> <ZtdsSR6M9nD614Ka@ryzen.lan>
Content-Language: en-GB
In-Reply-To: <ZtdsSR6M9nD614Ka@ryzen.lan>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1725397847; x=1726002647; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tv7K7A5ZqZRdGIBMHQPUEypJwkk8Xz2TtQospgBJ+G4=;
 b=EiU2QZIb0pYz+HwWvKmIVMN7QIpE+7awcfN6e4oFTb0gFiHGEkBgIg34MRyAcFD3rZ
 lVRFjpvgsmBGeq5cpmBC1SmVQTlHYI6Qj0ikJCNXN1j3LCax7xVQlE4WVLGMVYprLsPk
 iPoUgyrmLq8CUg2kdwZsE0yYoAyK8qRIV/QZ5vwy7bpfNmtpLu8sQkWdeAHW/FA1D0rB
 wvP484q8x3B7lAJnBo3CGUk9dr/+ZRrvhN+XSzF1KjIGjsNHaUhHeyyCYsAmMlBUh228
 vk0wPReMHAbsbPrtds/yQ1Cdt3SXMEBsSjIl5jUxjNBLlcOyLIW2fe0B4zJKoFNcusg1
 MlmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EiU2QZIb
Subject: Re: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
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
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/09/2024 22:06, Niklas Cassel wrote:
> On Tue, Sep 03, 2024 at 09:50:53PM +0200, Arnout Vandecappelle wrote:
>>
>>
[snip]

>>   For the time being, I think we generally prefer to have a kernel config
>> that is as much as possible custom for the target board. Thus, we also
>> generally prefer to not require loading modules. Certainly for ethernet -
>> having ethernet as a module makes nfsroot impossible.
>>
>>   So I've marked patches 3/5 and 4/5 as Rejected.
>>
>>   Feel free to give arguments why we should prefer these drivers as module though!
> 
> Sure, we could keep the Ethernet driver as built-in.
> 
> I still think it is a really good idea to enable udev though.
> 
> rock5b is currently using arm64 defconfig as kernel config.
> 
> 
> Just enabling udev shows this in lsmod:
> 
> # lsmod
> Module                  Size  Used by    Not tainted
> hantro_vpu            270336  0
> rockchipdrm           167936  0
> v4l2_jpeg              16384  1 hantro_vpu
> v4l2_vp9               20480  1 hantro_vpu
> v4l2_h264              12288  1 hantro_vpu
> analogix_dp            36864  1 rockchipdrm
> v4l2_mem2mem           36864  1 hantro_vpu
> dw_mipi_dsi            20480  1 rockchipdrm
> panthor               118784  0
> videobuf2_dma_contig    16384  1 hantro_vpu
> dw_hdmi                40960  1 rockchipdrm
> videobuf2_memops       12288  1 videobuf2_dma_contig
> cec                    53248  1 dw_hdmi
> drm_gpuvm              32768  1 panthor
> videobuf2_v4l2         28672  2 hantro_vpu,v4l2_mem2mem
> drm_exec               12288  2 panthor,drm_gpuvm
> drm_display_helper    167936  3 rockchipdrm,analogix_dp,dw_hdmi
> drm_shmem_helper       24576  1 panthor
> drm_dma_helper         20480  1 rockchipdrm
> crct10dif_ce           12288  1
> videodev              253952  3 hantro_vpu,v4l2_mem2mem,videobuf2_v4l2
> rockchip_saradc        16384  0
> gpu_sched              40960  1 panthor
> videobuf2_common       57344  5 hantro_vpu,v4l2_mem2mem,videobuf2_dma_contig,videobuf2_memops,videobuf2_v4l2
> drm_kms_helper        188416  7 rockchipdrm,analogix_dp,dw_mipi_dsi,dw_hdmi,drm_display_helper,drm_shmem_helper,drm_dma_helper
> mc                     57344  5 hantro_vpu,v4l2_mem2mem,videobuf2_v4l2,videodev,videobuf2_common
> drm                   552960 12 rockchipdrm,analogix_dp,dw_mipi_dsi,panthor,dw_hdmi,drm_gpuvm,drm_exec,drm_display_helper,drm_shmem_helper,drm_dma_helper,gpu_sched,drm_kms_helper
> industrialio_triggered_buffer    12288  1 rockchip_saradc
> backlight              20480  2 drm_display_helper,drm
> phy_rockchip_usbdp     20480  2
> phy_rockchip_naneng_combphy    16384  5
> kfifo_buf              12288  1 industrialio_triggered_buffer
> pwm_fan                16384  0
> rtc_hym8563            12288  1
> snd_soc_audio_graph_card    16384  0
> typec                  77824  1 phy_rockchip_usbdp
> snd_soc_rockchip_i2s_tdm    20480  2
> snd_soc_simple_card_utils    28672  1 snd_soc_audio_graph_card
> snd_soc_es8316         40960  1
> rockchip_thermal       24576  0
> spi_rockchip_sfc       12288  0
> rk805_pwrkey           12288  0
> 
> Without udev (i.e. with the current buildroot rock5b_defconfig)
> none of these modules will be loaded.

  That is a very good reaosn to want eudev, indeed! The alternative is to extend 
the linux config fragment to include all of these as builtins, but I guess 
that's not even possible for hantro_vpu...


  Then another question is whether we should use eudev or mdev. We currently 
have 25 confgs that enable mdev and 30 that enable eudev. Some consistency there 
would be nice as well!


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
