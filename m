Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E8CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:32:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB1C60E8F
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFB1C60E8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CC9781766;
	Tue, 26 Oct 2021 19:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gi5QZLg8dUD6; Tue, 26 Oct 2021 19:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0E1481764;
	Tue, 26 Oct 2021 19:32:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BFD61BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AC8040130
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2izIJ8xFr3G for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:32:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41E5D4011F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:32:37 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r12so853364edt.6
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BVQyGPNS67XlOKPgsHS1hArrAah2ufYeFszG26th3aM=;
 b=MD75ZVL39V2QUjXl7WfOE/UptUKerc7RkP+59KFnB3HW9HMNH81JKPodkD73PmIsVt
 IZ0MA5eGCcjYcMDDXVa10u+TcuMEjeoH+Qt3/mYghFKo5qYROKQHx0CZyYcmS+RkbR7l
 qf0NGS5YcGs9bJ7zmuDjuzNpKYdCBD09JUvFHjl48fbiqgeuBFF3VYv6EgDOFV2jcYqN
 h7jIpZp/Lg7W0dZ04f5H7K/CwL9a1OM4DVUhhNlEnI6yyhhaHo16y2DEpxhyx3VlK8bg
 Rj3KPWN3lwuRZ9h1CIgmsjRbjylPYvf7sEaMXOGITMBBP/9/cAoBPWXHa9qFRYeMhuEw
 xQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BVQyGPNS67XlOKPgsHS1hArrAah2ufYeFszG26th3aM=;
 b=nBCGpENp7XpzXqGbyx3V7ZyV7CwiNgXFB+Xk2rAMGuEdubg1ov53cn6ZAa3zhN6fTs
 aVukeE+9lhaVIWdZtNPIQllc3da+NUEzIp0FYd8D6gaKGeHEQ4JHTi+8fPDcQUgq0rRX
 XRPJM9zr3NJTr3ODqxaQpbFc8akg/TMdL2P3FhnCfnFjiKBXCe2NgZtt0ovSXZOdYFV0
 ZMqSi0PXt48ruSr+UibT0EY6jilsSObYmj+LmD67vln9MJSYN6kzqZF/VZdw7uStXKqU
 EljJZOfFUTSQXi2ngEm/W+B29Ki+Z0h/oi3MJ4NBt5dY9VkO4Vo3czaBZQ3ijcR+FpvQ
 Lh0Q==
X-Gm-Message-State: AOAM5324VdgGd06s/szeMVNETOIBPh2+X1mSFGvRmuoiIv4dG+RvqSe5
 Dgd6/DJzt3v+ZYAzONBy3GSYlmeCewToGA==
X-Google-Smtp-Source: ABdhPJx5E1ecFwEB23BKUCXSBaNHpZDcmAj328jPiDiPXVRBdhkv89eKY/MEPQeu8Q62gRDrJlCLRw==
X-Received: by 2002:a50:f087:: with SMTP id v7mr19883782edl.126.1635276755577; 
 Tue, 26 Oct 2021 12:32:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qf38sm3406774ejc.116.2021.10.26.12.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:32:35 -0700 (PDT)
Message-ID: <2d526f1c-ae16-4497-408d-9091140af53a@mind.be>
Date: Tue, 26 Oct 2021 21:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20211017162839.20278-1-dariobin@libero.it>
 <20211017162839.20278-3-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211017162839.20278-3-dariobin@libero.it>
Subject: Re: [Buildroot] [PATCH 2/2] configs/stm32f469_disco: add
 framebuffer test application
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/10/2021 18:28, Dario Binacchi wrote:
> It's a test suite for Linux framebuffer. You can run, for example,
> fb-test-rect that displays random rectangles on the screen. But first,
> you need to enable the framebuffer:
> 
> ~ # echo 0 0 > /sys/class/graphics/fb0/pan
> ~ # fb-test-rect
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>   configs/stm32f469_disco_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
> index 438d32150c..47dbc108a7 100644
> --- a/configs/stm32f469_disco_defconfig
> +++ b/configs/stm32f469_disco_defconfig
> @@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
>   BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +BR2_PACKAGE_FB_TEST_APP=y

  We don't add *anything* to the rootfs, unless it's needed to make the board 
(peripherals) work, e.g. wifi firmware.

  Therefore, I've marked this patch as Rejected in patchwork.

  Regards,
  Arnout


>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
>   # BR2_TARGET_ROOTFS_TAR is not set
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
