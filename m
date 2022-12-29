Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A299C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 10:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F3484033D;
	Thu, 29 Dec 2022 10:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F3484033D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2SZUktOrtMD; Thu, 29 Dec 2022 10:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 999AA4033B;
	Thu, 29 Dec 2022 10:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 999AA4033B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 918151BF292
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 10:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66C6E4033B
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 10:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66C6E4033B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKiEFAqEUMwn for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 10:46:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D1040335
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40D1040335
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 10:46:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so7427091wmk.4
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 02:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PongLho6/a0aUyXDIHkjHb3Kp/DGiv/0tqf0Gd7Bvkg=;
 b=srakjSzBfUZMw/zq1x9aRy0sTr9YHpmjHnDYKEBgsxGkb+AzT5UkqH1GB5QZWIg0bd
 qnXnjMBPWdYwpWVUvIIykM4yIdy+32ZwLEy8SgPrO8zgIB6JUskNWKUvo1X4P8V3Vzkj
 r5/HP/C5ZODbGvT66jRIaboMPBKTsjf0WtU8w+vOqtgxs05aZIN/NFDPhADjOKUU+xRb
 zCDfUMRfJz86EnsAI2FtWx/DDpjg+uO1yRnAbYdKh4D6YQ4ylYT0Tyl1u49fY46hW8KC
 2FcJMjBGRWI7WyXNeRwA1hg4zfD+cuqWLiCoLV0VWCGUWK8224OAiXMnsXfGgKKFNAem
 mytQ==
X-Gm-Message-State: AFqh2krCcp5TgP17BwYvqzDt729Cox003forKfMWR+RD9Qq6Bxn3tIL6
 mbEdKi+8Jy0JBarVnlAfBl7BC95QXq4=
X-Google-Smtp-Source: AMrXdXt4lctTcFwWiIpN/RbASkIhCLTpl6M2PFBFWrRFqw20MMx4jXXiN3TCKQ3sy44+ma61EIZFSg==
X-Received: by 2002:a05:600c:254:b0:3d2:2c86:d2b2 with SMTP id
 20-20020a05600c025400b003d22c86d2b2mr25476772wmj.24.1672310789064; 
 Thu, 29 Dec 2022 02:46:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e8-20020a05600c13c800b003cfd58409desm27830217wmg.13.2022.12.29.02.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 02:46:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 11:46:26 +0100
Message-Id: <20221229104626.145365-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PongLho6/a0aUyXDIHkjHb3Kp/DGiv/0tqf0Gd7Bvkg=;
 b=MWvJ31iLjGoZQ4QyO57MU/v0iT3rW8iBU8csgdwgcKXAVvNR8spTKUYOfKqm+AFVsR
 JINYudiANME3avnXRgiFFfgdezddCtWxUr8VENh5StMy5fBF2Hg6l+kp0vulzPc/ZJH1
 zJb8sqd6HmyfkByT3pduloGGufYGz1XwvfO7gRJ0H+7/xa2TRsewhGMfarroU/FRoz/z
 Y/TCwIs3sPzortUKGRuzOww5r2QgrjOiKPuTMICB7NMjvPYVBKUfvUe7ou6tsMExgdjm
 PhwWgvwPCKtBtG/XILJsvlQoxIiENZuYA+UwxVOZVnb/5DuhmHBUBP8Y+eG8Gre9Fy8L
 +1kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MWvJ31iL
Subject: [Buildroot] [PATCH 1/1] package/wireshark: add minizip-zlib
 optional dependency
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

minizip-zlib is an optional dependency which is enabled by default since
version 3.1.0 and
https://github.com/wireshark/wireshark/commit/390071ed0bc8aaf378c3468989ccde1c93817542

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 5da344fc55..801c6fff5a 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -115,6 +115,13 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_LZ4=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MINIZIP_ZLIB),y)
+WIRESHARK_CONF_OPTS += -DENABLE_MINIZIP=ON
+WIRESHARK_DEPENDENCIES += minizip-zlib
+else
+WIRESHARK_CONF_OPTS += -DENABLE_MINIZIP=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_NGHTTP2),y)
 WIRESHARK_CONF_OPTS += -DENABLE_NGHTTP2=ON
 WIRESHARK_DEPENDENCIES += nghttp2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
