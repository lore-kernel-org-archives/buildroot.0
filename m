Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83049C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3858D81371;
	Fri,  7 Jan 2022 20:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7BoRA7xlij1z; Fri,  7 Jan 2022 20:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955EA813A4;
	Fri,  7 Jan 2022 20:42:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2BF1BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2726F424C1
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-Zt1fH1Hnog for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:42:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D5FC424B3
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:42:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s1so13263326wra.6
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 12:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dyMLrTAMZBnRcJ1OEPAUJNxZnC7Rmy1rYSMgyvbL4cM=;
 b=cL6eJB5BAnJfjSsxI2p6LsXpdNG7mKKGPcO7PfKLyQsJDW8/rVq4TzjPEQ8UelFplf
 Dla9RnTTxpEZTiaMMEpWBGPojVT1oCfa8VYq2v22yc8YS08cdXpLCgqdyMGh9eqGqcot
 8moloA2YlrOEn+XavQRFKYpBIxzdkH72jtum29JgQcRkzqBW1JkZpis82E7guPz8M4la
 8/oPkddi5ftzq3lbQy/9mr+iBgd6k7R302v0NRPAzSBmhegAe9RjC2+8dSD1X852qsaO
 VCj79yQ4UGIM8XOsHvsMP8j0i99PZbhMc0Anzd2ioIYMVxshjgG1A/V9PYovH4XB5z/1
 jWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dyMLrTAMZBnRcJ1OEPAUJNxZnC7Rmy1rYSMgyvbL4cM=;
 b=L0lMxf/66Qg6hdbWH/IkUyuGbB0wp33fnpPUJ++i1UXehWxJXlDEKCab7AFN9JV4V7
 SoTQNW1nCR9kHeMgyqMk+a32j+ijLeIJlnXGnG+ExmacQJ2bqlpITQGXYUUE25RNlN8G
 7H6mDT9RYXyld3mxrqBRX2nrjyuXivdXWJiM69vr7Bu9mC2ry4+knlp6UP1TEIwgs7oV
 An3ApH15T/mP7+PZT+kIbz3tJQqpTZ3fulbtnQfnk3K187Sdpst2hcqgF/XNzWyl7Gbj
 hmdEkOked2FELvksWELu/CNlInhpJ2cSxprk0/ip2epq29odtYZhb8P8MXsyfMw1/Kn7
 boJw==
X-Gm-Message-State: AOAM533m1ydfwRwRQucUm6XLIYN1x+lqU8gT2knJ2djhFmmDdfmhZZ1p
 YWVfYtuqV9fq0Ciz/zsfjrYos4w6mSw=
X-Google-Smtp-Source: ABdhPJybPacDwlszQ7ZYAIQhxkJ8vuuZ0HBrTPa4T6nX9h0NnAqZ47FaoAljXdX0QyEbsSrsvSi18A==
X-Received: by 2002:adf:fb90:: with SMTP id a16mr32547980wrr.283.1641588122048; 
 Fri, 07 Jan 2022 12:42:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id v1sm6538440wru.45.2022.01.07.12.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 12:42:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 21:40:54 +0100
Message-Id: <20220107204054.1461571-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/semodule-utils: bump to version 3.3
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

https://github.com/SELinuxProject/selinux/releases/tag/3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/semodule-utils/semodule-utils.hash | 4 ++--
 package/semodule-utils/semodule-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index 595183924d..c252506df5 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 be155654883c8dc4d05493e04a3eb9e56d28803009f1fdd721d42c68b878f757 semodule-utils-3.2.tar.gz
+sha256  3098ec5e5f04a1dbbf4aa569b63a4570750a9fe0d4da14ce45954aa300a17063  semodule-utils-3.3.tar.gz
 
 # Hash for license file
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index 426dbdb7b6..a9388f7ee8 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 3.2
+SEMODULE_UTILS_VERSION = 3.3
 SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SEMODULE_UTILS_VERSION)
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
