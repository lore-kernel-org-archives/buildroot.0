Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78172C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D687161054
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D687161054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 966B661546;
	Fri, 12 Nov 2021 19:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mzvrC1o_-Gq; Fri, 12 Nov 2021 19:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED97761545;
	Fri, 12 Nov 2021 19:06:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 958041BF31F
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84D93826FF
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4TKzrLKmUvT for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 19:06:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99745826E7
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 19:06:55 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so9939053wmb.5
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3FtIdz9G6L9+SnDcOG8GlBosEUYFr1f6Sl9tvJv02Io=;
 b=Ijf9lj+sIxJgVeHTkdtQhdz0XArN7poi4G7Is4dovh+VYSxwGDCKwYan/wtMSWn3SL
 liCN1tk1FuYoOP+2SHoPqysPHXBJ0LJnsnWweMSBiFhEjE68Py8jUrGy/BqYx9yyMI1T
 bCPl6HxJ9DkFurWEt5jSJBIO6KDiZnU8GunQbRN9xfqgprDrqoTZlmQj5UI0DcaEA5IM
 K6samoxzeBBRCEvIY8OdQrIPVsKbcOqiRIJt1Bc7sMZ6VAD5d+u6Jfgiu8b/ohttq0bb
 4WmexA4SuE72Iw8fMKRr4WtLU3tlWBzRBa151OQ2gMGdfIcr0ql4mW5v5azMUENB9dPP
 XTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3FtIdz9G6L9+SnDcOG8GlBosEUYFr1f6Sl9tvJv02Io=;
 b=j0ERJpb+9mHYAS+hxq9rJnhzX//Sp4Mj0fOIlhwMsKVea8osYmq3cgqsuYqvGTzmDv
 KqhT8xRfd/1Kn1e4h1ZALTdrZxtlJ55911vMUmD3IA5k7rfM9f0BC+nIXp8P7z3d0RoZ
 7Zf7t+Rewk2HWY2O5LuCNcYH+Xbq2asjdP383fEcacIq7TJ0p/NjeDFwTR8J96HTtO1g
 O7cS9n1EP52Wmo6gD20lZ66DJRhqPvRD8+86MvbDC7T+LF+AQTSOXGCsOTr25CAs0pqs
 t9H5SkvjKihlkzgzkqpsXuebO+kl03uMmqXv/4bnKygwVyq9mlrqlTTysoR6/AXBvF6i
 P9jA==
X-Gm-Message-State: AOAM531YLoCeaJxr5jVM4n9MiaQuO5vRHqKIcF/cSSA1NoG7HafkrnRj
 1nSzMktviPBHkVWsi2iPWLoF7W6c2x4=
X-Google-Smtp-Source: ABdhPJxTM2OG0SQIpkgQUFMbU84/+6Kn6/+QGwfALIjMlOGbiE8H9UcrLvS1YKqiQUpuxqPsRsM1Lw==
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr37152353wmb.89.1636744013828; 
 Fri, 12 Nov 2021 11:06:53 -0800 (PST)
Received: from atlas.home (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id d15sm9462604wri.50.2021.11.12.11.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 11:06:53 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 20:06:44 +0100
Message-Id: <20211112190650.84234-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/6] rework luvi test in gitlab after luajit
 version bump.
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luajit package has been recently updated to the latest commit in the
master branch [1]. But we discovered several problems:

 - LUAJIT_VERSION doesn't contain the luajit version anymore but a commit hash
 - With Luajit, luvi doesn't work without rng support enabled.
 - Building for 64-bit target requires a 64-bit host for all target platform
 - luajit and host-luajit needs to be built with the same option, so the
   bytecode generated by host-luajit is valid on luajit.
 - iteration with pairs() does not result in the same order since luajit 2.1.

[1] 9450b53c8e06f1b5a75840b82c0f4663a5d75c45
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552605

Best regards,
Romain

Francois Perrad (1):
  package/luajit: disable 64 bit GC objects

Romain Naour (5):
  package/luvi: don't use LUAJIT_VERSION for the luajit installation
    path
  support/testing: test_luvi: switch to armv5 to boot with rng support
    enabled
  package/luajit: rework BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
  package/luajit: building for 64-bit target requires a 64-bit host for
    all platform
  support/testing: test_luvi: make luvi test reproducible

 package/luajit/Config.in                   | 12 +++++++-----
 package/luajit/luajit.mk                   |  2 ++
 package/luvi/luvi.mk                       |  8 ++++++--
 support/testing/tests/package/test_luvi.py | 12 ++++++------
 4 files changed, 21 insertions(+), 13 deletions(-)

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
