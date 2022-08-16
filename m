Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC71C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 09:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B445812B6;
	Tue, 16 Aug 2022 09:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B445812B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eN6jd-Ur6QdB; Tue, 16 Aug 2022 09:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BC988131B;
	Tue, 16 Aug 2022 09:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BC988131B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 062951BF39C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1D2D812DE
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D2D812DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kf7uzwFurHIx for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 09:48:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F629812B6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F629812B6
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 09:48:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id d5so2687669wms.5
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 02:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=OFwKkC+pPIkOKywlIA9+hJRLVSexjnndsREnPVBh2l4=;
 b=fMNqDxMxfQ8wf7L4PGUIoKIVnWUoS2PgvDpFmmvgHU2D/vnujurcHPKSzIpn8FU0rf
 bY48A7R/Zs7lK82Sva4PG8J9ex/erkk0HHKlfdKvuUNG/HAoXj8zkHwxRCsXSC6RFwAb
 324FBawWldFdnhGPINs/dM9W6nL6pTaq3LirTGLHTMOK3MwhZbAs9yHAcp+OPxgtrvju
 hv6yRpgknYrWUdIm/4/+W48tQdYRDwjVEt6S5L1/WNS6gDoLaykzB1OsiFqEF/kKtmpp
 bZBoGlOAI17AMrVfHlOPVGyP3MXaMKQmv4pPzj2NiSy1WqzMr9Pu0fOPe5rigwyAluFF
 1pAA==
X-Gm-Message-State: ACgBeo3jNZ/mCX8HjgO2jNVHv72J+Xl1dBF8hvQs3yfa5EhZWPx8A+5g
 vF5b51FWUQ1k5Kr8+tFzuw8PutMtLns=
X-Google-Smtp-Source: AA6agR4D+nc3GFs8kC4WPFZmzDejLQzX4iSH57aqBjD86OCDI/rFEVmBT48QfZ3LCfi+4Ks8YGnwjw==
X-Received: by 2002:a7b:c8c1:0:b0:3a5:bb57:e7a9 with SMTP id
 f1-20020a7bc8c1000000b003a5bb57e7a9mr15606788wml.18.1660643331013; 
 Tue, 16 Aug 2022 02:48:51 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a05600c1c9000b003a5a5069107sm12701049wms.24.2022.08.16.02.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 02:48:50 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 11:48:29 +0200
Message-Id: <20220816094829.377-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=OFwKkC+pPIkOKywlIA9+hJRLVSexjnndsREnPVBh2l4=;
 b=bRKXkqEyUo3RvEu/fFyE+FHCHFh9BKFqORHDyII+kkSfvKYcQWlq5Cy0hNL1efznca
 ffd9pjO3dgnoVDhWpeDNNFqyZ1sAUzIdTESGjGFA9NcOfNEhP/VpXkjTz8Pk7M/jSy/1
 lFZIRweBqK9aLCpfPg3MC3lmvlK0sAsSWYM2jiqhORQJcF5BFnJnZ2pSnJt40b3Vz22K
 jcg731k0hNlcAMpFPRWYZd4F6iLBPSHAG/ugo//lVUiQUwFWXgqeRFl9gtGolnKf/Zcz
 qTMQMsYWlP7NeiPTPNdpVWkjDzIXk2OxXTb94fHiTzyzWsms73mjhNycOvxVOvJ0ErM/
 aWJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bRKXkqEy
Subject: [Buildroot] [RFC 1/1] package/pkg-meson.mk: handle possibly non
 existing compilers
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
Cc: Yann Morin <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To avoid populating the cross-file with non existing compilers,
we tie them to /bin/false

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
I only managed the CXX and FC case,
assuming all the other ones are always there ?
---
 package/pkg-meson.mk | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0632ab21cf..f246a126d1 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -68,15 +68,29 @@ else
 PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
 endif
 
+# To avoid populating the cross-file with non existing compilers,
+# we tie them to /bin/false
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_CXX),y)
+PKG_MESON_TARGET_CXX = $(TARGET_CXX)
+else
+PKG_MESON_TARGET_CXX = /bin/false
+endif
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
+PKG_MESON_TARGET_FC = $(TARGET_FC)
+else
+PKG_MESON_TARGET_FC = /bin/false
+endif
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
 # Arguments are variable containing cflags, cxxflags, ldflags, fcflags
 define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
-        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
+        -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
         -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
-        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
+        -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
         -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
