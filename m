Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D20C4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 10:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 151336109E;
	Fri,  4 Nov 2022 10:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 151336109E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PkN-UOsEt14f; Fri,  4 Nov 2022 10:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC4461071;
	Fri,  4 Nov 2022 10:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC4461071
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6D01BF32D
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 10:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60826410C0
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 10:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60826410C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EtE67E6BACxP for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 10:16:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5CD8409E3
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5CD8409E3
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 10:16:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h9so6439760wrt.0
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 03:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4yXIPrjBfX6DZT7MR3ryPb0yH8IZQkXr5riu1lpmsyE=;
 b=mufPcNQRU+CLYAeYRRItwY+kI8h8IsGQkFK8KWJpqjTcyw98h3/SBRKYrPq4xEk1nh
 fhQOoItRo8bnZuoAyd+pggkoM2x6vPJiDDMWpNcb8BFe2vQN26sP5v8sifBY/t7YOy5j
 eZ4SksVj4Dr1VB6uVsGx2AFb04iCynjO/a2TcJkvMQbviB1raPACdm+R5gu0JqvF8Qwt
 QGtOJTUL4fvQT6Kz03AzcT84v958dKgd+j06+KjM3QYkUB5QJuU7r9TwDCiBaKnUu26Q
 sMLBIUllHn/CkyMZuNQ7Uta878vtuKDsn3Za8nJeuGjIm9a88uGyyvXr0aVdGMhu65gt
 1TZA==
X-Gm-Message-State: ACrzQf20mLQoZtsHd33y526ln7VHzJK0knR7zlypXWxXOEBSuQygQtF+
 CH7LDU4kht2+eQRs0gpGoI9kgEGhNU8=
X-Google-Smtp-Source: AMsMyM4gGvhUqmAsNKQMYnTuqlZEka42LN8fgtYIeaJZ9pl5QCWD+L86LkPw8aEHlVnpkL30cSLM+g==
X-Received: by 2002:a5d:4d8e:0:b0:236:d95e:2a7 with SMTP id
 b14-20020a5d4d8e000000b00236d95e02a7mr15159974wru.408.1667557002556; 
 Fri, 04 Nov 2022 03:16:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6dd2000000b00236863c02f5sm3033065wrz.96.2022.11.04.03.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 03:16:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 11:16:39 +0100
Message-Id: <20221104101639.24364-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4yXIPrjBfX6DZT7MR3ryPb0yH8IZQkXr5riu1lpmsyE=;
 b=J0pnWk7Ix5sOQcRKlciD59eAOTSH/Fs2jtzSw4jPCdWk4Gk4b/eq/dJBRdpAnflych
 uKrqqOrjqXrMAXkSd4U5D4QSmmTo//zv9MoQlZ0H/vrzOisOIFxQP+CMLiJ/VYYl+55+
 PZFJQ4++kXwlk64yM/vS7xHPqq1e+FjqLicO0KNXAKbMwPGaQ8IAwzFH9j8k5xCok1Tq
 uzSWsFNH0hcSqEJI/vXQ0d+R6bUtWln0b5Br6/3yJslOGcyT5sD+pN9uo1q0lx4hNFdC
 FkZgtIDVlBL5nJQk6/qc30lfO2yo4iezX4hnRlTRDb7cujoHk0ytkiEjhui1KgyW9Mz/
 I3Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J0pnWk7I
Subject: [Buildroot] [PATCH 1/1] package/botan: add host-python3 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add host-python3 dependency to avoid the following build failure raised
since the addition of the package in commit
e43da7bb32285bbd41b38a379aef77132d149df7:

(cd /home/autobuild/autobuild/instance-19/output-1/build/botan-2.19.2; PATH="/home/autobuild/autobuild/instance-19/output-1/host/bin:/home/autobuild/autobuild/instance-19/output-1/host/sbin:/home/autobuild/make:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" ./configure.py --cpu="m68k" --disable-cc-tests --os=linux --cc=gcc --cc-bin="/home/autobuild/autobuild/instance-19/output-1/host/bin/m68k-linux-g++" --prefix=/usr --without-documentation --extra-libs=atomic --disable-shared-library --enable-static-library --no-autoload --without-stack-protector --without-os-feature=getauxval --with-boost --with-sqlite --with-zlib --disable-altivec --disable-neon)
/usr/bin/env: 'python': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/91eb6d03ee899bc1034efc5ac7d1fe78961d37ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index b26ee4c66e..b0ebe594b1 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -13,6 +13,7 @@ BOTAN_CPE_ID_VENDOR = botan_project
 
 BOTAN_INSTALL_STAGING = YES
 
+BOTAN_DEPENDENCIES = host-python3
 BOTAN_CONF_OPTS = \
 	--cpu=$(BR2_ARCH) \
 	--disable-cc-tests \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
