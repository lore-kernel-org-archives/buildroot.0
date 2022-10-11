Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D806C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 06:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0154D81277;
	Tue, 11 Oct 2022 06:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0154D81277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZX_fYdXPweR; Tue, 11 Oct 2022 06:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3330381256;
	Tue, 11 Oct 2022 06:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3330381256
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0C811BF32B
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 06:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A46241685
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 06:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A46241685
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oASfaVwX-ZbE for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 06:26:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 693F340869
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 693F340869
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 06:26:56 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y5so19620619lfl.4
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 23:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WLjqisFf22JMBEW8SF3XVrnKfj6LCXbihKWvSivy9Xw=;
 b=1sKdVt1xt8Sc8rLwx7Yxjd1wRNLBXji4Y4s6e5BD5iOCeOsLLSVzHqMJHkazNNIBOs
 gRbZR5isK6p7kYh+Diuv1WPcnXA0Kwa7dOE7OH1HsMoSFsZWO6V5VCchBCITlI0mkJaB
 bCB6305R6rTD0WoJNiDZGlQwYsbCZk8gUwnv3pu2qa9r151qJ+UIJ09Kt/QWowyUjgDq
 KiLxMPEBBKA0Yr/Ey69fJUBjghWXLVzi1uIzWUiE91tCiCwGYOLvpJLi+KFhMjIcXIEW
 SPldC2cPGW+iMl9UCD8gII2/O48m0zFCYD6LnEtT3ZzHPSje7ag3alPEIe33TRL2X6bL
 Rnew==
X-Gm-Message-State: ACrzQf0yza9AMfThxoSeEW3xSO11sJtmJt5vEycaBEh/c913qL38s+9K
 4Hm30CIXj1Q24U3YnLyXFI3PSJ9QHo8=
X-Google-Smtp-Source: AMsMyM4BEFZa81EGsscvk9S+0obZIw9iCM7l6DcZvyTCkerSvp9/TlOvkN+5P+Hibj0IP91Bdsx51Q==
X-Received: by 2002:ac2:4c39:0:b0:4a2:8a13:ad15 with SMTP id
 u25-20020ac24c39000000b004a28a13ad15mr7644065lfq.150.1665469613861; 
 Mon, 10 Oct 2022 23:26:53 -0700 (PDT)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 f16-20020a2eb5b0000000b0026daf4fc0f7sm668826ljn.92.2022.10.10.23.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 23:26:53 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Oct 2022 08:26:47 +0200
Message-Id: <20221011062647.741292-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WLjqisFf22JMBEW8SF3XVrnKfj6LCXbihKWvSivy9Xw=;
 b=pt4GsOd9PKivqEafXS9QZoyrqp0tZtKwnQWoY3KMLN79vRM5nBza7A1c6C+RmGf53L
 XYyq3KbJYvJhyEGHGt0xhr7D4aayNKWm18LDbVD6OchCeoAcwkO2Vb0iPRlHsiXzPEpd
 iMEpjR4PoQjiWBlFm8Rrdpz+8o9qKuziCjegIrieAitZyDX4iHxql4RrNXux7U8aH7Sb
 CCs4U+wB25OAfDRjr/X32r/1NPb6pBnqi6djueTdxn+/lbDD3zISPXzlC0t3HfXQZGVs
 POTyA+WBgCKBDjLigeBQJmXjVz4YDyXlMfcg43zluHOJF6u5qr/b/lakkIrB7VXbUbMv
 FVRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pt4GsOd9
Subject: [Buildroot] [PATCH] package/libostree: select libarchive for s390x
 architecture
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libarchive is needed when building for s390x.

Introduced in this patch:
c6a53ef6e8f9491633b0d494991f94c629791e1d s390x: use 'libarchive' to modify initrd in SE case

Fixes:
http://autobuild.buildroot.net/results/14cc164ab3005be9b3efde57b4bd914414e3acf0/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libostree/Config.in b/package/libostree/Config.in
index 14ae4da4c8..a36e12ddde 100644
--- a/package/libostree/Config.in
+++ b/package/libostree/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBOSTREE
 	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_E2FSPROGS
+    select BR2_PACKAGE_LIBARCHIVE if BR2_s390x
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBGPGME
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
