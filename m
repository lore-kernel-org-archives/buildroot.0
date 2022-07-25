Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34368C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 07:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91CED40CB0;
	Mon, 25 Jul 2022 07:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91CED40CB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJ_5mNF_nn0z; Mon, 25 Jul 2022 07:11:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D87440CBA;
	Mon, 25 Jul 2022 07:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D87440CBA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 074C91BF379
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 07:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDBE1405AF
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 07:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDBE1405AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgqye1O1rqVF for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 07:11:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 054F3401C2
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 054F3401C2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 07:11:05 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id o12so9621902pfp.5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 00:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zRZYZrqLv9LRmCVktczzsTE3pl+/O2hTd1mI8RYZ24o=;
 b=uxmvxIAojKclO9UMapGzYthDbN9OZSu6MoBJhMcbQWVYushhycnydUN9K5yNQn7hUO
 S9Vc/NJ+U1I0Kp+RJVidvdZNRD6LXQFDnCpj7DLSmGIp0BxKDIzC1RVX1PWlzoH+3TBf
 GNwAeb5829drGFHRV1vgGNAU0nIUjD+SwWxLUhD8dXdg1Yy5ttLHm3EallMKBxYqOfZu
 7HcbNUPRnsgJyEbaAZTY7cljtiIBOmRPzlEtzh338l7ipBpxDX2ZhNNxnEYkw4uBlb+k
 V60Mf0LM3K5IbLaxIV/+uPxluZDrC5j4P8h1T0FBDXqc8NACBPCtGkn+BDrixOmZQ9Pg
 X+gQ==
X-Gm-Message-State: AJIora8ZjQY8mCC+L6B24m6zBc/Jw96ouQS/wjwzby///yloWyo2NHgB
 LehbZ4NN7mk2mXcFS38yzuk7hgbr4qwWqQ==
X-Google-Smtp-Source: AGRyM1vZQjcE9aoUrKbY9B6N973/YliA1dWWeEHNnOzolf2AbPVz4sRC2K3nFtiJsOdPHkiEzEdFCg==
X-Received: by 2002:a63:1220:0:b0:411:f661:f819 with SMTP id
 h32-20020a631220000000b00411f661f819mr10119967pgl.250.1658733064806; 
 Mon, 25 Jul 2022 00:11:04 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 x23-20020a1709027c1700b0016c57657977sm8366137pll.41.2022.07.25.00.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 00:11:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 00:10:58 -0700
Message-Id: <20220725071059.3067736-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/rtl8812au-aircrack-ng: bump to
 latest 4ab079
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to the latest commit hash as of 2022-07-25.

Fixes the build against kernel 5.18.x and GCC 12 and ARM64.

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - update to 2022.07.25 version
 - add some Wno-error to fix build failures with GCC 12

Signed-off-by: Christian Stewart <christian@paral.in>
---
 .../rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash   |  2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index 667cf34efc..0e61e95780 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  749ba2e77d0364381445e40f7f0b7041d861cf9a356dbe53085e3abaef888c1d  rtl8812au-aircrack-ng-37e27f9165300c89607144b646545fac576ec510.tar.gz
+sha256  ad30e61bc3100861b995617672193ab027ec51061dfe1fea9f8625b99cd27995  rtl8812au-aircrack-ng-4ab079f7cb172740c7abc8cbd6e6383bef0f65dc.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 55c118a825..111fd520a4 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,15 +4,21 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = 37e27f9165300c89607144b646545fac576ec510
+RTL8812AU_AIRCRACK_NG_VERSION = 4ab079f7cb172740c7abc8cbd6e6383bef0f65dc
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
 
+RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
+	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+	-Wno-error=address \
+	-Wno-error=array-bounds \
+	-Wno-error=cast-function-type
+
 RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 	CONFIG_88XXAU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN"
+	USER_EXTRA_CFLAGS="$(RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS)"
 
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
