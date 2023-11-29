Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5386BC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 22:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E31FF615F8;
	Wed, 29 Nov 2023 22:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E31FF615F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYbKT9ayszTP; Wed, 29 Nov 2023 22:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568C0614F9;
	Wed, 29 Nov 2023 22:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 568C0614F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5F4C1BF356
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 22:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE98784400
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 22:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE98784400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEYA5o36EM-0 for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 22:08:48 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A412A843FE
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 22:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A412A843FE
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-332ff20ec45so901692f8f.1
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 14:08:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701295726; x=1701900526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aSLSGDxpX4ceqy4RA8mTdiJ1iimoUnvG4OLvx07XzLQ=;
 b=qSSBoqCT+O9P3dMdLSvkslwChLnumhW6vxRJp1q94AGbOf/bVjchXBpp1Gl3BnoJuZ
 1TDakhIYnPNe/b8HioqlnsoZtt9P6y40QajtHJrL3PG0fHfsJDFNPli7V63+gIfGeTJr
 8TDOuLUVb1aP+0ADEzngQO1bkXmcHBltfO+NtPDxo3sM/nbBjh3gcQIhmP36SvQFsOZD
 9v+tqkTs/Zt9UtQRfVKsyPYaFBIPqICvnmLliH5BtoCrqpEj8Z+D5CBCoEJvx1kY+Ssy
 0QxzM9axA/9qVD6d2Lb5T1nn0vJBJQEirnYNsjnBBjN+MbyzHl/YmHy6ZVDoJsWmqu8S
 6GVw==
X-Gm-Message-State: AOJu0YxG4KACqYnzk8qI+L+Hs/sPfq5jSRsu/Ms2VhM82MBeL6RZwEjS
 UlxaFmd8mJVVRti6Z57G7OwQqQcf7/c=
X-Google-Smtp-Source: AGHT+IFaMo6ind8w0DeuB3LYCr+/GcG1zRI9A8aCPzddZcYLEuXLAygtC/AhnpYQAepAyeEAH31O6A==
X-Received: by 2002:adf:f944:0:b0:333:1a90:83c5 with SMTP id
 q4-20020adff944000000b003331a9083c5mr2211022wrr.19.1701295725644; 
 Wed, 29 Nov 2023 14:08:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fa16-20020a05600c519000b0040b36ad5413sm3477117wmb.46.2023.11.29.14.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 14:08:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 23:08:43 +0100
Message-ID: <20231129220843.1712894-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701295726; x=1701900526; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aSLSGDxpX4ceqy4RA8mTdiJ1iimoUnvG4OLvx07XzLQ=;
 b=aZTHWVF0J0VBlz728jTNWW5+2JPoegXL2TDYAySzhx42QrpR2qXr87a1EdLM2aLoTW
 Ei6bVsQWPDICiKS1FgRsicIU3vj/5rg3qVWkjdrYRJpD3Z3eIbt95X4hen0Htl8ko98B
 21Wrs12FGAEDPRUUhjy/OZ6Ks4jB5zPCslTm60JA/2FNVLhJn7vNipnAKkqYXewWvtNa
 7pTCIvq2LvQ8XRcgowj9LUH2O8pnJCoMv3raDSOLihvt6PCvozXLOD/oG+Q4kCZbVXal
 1JUxG+Zn43zvUPngiXKhzMRsPIXvbFp4hQsatHAkfMGyFHm8txrXs5kC6nrbLTJnpLAe
 GZOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aZTHWVF0
Subject: [Buildroot] [PATCH 1/1] package/openfpgaloader: bump to version
 0.11.0
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
Cc: Jean Burgat <jeanburgat33@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure thanks to
https://github.com/trabucayre/openFPGALoader/commit/933ed793e85dea7e16ddd6540791097fd3a299f5:

In file included from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/jtag.hpp:13,
                 from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/device.hpp:13,
                 from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/efinix.hpp:11,
                 from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/efinix.cpp:6:
/home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/board.hpp:49:9: error: 'uint8_t' does not name a type
   49 |         uint8_t tms_pin; /*! TMS pin value */
      |         ^~~~~~~
/home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/board.hpp:12:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
   11 | #include "cable.hpp"
  +++ |+#include <cstdint>
   12 |

https://github.com/trabucayre/openFPGALoader/releases/tag/v0.11.0

Fixes:
 - http://autobuild.buildroot.org/results/ee89dcc7430079195e2e9ff300e1320de848d3e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openfpgaloader/openfpgaloader.hash | 2 +-
 package/openfpgaloader/openfpgaloader.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
index a8b537782c..6fa81a98a2 100644
--- a/package/openfpgaloader/openfpgaloader.hash
+++ b/package/openfpgaloader/openfpgaloader.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  966b4629df86b1d520ddd8a4e0a3fc00060b26b5ab4e172b596bd9d4659a196e  openfpgaloader-0.10.0.tar.gz
+sha256  a463690358d2510919472c2f460039a304d016a08a45970821e667eea1c48cc8  openfpgaloader-0.11.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
index 6d7fbd9850..0fd172b532 100644
--- a/package/openfpgaloader/openfpgaloader.mk
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENFPGALOADER_VERSION = 0.10.0
+OPENFPGALOADER_VERSION = 0.11.0
 OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,v$(OPENFPGALOADER_VERSION))
 OPENFPGALOADER_LICENSE = Apache-2.0
 OPENFPGALOADER_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
