Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23684C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:50:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43CC6108B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B43CC6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52D04404F2;
	Tue, 26 Oct 2021 16:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LNHRqODZXhb; Tue, 26 Oct 2021 16:50:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4255404EE;
	Tue, 26 Oct 2021 16:50:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C5721BF4D5
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BDB3606CF
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3vKRzAn9XVjp for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 16:50:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B17D60697
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 16:50:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k7so15783734wrd.13
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OczNpMaPy+YBDVaU49WBfu2xcqO5KAUtX6cR2tUDfwQ=;
 b=M0lplIhbfwRUNjWmUYHNfdnr3CSeg4xteLIdMTrjTs0s0O3TFGmE2G76Z/bnsXSdzn
 rnqQaScD2kP+p7baSIhP2nuIHCb/FSM8DlibJ7FsXso0SinMKo0KDWdonFDe46pd8euH
 zaZEUUZ1UNUmuBcJFFKyydCqD93FZX7ARsaPRDTL3RbhK72g/j4EdQJ+WsatCJ2EFxy1
 7le624LCT0ERcywj+555or2Si/WlrL77Ribbas74ieK1fKmKBul14zrz1kzB8V7uFzEj
 y4JzrL/4X3m91duogHR0AUzfX5FnD5Tsf9f09V5gWCVfL0aw6JHc64gJy0oCczjMIned
 9Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OczNpMaPy+YBDVaU49WBfu2xcqO5KAUtX6cR2tUDfwQ=;
 b=nC+rGM3YRWL4EzWy7n9B1oMXcVtAEnOxTgOxyFB6Q0ymgDZu2xlk8MJ1pWOs/Of6zS
 sBxgXv35M1CGbW1fOxtzPlz3s6UzdwPtiNCu1qDfaHfaHdJIeTF+QmJCHKtHL2anqTPs
 J8bERv9F6SYcFRIshd7Yin8MTNR0Tb/Ru8nkFnhEdeX3KCjdZ1ouxyEWTl1c1pa3ZuKu
 lA/1S+DlD0wIa3zaxCAsis7Mmr0w368Akq/hy49csDiI/xP4vV2jkXHjhPGc5x3oeNA9
 AQhKAcAtNE9qeHpneRdsZIOzS6HglKG7dE+Ufe7/ip3U3NyIC7E2Un5C7w2hfv3p1knF
 UVZQ==
X-Gm-Message-State: AOAM530sLIbRsB4bCVUzKYPjSfsO9Cy/yn7XR2Pkgn9FCnWil0sctAp+
 5+3kh/XzPO/mQcfCZkJz9kmxCh5CJaA=
X-Google-Smtp-Source: ABdhPJyC0yZQJF8qy/Y8ndHkVo6B7HkoCKtTGixAg6aOwdSuri+LI0oYjUUxjyuEW1/bgcx5KEDfBw==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr23234101wrw.256.1635267047425; 
 Tue, 26 Oct 2021 09:50:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id k17sm19312378wrq.7.2021.10.26.09.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:50:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 18:49:15 +0200
Message-Id: <20211026164915.4020648-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vnstat: bump to version 2.8
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Rodrigo Rebello <rprebello@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/vergoh/vnstat/releases/tag/v2.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vnstat/vnstat.hash | 2 +-
 package/vnstat/vnstat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index 0f269039b1..191dc4ec0b 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4c28a1d8bc03c2b6e7ab96c876e07dd8ea174b7cad73b7190ecb2b9501e83e9e  vnstat-2.7.tar.gz
+sha256  03f858a7abf6bd85bb8cd595f3541fc3bd31f8f400ec092ef3034825ccb77c25  vnstat-2.8.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index 7f5ff67b82..91f0233f56 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 2.7
+VNSTAT_VERSION = 2.8
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
