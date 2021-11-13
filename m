Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47259C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 15:31:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A19D3611AF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 15:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A19D3611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E20260673;
	Sat, 13 Nov 2021 15:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WWgxmpBHfRsE; Sat, 13 Nov 2021 15:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB72E6062C;
	Sat, 13 Nov 2021 15:31:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE5F1BF306
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 15:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3A4F81068
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 15:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J0rpt6hw7Qlb for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 15:31:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E114780F41
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 15:31:39 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id d11so24791960ljg.8
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 07:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fk9mj/VU14cBQ31Lh6Qy1I2te0cbI7jRS/bssh4Wu1Y=;
 b=dFcxudGtG4RvofX8HxSkUCWEZAR4qhfhkIL1xj2OfSmowdJG+5Jn1z7ZbsuEL10Sqk
 uNTFC7cjxCYKXSNyCmWEX/ZJ1p61WF8UfyhYUAq7xmfWW0xIBQkNANmFIym79Mpn1TGi
 KyCsYdc815LjSP/rzOXAorXp6wrT6z5KKmeDeAT8411Y6tY4ikt7lKj7tAgHtuAvPn7i
 tMollS2ZFFVOsF2xlwtr4FNFaiUVvITIgCsH83xgfSDAw4ThGeX/8obgYaC9lnbH8Uky
 piReAuZeiMO0cFl7kIbu+ix/7ZIt4RHc0qgfEM0v87KRgdAYfaVuA2zgHYyfNixALzEL
 CFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fk9mj/VU14cBQ31Lh6Qy1I2te0cbI7jRS/bssh4Wu1Y=;
 b=rGCvq+q2hsB8g1cc5Dea9UsNeDR8XiBnSKoL0cBeB2yS54cNOTJibhAbd/ZRAiPaG1
 GNXCkyOpqaPIJ+BdtgM70/2sC6xA19POvR5PsZjVl6+c2gDc210R7/TStlzgjN+fd6Ai
 brUKz1Z7uJMME7W3LO7TfwZiCXhpDyFrL0b/qGC6vfSSsakSkNuUtepnB1nRr2Al8Mmk
 zZjBcCcN+7a/c96BEtzIWTrT5Ozzb4JQFw5Wa+rWNlWM56gqKaPFCcvxcorNNKNf/K4l
 O7G2j+4C8ywY0UuDbx86OigCWOlm/pci8LdbmZ23VXtEcB1eX7dzMPom90Gf3n3ePpm3
 9N+A==
X-Gm-Message-State: AOAM531efHU737ekfMWA2K7DkbfSGjxkBxvByL4tf1ITfv76fRt2pHRU
 EzePOKAAaar0fcDgdEiHNgiASuXRsY0=
X-Google-Smtp-Source: ABdhPJy98vrnJXwf/C/OuwTCTbskayid9IOQW+fDHCtUc8zss6Sb6V7tQ9jPPfY4SdBOe+t6xERI+Q==
X-Received: by 2002:a2e:7f1b:: with SMTP id a27mr22498212ljd.55.1636817497404; 
 Sat, 13 Nov 2021 07:31:37 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id i12sm891723lfb.234.2021.11.13.07.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 07:31:37 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 16:31:21 +0100
Message-Id: <20211113153122.1745140-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211113153122.1745140-1-troglobit@gmail.com>
References: <20211113153122.1745140-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/smcroute: bump version to v2.5.4
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Drop backported patch, included in new release
 - https://github.com/troglobit/smcroute/releases/tag/2.5.4

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 ...Avoid-trying-to-delete-inactive-VIFs.patch | 51 -------------------
 package/smcroute/smcroute.hash                |  3 +-
 package/smcroute/smcroute.mk                  |  2 +-
 3 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch

diff --git a/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch b/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch
deleted file mode 100644
index 07f49dffcf..0000000000
--- a/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8ce1d117a31e35d97fb955b82edf13514267eaab Mon Sep 17 00:00:00 2001
-From: Joachim Wiberg <troglobit@gmail.com>
-Date: Tue, 28 Sep 2021 11:09:47 +0200
-Subject: [PATCH] Avoid trying to delete inactive VIFs
-Organization: Westermo Network Technologies AB
-
-When probing interfaces at startup, there's a check for IFF_MULTICAST,
-if this flag is not set we try to delete its corresponding VIF/MIF.
-This is for hanlding .conf reload scenarios where an interface has had
-its MULTICAST flag dropped.
-
-However, when starting up on Linux systems, the loopback interface has
-no MULTICAST flag set.  This leads to the following bogus warning:
-
-   Failed deleting VIF for iface lo: Resource temporarily unavailable
-
-This patch makes sure to check if we have a registered kernel VIF/MIF
-for an interface before attempting to delete it.
-
-Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
----
- src/mroute.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/mroute.c b/src/mroute.c
-index 291e9c4..6a80a47 100644
---- a/src/mroute.c
-+++ b/src/mroute.c
-@@ -298,6 +298,9 @@ static int mroute4_del_vif(struct iface *iface)
- 	if (iface->mrdisc)
- 		rc = mrdisc_deregister(iface->vif);
- 
-+	if (iface->vif == ALL_VIFS)
-+		return 0;
-+
- 	if (kern_vif_del(iface)) {
- 		switch (errno) {
- 		case ENOENT:
-@@ -910,6 +913,9 @@ static int mroute6_del_mif(struct iface *iface)
- {
- 	int rc = 0;
- 
-+	if (iface->mif == ALL_VIFS)
-+		return 0;
-+
- 	if (kern_mif_del(iface) && errno != ENOENT) {
- 		switch (errno) {
- 		case ENOENT:
--- 
-2.25.1
-
diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index 26d55adf88..ddc38eddd2 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,6 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256	4342b95c99e410cab75e9ee80f20480e0170d8b07b8e31553ba1bec3e377fc56  smcroute-2.5.3.tar.gz
+sha256	96b890fd6fbf8553010f62beda991742f7b4e7e8aea3e75335fb6048b15869da  smcroute-2.5.4.tar.gz
 
 # Locally generated
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256  d260ea4b9d4b01317568850c3271e3923b546ea4ad57c899e79434f1cc8bcf0b  0001-Avoid-trying-to-delete-inactive-VIFs.patch
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 913647e7bf..81f540088a 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.5.3
+SMCROUTE_VERSION = 2.5.4
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
