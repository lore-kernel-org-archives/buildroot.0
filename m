Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230D0C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 10:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B76E181980;
	Thu, 29 Dec 2022 10:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76E181980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p53_ur01vnmm; Thu, 29 Dec 2022 10:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1626C81970;
	Thu, 29 Dec 2022 10:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1626C81970
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87CC41BF47F
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 10:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 636A340578
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 10:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 636A340578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBkJTEd0hPn6 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 10:53:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BCE9400DD
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BCE9400DD
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 10:53:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id ay40so12899591wmb.2
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 02:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/5ObPs/2hsKdQ+WLxeC1M9dhyrKwuwy0L01y86odZ9I=;
 b=uZpjaJApJd3G8nG9rhulkJGl2TL5zZAvxDyBUh9zp9mWM70/LAtPZjPyvSqiPV8kq+
 uHnK0mkGqJE28ls1tNeIBJUXDO0oWcjR4ZwLsLZQu1CaeDM70msqRi/ZyXw+3v/FREdB
 yxqEtqr85MMnzSn6Yjma9GD87CmTWKMXFYVdbT1Gl8mYq/s9g2XgTb3aAu6K6c11PoSD
 F+2DtEoCFHw6fhOvCEz9FL0IyGYMxWx81GTfeWAYDdIcucyykyyiWLj178riUELvjxRS
 JQryK4o9I7glW5WQ7PREOazwB10MKCvUD9IsHlMvxpXccKDKjKYkR9r2VcIPNJydByVx
 OCeg==
X-Gm-Message-State: AFqh2kpKkBoKnd0cAydyWgfGvAhiYT44go283XfHsMZxHDWtqJslU0MY
 NGot/wOfHDfBJUMbnzVDxHB3r6bLq2A=
X-Google-Smtp-Source: AMrXdXvyFqS/G1YP3+Up9Y1BNkGY6Wfza/0XS3EKEe+7Xal7AYCAeTP+93CuI4HSYcErvElmHHpe1g==
X-Received: by 2002:a05:600c:5014:b0:3d3:446a:b46a with SMTP id
 n20-20020a05600c501400b003d3446ab46amr20891085wmr.38.1672311198282; 
 Thu, 29 Dec 2022 02:53:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d17-20020adffd91000000b002882600e8a0sm3748939wrr.12.2022.12.29.02.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 02:53:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 11:53:11 +0100
Message-Id: <20221229105311.170136-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/5ObPs/2hsKdQ+WLxeC1M9dhyrKwuwy0L01y86odZ9I=;
 b=GpPnicSc3o2knpj8wDjlHZIcAEp4H9D+HjBcxI5s+k5ptuYTpG4OuKUYUqZtZaACse
 1l3sKG/Yv72Xgh8uBfltIs70MaQFeUdgflzYFWx8mKJais4RT2xZCUCm+fgduTEN6q6L
 6kXkF9/X7tCO83J/4HD+Apl4rU9QUL7RXOpnBSpu1Wb/tJDy3+g40FVBD1a6z23xnuoL
 vKU3dSJo6jDZx10w4LSoMcfHR4VYsRF8+uWVH3+gJ8kxuSUgpYUK48g15uE3B5B9jjeu
 FmNEQ/s5f1RESCA3eOZ393SB/du4bwahZQ4uD2qUSxeNLMvwMlvN3/keW3Dt9wMmia3y
 e0PA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GpPnicSc
Subject: [Buildroot] [PATCH 1/1] package/wireshark: add libcap optional
 dependency
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

libcap is an optional dependency which is enabled by default since at
least version 1.8.0 and
https://github.com/wireshark/wireshark/commit/9250a69a9976617c735679aa5383e53802e5b43e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 801c6fff5a..12d69e8421 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -65,6 +65,13 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_GNUTLS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+WIRESHARK_CONF_OPTS += -DENABLE_CAP=ON
+WIRESHARK_DEPENDENCIES += libcap
+else
+WIRESHARK_CONF_OPTS += -DENABLE_CAP=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 WIRESHARK_CONF_OPTS += -DENABLE_KERBEROS=ON
 WIRESHARK_DEPENDENCIES += libkrb5
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
