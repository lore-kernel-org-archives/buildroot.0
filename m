Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81212C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:21:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43DBB611CB
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43DBB611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D08360D65;
	Wed, 13 Oct 2021 19:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNjIW_fGi-Rt; Wed, 13 Oct 2021 19:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61FC760D61;
	Wed, 13 Oct 2021 19:21:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEFF11BF372
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB05360D61
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EGicAOQbkhAE for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:21:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E535760D4F
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:21:50 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m22so11964474wrb.0
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UdiTtvSLvcCibxi9S86NMFYpw5rxMlSuuSyv13V7J7M=;
 b=XUQby6crI44LsN9z0mVjzIB+dpDPKRGDESSPXU6nOSvN6L1Vb6jbIuBejJ7laohl13
 vfvZSYyH76uOICwkMmyR70emtda5IAi8c6RDfH8h5EvQoe3qwjOTlJCALMUVG1q6xPX2
 s+ilOxNbBOiNKxCyMQbOm3N2gcqLSnEmISrjn5aiD8ai3Z8xC+E3P/X/cxAKqcY4e+N9
 vS8Ilxw4rPB9LTt7aiMnQYO4OeYTZfPfZ7UP4MxGXCHNAJiA16k+nN5s6b3xU3oC3Ypn
 7EEMVsZkwSRhlcefuMzGfxun8sfbeT00T42XdCiVD+0kUZ87jp4iKKX0uMvzaDj0Ljx6
 yNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UdiTtvSLvcCibxi9S86NMFYpw5rxMlSuuSyv13V7J7M=;
 b=dj5zuXH+EW2h6dI4ridkz94moLWMSBJRKxYce1Kl/Mco70tzXr6vDPZS7g+luoA2Lf
 uN3Xtes1anCt+Qbx5ULm1zrbWiLrC3bQe4o+Q4r2i+fAUp5t/hMLiEKvC9HsViyOjyMX
 L9fb4Le3CN7fw79W19bBpZmq/edHcHd/ziXJhL7FhGr5dw0R9oZTkXT1T7ojnIOUMle2
 Mq8DLGEBfe2itbIaN6Z2x9nIUqq/4jQKrnIhTUiDKlH7ybScysj8xNPSCwPkOMJSj3iE
 0pFPePHxsLH/hc38hVZW5bJTo77C7XikW5lI3bz6hRXC6j1txn7y/uyYgZuSSqtq6fwA
 4JfQ==
X-Gm-Message-State: AOAM531Ny7b6Glet1VDZjPiXydYcGP53QSLfXZVBh+KyCkYESG/uhsg1
 p7clSq/p2UMT4GUV9itv7DZ/euA700Y=
X-Google-Smtp-Source: ABdhPJzjzQGGdVXQnbI5d2nQE/AAr2YU5Y1LczmtSF/0Cu8DCCwSNpc8SBwg10AgAS5qaogonP373Q==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id
 r13mr1181559wru.230.1634152908918; 
 Wed, 13 Oct 2021 12:21:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id a127sm5804143wme.40.2021.10.13.12.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 12:21:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 21:20:38 +0200
Message-Id: <20211013192038.1876922-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/p7zip: add 7za support
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 7za stand-alone executable as 7zr is a "light-version" of 7za that
only handles 7z archives and cannot handle encrypted archives.

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14266

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/p7zip/p7zip.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index f94b55ecd2..a363a2ac1d 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -17,10 +17,11 @@ define P7ZIP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
 		CXX="$(TARGET_CXX)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
-		-C $(@D) 7zr
+		-C $(@D) 7za 7zr
 endef
 
 define P7ZIP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/7za $(TARGET_DIR)/usr/bin/7za
 	$(INSTALL) -D -m 0755 $(@D)/bin/7zr $(TARGET_DIR)/usr/bin/7zr
 endef
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
