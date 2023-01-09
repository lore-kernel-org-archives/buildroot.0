Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E20C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1781B60AA7;
	Mon,  9 Jan 2023 05:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1781B60AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lt9cezvs839v; Mon,  9 Jan 2023 05:34:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69FDF60AED;
	Mon,  9 Jan 2023 05:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69FDF60AED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BD671BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56D0260AA7
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56D0260AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R1kJJePIWXpB for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:34:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 485E260758
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 485E260758
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:34:02 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id g20so4101862iob.2
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cm4bBeRrLrf7VytFEbQBunrKxI9jEesCR1R7bXtyLO0=;
 b=fZ48c4/agyXSTrAsYQYnss/pBytmPou0Pqs1i+dNwKU4U7bOkpgAYzxlNTZ3A1+Nvb
 aVmttKhu2zui1sHM6AleKK42cRPXg3zzvztVGGPcFjoWKROil2xi4ZLiyljURcMj/b2p
 FXAnczb0CJsnyNjKhPWW/RLu4tyGsFw/dv4W2CZFl9df9y8IclNEYE35zqderqYNuu81
 GHfDjLg5AVVO21qd9PMlQYEczSy7VsOmdhNJ7ApnYLtjMkBlVH5SuhXHKHHYrOzjIssO
 xFLeMp623+vsegDOVXhFOIP147ST8ffKHzgaSWkeABwI4SlEokXom8M1dLEYHal+f+2K
 b6SA==
X-Gm-Message-State: AFqh2kpMj+t8+QZYfKbupdED9vx3972pD5IBDA+HhQvJl+mgqnrAwXQR
 jOauT2TdKfd18tZWJ0r5qQK533TLFlQMSSCy
X-Google-Smtp-Source: AMrXdXv/13dvKYOqrrcdlqvBb4b2CZIeeyXULf1ffzU6uf86SJGuhWUOyqzpAgGvJLloSf7HLoxq6w==
X-Received: by 2002:a5d:944a:0:b0:6fa:3c6a:c8ea with SMTP id
 x10-20020a5d944a000000b006fa3c6ac8eamr21940265ior.2.1673242441215; 
 Sun, 08 Jan 2023 21:34:01 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 a12-20020a056602148c00b006e25b512bdesm2877166iow.33.2023.01.08.21.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:34:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:33:59 -0700
Message-Id: <20230109053359.2675585-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cm4bBeRrLrf7VytFEbQBunrKxI9jEesCR1R7bXtyLO0=;
 b=NEo0Q1ZE+lyxQWllf8rKgNvjXPpM96CT2n93naMFl8//9hhDfDiTwFl91tFhxtkkjV
 W6suSCV9XjrueXYVEEfjsKcb5pUMQBabwjgqQF/Ola00mPsCruwfnwk6nXDT0AN1EUcG
 9HTukzhnDWSsJifQYow3tEWHiqUVGEaWNEdSF6fEmo+/fmuSw2NLokR+OB8rjkR4LTVE
 7oJvYdv5QBL+6j9WktcSoN41PCaZcyHprIHwaEjxPpdeCiLgY9tDmJNPX5LdJH1uQcAK
 5AzhDirI9CT9mh9+XuRq6huFk8t8Jsptm2b4cPcrQzL51ilGmb3g9mBFPp2QCa4m/zxE
 czpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NEo0Q1ZE
Subject: [Buildroot] [PATCH 1/1] package/python-pysmb: bump to version 1.2.9
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysmb/python-pysmb.hash | 2 +-
 package/python-pysmb/python-pysmb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
index 025e47d030..87b1edf595 100644
--- a/package/python-pysmb/python-pysmb.hash
+++ b/package/python-pysmb/python-pysmb.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9215356c446e4c6b335b4a481f52d746ff60926badfecbc33524b94908fdc0e1  pysmb-1.2.8.tar.gz
+sha256  30558c11ba141e9ad26e5edb1b85b94813a335ed5c0fe11df8046942b0c7e813  pysmb-1.2.9.tar.gz
 sha256  8c487d5c10f024e44a9cf1df21d1fd28a80bd2dfddd9f1dcd109a47d721f497f  LICENSE
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index 36993ce42c..394a9d806c 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYSMB_VERSION = 1.2.8
+PYTHON_PYSMB_VERSION = 1.2.9
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
 PYTHON_PYSMB_SITE = https://miketeo.net/files/Projects/pysmb
 PYTHON_PYSMB_LICENSE = Libpng
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
