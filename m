Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625DEC433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE72C81CFE;
	Fri,  4 Feb 2022 15:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fajsDo4hdR6; Fri,  4 Feb 2022 15:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3445881CEF;
	Fri,  4 Feb 2022 15:46:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF4D41BF2A6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6DA781CEF
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TSA0S7GC8i2e for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 797D081CD0
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989592;
 bh=aIcfxplrDNfKdLx76yLG87HF6GmQMVGVbyS8t75z+aI=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=VLYhFFscQEYQdfUFppdXF2yshxqaeZnOZMZNCzi72vlnFje6CVNszvTepH2MQ6PMm
 +nY3gESRPFLOYdCHuPXoTydOQ2hw2CW22L8FYPnh9h8wLOk/vY3CjqmjxBEx4vHDub
 FCnuKi8LUK11DxSba/Rrqfv3lwDdoY/De1fhbXvM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MryTF-1mSR251q3p-00nx6E for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:32 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:20 +0100
Message-Id: <20220204154631.17814-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vrEri5F1PWS3Hvd3XlL7WoahvYka4kQmICW2LSITwy6S9JlZevo
 jcJ+UlyXxYXT/uhOycLY53CuD5JhsmH8SuElxNm960QM39Bu/nELty5E6Nrsc8uuZiPJ62Q
 5olU7tNenHffFBi60NmarU8cVmdSjGcSNMkD+AOtIu0vzWCZzcNuXa33GcFO4qz2kHRu7vr
 muWJAedz0YZivrjmluyrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y+kfTqX+yfU=:mH/5N8b358Oe+CZEOFGM2L
 +lE7fz6vuLiVwRbhksNmH4oYdzQvMhb7dmL1/j69OzhV7F6dXgOhiw6UprFotkIj/5Qnts2lF
 Ea8gn2c+Fja0pAWZaeSb48gjjAg12MrYCgfqLiiqSCCBMSeSrR/RatPc3Ac4TfvJ7MCFBePI9
 Xan51pGBQt8EFW41PF0fU38Wsaw6g4jG6W8cNQVKOiJpy4yuv5d9Hzd8XcQ8qtwvDzyzKs7Pg
 VrqsPP8GoFmRL70qM6FRFlaBPuMafL/TEF9xWo/ySEvZQoAyK/kzCxhZTbplyzXoOZAQGJP66
 V60I4RBd2G77MMhyaf0z6ESXsC6dDKKtXIkqOydWS+oDfGQKN+FdWU7SjPtyqLy9wZdMoO4UA
 2soCmgoa4sPjJriOA4nS4TQOw34L924bK0/I/mhqOByw/KqR2JCKnDYLq3Ise1f79EJTZmtyZ
 xrfZeIEYUV/aDlKcXqR7nscsYk6TtbXpnU9TcDRhiTx4gAY+VNaLvbtfr+llsgWeL39l0xE5M
 xDQ+Atz0z5c3DXKPRQK6VFZCvcH9xO10aSVtLuQAjBsMkdeqhqkHMM2Gsgv4CnYmQWrbJuGd6
 N/hQAA1un5/6XUa0pNFuNonxhj3j7TzJVt9W1m9+PTEWokX6JNc9SrbEW1pL4UsgacrRfg3xG
 CA9bXxx/EEl2wBX3hbjPnN/w0WIiq/vZPsRV+tPcfKSI/0eLWVC5yseCBKhQd3q9AHvvAWlvc
 AXH/iQa9Ea3UfQGoFNA47ofGF4ce08L4CBsvmsBUpRWG8YPPDL5O/12zHhAWAq/u3FI9VLiLV
 hgLpamdwS91tpKA4qCSMZk6zIF3dSq9JVbZLoSIh6JlgNwTZ+KsAg8unV3w7GlqcNJxFImwBG
 gwB+XzjHDh9xbYliBoeDQGutxSNks4Oc2QbkELa0fPWm7+LQSa/dkBzkyvdjUMKWHaxu1Q0gY
 qFb5VtE5Q+lTMiZY6ABOOUAq53JTsN7FMpjDwkdFsHwv8z36y/ekFTAEwpeScpJxq8GZuWtye
 Erp2T5GUlqyjU4J9nctkHK5cG4DI22C4yZ1uSWWZ/lxb2VLqKl6mxPiCbn5pUGmsyQdDv3AxS
 VXr7+lwiuGJGVI=
Subject: [Buildroot] [PATCH v1 01/12] package/gstreamer1: bump version to
 1.18.6
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

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index c6282454ca..1202bf2c50 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.5.tar.xz.sha256sum
-sha256  55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a  gstreamer-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.6.tar.xz.sha256sum
+sha256  4ec816010dd4d3a93cf470ad0a6f25315f52b204eb1d71dfa70ab8a1c3bd06e6  gstreamer-1.18.6.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 1aab035e05..27745f3bf9 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.18.5
+GSTREAMER1_VERSION = 1.18.6
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
