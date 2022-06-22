Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E56C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 17:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF346128D;
	Wed, 22 Jun 2022 17:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF346128D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIhv9fKQMWDk; Wed, 22 Jun 2022 17:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E26160EA3;
	Wed, 22 Jun 2022 17:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E26160EA3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5ABF21BF3E9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 17:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26E1860EA3
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 17:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26E1860EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G09_cpvDFX_z for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 17:24:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D3B860C1D
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D3B860C1D
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 17:24:19 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q9so24381580wrd.8
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 10:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JEz9Cvj5RE7FnQzyX2DDemWsFceJZr50JLBtHkV3zxM=;
 b=z+pvx3GEzTjKARXN5rauL+ecfiHd4EqahzTxfMSl+tc1tmKkNufdHh5j3WcNgJ9HFt
 ZqBTsFNpgqlz3RgQRLKV7fWjXHTD6mXEuIxO7Nthq7XAKt1nDDzGOdfydusAsqN71Wt2
 7q2guSBSv2vizP0eB6n29v57jmGbeMU1jGDmHNSzD6De9mxB0YFdQRulHPzjk8uhgDqE
 W0zvQJ3lHFmUENgeKzZpq8qfKmHNxrHhNr1Yb3CN82FMeAavPcYpSej5UtCMm0nWj8oe
 jMQ7qufReZXnO7Sduc9b4LnsrhrFZJx9LPNhKhDpMKR9mZZy1lkMJ2xkp1+PQPgUMhyG
 P/uQ==
X-Gm-Message-State: AJIora+fTPryHr05FjgKHsJPnp6iFKirMwIenlgYmlF+GvfOicKBWMal
 MeX3N5Rq72rlDONiGNm+bkzhIeBehcs=
X-Google-Smtp-Source: AGRyM1tsZ1+z56Nrk4pIJfXGk5Bw7lyiXMNNhl3AE1NpJ6NVrhI1pwlnhT+8YZ+gYtdKTSid4iiHGg==
X-Received: by 2002:a5d:64e7:0:b0:218:5626:7e7f with SMTP id
 g7-20020a5d64e7000000b0021856267e7fmr4548150wri.245.1655918658107; 
 Wed, 22 Jun 2022 10:24:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c210f00b0039db500714fsm97254wml.6.2022.06.22.10.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 10:24:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 19:21:34 +0200
Message-Id: <20220622172134.110774-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JEz9Cvj5RE7FnQzyX2DDemWsFceJZr50JLBtHkV3zxM=;
 b=XOu8PorBOK72yWN6gEljfpE3xAOiKJXmmted8mlR/lwUmzH9MUnFeKxV+xb9ZZH6fv
 iLx+NHpX2CYWiHi/+lNQfyJjPxIn7XNpAGhy+0r0GdhHsYY8sxLkRabPukOz3OAe8wV4
 eF/ycCV5loymNzbtHUuh0Q99oF6tOcCHrZ4/8U0HU7WSfFBR9NFYMEo/Vp5r67MFI7UY
 oVqyr/xSy3oOP8eGug1vhuMjKg8RwZ7XmJdBClkyRVyHaLCMAx51pp5LWXNmNd4vBuIV
 xcyOXqppaEAgco5PMztfuB6yA/fQiv6VHhwsabjpaTUfYVWNUo3d/gKh8ZHSdwivEsta
 Mj0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XOu8PorB
Subject: [Buildroot] [PATCH 1/1] package/flatcc: bump to version 0.6.1
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

Update indentation in hash file (two spaces)

https://github.com/dvidelabs/flatcc/releases/tag/v0.6.1
https://github.com/dvidelabs/flatcc/blob/v0.6.1/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flatcc/flatcc.hash | 4 ++--
 package/flatcc/flatcc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flatcc/flatcc.hash b/package/flatcc/flatcc.hash
index 11d9d9803a..4c6b2fc8db 100644
--- a/package/flatcc/flatcc.hash
+++ b/package/flatcc/flatcc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	a92da3566d11e19bb807a83554b1a2c644a5bd91c9d9b088514456bb56e1c666  flatcc-0.6.0.tar.gz
-sha256	c8f0d9c1f92c658d87ebd854ee7447a3d3912d2c3a5c78c117787be5d5da8af3  LICENSE
+sha256  2533c2f1061498499f15acc7e0937dcf35bc68e685d237325124ae0d6c600c2b  flatcc-0.6.1.tar.gz
+sha256  c8f0d9c1f92c658d87ebd854ee7447a3d3912d2c3a5c78c117787be5d5da8af3  LICENSE
diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
index fcace691c0..06be1a1338 100644
--- a/package/flatcc/flatcc.mk
+++ b/package/flatcc/flatcc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATCC_VERSION = 0.6.0
+FLATCC_VERSION = 0.6.1
 FLATCC_SITE = $(call github,dvidelabs,flatcc,v$(FLATCC_VERSION))
 FLATCC_LICENSE = Apache-2.0
 FLATCC_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
