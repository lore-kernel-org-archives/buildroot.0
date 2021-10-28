Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B457C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 06:26:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 701C361056
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 06:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 701C361056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openest.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3744060725;
	Thu, 28 Oct 2021 06:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id um4q81HHxuGm; Thu, 28 Oct 2021 06:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5B4B60689;
	Thu, 28 Oct 2021 06:26:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 617831BF350
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 06:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 507A440256
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 06:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hh9FaeA--3i for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 06:26:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F884400F7
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 06:26:23 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 131-20020a1c0489000000b0032cca9883b5so7008611wme.0
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 23:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aOEIJOK6bpGsb2XtZO1al9dZWdBHd0qlAM6A+Skg6RA=;
 b=mk3J60jp6gcZRBGXZj0POAeys6CnY6X0xNFr+x6WM4ARqeAohDVVg+AVr879f6MAsg
 W1adFH8JxWrCnmzVb3FLiV7i8Dp9ByiR+g1S62sjq88lkv/iiODL1fw1xfsG5hw+kGbB
 FgPsRmmh62wfeOhNgecbCmPsBnWZKcbYpC+zv5FfgLWxiEg7QzvJZkz2MSnYBYKjCoPQ
 OiznfJl2GJPTsJLFqnbcryAHwfXMgXTtukVCMONGl20TlFIyj5yC2P3q3jnMUi1kQRzB
 NcV2l1dOAGzVOJHMBHglLnR/zOvGF0/cinVDIVIyql56ze6XjwjX4xW2IKLc/Z3oxmWS
 9+ug==
X-Gm-Message-State: AOAM533hosbgeZzGq7E9OAwoIu0Ai7HjxURhMM/NU93HBbp5knXTQlb4
 kCfuAG+kFUvqrea/uJKhOiyBeKf2vXU=
X-Google-Smtp-Source: ABdhPJyXeGm7Jx/L0hcFxRFqcwrJtZOoY4Pe2XxK30s1U2NW7I9DxBLt+UwfiyMEcRynwzAq3egwug==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr10432995wml.191.1635402381323; 
 Wed, 27 Oct 2021 23:26:21 -0700 (PDT)
Received: from alderan.numericable.fr (249.164.25.93.rev.sfr.net.
 [93.25.164.249])
 by smtp.gmail.com with ESMTPSA id c16sm1997400wrm.46.2021.10.27.23.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 23:26:20 -0700 (PDT)
From: Julien Grossholtz <julien.grossholtz@openest.io>
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 08:26:16 +0200
Message-Id: <20211028062617.2772874-1-julien.grossholtz@openest.io>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/1] Raspberry-Pi Zero 2 W support
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
Cc: Peter Seiderer <ps.report@gmx.net>, Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The following patch add support for the new Raspberry-Pi Zero 2 W.

I have a concern regarding the previous Pi Zero naming in buildroot, the
defconfig is named raspberrypi0w_defconfig. The commercial name is
Raspberry Pi "Zero", not "0". For the Zero 2 the defconfig name would
be raspberrypi02w, but it does not looks good.

It is also true for the board/ simlink name,config.txt and genimage
configuration file.

If you agree, I can send a patch to update the previous generation pi zero(w)
files names to something like "raspberrypizero..." . Otherwise I will update
this patch with appropriate filenames. Anyway, it is better to have a
consistent naming scheme between those boards.

Let me know what you think.

Have nice day,

Julien Grossholtz (1):
  board/raspberrypi: add Raspberry Pi Zero 2 W

 board/raspberrypi/config_zero2.txt            | 29 ++++++++++++++
 .../raspberrypi/genimage-raspberrypizero2.cfg | 31 +++++++++++++++
 board/raspberrypi/readme.txt                  |  5 +++
 board/raspberrypizero2                        |  1 +
 configs/raspberrypizero2_defconfig            | 38 +++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 board/raspberrypi/config_zero2.txt
 create mode 100644 board/raspberrypi/genimage-raspberrypizero2.cfg
 create mode 120000 board/raspberrypizero2
 create mode 100644 configs/raspberrypizero2_defconfig

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
