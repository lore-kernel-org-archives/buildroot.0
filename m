Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C45BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 21:39:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C4F60F6D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 21:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19C4F60F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED6D60828;
	Sat,  9 Oct 2021 21:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7M-KrHmS1Cf; Sat,  9 Oct 2021 21:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D4B06077B;
	Sat,  9 Oct 2021 21:39:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84EF51BF578
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 21:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74AE06077B
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 21:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkOcex3Vwzzt for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 21:39:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 894836074E
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 21:39:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e3so7972871wrc.11
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 14:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vta9KWJVLWFmcizx8yV5u7deZAlyFwVllCl+YEFlp7I=;
 b=aXUC51+EJHii8iRihI8qSFaRNW9zfG3aj7XY+crOBJJyv6or6zSpl5X8VFP/QtTDp5
 xg8jOo8U4HmWFcP4YEDJuVe26j3hV1B/KiQc9Z00MfI0PPPdWbxuwmPK9Ev373f+Q36D
 GOnV4+mNL/50xxHQnwWrBQ1Npot88H1nYDIgnBAB6mQ8Em6wEmxrraxPfBHc5IPIOA21
 DtRJTDbQu/oxZGWfXJqjTwNR3SDPOMBk1REZpSzER57pp0KkDttYAQetuFwM2BRM385S
 lx4KH///xvbcXeIfjL3g+VviofLBsmeyr0O0znaTgRzqYUSGipSl5XvzQeHdDcVxHhSk
 5goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vta9KWJVLWFmcizx8yV5u7deZAlyFwVllCl+YEFlp7I=;
 b=uwfTmlppBO9D889MP36qTnPS7V1r1FVs2iWriJlI+u1ycSBMwRpXzr6rEapmhM8eA9
 c063b9X8qgsclO5HllgOy77BHQJVkb7b2reY7TbFnLS7ZDXctBqFfSP95rPJpLXSAjv0
 2TDit8kky5aTMrvyuXNvxqxniVuxEFaqtF7u0JOW+8jGGnLMbkEamwP6/FtiyulnznUr
 LcXG2SWknNuwOpf5wEPcZYSOzk9b4Q7Hozkn+8azwpLI9kTmtd5JHkNBF6Uve/NCpE5F
 /uFx7FBMd5+ioreeG79HJTMX3V12lFE7UbcWDTrfG06sMXW2BlXkB6bkFjPYsy05cEpr
 lIhg==
X-Gm-Message-State: AOAM531B0DM7jlXE7rrTz4/v0shL8/4LwI/nRSl82yrR3JVfdxnJltUp
 RLhb7Y3Ro8O0eGpUBNJTlm2QfkMVM8g=
X-Google-Smtp-Source: ABdhPJxscHXdeFMGqjIqDaJ54x3zescButJMSTFAof6pvP+oYGJFDIN72ddwSRzz3l+uCzBqh7Yo1g==
X-Received: by 2002:a1c:1b4a:: with SMTP id b71mr11679238wmb.33.1633815552538; 
 Sat, 09 Oct 2021 14:39:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id j1sm3993897wrb.56.2021.10.09.14.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 14:39:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 23:37:42 +0200
Message-Id: <20211009213742.698489-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.14
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/nhorman/rng-tools/releases/tag/v6.14
https://github.com/nhorman/rng-tools/releases/tag/v6.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rng-tools/rng-tools.hash | 2 +-
 package/rng-tools/rng-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index 0ba2dc8329..6806a99fc6 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6fd5b52a700edec85eb1043970e22e8e2ad06a4b43851f35d33d90e09570e9d3  rng-tools-6.12.tar.gz
+sha256  4dd86f6ae37d917a8489f44070d39d7feddcc622429b95efd7aa85a1f3cfdf81  rng-tools-6.14.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index e7fb998df6..8db97569d4 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.12
+RNG_TOOLS_VERSION = 6.14
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
