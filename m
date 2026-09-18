Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F13C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F92E81301;
	Fri, 18 Sep 2026 17:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKj3tW7KtTVw; Fri, 18 Sep 2026 17:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7D25881334
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789751894;
	b=ivpcZdsTnEAqbykGDLbs6JhywzfEM66XqdkZclIHmCMbUG1+cl6HoFVXq8PjL82//Qgg
	 6rEtcX8SnuxfwDaOyPfkk4ONdIrAUFr4Z2Kx2k7vSLWrOVOnzHCt3n+NocQ8KV5cIxtRM
	 u7ej3gOBTswBvtf1KYM5oWAcae9kNzArzNaPdvGRZ+94Kr9qjq95MX8t4TFJ0MyDc7m4N
	 27IoF3FGqPC11bizj9UVLDYCO9oazkcXQiDptTWzJ6ny8S/LVMl1jj0RL0BRULNQzygiF
	 pzYD8WOjLkxr1lgEr27soAwVCvXUjAgOOmfIdS4n83WL0vGFTCbGSDyC8Zb3uvwngjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789751894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:Date:Message-Id:MIME-Version:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5qHFYm/DC0pj0lRNEV7OE3jIq1wHtgaAWrjjG6X2Zlw=;
	b=NJJ9A5DscglTugho6Geq6mR79ahVWKE4bdz3CqPNzceeH4yIsyiBgtIVvGrz8Ofmu/4z
	 XhQzXEODCP7lJK/qQPGFFDWzbpU6XLB1Shmw4zgoES4HUHGgAo2uSxbyPZsyiILz3dn09
	 b2lQyqrnbwiGdcj62gJdBYRw5ZLYXYyUtt2MZSMwHJDXpnXjqpHXeVGRri/RW+aoMuJfU
	 XokIl7Sm3BRfit02UboKlFiAKT7kIr2TvYy8KXihlVvNGZ8XYNgtRblQNRwGczPk2DV3p
	 Fr4+scOwPt2gBg9YIBHFB00RbZtd4I66aKXXF2FBZhiWOk9o2CgCBrqFqQQPD9Inrgg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789751894;
	bh=5qHFYm/DC0pj0lRNEV7OE3jIq1wHtgaAWrjjG6X2Zlw=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BbsHFtMtEvSLr93FHHlPkSkgNfK9py+40XMl7Uqdhr8BUGGnyBchZRSU7zBlTYuzl
	 NYGKCkm3I6k98vf9aNrF9C1gsbAdHsxO2c5fBsLlcpjg5TcqGc5qcc38IqEqQwnvYu
	 PawixJlgyFWN2pu8cFyDRCL1xPsoy3eKCbFcS8ISycwLwmNm3mYda7GHH/wB+TFMfs
	 ruze0qHLcg7FHjAkCZb7wI6E5DGA6ofJzBphrTBooDuYXP02teVtqrSFbWJGIukGZu
	 kp/EwWvyvvmMHLbDS5y/hcUuRztTFTU0ijDTnwGELaOxvzzui9obAEKbGmzrcWFyfU
	 kfgun/wjdRBjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D25881334;
	Fri, 18 Sep 2026 17:18:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E97BD237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E712360D76
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XcrfKo5WGm5 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:18:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C96DF60D62
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789751892;
 b=ohW2J94/yyfY7UJsRn2sf7cm8c0gEArroM+09CkM5gTaexJnCyBPX6DRt0JZMhB1W+95
 HnDatfia5suAzpFfpxCBseU2Kl/W/yWClV6or4/wzWN7hag0YIntmXcEqwctIFXrsim9w
 ABkgp8zafp3XyzWslQTLXanEB/+oSn3Xvl2Oac/0YOEDrzHxEUklK6h8Z7i3sPs394Pxz
 kb/ifYZ0FVve16wdS7Ji5Kzuo6hFYRpbRlig7OnbX78U0RWbgefyIJNsgaV81ScdOxaQj
 Y8ngIyhvZfVryOfQnyMDpB6GibPw4q7977Va4F7YZbjBCCuKBEz2mieuIxD+nwxAjLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789751892;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
 bh=iZ3KZHyETHxNmQamY/trdjl8fJtpmKGSn4EBwOOEfOk=;
 b=FHlCNOCDu9jyxVsR1IY/evT9oKHpPNXqFI75bUuw6iM5Q9ut4i05dLv1swh+UaI+1GKd
 eJEAcYBRRHFTF5R1uanAnHaQnMnQK0zvxkYg2hNhirfZoBhlIoQ29KZtgCS8cpMqmOzJg
 tXkIqsnU1dedeUt7I5xTYW/bB/+qTU23Vojg+z3UPctV3T4rP3zC6cjmW7yYu72QefOXI
 IkVtguQCLiVD1FsZim/43ixtMTpgXUAOt4BY8TzJWVVM5fjbckJINbxmxzHVuVs0tF4DO
 mD6LoLjzedY0LHC9TibVT4oS56747T21t4WcLDHOo8OGwxh+gcmz7bn2M0W7c/0yGOw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pWUSMEH3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pWUSMEH3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C96DF60D62
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso8646185e9.0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789751889; x=1790356689; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=iZ3KZHyETHxNmQamY/trdjl8fJtpmKGSn4EBwOOEfOk=;
 b=pWUSMEH3ADBU5r4gKxdfT5FosYkPZZbNHlcexetRX09Fyv/lGngWqQoSFOVRvA8tDm
 ycdbWGSSiUhNja57kyfGA8hajRCIt4WVhQGqOGV3C86QZyq8Zfrsz9RLmUHq4cXA2HY9
 X47tbcV448HgxrG9aNgQs3tVDLKJwaLKq1xeNg1/pgMgpLIIfKkU53Ol9t0xrBfWPogy
 1BF551/ZHKoQWV82ml5Qe27q++434qoZKlsfZgDz4BF3jCZWWjid1wBOS/JeSObfQ7I2
 2wYF6k3IJ/wJ5BokFON3A/NkozDYP1CfTbYW6UmylQSz5aPEW4hEhv1IG1jK40I5YVMD
 I9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789751889; x=1790356689;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=iZ3KZHyETHxNmQamY/trdjl8fJtpmKGSn4EBwOOEfOk=;
 b=lJcz2MBf28kkIaBcE2UQ40rbnaQTnMbWpVZY7Sft3+Po9ItLyKuSu7aU/pPl4e8iJ/
 uS8pWLNOz+N9h/eQwybInp2m4jbEFRTbdYx28El/4lZqbNVVN2nKlGhun4UaKvM534mn
 rLKrgqJU1e8bB6FwlbjafW8suOkUhlJlQ2S/wZRK0l1QKhoCENZAxAUdkTmMBxHevL4M
 31VbPyfMBitVrRfAz7z9ebn/hWnlXlUot8hgAJf5XCb+SFWpD4G7PI7LhRxpkLGCURky
 Q2BubArEyiA5smCZQgE/W+rDyk2ubok5sOE+WRsDZkLmJRyUixH+/QxSXU861EaF9Alb
 eDuw==
X-Gm-Message-State: AFuF++mgCOjPNNv7ajT4BrF4Wdj9SyuoxO3ZZWxqX60cM9ZpSs/sEjZp
 9B+iLJkeRGSWTZ33YHo9aCqpVsJ0yaRr/MqhsDi6YgOUCpXv/Iz1KxIT
X-Gm-Gg: AYBFou02w/ZEeNvGKWw7cGUxBnlckHurgFrhCXoiwxeQy5ebwirmEmgpd5EXBupGjsf
 5lCLC2meSR+DLEqKKKTq82yatpbWdOJ6OhN2NkqZKTBg8gCGhECFtqnoXTXbwQ5bCPSYTsuive9
 RNLTCv+vJkpp58y/DDICZMUtE4UF5V/dIbsidLjiNdnUiE6KyO/DW5HDqgKoC7Y0ZpqnEYOV40k
 hIH6EZts6iWizFLoMRf7QO6HrAz92ORVrqQr2iVi4/FPUuvkr9IF2iAqv7C45V4LKbnWUC8u2Mo
 JJZ6kfoqhXm3vdurqEkZ8oArkk6E+BDpp5rNPbzwOpmsM9rv1HvkIhrcQlyNp869dHTHlRInb8T
 It6Q0MuaVhM12DV1iouYLn16PonEeC455z5YQSQ2NxmMSzSaA6IQZCjp+JKsMVwy9l/+SiZZHSr
 gia+1vvYcIC1dfb/EfHXWSqv2LbWXVLqWf1L6km03hgDSqAOa1jzZDvqWm0XY+lqjjb010vmyS6
 vQMzg==
X-Received: by 2002:a7b:cbc7:0:b0:49e:6052:4587 with SMTP id
 5b1f17b1804b1-49fbd200263mr94363885e9.19.1789751889085; 
 Fri, 18 Sep 2026 10:18:09 -0700 (PDT)
Received: from [192.168.1.138] ([139.47.34.204])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724460964sm133880f8f.7.2026.09.18.10.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 10:18:08 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Fri, 18 Sep 2026 19:17:34 +0200
Message-Id: <20260918-rock-pi-4b-v2-0-89120500a1de@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBAFf8Xs2ZoWCxRPxt8gHEq7wCpQ0gLRE
 P5dwKvHSd6bWSCgJwxwOy3gcaZArt8gOp/ANLqvkZHdGCIeJTwTKfPOvNhATJZMGZXJyqrsKhV
 sh8FjRe9Dlhc/DlP5RDPuhvwxUWu9c2OxjxsKo/OfIzyL/fK3MQvGmRZWS0Qex0l6rztN7cW4D
 op1Xb8LD5JlwQAAAA==
X-Change-ID: 20260917-rock-pi-4b-8c894fd89348
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jean-Paul Etienne <fractalclone@gmail.com>
X-Mailer: b4 0.16.0
Subject: [Buildroot] [PATCH v2 0/3] Add support for ROCK-PI 4B board
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
---
Changes in v2:
- brcmfmac_sdio-firmware: account for Thomas's comments regarding cp
- Link to v1: https://patch.msgid.link/20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com

To: buildroot@buildroot.org
Cc: Jean-Paul Etienne <fractalclone@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Jean-Paul Etienne (3):
      package/rockchip-rkdeveloptool: new host package
      package/brcmfmac_sdio-firmware: new package
      configs/rock4b_defconfig: add support for Radxa ROCK-PI 4B board

 DEVELOPERS                                         |   6 ++
 board/radxa/rock4b/extlinux.conf                   |   4 +
 board/radxa/rock4b/genimage.cfg                    |  22 +++++
 board/radxa/rock4b/linux.fragment                  |   6 ++
 .../rock4b/overlay/etc/modprobe.d/brcmfmac.conf    |   4 +
 .../rock4b/overlay/etc/network/if-down.d/wpacli    |   1 +
 .../rock4b/overlay/etc/network/if-up.d/wpacli      |  50 +++++++++++
 board/radxa/rock4b/overlay/etc/network/interfaces  |   9 ++
 board/radxa/rock4b/overlay/etc/wpa_supplicant.conf |   3 +
 .../overlay/etc/wpa_supplicant/wpa_action.sh       |  20 +++++
 .../lib/firmware/brcm/brcmfmac43456-sdio.clm_blob  | Bin 0 -> 7163 bytes
 .../patches/linux-headers/linux-headers.hash       |   1 +
 board/radxa/rock4b/patches/linux/linux.hash        |   2 +
 board/radxa/rock4b/patches/uboot/uboot.hash        |   2 +
 board/radxa/rock4b/post-build.sh                   |   9 ++
 board/radxa/rock4b/readme.txt                      |  93 +++++++++++++++++++++
 configs/rock4b_defconfig                           |  62 ++++++++++++++
 package/Config.in                                  |   1 +
 package/Config.in.host                             |   1 +
 package/brcmfmac_sdio-firmware/Config.in           |   6 ++
 .../brcmfmac_sdio-firmware.hash                    |   2 +
 .../brcmfmac_sdio-firmware.mk                      |  18 ++++
 package/rockchip-rkdeveloptool/Config.in.host      |   9 ++
 .../rockchip-rkdeveloptool.hash                    |   5 ++
 .../rockchip-rkdeveloptool.mk                      |  17 ++++
 25 files changed, 353 insertions(+)
---
base-commit: 267db9da2b4ed1b0e70e46d97db717ca6aab5d47
change-id: 20260917-rock-pi-4b-8c894fd89348

Best regards,
--  
Jean-Paul Etienne <fractalclone@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
