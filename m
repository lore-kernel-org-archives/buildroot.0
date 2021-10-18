Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8108AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:47:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C4C60E78
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33C4C60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97556078F;
	Mon, 18 Oct 2021 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TALycXZR_dz; Mon, 18 Oct 2021 21:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D2760787;
	Mon, 18 Oct 2021 21:47:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7371BF36A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E9BB60787
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bby7hK9GESoA for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 21:47:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8461160779
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:47:25 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so532401wmd.5
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=611cEeD1y+SUkBK/5YdjBb4WULGTTBThu0iWRdWSD/A=;
 b=Fn3ZR0itTiZiMAQ9f5YSqhrd8nDfnDE/OGzUX2csM8gnuCHSfHZ0xhDQVMZ7usOSUi
 sXxZzpVRYZAnpwgOzBk2NT4aSbMkwTBHATqgWNVRntHilEFQ/O5lqbsd21AiCsrVI5I/
 /JkU5bet+9nxyVGH9tSTW80IthQwKvBWWve4Ikg3cpw4CsTM12zeEcjr27c3Gb4yCKc1
 ML0Zrx7XqohAFC6YqKtIACsAUqmGgtjt+ZHnjJz7CRSPoAgGVSqns4/AfPuNsOuC1x1p
 t5Bja5KCA5e8CGv48CGHJCzLjqtIi6Mab4zFbo/4Iq66LNb5uvIGAJs1GUYGC+3J1vWA
 PFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=611cEeD1y+SUkBK/5YdjBb4WULGTTBThu0iWRdWSD/A=;
 b=HgpwIc/UVYP4WkeWayFpvoI4b7W3uhNiECSBGqjpj4dhEYK1faIwKa4VBxChwA5QVQ
 9z0Nxr1aAXemBXDfrurdsWgIb/0R4FPPsyhAL+d9qUcSVTCp3Udn8yofUJ+w90/1yTWh
 jiUcQdpRuSaEDBssyN0zlBoaj90PFUpNIdeNUnBodDkahqw95guGHqWcA8lK7C93o5nU
 VOnS1IK/CTbwitJ0NEfCX/faS/aHN19DsLULSqokUZQk3KnjnpuYrCnPoS32/y5wzUl7
 j7Xs0nvkzdDfTF1OXJ7eNXiap61tRXWLuYmNZ9QqswPBdGwAgYnM6XtUHjawyk9UlIAF
 pt9g==
X-Gm-Message-State: AOAM5308CV8WY4Q/G4not0qyW8j0Y9EqhYbZb1LdSCt6FGeeDjyY75Ps
 Ehtk0HZT9fcXfe6oBPthBhdNYEuNkDc=
X-Google-Smtp-Source: ABdhPJwV3eshsbgciIq1iFqlnUhnwAFfy1tg4kK3Sn215DrP5ITW80xEYb9V0/xFOZ2zOtHD1xq9yg==
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr1658129wme.130.1634593643553; 
 Mon, 18 Oct 2021 14:47:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id v191sm535473wme.36.2021.10.18.14.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 14:47:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 23:45:58 +0200
Message-Id: <20211018214558.1514616-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libunwind: don't override
 dependencies
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

Don't override LIBUNWIND_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libunwind/libunwind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index abdec86761..5f6b87b9db 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -16,7 +16,7 @@ LIBUNWIND_CONF_OPTS = \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx-exceptions,--disable-cxx-exceptions)
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
-LIBUNWIND_DEPENDENCIES = libatomic_ops
+LIBUNWIND_DEPENDENCIES += libatomic_ops
 endif
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
