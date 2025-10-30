Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E00CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9514484404;
	Thu, 30 Oct 2025 21:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPQGrAPFGS1N; Thu, 30 Oct 2025 21:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C93F284401
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C93F284401;
	Thu, 30 Oct 2025 21:42:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7507D2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A8B26155F
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2fWHYbdpJoS for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A28FD6155E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A28FD6155E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A28FD6155E
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:41:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cb2.dip0.t-ipconnect.de [91.58.12.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A7342A4C5B38
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 22:41:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41906)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vEaP6-000000004EC-2QnI
 for buildroot@buildroot.org; Thu, 30 Oct 2025 21:41:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 22:41:52 +0100
Message-ID: <20251030214156.1307743-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761860516;
 bh=rxSVNlIsUnaUVVdkkAhjXLSLgQ8d/Jt51Xc1vBu0T5E=;
 h=From:To:Subject:Date:From;
 b=uyF0/TIePl9seYI9+aMsMLzK29Lbfh+7qmU92cdnMeLui4YFYb7yLdh5USCXuOJFe
 UPuPd4bxVXSpB0esNNJe7psqq4kL/xvyLv0vbVMjCi8ORpVAtLwg/c55atk7qE51rT
 2fm027wetodm+mjspF5UZYo0wkzc2hXlsrccsr/eguGl59L0H8ileS4whbivFPpElr
 ZlkFNIUGRSO2lsbGaor5L8U9UFijpYs1mEl1ekPd+RktnoEiyAilVlHgh86B/ZmQJr
 liRt6dM8eCB+rg7IxDMuJMewPsZhCqFqf3oIlVh8ZXR/LAuX5TPmsQWOJ4YhswU56p
 b4pOk9DSf5sjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=uyF0/TIe
Subject: [Buildroot] [PATCH 1/5] package/bind: drop unrecognized option
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

Buildroot commits 7b43e248180ad3b3dd1804687bc4457f29a88137 and
8adeaec8afacbc680edebae91524f6144926ac92 removed the possibility for
static builds but forgot to remove some related _CONF_OPTS.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bind/bind.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 350f6c6fbe..11730b6e7e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -109,16 +109,6 @@ else
 BIND_CONF_OPTS += --with-readline=no
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-BIND_CONF_OPTS += \
-	--without-dlopen \
-	--without-libtool
-else
-BIND_CONF_OPTS += \
-	--with-dlopen \
-	--with-libtool
-endif
-
 define BIND_TARGET_REMOVE_SERVER
 	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/, $(BIND_TARGET_SERVER_SBIN))
 endef
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
