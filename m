Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AABC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:44:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D04526108E
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D04526108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9796680BBE;
	Tue,  7 Sep 2021 08:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBN8zz-0bljH; Tue,  7 Sep 2021 08:44:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA67A80BF4;
	Tue,  7 Sep 2021 08:44:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37A831BF48D
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 279066068C
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:44:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LX3GBkYNw8qI for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 08:43:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75DE560602
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 08:43:59 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso1058808pjh.5
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tfgWiQeLxikoZqpJlCNkSpfzvv0NbtLlETWWF2Elx+A=;
 b=NwZ2krZ0LTR9hGmGkwSdbF+OplZIBVtEdER9ufOx/L3yP4mZgZL5ANe+nC0/S4Xeuz
 omQwmY6VgUdmAjEHNldqiGQoUlfXx8yEEorOLNkGtcuY6HKszZGokbruRu9jepry7SuT
 2d7pLi0c4Y2mOIkB0u0jZadhtGnYNKjHtahdbJkrXo0vk+cUIIo+xqY1HCwr1jSWeVOj
 BIHUDzkXvuic9AoUcBp78KkjQmW36KbvZ8vQmjkDoVncbj6NGypH9J83lb6X1WbmvWwN
 U1h7kNYfYInrz8JvugPsyIQ7o42QXuu2KubPgY/SwIWYpvqDWfhg5x0aYGVlCvVENo9T
 XLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tfgWiQeLxikoZqpJlCNkSpfzvv0NbtLlETWWF2Elx+A=;
 b=iJsVyIXr7b5uJ2TdB81PU073uCDNTu3d7bbMBH66OCDiFMG+C1XL7jN6Mz1Esa2exd
 JSwwJ4oQTaefdDLn07rWyfSffI+c8DFXrGxabYyfwd/lFQfIfw30VQM0NA1bZJjRWg2b
 538GrmNM+gWi3VpYauj+oP6wPD5QBzESZGhsZH+brH28Bv5IDVB7TySjZpszUdIwMvL6
 U5lRHt/yG9yE24PG3RIr4WbU1Yjn12ejwSeNOktrkwwWnHZnMhdOxJpE1sQoIR6G7q8S
 LLouaZE5i9Vmqdb1KMARnU295AQ6Cay6wfMq3YVjbiqmkkNP2MliF2gzmumotRY/jCoh
 veJA==
X-Gm-Message-State: AOAM532O2W3tD1cQKNIm16Qy7V/EWR9SE90UVBLUojdVAieQjZKmAJcz
 R3TVPEHLI+moxyf1d1b++HNcnW/1R2vfdQ==
X-Google-Smtp-Source: ABdhPJxJcH0fmCVz/oSvKgl6/Aq5SamFDaowzrlfJgZyBxiAzRStYsN4ElSkU5im2z7PmfPGWOTRIg==
X-Received: by 2002:a17:902:dacc:b0:135:960b:1754 with SMTP id
 q12-20020a170902dacc00b00135960b1754mr13840975plx.77.1631004238598; 
 Tue, 07 Sep 2021 01:43:58 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:99c1:78a8:271f:9808])
 by smtp.gmail.com with ESMTPSA id u12sm12513308pgi.21.2021.09.07.01.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:43:57 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Sep 2021 20:43:43 +1200
Message-Id: <20210907084345.6192-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/syslog-ng: Bump version to 3.33.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index fdf37ec3d9..df8002341c 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  35913654582947705a5679c9a2dcd4d25b4c98f3f3734cd55e94c5c780c22877  syslog-ng-3.33.1.tar.gz
+sha256  0b786a06077b9150191d714f45a1b4b3792952cb58163a3af336f074da9fb14b  syslog-ng-3.33.2.tar.gz
 sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index b5aa5ca027..765e886b12 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.33.1
+SYSLOG_NG_VERSION = 3.33.2
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
