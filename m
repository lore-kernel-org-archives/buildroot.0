Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB475C433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 18:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D9134043B;
	Sat, 26 Feb 2022 18:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4TUHpohWodti; Sat, 26 Feb 2022 18:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF0D14036F;
	Sat, 26 Feb 2022 18:15:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DDFF1BF281
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A1E840A00
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ka2ejkTgr7U3 for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 18:15:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B3E5409FA
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 18:15:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id r10so3450680wma.2
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUzMZEik5ppmvv1RIZvS8tV2JB1KHDi9yp2N2sQ7WBo=;
 b=RQsM50T7hPyx8A+I4lDewCk7titK0NBzLMRBWmf0/t2PV5VNS+lIU1i7QdS8yooZX7
 n6mDl2yTRZj50uT1jSNZ072MntXEmzaYvNkb/ZMGS1798Egprddd9cynLw+8YmZe/CEd
 D55CQsfrNqPAX9H7tt2Pv5WkxXU9O9v89aJTsH3uuW2AdQL5gE0fduFarSqsPIgD/BmF
 U45F9C0UE/By766We1u9L80pZfeb1cTP1L11Rv5gARSu5h0s+locRM11/saqQl3Rr3Xo
 DmNbzuoIDlRlxHlu5v4tq5jzcumIW2Ef2bQmYKepgIdB6lSKpET/BJYCUo81yxiNwFKq
 Uk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUzMZEik5ppmvv1RIZvS8tV2JB1KHDi9yp2N2sQ7WBo=;
 b=xJR72KkRxO2M0v+1zDfv6iZz/eare4SRRiPYUoEYQXYdgKo4mTBHMTyNQ4/ujAI2w5
 uPtmfrB/ZbsSFIVNeJ4j8jbZE6q5hgnZAWG0KibAN5dxGKrGlE8PV1wlMTekvubHBbjr
 8R4k1j83aUfXQDrjEz9asygvddtimc6IcgIfMzcyDRFuT2EjjCuSOauVbSmxSefGI8/t
 xvxSX33Q/cmSgcTAGIpMwnZDKLDFoVoKQB4dop9bg4CvfNiwqdboG99f4v13UkldR+5t
 +WRYtbIMO8DnIBOb+wvEmTvHp0rvMWSRofylYLZBmUsE1kgWpjpUJ5R9Y3d8YKLKPWMw
 A3MA==
X-Gm-Message-State: AOAM532vT6p0nQH4TBmKywY5XWsFntgrl4kVxsWKH0t04jWpFpAdQKmu
 Nb3rnWozBYxqrpilTx//NgfEIIXr1Sc=
X-Google-Smtp-Source: ABdhPJy2mLb+NjB+t/RrEFd8/EeP4XZ7hHnTyapNb3SBi3i2+4rIbSkTNYvQHjhdIUyi5xRMXOtOQQ==
X-Received: by 2002:a05:600c:4f90:b0:350:d962:8944 with SMTP id
 n16-20020a05600c4f9000b00350d9628944mr7341170wmq.48.1645899321248; 
 Sat, 26 Feb 2022 10:15:21 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a5d522f000000b001e85b14dadcsm5618815wra.5.2022.02.26.10.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:15:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 19:15:08 +0100
Message-Id: <20220226181508.3011361-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xterm: security bump to version 371
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

Fix CVE-2022-24130: xterm through Patch 370, when Sixel support is
enabled, allows attackers to trigger a buffer overflow in set_sixel in
graphics_sixel.c via crafted text.

Update hash of COPYING (update in year)

https://invisible-island.net/xterm/xterm.log.html#xterm_371

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index d6d80ad977..3f6ec765ce 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  27f1a8b1c756e269fd5684e60802b545f0be9b36b8b5d6bdbc840c6b000dc51f  xterm-367.tgz
+sha256  32f888277b19e28ebc0a3112bff000607c07bed0679caa0beebb36f9cad484f5  xterm-371.tgz
 # Locally calculated
-sha256  dfb668cc977e24649500f3cc54de3e2b793928d210715a445ab1227930b07ba6  COPYING
+sha256  9521ef761474cd31ea406f56a751646a7b42a9287cdc6f2f8e52ed4c4d2a73e7  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index e09d350a7d..95984f1cf9 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 367
+XTERM_VERSION = 371
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
