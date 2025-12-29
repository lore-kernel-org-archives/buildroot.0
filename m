Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3024CE92FC4
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0864D60C19;
	Mon, 29 Dec 2025 18:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3L59pSEpkO4; Mon, 29 Dec 2025 18:05:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD55760C06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031522;
	bh=cbQt7WMSMJFfmmv71+0I3bsMoJBaEJ+0lBeigNkMaO4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qvlpR93Ci/rLMFsx9Fot4RGoQz4NZ87Q8WlYaNJ7vnP6v/NOZD4Bu2IrdimBzgg/R
	 9t9aBQ4pjJ3rt10n/bkVeGdmtpljN6HheEH43677ONhaAN5xMQ+ZL/pCEkIGrDBMAk
	 mjwecO3rZRMHX2Of01u2Nb0SiU7IXur7zSjsPnv6lD+vgRKaNbBfCxaahASFmnQqKH
	 yRYn5odq9tfgoqIdko4BsbJB0EeCjWzcWNrK7GiLQ7mjJtXhWifwNvVRvDYGQI15fc
	 UXVmq97pruXOAW8U3yo7KT00AAFBtrREarIC6Iv5M2KkBRpmpIOJp3U/aOh7RI7ylV
	 OaWdGJWX5+liA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD55760C06;
	Mon, 29 Dec 2025 18:05:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 224E9D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0618080BA1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jl3atG1IBmV for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 029F280B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 029F280B29
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 029F280B29
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:05:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3486EA4C26EE;
 Mon, 29 Dec 2025 18:59:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHWx-000000002P5-0vJE;
 Mon, 29 Dec 2025 17:59:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:59:36 +0100
Message-ID: <20251229175938.3549882-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175938.3549882-1-bernd@kuhls.net>
References: <20251229175938.3549882-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031191;
 bh=4RbOLyujht/eRdMJ4nc78yXg6N6EMJQgF0wjfzZwik4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tBvYnOgfdrWAEnhWwIhMMYhopQILfN+pKNJpdyiOqJV/JTVTFZg+7gjvSvYRTvWVE
 4QuC3Ts3Bno59qdn2U7jf0IwCUbfTFkgXPHUj3kKQDZbFSglwB/TDpfdCCcICVwtj+
 7D6auOp920thqXawSl9Lk4RqTOwEvKdX8k4SSWzkgKsahCMFOM7m/YnLw0l7gTO6V0
 50U21+DGI1PSlsSO6UZfwIBg4gmK+uYQWhJwAPXi++qzXXnZlZv4Gn/+0RwQmfGh48
 BN7L23y3Er2X3qAarmccDD5aIbmWMLg/z7gCvGydFCic3r2FSbO4muDEbJWGKy528I
 vFF849Sy1z9YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tBvYnOgf
Subject: [Buildroot] [PATCH v8 28/29] package/cegui: remove dependency to
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
