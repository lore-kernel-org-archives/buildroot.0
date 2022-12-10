Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB38C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 13:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A8B409FE;
	Sat, 10 Dec 2022 13:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A8B409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJV5O-FrUw5w; Sat, 10 Dec 2022 13:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E433C40544;
	Sat, 10 Dec 2022 13:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E433C40544
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C05DA1BF855
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 13:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9842181CAD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 13:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9842181CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOpbj3SHAVpA for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 13:22:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6E681BBD
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E6E681BBD
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:22:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o15so1781606wmr.4
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 05:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2k+PG2KHw4DO48IoLRgJkdpYidf8P//N8dnhUNC3bsc=;
 b=PcF88bu61zEly0erbCKvleznUGUPXdePj8EhynASwsbfUOfeAGrALElgb7YFvn4BF7
 FYuIsQLcU5bmzSBJqXGqBQhzclSSMihNVNp/MQgK0cHofoRp1ZHJq1kOMYttq5jkpQHh
 wXi3MExT22QqbPyw7AKfb7PeT+jMWzTVv4Qd/WHxqb54twMILQYcb0VzyX36yXIY8qRO
 eFBnm9Y+ty8dx06Tx/v0us8aRJ3nVDt2J5TLrewBZ4TSm4lYk+din2yhNvODGwe/CVmI
 MOHmbj8yl5+t00ihTR53frEW6vv8ckfAaQ3gPcS8G7PKCTFm+h/jpjBLP/oX9bGm33Md
 9Ulw==
X-Gm-Message-State: ANoB5pmBi+FGqbPxiNHhzLBX702WbllzyG7BsPbyR9Rdj4mruVHqsBNw
 ExHrPtkcm7xoD6qG1PurdkChldlKCe4=
X-Google-Smtp-Source: AA0mqf69s28UH/QpOe6AI9QsIC4R3q9aoO3CUwYxdRdcFHnWpRyuR3bIUrJtMXjwcKvjXtZXpeZnyw==
X-Received: by 2002:a05:600c:1c25:b0:3d0:a768:a702 with SMTP id
 j37-20020a05600c1c2500b003d0a768a702mr7507033wms.19.1670678564798; 
 Sat, 10 Dec 2022 05:22:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b003d21759db42sm2695593wmq.5.2022.12.10.05.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 05:22:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:22:40 +0100
Message-Id: <20221210132240.10559-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2k+PG2KHw4DO48IoLRgJkdpYidf8P//N8dnhUNC3bsc=;
 b=YlzwRT3qxsX/3Muu1NjqU3KTMGw+q+q6h7qNKFDri35pkKLqUvndl1thDot3ez6pmy
 qsQ+NLN50gSdF1HP7J5BxkMpsEpgvSUZRfkx0oUPmNKkHppEmUHY/eQaWFZKQ8pBLE1j
 8g004mfaVN5z73JwNpA6vLRi4GwqyqjX1ePHdjgVTEHhUcxTVjuwtkIuB6WgmVBBzCAK
 +lhmrSB7ApjXCwhaygcwRkrRbJiLGzA8tI4rmeayxTYCjpmaP1Yl3gp0IB648pBngW/Q
 egiITA2dcG7xyGZphxPdWQLd1YvpOSx21cxMO2/hMFfHwDUS9uqWtN1DCNXU6eevbUMt
 Bztw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YlzwRT3q
Subject: [Buildroot] [PATCH 1/1] package/neon: bump to version 0.32.4
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

https://github.com/notroj/neon/blob/0.32.4/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/neon/neon.hash | 2 +-
 package/neon/neon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index 5a5a77a58b..9bd6195e39 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  986566468c6295fc5d0fb141a5981e31c9f82ee38e938374abed8471ef2fb286  neon-0.32.2.tar.gz
+sha256  b1e2120e4ae07df952c4a858731619733115c5f438965de4fab41d6bf7e7a508  neon-0.32.4.tar.gz
 # Hash for license files
 sha256  ce2421ee38d6c0e02c85ac076478a0f92da6ef92b92b7a174877cabf01b2e531  README.md
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index eae6bfbad6..1ce8f1ff16 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.32.2
+NEON_VERSION = 0.32.4
 NEON_SITE = https://notroj.github.io/neon
 NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
