Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45533C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 00:27:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D5E60F70
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 00:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1D5E60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A17CB83F3C;
	Sat,  9 Oct 2021 00:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMfdmYs614sM; Sat,  9 Oct 2021 00:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BD0883A5D;
	Sat,  9 Oct 2021 00:27:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30CC31C1135
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 00:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CD0F60B45
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 00:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwKTC-0sBD1W for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 00:27:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BAC46075B
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 00:27:31 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id g14so9497321pfm.1
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 17:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uNO9ZaTznh1Hf8KZxd4NbXpf9CCnr49iMuFVhcDtgw=;
 b=QmTme8okJK7FCm6YPBm1fD/TIvNcqxC1QZw4U92p7qd674UGSR3Ypp77kEUBi1itZU
 PCqnbjs72h4vPgdUdi8Ir6LGAibfwmXhXAKjz/3ZT+oKrRsj309YEvcPNLSbgedpixNT
 LsYmL2nSFTuLKZ4OLGEWgJkNGeN8BhwHmh0ChsIfR7cuBktSMyVQjYjGikmbOSribe15
 I/jQPiZHCnagowV53+JOP2pcPGwfeTYMLGABfpxSevHr9YqJ4shnD6qj1/jzuNXkr5aQ
 qBZTUnsv7Hv36z5aX+I+5XZM78hkIg22wcVIXTTYunJpmDbmBOPd053Fm5r9iCNf03/u
 TVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uNO9ZaTznh1Hf8KZxd4NbXpf9CCnr49iMuFVhcDtgw=;
 b=KTw2rC+0dpqqomv4gk9at2QcRzaPJHq/2+LFWtGrurCerGoawrPU1qOxOtefTwOOa0
 DrWm8YuLDPAsYLN8xqhtQCK88lJIXBZSckz6DK75BfdT/ZGBlNN/G+P++7XaQtE+u2g5
 RwyQcYnZxzxpYAUbpQOJFpRv6f1VvJZqjay8JkD2xl2KRgOxRS3IhMvo5zFLGX3cAb7c
 I7SmOvRd0WPFW7EM6pQKOixUE57fY1ff/Gg4ys/0VibR7Ivjt5G4VTnCImxKjTW101/0
 pUQhwqGmCNwR1nuNtt54LPfXAdZErZboXmKq2UkjP7hcCrz7Vlbyxid1AAe74QV+Xl9z
 83PA==
X-Gm-Message-State: AOAM532M6mPCEZzy/nt/5h7wnSla8fT6wYIy6ggUIptawOQ4+UskwF/L
 bNpVbQPxWhYOCuv0u9YgSrVcvXS05D8=
X-Google-Smtp-Source: ABdhPJzyz0WlDH6dWEbusR8A0UDlwFvgKIt4l2mJCUQfNVPN7CwobO+/V5btkMAOjRWJMz54elKcZw==
X-Received: by 2002:aa7:9542:0:b0:44c:6db9:f596 with SMTP id
 w2-20020aa79542000000b0044c6db9f596mr12919116pfq.21.1633739250725; 
 Fri, 08 Oct 2021 17:27:30 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id e7sm398912pfc.114.2021.10.08.17.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 17:27:30 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 17:27:25 -0700
Message-Id: <20211009002727.972605-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 0/2] package/nodejs: bump version to 14.17.6
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
Cc: Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes include:
  - Remove the dependency on Python2, as nodejs 14 supports Python 3.
  - Remove --without-snapshot as it's no longer a supported config option.
  - Remove /openssl to the shared-openssl-includes config option, as the build
    system automatically appends /openssl to the includes path.

  - Add a qemu wrapper. V8's JIT infrastructure requires binaries such as
    mksnapshot and mkpeephole to be run in the host during the build.
    However, these binaries must have the same bit-width as the target
    (e.g. a x86_64 host targeting ARMv6 needs to produce a 32-bit binary).
    To work around this issue, cross-compile the binaries for the target and
    run them on the host with QEMU, much like gobject-introspection.

Changes v2 -> v3:
  - Drop the default y options from python3/Config.in.host (Yann)

Changes v3 -> v4:
  - Fill out package/nodejs/0001-add-qemu-wrapper-support.patch (Thomas)

Adam Duskett (2):
  package/python3: Add bzip2 option to host
  package/nodejs: bump version to 14.17.6

 .../0001-add-qemu-wrapper-support.patch       | 88 +++++++++++++++++++
 package/nodejs/Config.in                      | 15 +++-
 package/nodejs/nodejs.hash                    |  6 +-
 package/nodejs/nodejs.mk                      | 78 +++++++++-------
 package/nodejs/v8-qemu-wrapper.in             | 12 +++
 package/python3/Config.in.host                |  6 ++
 package/python3/python3.mk                    |  6 ++
 7 files changed, 170 insertions(+), 41 deletions(-)
 create mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
 create mode 100644 package/nodejs/v8-qemu-wrapper.in

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
