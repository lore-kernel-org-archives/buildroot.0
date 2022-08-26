Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E232ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12CCF40D93;
	Fri, 26 Aug 2022 12:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12CCF40D93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Om1bfELGTYuL; Fri, 26 Aug 2022 12:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32077404BB;
	Fri, 26 Aug 2022 12:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32077404BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7BB1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEF2D610F7
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEF2D610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02gtNWudl7Ij for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC0E60761
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EC0E60761
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:09 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u6so1960655eda.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RnugFEztpzBA7GmFCpC5qHoSA90Z52zKni1UR+kIVKQ=;
 b=S0lAycQ2epsUJKkjApLqjZsp6obS5allZ5qUHGMnBR5UNneF3RoL9ogOtdujEmpZCG
 f29PLhXUrNTglC9LCeJ8TrS+YE2hQ8fzYZay+zs3LAjv1C92CYdleYv8pig+b6uLn58B
 HTjxAXWMkQIRrGIBfNb6xpHS+w6eVmJoioH7R398N6Bw73y2wZoNm6uWiKfy1CM6whE/
 cvWHnLIYhwOVJfbD3tI/yldoffjZWr71qCv+xFvK0OUyGQjrSRkoUOyQtP+6tvC75tYB
 uSSp3evwEnrsl5cockSywYGbaVCNyCjIYZuwigxKa64bFBJtRzwQOzWEgWIXQszGaJjU
 3veA==
X-Gm-Message-State: ACgBeo0+n+KJ9KSONCPg7dxbDwdBSuyFrGi8BAMoiCBOJqLOW+Cx4E+8
 TLeXrqkkLQbCMSt1x78B42LVhifiHA7ik1RZ
X-Google-Smtp-Source: AA6agR6aIS3uTt5+vQ0fIUeMV1EyZInAe3nin22ak8VLEeFp8oah9PauatTJVgFTTomh+8ATsFh7bw==
X-Received: by 2002:aa7:d993:0:b0:447:ed34:14a2 with SMTP id
 u19-20020aa7d993000000b00447ed3414a2mr2083559eds.260.1661518388349; 
 Fri, 26 Aug 2022 05:53:08 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:07 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:35 +0200
Message-Id: <20220826125252.16782-13-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RnugFEztpzBA7GmFCpC5qHoSA90Z52zKni1UR+kIVKQ=;
 b=P4BP1/wqYYhk7x3kXYKclLrzwA1KQTzmJE8Ys0UzQAKBD2N+iNZKqjsiIxFh0QXaqd
 it42U4UkArsQi0aJXICgtyfrH3qFzRwZcZJa5lATZ6yt0ywjQu16MTUhmTWUrn12/xCt
 y3uw/GIVs0rRUMynUmPhc0s8+SELi7MIqTXDYodJV34xdy+KfUwImTufyuaFNVjYDUP6
 n43l6C3gMCKVAzTMToJz1mneeNEvmSRQuVbdytnXtLLOFwaAq2irftKvW8cWQ/+SFEL3
 X1iEr293mrMc7jWkMehE2zbtETSknNMSdO5jDvN5E6Mk7mjYsUyalumYzVYxOrT6R9p+
 X1Wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P4BP1/wq
Subject: [Buildroot] [PATCH v3 12/29] package/qt6/qt6base: add linking to
 libatomic
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch might not be necessary for qt6 but I can't find anything
indicating so, Yann E. made the original commit for this on qt5 so
he might be aware of current necessity

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 8bca29900e..c04564d132 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -151,5 +151,10 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+# Qt needs atomics, which on various architectures are in -latomic
+QT6BASE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-latomic"
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
