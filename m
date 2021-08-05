Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3378C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:21:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D3F60EE5
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63D3F60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37FF660A8A;
	Thu,  5 Aug 2021 11:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cD1eaj3fQ45F; Thu,  5 Aug 2021 11:21:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85CFA60648;
	Thu,  5 Aug 2021 11:21:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F5331BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A03440355
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tM7M2cf5GF2v for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:21:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F047D40138
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:21:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b13so6068283wrs.3
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 04:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a4CXXEIE6m1Tye9hNEPIq558pAfwnLFzXmPtVT6ENQM=;
 b=IjKQ2ka2A8y3BB1Fo5uBum71eYOf0N/5br6akgawrpfhPrEyLlzz/IkngVabU6+jLW
 5mJPlbPg7elXWg5O3aD1F/FCsJIMrncwfBX4ciWSbzqLljNjeiHDbqwGX8etIragj46/
 kt/CqrYnVaC8YEjzmLqjg0y6HhAPjddefmVsWUlBM3UQLiFzPd9Jsn54SLaM1fDcTSyw
 zTaSXJl1Vi9FokE60ycV32S369UJrXn6SEgMaJVJmb4vPO8E7AUMuwURV9VfN9bpqN8n
 Qrvr9+YlkCBPxOijvpzvMCLgAZFI7op4TiAKg0NiE08xT6QUDcVHmCzLfrUIMtq4VJCG
 fk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a4CXXEIE6m1Tye9hNEPIq558pAfwnLFzXmPtVT6ENQM=;
 b=W1tGI1VGXQtvZQzHD0j4+k6l9CtA4rcrVYRSzFpujLgJW9Gy/gwWicgxPtpo0UWXsK
 BTnmqtR8yzlH3oxwZQ6nM/WNOi8Okhh1L0m7mxAkijZITLX+joeFyKMGSaehEUwCl4ho
 rzIgWmf2V3qDtc8+jUHBmYD67XL/gpPPFHC0k8wGOHtP92rHN0X0XjDncxSpECXOKl99
 2YWdX2ubJIc/lr+9oJK84Q8tq8PCbuXnrBmZ7zXyaX/yYJIulsty3dg0hwsiXqCHRycM
 SOjcq7qJjzmS3MjcHAFuca847x3QGcxUn4zharObdLoWLOBugBwcb+F1OzwqtAwercZl
 4maA==
X-Gm-Message-State: AOAM530TFKCXJMgc1aa7IHXUSTb2PdbfUE89ZgbixfKFygF428h3Rjka
 qnJZA+hpsyxTFCe2zmrXosWubCidpE5UqQ==
X-Google-Smtp-Source: ABdhPJxzfOqKnQSkFZUqAfHpaF09JfXk7yiUmBT3p1cwr8VnJKC007QgfE2u7GzyX4DJvPto4g61fA==
X-Received: by 2002:adf:82e6:: with SMTP id 93mr4587788wrc.47.1628162495779;
 Thu, 05 Aug 2021 04:21:35 -0700 (PDT)
Received: from kali.home (pop.92-184-97-185.mobile.abo.orange.fr.
 [92.184.97.185])
 by smtp.gmail.com with ESMTPSA id i29sm5413520wmb.20.2021.08.05.04.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 04:21:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 13:21:23 +0200
Message-Id: <20210805112123.2111703-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libxshmfence: disable on
 riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

xlib_libxshmfence unconditionally uses SYS_futex which raises the
following build failure on riscv32:

xshmfence_futex.h:58:17: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
   58 |  return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
      |                 ^~~~~~~~~
      |                 sys_futex

Fixes:
 - http://autobuild.buildroot.org/results/b3523e35fde0fac04b96a6278cbc6ffdfe56f7d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mesa3d/Config.in                    | 3 ++-
 package/x11r7/xlib_libxshmfence/Config.in   | 1 +
 package/x11r7/xserver_xorg-server/Config.in | 3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 41c90c49af..eb7c1eef46 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -65,7 +65,8 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
 		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
 		!BR2_PACKAGE_MESA3D_OPENGL_EGL
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
-		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
+		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4 && \
+			!BR2_RISCV_32)
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	bool
diff --git a/package/x11r7/xlib_libxshmfence/Config.in b/package/x11r7/xlib_libxshmfence/Config.in
index 710476b357..55cd91d1e4 100644
--- a/package/x11r7/xlib_libxshmfence/Config.in
+++ b/package/x11r7/xlib_libxshmfence/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	bool "libxshmfence"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_XORGPROTO
 	help
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index fcd3d0ae00..4dc15435a8 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -53,7 +53,8 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBPCIACCESS
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
+		(BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32)
 	help
 	  This variant of the X.org server is the full-blown variant,
 	  as used by desktop GNU/Linux distributions. The drivers (for
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
