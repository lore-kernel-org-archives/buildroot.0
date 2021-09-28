Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6275C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 09:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E0B610A2
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 09:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19E0B610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDAB180DBC;
	Tue, 28 Sep 2021 09:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qD46iBO5t-jv; Tue, 28 Sep 2021 09:44:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 183F680D5D;
	Tue, 28 Sep 2021 09:44:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9DF01BF29A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 09:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6642608A2
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 09:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9us0demHtLaW for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 09:44:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EF8F60AD9
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 09:44:07 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id x27so90206687lfu.5
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=ykIH2qXqnLtQqAwLtvN5vnF1j6TXaEnwUxeUORwiCBM=;
 b=nqhlAFE2mRz3zVnXYZtLb+MGzMmrzLlRZSOU+ZhruwMwTMXCMIOtKkOF6PjwAY2SrF
 vMRn+nr2ah1WeF96nPGPugMY56LM1nYXSad7gExB+NEXmy5fRC5l86ZmrkvsrQzOaRXF
 pW758AfVLpBWXdolSBbFpqCDVDLFi0os15t9w1b+45EIhhXI7g28itWvxSkkEAC/nz3/
 3PVMTSe/Fdp1CeLEzYmF6K52I3RL8pt9/nJd+NhLFIQZIIJFxhfCbX0ssuCAQ0cSyZK1
 NmvIttfdXJvWnRfUNouCAMtmMySuU5Zm3XNoHroSlr74AT5M7XP7tQOVZ78KeVAzpehj
 4N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=ykIH2qXqnLtQqAwLtvN5vnF1j6TXaEnwUxeUORwiCBM=;
 b=kudBqM4FyOip85lq/SCTg7gx+ANpHuBswvbqIwUqM25HpoNwiX29ahaBDZBbXDmyrY
 yaWx1LBT5ivkoK023oH+WDRZkvZu2d+qwyPUReBjJTwX8Absv3nvEut/kPPBNKcn+GQY
 jOL8Zg541RCYJRlzaf8ySkK8DFO9Lf7jykReNeRLgfnTtQQZZU6f50Tc9LQ1uSfEbq6J
 bxDvb6fnd+eHbTwFNFMFJMvQxrHmUSXndc5MZ62zf7LX4Rsp94TX3RbK0oJufLu5ovjO
 eEG8GGIMDnOegEWskbxV2b0k9uXQMlBo3aSMCTbarZEyLDGS7ZRWbg3hISMsX9R7g6s4
 DVjw==
X-Gm-Message-State: AOAM530ZwNeEpyNaMKDriSxMOK98S++v6IskwprZr3pNmvGNHel4Euvw
 AYpyGIPK0BIcLbtIqB8PTLdi5UZGR4Y=
X-Google-Smtp-Source: ABdhPJynVIuWeqoHbzYcR0Q7Pza9j27FtZe+w6inx9w9ACEcGVROmkqjEf1ykf0eoNZTCrMYqdCdnw==
X-Received: by 2002:a05:6512:3154:: with SMTP id
 s20mr4670618lfi.475.1632822245789; 
 Tue, 28 Sep 2021 02:44:05 -0700 (PDT)
Received: from wbg.labs.westermo.se (h-158-174-22-41.NA.cust.bahnhof.se.
 [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id s29sm2481192ljd.54.2021.09.28.02.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 02:44:05 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 11:43:22 +0200
Message-Id: <20210928094323.2566981-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928094323.2566981-1-troglobit@gmail.com>
References: <20210928094323.2566981-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Subject: [Buildroot] [PATCH 1/2] package/smcroute: bump version to v2.5.3
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

 - Upstream has .sha256 checksum files, drop redundant .md5 checksum
 - Backport upstream patch to silence bogus error message for loopback
 - SMCRoute is useless w/o kernel support, use same fixups as mrouted

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 ...Avoid-trying-to-delete-inactive-VIFs.patch | 51 +++++++++++++++++++
 package/smcroute/smcroute.hash                |  6 +--
 package/smcroute/smcroute.mk                  |  9 +++-
 3 files changed, 62 insertions(+), 4 deletions(-)
 create mode 100644 package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch

diff --git a/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch b/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch
new file mode 100644
index 0000000000..07f49dffcf
--- /dev/null
+++ b/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch
@@ -0,0 +1,51 @@
+From 8ce1d117a31e35d97fb955b82edf13514267eaab Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Tue, 28 Sep 2021 11:09:47 +0200
+Subject: [PATCH] Avoid trying to delete inactive VIFs
+Organization: Westermo Network Technologies AB
+
+When probing interfaces at startup, there's a check for IFF_MULTICAST,
+if this flag is not set we try to delete its corresponding VIF/MIF.
+This is for hanlding .conf reload scenarios where an interface has had
+its MULTICAST flag dropped.
+
+However, when starting up on Linux systems, the loopback interface has
+no MULTICAST flag set.  This leads to the following bogus warning:
+
+   Failed deleting VIF for iface lo: Resource temporarily unavailable
+
+This patch makes sure to check if we have a registered kernel VIF/MIF
+for an interface before attempting to delete it.
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+---
+ src/mroute.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/mroute.c b/src/mroute.c
+index 291e9c4..6a80a47 100644
+--- a/src/mroute.c
++++ b/src/mroute.c
+@@ -298,6 +298,9 @@ static int mroute4_del_vif(struct iface *iface)
+ 	if (iface->mrdisc)
+ 		rc = mrdisc_deregister(iface->vif);
+ 
++	if (iface->vif == ALL_VIFS)
++		return 0;
++
+ 	if (kern_vif_del(iface)) {
+ 		switch (errno) {
+ 		case ENOENT:
+@@ -910,6 +913,9 @@ static int mroute6_del_mif(struct iface *iface)
+ {
+ 	int rc = 0;
+ 
++	if (iface->mif == ALL_VIFS)
++		return 0;
++
+ 	if (kern_mif_del(iface) && errno != ENOENT) {
+ 		switch (errno) {
+ 		case ENOENT:
+-- 
+2.25.1
+
diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index 62b72239cc..26d55adf88 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,6 +1,6 @@
-# Upstream .md5 and .sha256 from GitHub
-sha256	7eca88389cc08cbfe75f787e02ab32a390ef806555069a08abe8d7fa925ed094  smcroute-2.5.2.tar.gz
-md5	dc29e6bd3024a1ad3dd0f2d8c2aed16e  smcroute-2.5.2.tar.gz
+# Upstream .sha256 from GitHub
+sha256	4342b95c99e410cab75e9ee80f20480e0170d8b07b8e31553ba1bec3e377fc56  smcroute-2.5.3.tar.gz
 
 # Locally generated
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  d260ea4b9d4b01317568850c3271e3923b546ea4ad57c899e79434f1cc8bcf0b  0001-Avoid-trying-to-delete-inactive-VIFs.patch
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index e8fc54bb42..96da0dc346 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.5.2
+SMCROUTE_VERSION = 2.5.3
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
@@ -30,4 +30,11 @@ endef
 
 SMCROUTE_POST_INSTALL_TARGET_HOOKS += SMCROUTE_PRUNE_COMPAT_SCRIPT
 
+# We will asume that CONFIG_NET and CONFIG_INET are already
+# set in the kernel configuration provided by the user.
+define MROUTED_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTICAST)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MROUTE)
+endef
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
