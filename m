Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5D9C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 04:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADFFD81B26;
	Tue,  7 Feb 2023 04:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADFFD81B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgIDklQ2aWHi; Tue,  7 Feb 2023 04:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA36781D24;
	Tue,  7 Feb 2023 04:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA36781D24
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 041151BF2C8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 04:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D252040249
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 04:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D252040249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovmABc_0pQ6N for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 04:31:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B981A40202
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B981A40202
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 04:31:25 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id g9so9912797pfo.5
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 20:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G+foHxVluysYohqGu/SYq+8j8Rr/Jc1OUaNmEfh0r2g=;
 b=Xu66fj6LTjmZUB9AwpeiwlZ9Mfp/2aY9gh0KDqkQ1hNmr4pyKb8/aPbkVaYBmWxSHQ
 jGNPHO7Roqq/iESgxo78EuUfh134Dn6Z/vXSBy9/gfnvkbmOCMj9eceHlg/oYBCWuy8V
 p69AJ6sny8Icej3Lppgs1gPkErLMz6wuFce00ID+2lkRlCcVJP4BLGrr1cXdMQuVWvaN
 gGfc+DoQyY/24r3Tm/Uv8Ip38Xm7ds67ETlLRA4vJh6QFP2LKwrbjegj5WtkCYSEyUq7
 04nF9jS92qGNp1pkyGIdqUfJ0FX9/UsySsVKEYqc6v1nEBr84VQZTomU30T3dslOFzVt
 gEvg==
X-Gm-Message-State: AO0yUKVzCVwlrqz3fLwwxaFH3cAoVW0Sl9GRr5PjnWHYqkB6UNgsSwoh
 iNoZf2ld92WNhfvamgfiES03pxG+CPAkcQ==
X-Google-Smtp-Source: AK7set/zhZ4GUvVpa9CFz02ocCcfBOwB9OxszEBAWe+8mZc0PNZB25J+yOiSMgTFGinppHcvEpniHg==
X-Received: by 2002:a62:7987:0:b0:591:b0ca:993c with SMTP id
 u129-20020a627987000000b00591b0ca993cmr1959395pfc.20.1675744284816; 
 Mon, 06 Feb 2023 20:31:24 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 k20-20020aa790d4000000b005907664a3eesm8007971pfk.125.2023.02.06.20.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 20:31:24 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 20:31:21 -0800
Message-Id: <20230207043121.86027-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/balena-engine: bump to version
 20.10.26
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Tian Yuanhao <tianyuanhao3@163.com>, Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

balena-engine does not ship a go.mod file in the tarball: create one to tell the
Go compiler the root import path prefix for the module and the language version.
Note that the language version in go.mod is not required to be equal the version
of the Go compiler.

This update requires a workaround for the non-standard vendor/ structure in the
balena-engine repository, which has an invalid vendor/modules.txt file.

Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705

Remove the vendor/archive sub-tree (fixes a build error) because Go no longer
allows having duplicate packages in GOPATH and GOROOT. vendor/archive/tar cannot
be in vendor/ because it exists in the standard library. Remove it from vendor/.

https://github.com/balena-os/balena-engine/releases/tag/v20.10.26

Signed-off-by: Christian Stewart <christian@paral.in>

---

v2 -> v3:

 - add missing go.mod file in CONFIGURE step
 - use rm -f instead of checking for file existence
 - update comment about language version

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/balena-engine/balena-engine.hash |  2 +-
 package/balena-engine/balena-engine.mk   | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
index 4adb8ce561..6a92a40cc8 100644
--- a/package/balena-engine/balena-engine.hash
+++ b/package/balena-engine/balena-engine.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4fb38109d133d499de366466a612fb6f523ea99d56fcd69b45dc494a75fbce0f  balena-engine-20.10.21.tar.gz
+sha256  1482b64e35d5406be719e362647ed7d0599cf4eead7770247ebd972c4c85ede5  balena-engine-20.10.26.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
index ecfb62bfbf..89a572cf8e 100644
--- a/package/balena-engine/balena-engine.mk
+++ b/package/balena-engine/balena-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BALENA_ENGINE_VERSION = 20.10.21
+BALENA_ENGINE_VERSION = 20.10.26
 BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
 
 BALENA_ENGINE_LICENSE = Apache-2.0
@@ -34,6 +34,16 @@ BALENA_ENGINE_TAGS = \
 
 BALENA_ENGINE_BUILD_TARGETS = cmd/balena-engine
 
+# create the go.mod file with language version go1.19
+# remove the conflicting vendor/modules.txt
+# remove the conflicting vendor/archive (not allowed in go1.20)
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define BALENA_ENGINE_CONFIGURE_CMDS
+	printf "module $(BALENA_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
+	rm -f $(@D)/vendor/modules.txt
+	rm -rf $(@D)/vendor/archive
+endef
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 BALENA_ENGINE_DEPENDENCIES += systemd
 BALENA_ENGINE_TAGS += journald
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
