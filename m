Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F340E95A79
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 293EF40862;
	Tue, 30 Dec 2025 11:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWFZBux44YgU; Tue, 30 Dec 2025 11:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A1DD40866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767095380;
	bh=cbQt7WMSMJFfmmv71+0I3bsMoJBaEJ+0lBeigNkMaO4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ie45o4R50zncn3Fh64oRSJU4jtfxaHXVdQ5e2kCuMM1f+ULvsnR3MHZ96Mvnl8ILG
	 PJI9cCNm/ticPaoE1qagEK4UFWebEIoUunNzvdRHjLL4xZ7ituiBGWeY9jJ+LEvxIf
	 OurLPyhm3VjJ2quS+Avq8UIRrc/f7CyhbNg06JgCQpKaJ9pQtcxXEWJpsaBJRfYCVT
	 WbtzozxPjxe8JTfFbyBDaMihC6J7LGEh1bfIov0GVcxiMLRCbq8KYL6HND/0zXRXmr
	 FdeK9AXtOdb1C0Px62erpuR44YylGZd28M4kN0uEH281GgaS5NY4k5SnjzbFJn4Pw5
	 URC09eh+vHsyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A1DD40866;
	Tue, 30 Dec 2025 11:49:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8622D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF2F54030E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvRF7QRpQNJR for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA0D0400A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA0D0400A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA0D0400A1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:49:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F1C2A4C2ABC;
 Tue, 30 Dec 2025 12:46:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaYBM-000000003Vt-3FXP;
 Tue, 30 Dec 2025 11:46:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Tue, 30 Dec 2025 12:45:39 +0100
Message-ID: <20251230114545.2236640-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230114545.2236640-1-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767095200;
 bh=4RbOLyujht/eRdMJ4nc78yXg6N6EMJQgF0wjfzZwik4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=i7KpxEb6tnWuQB1furdpiO0rfyehQ6mWAwAsraOHSQHsJaucOI0ZGZm4Kw6yll4fp
 HJtxKBl9kqSJVFOzjHQ0By+1BJEztdfeJT3fkdB+4ndZZPIUeK+WM4m2GNWghVG55O
 XAFfxazONJ+EAw2B9qaeVkjqHVZuQd6xc9S1rk+jFW7IeZ5xJ3AyvTu20cES87Rnnq
 tqUscBbpSE9JH0yPjFzAuYKQfVHzQtZxoVn9Tt4nBwRGgPvxkt03l2+/iYqoFcJen3
 2J7S3Qbuu3haLTQvahyKTX7QGMg/diLNfJjke5TEaUJg+zirLtX0kvxdPe1iIpIphv
 cJQdPK8dzccuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=i7KpxEb6
Subject: [Buildroot] [PATCH v9 18/19] package/cegui: remove dependency to
 libfreeimage
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Due to security reasons libfreeimage will be removed from buildroot:
https://sourceforge.net/p/freeimage/discussion/36109/thread/435a3549f4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cegui/cegui.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 2e56322374..835658763e 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -11,6 +11,7 @@ CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
 CEGUI_CONF_OPTS = \
 	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
+	-DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=OFF \
 	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
 	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
 	-DCEGUI_BUILD_RENDERER_OPENGLES=OFF \
@@ -92,11 +93,4 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFREEIMAGE),y)
-CEGUI_DEPENDENCIES += libfreeimage
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=OFF
-endif
-
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
