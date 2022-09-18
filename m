Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F21C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2D8B4240F;
	Sun, 18 Sep 2022 10:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2D8B4240F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOL1eD2hgIyE; Sun, 18 Sep 2022 10:30:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DD4641D1B;
	Sun, 18 Sep 2022 10:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DD4641D1B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 337C31BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BF2041D1B
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BF2041D1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cU2fm1rxuLhC for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:30:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 760A341D0F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 760A341D0F
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:30:23 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so2595604wmb.0
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 03:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=hkPE4GM5bboQo7/P8dCMSiuih6T4H24aOJ1VxWVpbI4=;
 b=pkmkj4d48K3jCaOG+2A4xc5DJ3c1NLCyRAS0nnGNWJ2eRJiieuixxqhuso1t6FiH/s
 hX8ajKVwog642Kb1HYIx1o4OBGrUI56Sz4CI7HgXTJkp0YrLzAoyZRFViufhqg0AVTz+
 YNJNxqfL39/TQxno7jTa4qekmxUjsu8BA6zAuZHed2iameSgAgKz6ueDBfIiDn6if1ZE
 3s+Qyqc7qimUF6FVmIUxajZpfnjrOFxeLS3n3nwm6UsTTn1EpWnzZcPAn+Lyi0pNwkmU
 W/mJSSKeKNy9NmLMo9UZZtd+cbToXr4KcXzAtLZdFcgfWzpzf/XGYTgmlibQqBBNnJhH
 bRZg==
X-Gm-Message-State: ACrzQf2lRjQjpu+CrvasBPZ1aNH7ZFNDl8bILGvtdsexkNV5Fdymqf46
 oywAQGanUkIra5VvBC68slG5QcIRFb0=
X-Google-Smtp-Source: AMsMyM7NYlXq85ZooKEIptLChHzlEfuHBTOp/Z+72D9h8faAt9Pn3fswa+eUhk+OBG0bfdMBbIFVpQ==
X-Received: by 2002:a05:600c:5127:b0:3b4:7753:2e20 with SMTP id
 o39-20020a05600c512700b003b477532e20mr8685980wms.81.1663497021184; 
 Sun, 18 Sep 2022 03:30:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v26-20020adfa1da000000b00228c483128dsm12119348wrv.90.2022.09.18.03.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 03:30:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:30:19 +0200
Message-Id: <20220918103019.196327-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=hkPE4GM5bboQo7/P8dCMSiuih6T4H24aOJ1VxWVpbI4=;
 b=UgNhpPMnLNfsZLiYMt8DICvGYmvXtRyoMzzBZa1KvlJAPpXld56/N97i6Rt5Rdp6yz
 st9WNmDppRZJcy+Gmeg0mq918HHbjCI6cL1y6ph2Ihk8Ez8Vh9TzA+iBiBZ+3NntYqci
 oZm+qhtirp73Quf7qVRxQz9bc82yNtbjG8HEOM5N6e4lRUtGc/AZj4CKhoIuomgVHvCA
 Sc2kJN4vhwxJizGca6KprZZ0BwRswHNEA4fxaIXx8zpZWf6tli1fePwlexLJFnObEsWr
 2xFhsr8QjfjI/xd37eaTNZZd403Q1qqI+UIf23S9EExQYx3sTi/Mjhl+GzYkwntHYlSh
 j7eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UgNhpPMn
Subject: [Buildroot] [PATCH 1/1] package/git: security bump to version 2.31.4
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

Fix CVE-2022-29187: Git is a distributed revision control system. Git
prior to versions 2.37.1, 2.36.2, 2.35.4, 2.34.4, 2.33.4, 2.32.3,
2.31.4, and 2.30.5, is vulnerable to privilege escalation in all
platforms. An unsuspecting user could still be affected by the issue
reported in CVE-2022-24765, for example when navigating as root into a
shared tmp directory that is owned by them, but where an attacker could
create a git repository. Versions 2.37.1, 2.36.2, 2.35.4, 2.34.4,
2.33.4, 2.32.3, 2.31.4, and 2.30.5 contain a patch for this issue. The
simplest way to avoid being affected by the exploit described in the
example is to avoid running git as root (or an Administrator in
Windows), and if needed to reduce its use to a minimum. While a generic
workaround is not possible, a system could be hardened from the exploit
described in the example by removing any such repository if it exists
already and creating one as root to block any future attacks.

https://github.com/git/git/blob/v2.31.4/Documentation/RelNotes/2.31.4.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 5868fbffda..41afa83f86 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  d9167d801cf4aa2abca6e8f43d5d1b383e02e4d257ac1dc071802bb773ed0e2a  git-2.31.2.tar.xz
+sha256  84fc20acf8fbea5cad7d5d7be0dfeb32494f1dac8e6c61675c904d1fd3d8c016  git-2.31.4.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 981a238acb..dc587170e8 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.31.2
+GIT_VERSION = 2.31.4
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
