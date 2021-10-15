Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2A6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 18:32:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEA1A61037
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 18:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEA1A61037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83963606A0;
	Fri, 15 Oct 2021 18:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKhtKBGFM6fH; Fri, 15 Oct 2021 18:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4428F60BC3;
	Fri, 15 Oct 2021 18:32:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86CBA1BF8A8
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 18:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D44A4085A
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 18:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yojc369l3Ipc for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 18:32:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A5FC40854
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 18:32:24 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r7so27992522wrc.10
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 11:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XyR+PeahGJEeIC4KQn5g5okfBHSENL3GhaZFTGiO5zY=;
 b=EUTh/U4yrFHYkR5TRFd56qQlQK2Jc9r3wHqspS02j1ylNEQSvbe4ObdJhFtfPEaKUC
 wAl69D9DNvVfVcUPswT15Gqr6kG+1HsGhO8rF1RBr5r0Q+XDf7L42jQ3k/Kf8qLYfttA
 NXs7DIZ0J5B3X1r1Tx6unk/JmA/9Z41rN74fc9YTHQB5kPnMjRwGFkOmSSvRCdECckEJ
 YClIHrl4RQsEQzq8mmX/6QEAWQv48M3w36sB2pPxpwnL+3fCZv8cvj07VcLGTOpuz8dC
 qzYZcFWN5sbt73Jjoe9wkfO0h7BATllFUDlH1rH++hJYbs8BBv/1umIJvaSOnI6IydgF
 JsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XyR+PeahGJEeIC4KQn5g5okfBHSENL3GhaZFTGiO5zY=;
 b=LPzHSNFCLNbMzPG5jhVg3Li90nBg2t/5MWb3yFhuJqRl68YZq9cEhkB9DnQ5xmpIG2
 NXVeTC2c7N7mN8dvaf0p8aKJYzE2ife2I6PjknPJVZ+smx75Qc3Q0ttxlMk4m2Zqf9Gw
 tkCfY8seBoloASVuk7cpq82EIQQZ61qM7jzkk2ZJXmSbxLI/2g/WH9fRuqq8rx5uUE/a
 ojDkThWd9FEa+VY9f9QCiEGGJtgAnL4wDzkAxC/4rBQy0Aop+V4aH0RfDbD4CR53+Ncg
 VBMywhY53yd/2+V9xnqbsLsKWEb9e/q1Gng1FXcE93uAExeyCweD9+BNcYFYRC4hxJpO
 Wyiw==
X-Gm-Message-State: AOAM533cKpNtTI6tQNOU8N9D8eAkn+nMSAD5ENa5ew+ujgrKI1DWgjNn
 cry6FzPGTx4AwMsy1HOEdKyL6/YP4+U=
X-Google-Smtp-Source: ABdhPJz33BO+CI/UPNXpN2V8fvM3KCEJz7fI75YVUTah6E7Fv1yUyfyD/SmMnm6qdSMW8b+nTAidXg==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr16546323wrz.408.1634322742146; 
 Fri, 15 Oct 2021 11:32:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id u5sm5617737wrg.57.2021.10.15.11.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 11:32:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 20:31:13 +0200
Message-Id: <20211015183113.1149243-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcamera: raspberrypi depends on
 arm or aarch64
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a dependency on arm or aarch64 for
BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI to avoid the following build
failure with one powerpc64 toolchain since commit
c09f126f570355b8ec134724b453300a4811339c
as suggested by upstream in
https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/025796.html:

In file included from ../include/libcamera/base/log.h:10,
                 from ../src/ipa/raspberrypi/raspberrypi.cpp:18:
../src/ipa/raspberrypi/raspberrypi.cpp:64:53:   in 'constexpr' expansion of 'std::chrono::operator/<long double, std::ratio<1>, double>(std::literals::chrono_literals::operator""s(1.0e+0l), 3.0e+1)'
/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/powerpc64-buildroot-linux-gnu/include/c++/9.3.0/chrono:502:32: error: '(1.0e+0l / 3.0e+1)' is not a constant expression
  502 |  return __cd(__cd(__d).count() / __s);
../src/ipa/raspberrypi/raspberrypi.cpp:73:56:   in 'constexpr' expansion of 'std::chrono::operator/<long double, std::ratio<1>, double>(std::literals::chrono_literals::operator""s(1.0e+0l), 6.0e+1)'
/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/powerpc64-buildroot-linux-gnu/include/c++/9.3.0/chrono:502:32: error: '(1.0e+0l / 6.0e+1)' is not a constant expression

Fixes:
 - http://autobuild.buildroot.org/results/49caebe7ef7e3d63de49e78d5d6839dd0aedf10c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcamera/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 92c17df849..c510e34924 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -40,6 +40,7 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
 
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
 	bool "raspberrypi pipeline"
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
