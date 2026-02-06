Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0AEEB28E4
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E51A6122A;
	Fri,  6 Feb 2026 08:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtspHCdk5dSa; Fri,  6 Feb 2026 08:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB84E61221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365527;
	bh=Mq/RW6UUofNneiDtH7vYIojeSWSdtmclmK0VfrZALTI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gdkrChBBhBzORkCwI4oYaY3yhUv6pFhQhpM11tggOa0wYT10ubryV3xKsGmI/jjMb
	 folxR2Nr4MDiThqqf2vb3f/whGhU0YpCMVm06mYiJfufNP5b1G85hGTSeIHZBKnF9w
	 RfpoqA4aAw0AysbKicol67pASX3+U9RLw5+JPbcYYlfm9Mpp0126CIpUeEpUBK358e
	 WPydmb9MxATeBUtB4pgSLSlJNBEN6flKoAw3iDSczp7tfc9O9ecmH5FFEFPz7OlICu
	 j4rm82897XHBTEb9kcIlZeJrLgvv+exVJVjtBC/fUj5/bcJ8bP+zDoZ/+F+zDzRBMT
	 3bxvgVIHRXV8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB84E61221;
	Fri,  6 Feb 2026 08:12:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 718A3219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F1FE83BC7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3amjy-siiow9 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C635834C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C635834C7
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C635834C7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48069a48629so16563005e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365516; x=1770970316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sju8pWrhsIR1t1jxREVbcNZPGnAxoLzzPisLE5GwiNI=;
 b=WK+iSMZEsQiU+N3yflnG/+m1wHY4eiPmnmQAM5EdapRdsalFXu4WWLWtBauUW+S9cb
 gYU8aIVLuc2wKlctuLSfwhdWc6rsp21vaHCtsdnCgEdSpJpI7Y19+cGaiFRR/rAu3GbW
 mt++04LG5o3tQ8+6w+HFyiGoIAaGv7rkfBBVE/NmLviyVmKfwnm/ffwCcfSnZypLPpLY
 BWZZE8AgdXef0kVVwmauPr2a9xmzu3qnaLmAB37w3Bf3gCBD1Be0uC+QrMvfOvM14TfJ
 hE6vmHEFlxaBpAAy0XqxX/+p1ZPZwlB39bHbKG5Ge/svVsEbs501x4ZjtjOUCM0ugQqa
 kNbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNfKPqOxic+uUqUJfTkyfQMp5WOy1wjA0souu88nh+QjmsTY8vxqFDdqOA+cNMU94FBOM5Pop5QmI=@buildroot.org
X-Gm-Message-State: AOJu0YzAnkOsCVjo3gfYT6nT4ePFKGo3v+vLdsg5idjrwNHBBCsk0tOY
 iaOlGMM8YR2ElSl9mxyGP1iTmUGgFda8sOUagAWH18RWGcwHLhOLekHRqkl2zz2tt4I=
X-Gm-Gg: AZuq6aKOkvU4dGdUGUpwE4neuz6YpPiR1qVR3PnxBOrdTn82t7jTV+A9J0rXOClFehj
 4dLE0KiGf1qrPy2Z7Cs/FoTCvLDcrF2FLh3eaE3qaNEmzK/GJ9oX/6/WecB4+fjiTbVvngjlnV1
 sendAfDeJQNVx4Radx4H0JQ0ihYD3Yym1Ohh/7oahLc2N9s2wz+9qfdg4cWLsNK79AJBjr3f2an
 WbiYHXeS9P25ZkTr7lDLZQvpXGQ140A2XDh0MDJjv62+Hen1pIIR72iV6xkJ2+PLsR+03bf9G/J
 coM57jneZqD+OtRl/G2bskmsxxjZzHWMrajpiJbKH6WaFBSPymSCx5pxMb6UOkl0C87sMCitFrN
 Ut2cTnmX3lsCXtH6H1OBQZkLKvcMChYYGW+OPs1P/odZe6It/2ULY8VCtRMGbdTjxVFdUZFYN5S
 9VU34=
X-Received: by 2002:a05:600c:1e8a:b0:47e:d943:ec08 with SMTP id
 5b1f17b1804b1-48320221002mr24912105e9.28.1770365516351; 
 Fri, 06 Feb 2026 00:11:56 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d7a99asm119370315e9.11.2026.02.06.00.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:55 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:55 +0100
Message-ID: <20260206081155.32459-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122183444.475411-1-dario.binacchi@amarulasolutions.com>
References: <20260122183444.475411-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365516; x=1770970316; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sju8pWrhsIR1t1jxREVbcNZPGnAxoLzzPisLE5GwiNI=;
 b=P5ybPdXYYjulYrHUTsm2n5griCCWFhy/eODqcTpZEMSetvL3QmP0pS9yp3zOI3hlxf
 Q1DrQog+rBc2NDAt1WDIxQGToqd4p316ve1KiEU75Af0+8qC5PRfmiCWHuRAF+3Qhyg0
 mxhCBeSE4YUQGbiYF7RpbcrNI7XJFmM5oULErGWwM+IxvX7+mA/ATboJVbT+FuoXe/vs
 9uNZx8/HZaUv5CUXiSvUOBr4t2DIUK0eSQvKFWDJSM++PIXneHgKnosKYmLYs+gvGY21
 8dcv4eZTs318zrosQu7AYIe/b8/wXyac/fI11kZYsFao2ZCyfsB4FvAneN+LOFpO3nH5
 642g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P5ybPdXY
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32f769-disco: fix typo in readme.txt
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Add a missing space in the "Creating SD card" section of the
> documentation.
> 
> Fixes: 1a1239fd286ec5602e6ea29a1799e26b6254202f ("configs/stm32f769_disco_sd_defconfig: new defconfig")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/stmicroelectronics/stm32f769-disco/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/stmicroelectronics/stm32f769-disco/readme.txt b/board/stmicroelectronics/stm32f769-disco/readme.txt
> index 8f4f79a86138..5b8fba7099ef 100644
> --- a/board/stmicroelectronics/stm32f769-disco/readme.txt
> +++ b/board/stmicroelectronics/stm32f769-disco/readme.txt
> @@ -20,7 +20,7 @@ It will flash the U-boot bootloader.
>  Creating SD card
>  ----------------
>  
> -Buildroot prepares an"sdcard.img" image in the output/images/ directory,
> +Buildroot prepares an "sdcard.img" image in the output/images/ directory,
>  ready to be dumped on a SD card. Launch the following command as root:
>  
>    dd if=output/images/sdcard.img of=/dev/<your-sd-device>
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
