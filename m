Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F8EC4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 18:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5648815AB;
	Sun,  4 Dec 2022 18:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5648815AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_2IjCHNSU76; Sun,  4 Dec 2022 18:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13F1C81551;
	Sun,  4 Dec 2022 18:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13F1C81551
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 863D21BF2BF
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 18:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A2FF81551
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 18:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A2FF81551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlK_baYe7s2J for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 18:32:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4830881521
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4830881521
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 18:32:59 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id bg10so7250035wmb.1
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 10:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QNZNsi9glmzA1SZyZx2Cepl2lgOzmiBnexm5UYgWXPM=;
 b=7d99jbUFcmYwVUFZNcgOCn7GsvQWieUAw+15h/4hHq3LR5mbmR+fNcC0aMds+CiuFG
 wivk3+Q4JIXxpcJ9oGpZc/3ye7HoIu9faPkPRlefZe+IFJ/Y6laK3dDqbZKP163w+N41
 /ffs8MM0QVqPHa/5lRZZ8itxnmbw9Fi+Q7q3gJurQ1LqX0ZhOeL5fNev9BZThtDJAAVJ
 S/HvqN/tUPQR6GzHPHrekTmXAQ6FsOUWuz8apQzimx6NNz0SggtMPn1CKTKQCglPNBp5
 7IiYfSttNQ5e1AqD55fF2VFPhciMrU0LGkPPdEYqCThAX+cBLogp5zmUSGnsC67WN0DG
 Gkyw==
X-Gm-Message-State: ANoB5plgtTUwDxeo7lHeXA69VAmSm94Cwhqb80u/MQ/qlfNCZ2rCGsON
 XMRK5ILzedK6qQUL+qx0agjR0gKYayg=
X-Google-Smtp-Source: AA0mqf49AVmrwTLttOmE0UwuCDXU1XamZNyxHlOrzkcKLAZ4DbwT4TOyhFU2X0sRF2c9/gAzo+PjGA==
X-Received: by 2002:a05:600c:2145:b0:3d0:920f:f7b7 with SMTP id
 v5-20020a05600c214500b003d0920ff7b7mr5623391wml.22.1670178777044; 
 Sun, 04 Dec 2022 10:32:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 w10-20020adfd4ca000000b00236545edc91sm12366998wrk.76.2022.12.04.10.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 10:32:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Dec 2022 19:32:53 +0100
Message-Id: <20221204183253.18925-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QNZNsi9glmzA1SZyZx2Cepl2lgOzmiBnexm5UYgWXPM=;
 b=RRHwZlhQgpnpFHQdTgjOgIdKwjw4oz+xNtvsTyZv/g6aMyFiLGqsApvS1feFa5aaDX
 u4Sv5ffDSs3GpDTX21326EH15b2+A2+4dr6fzXecn/ai9J9PSGaHM79hvM6OpW56EOew
 I+q6fWaMWnoVmtHtKq1KmssZWTMlXHmPuI3ytdjNQKrQfZh0p5TDL8YjjYj5Rzk+urxf
 5H/jZ5Y/cEa1VDzJUs4zMrsTUEDNU/6wU4PGAuU8Euev8mD4zrgnlox+/PrIQVJHDA7i
 iiWPaMOAYptWz52Ch0ujyYwRenMXNoz3OlMcirdiE1lbIVY1APQjZKy4g7DO69ERLuXs
 RUMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RRHwZlhQ
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6serialport: fix license
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 343974b99528702842e8c1dad945fcd4f0defd6c forgot to change the
licensing information which has been updated with
https://code.qt.io/cgit/qt/qtserialport.git/commit/?id=bb05a26d52c834cc7f3c549f3e5d66f76baf42a2
resulting in the following build failure:

ERROR: LICENSE.GPL2 has wrong sha256 hash:
ERROR: expected: 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
ERROR: got     :

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt6/qt6serialport/qt6serialport.hash | 11 ++++++-----
 package/qt6/qt6serialport/qt6serialport.mk   |  7 +++++--
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index fb1b3dcf6b..54a45681fa 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -2,8 +2,9 @@
 sha256  f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483  qtserialport-everywhere-src-6.4.0.tar.xz
 
 # Hashes for license files:
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
-sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
index 01763657b8..362f5ecd8a 100644
--- a/package/qt6/qt6serialport/qt6serialport.mk
+++ b/package/qt6/qt6serialport/qt6serialport.mk
@@ -9,8 +9,11 @@ QT6SERIALPORT_SITE = $(QT6_SITE)
 QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
 QT6SERIALPORT_INSTALL_STAGING = YES
 QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
-QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
-QT6SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs), BSD-3-Clause
+QT6SERIALPORT_LICENSE_FILES = LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
 QT6SERIALPORT_CONF_OPTS = \
 	-GNinja \
 	-DQT_HOST_PATH=$(HOST_DIR) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
