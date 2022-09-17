Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA119ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 22:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 429F360D91;
	Sat, 17 Sep 2022 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 429F360D91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKhSKIRY40pX; Sat, 17 Sep 2022 22:20:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F10060D5B;
	Sat, 17 Sep 2022 22:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F10060D5B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6AC1BF2C3
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 22:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC26160D5B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 22:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC26160D5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9dDaSz8MwEK for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 22:20:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2365F60D4C
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2365F60D4C
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 22:20:13 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id o204so10326226oia.12
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=hYngk8u0cmg+9vLs2VAN5PQfl3+5EvizkjFrAwjGF3k=;
 b=pprJ9c+NqYLkD+9vvd/S+QzJASLC94C+LHHaNpnoWGYv1UnfDUIjq9yXmqyEdPjrmD
 67jaN9Ek6qtzwuXzy9C041zp+iPdPzWgunTNxXi6ZcR+Ok2O6nneRVYPxNhU9TTY2K3s
 M5Cc++hHrqBxefBe+KNwtU914eL+dn0GkeLOqkxO4O9APyLw9Al60Hyll6jaRbDYiWtb
 2xx0vgLduGiXVudrQUkCIeflNOv3gNphb1vnL/nNEBUn88BoMKiBDQOVyvIdg8SmqF4o
 D7F7463tvl//BZDGtgChTmZCFue3zM2IfA7+3So/TOGv3wKA6FIkZNWxaARqlqRU/MxX
 zU3w==
X-Gm-Message-State: ACgBeo1d/DoSQlRmBUsPF3qaZ+P6MapxK6yPoaqKSzTdjk/CTj8DXH5c
 MCes4m+4GojWAtr+yd75qElfgOcJDrY=
X-Google-Smtp-Source: AA6agR6DC6JQDCQus3CgjXjXNxq2VJ12TQw+m48ljSaCvGucz04+nIDlzSFTX0OMDRwmdZpXcPtzOg==
X-Received: by 2002:a05:6808:124a:b0:350:a5e:f8f4 with SMTP id
 o10-20020a056808124a00b003500a5ef8f4mr8612039oiv.149.1663453211897; 
 Sat, 17 Sep 2022 15:20:11 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 v17-20020a05683018d100b0063696cbb6bdsm12084457ote.62.2022.09.17.15.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 15:20:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 16:20:09 -0600
Message-Id: <20220917222009.1721272-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=hYngk8u0cmg+9vLs2VAN5PQfl3+5EvizkjFrAwjGF3k=;
 b=fNDP9IGP5AKIrwsD1jyYwXzhbq5SKosPbO0yZ3ksZ9eCS+vHQY+pk4Cr7mv7PqSe2g
 O3KPNBs851s/s/PX3H80LU5aS/qjRkwI3Ss4Nq8D/J2uAdp2RgVjEJEfpmHFSXzziPaV
 UE1cmks8tvSEOnW1t7KAdnkRdCObDjXq7eDnCU4X7ochLB9kGwqO7kcK06rdlTmlSIxS
 uGmbuwoVcC7xACLBsv+zbDGmV3k8v97eXw/Ou8RaWoiiaNrkKyLYvtturdZTR15a1enK
 LSKBNm7xAS+kwXFMzCcqLHhmqVUlM9DQtWaZCqduJpITzhJSQHj+v8fNlEEFv3wbVUzr
 qBrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fNDP9IGP
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.63.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index d22b21cdea..df6a92d1f2 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.63.1/meson-0.63.1.tar.gz.asc
-sha256  06fe13297213d6ff0121c5d5aab25a56ef938ffec57414ed6086fda272cb65e9  meson-0.63.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.63.2/meson-0.63.2.tar.gz.asc
+sha256  16222f17ef76be0542c91c07994f9676ae879f46fc21c0c786a21ef2cb518bbf  meson-0.63.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 1e431f426a..f9b3f95bb7 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.63.1
+MESON_VERSION = 0.63.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
