Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F1FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:34:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79727611C3
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79727611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45E3860EF4;
	Fri, 15 Oct 2021 20:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNLeBMXBGYee; Fri, 15 Oct 2021 20:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B08AC60EEA;
	Fri, 15 Oct 2021 20:34:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0E701BF2CC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED78160B2F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZVPL3REafea for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:34:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AA3C606DB
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:34:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u18so28522519wrg.5
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8x5bS8XCRYZD2F9OVZpQkBZRGWPpiqEpvUWRVuwG+lI=;
 b=kv9ju6QrjMmiUAt8VpGgtd8bXeh7iXDQeoIycfuBrZC88LUnDfTiE7aJdwbCD3KyaB
 oorJ7PPqtQ/hl+d3N5FYa7jNMnaxWKR2oAkzxC8gDBOHYuM21kLWRb9oYx37sbQQrcbh
 CBkXWKaA6iJJzTFU1BT+lTFdFMyx9x86pUU+RROf5D+IZM2esNFVTAng1+HITtusjsE2
 9WghNAaKHSHEBMO89lwQYQL4pb8lMfr+L4SYvMuCBVkzFNyh7aS0WYBziRGDW27sfBGb
 w94SZXbL1zXzRzdYFCArlxHXaMecLYy/jjvxsAKOYlkhqFw52drq2hSzol07+aq0sBqS
 mv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8x5bS8XCRYZD2F9OVZpQkBZRGWPpiqEpvUWRVuwG+lI=;
 b=LxGp8tOogqntCKKgVjSYXLOxDu3uQOcIrpiDcxhN9jwkl2q50wLNeCMGhku9HtU2K8
 XkGGNt6A5841qzBEWvImuVpn5/wKhEgahGDyYZu+aVb46GGoaFAqDI0aBqTvw/JdENTO
 L4gvf/01basW1qg7dFXEolQttJI5YQm+QkKeytFSskFJhNjM5EJibrkHbWzH/B0Pvedl
 b+9VhpF/uGL6KRZHn2CRkGwQjoZb6jDEkrEsVN5LToHs4aTIHQ5Za+iTPoR9ir0BObjm
 JE6ul1aF26gRH7YSm6ki9LiSriSKdHl39gxO1WNvwZF8k5YDymwThXz9yCXPyQF9j69s
 dDnw==
X-Gm-Message-State: AOAM533vBC8VwSmXKN5HTQod3aqxZqAaG4GebfCwSDU5lzw9xAzGpRQq
 klrGMM/OF4I8ajAA1ZhhadW+ALAKmls=
X-Google-Smtp-Source: ABdhPJwh0PMCmLvQm0bwosQ+BywrVIwP6c1WMar7lPuWwijF9/7OJ7K6KCr9cBdhsYGfHMt1dJkKNw==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr17008875wri.81.1634330075960; 
 Fri, 15 Oct 2021 13:34:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id c17sm6539854wmk.23.2021.10.15.13.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 13:34:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 22:33:27 +0200
Message-Id: <20211015203327.1754756-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/davici: bump to version 1.4
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

Update indentation in hash file (two spaces)

https://github.com/strongswan/davici/blob/v1.4/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/davici/davici.hash | 4 ++--
 package/davici/davici.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/davici/davici.hash b/package/davici/davici.hash
index 178d87f2e2..27ec2a6dab 100644
--- a/package/davici/davici.hash
+++ b/package/davici/davici.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d3e5e806ecca841d7e133a3df768062df59f4b4c76bf98e0f90aa8064721b3bd  davici-1.3.tar.gz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  b03c5a1aad905e962271d70246d6af6c337ffd00449d990082ea02161327bde8  davici-1.4.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/davici/davici.mk b/package/davici/davici.mk
index 6c8df48b6a..d54e02e278 100644
--- a/package/davici/davici.mk
+++ b/package/davici/davici.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAVICI_VERSION = 1.3
+DAVICI_VERSION = 1.4
 DAVICI_SITE = $(call github,strongswan,davici,v$(DAVICI_VERSION))
 DAVICI_LICENSE = LGPL-2.1+
 DAVICI_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
