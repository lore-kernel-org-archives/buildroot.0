Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D72C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 09:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D4F812E3;
	Sun, 31 Jul 2022 09:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D4F812E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmxeAJR0XzJZ; Sun, 31 Jul 2022 09:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 627E081372;
	Sun, 31 Jul 2022 09:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 627E081372
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21C641BF342
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 09:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09DFB81372
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 09:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09DFB81372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bdd5afeuiGId for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 09:48:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23152812E3
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23152812E3
 for <buildroot@busybox.net>; Sun, 31 Jul 2022 09:48:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l4so10694793wrm.13
 for <buildroot@busybox.net>; Sun, 31 Jul 2022 02:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PErrSUZwd5F16yk4zTI8DpEtYeQgtjmaqxmYcgg8qn8=;
 b=dROJrbf1rjwdXG2mCPoNWCb5vJr+Jfgv2iAmsiVsHAOUXy/+XSXZVuWIvtH9G1BpHH
 Ngn8PCYAVvD7FL2cUGYdXNo02yUHHXIX0uGfdhTuSl/pK4bf+s6vfsLKWne1HobsKHk6
 k4dSCSab//6AxkwUiqQubTGK36uEW5kFgDRbbSPIvRYirB0r+W+2a8KM3zry5eBbMUn3
 XLFJVo4XDHla+MMpqCnJQ6Yz5qd4mWs6WdSY1oFYIi7KPQ9O2qpZHbdpZ/MqiTpXqM4w
 CveQnv5/EwL4XLUHo5PY0kxY3VTFW7SOxlO4QuqXVSh9IqQvtfTcuks0dt5udm7vhgOE
 Hi9Q==
X-Gm-Message-State: ACgBeo1yNlALiTUL7EwJTJodxDnTrKISurOKLE7nUTYfE3BQJEFgZ1Ui
 HcvcG6OfMn7YjeMw37lo8LkUInHtDFI=
X-Google-Smtp-Source: AA6agR4a/f/Uk227pluZSsOhbRwVO3dBsmft5gnbk6k7PWj44GNeL6/9JcceZ0fcqfXuqNUOURPKSQ==
X-Received: by 2002:a5d:6348:0:b0:220:5edf:c3e8 with SMTP id
 b8-20020a5d6348000000b002205edfc3e8mr1872028wrw.255.1659260906042; 
 Sun, 31 Jul 2022 02:48:26 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003a0375c4f73sm10241477wmb.44.2022.07.31.02.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 02:48:25 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 31 Jul 2022 11:48:05 +0200
Message-Id: <20220731094808.1347975-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PErrSUZwd5F16yk4zTI8DpEtYeQgtjmaqxmYcgg8qn8=;
 b=BTARQS5K0FP2AjMMgAP5J3SkXUzYIJTxMDgNfLpP+iqlG7Zginh8+gKV9G2Ltek7LY
 VP+IGm4y2ZXbUq5SNTm05CGi4rpha+M7mawOymLKZk6F1N0UpAasXtfi1ZzxXEM6AJk5
 En8J69cN2MwUuEhhqRRdMlfTp0QsAN51+Gh3/0uvvZGHjru9XtlixjTdeyT48y7H46Se
 ZsYJaWj5vQOz0wOlLAlxaDPEJe3Pubxdk5PWWb0NQerLpINgNbYzDGvhLyP+W5JGLLTE
 Mlz4av2E7b1zaX8eYil0aX+1kVKQRlMN6Vnt2KF8u3yuzY/OP3kJo7yFUaYMd6BUYJGW
 +z/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BTARQS5K
Subject: [Buildroot] [PATCH 0/3] new board LS1028ARDB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This serie introduces a new board.

The two first commits tweak some existing modules,
and the third commit introduces the new board.

Francois Perrad (3):
  boot/arm-trusted-firmware: allow to generate BL2 from RCW
  package/qoriq-cadence-dp-firmware: add install in target
  board/freescale/ls1028ardb: new board

 DEVELOPERS                                    |  2 +
 board/freescale/ls1028ardb/genimage.cfg       | 23 +++++++
 board/freescale/ls1028ardb/readme.txt         | 60 +++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |  4 ++
 boot/arm-trusted-firmware/Config.in           |  6 ++
 .../arm-trusted-firmware.mk                   |  6 ++
 configs/ls1028ardb_defconfig                  | 60 +++++++++++++++++++
 .../qoriq-cadence-dp-firmware.mk              |  6 ++
 8 files changed, 167 insertions(+)
 create mode 100644 board/freescale/ls1028ardb/genimage.cfg
 create mode 100644 board/freescale/ls1028ardb/readme.txt
 create mode 100644 board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 configs/ls1028ardb_defconfig

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
