Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB4BC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 19:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4BCE82923;
	Mon,  4 Jul 2022 19:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4BCE82923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuMrzxwTHgvu; Mon,  4 Jul 2022 19:24:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2753828E3;
	Mon,  4 Jul 2022 19:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2753828E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FFFB1BF331
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 19:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07D4F60F04
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 19:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07D4F60F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuezNN_7bOXp for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 19:24:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9061960EDC
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9061960EDC
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 19:24:11 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y16so17138506lfb.9
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 12:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cPU5IMIWGwvK7EgJhkLE9brSupOHfyTuEhJDiWPEFDA=;
 b=WdzTM5V6ML/teId7tejyfz+6qHexFEUPct2XGqBp6FLa/Vj3xHYYZj25uUQiXtY/od
 3pywdlYuBwWtpRO2wLdZVs0FqGNedZxEJdChIB/aO1/X5H/eY5Xs9q6/sUsHs8eGPqs2
 pcAmN3WFBSnNrri6ykIs5kcwDhzhh+Dv5fdgf0xGUCQa58+dWiwKDEhwz+kKAw5ZNoOF
 9OQg6TKQcEm7dpz/sdQarAPSp+EpLmyQE3eTg7DEwBQsR1a2qg71JcVqiZT2eW7+6Nw3
 rYcqMuM6lp57kUe0T1w7NPpx8/Uczbv+shquyVyMB/5zmfi67cB2TLsJBcnjeOpGvt/D
 vzkw==
X-Gm-Message-State: AJIora/5tOK50LxRltb5V/E9jieYS4v9nFIbzFZTSxxGy60bujsGt8nU
 Wqum/HbcEbI5G9RA4/okrh3czDlQNtE=
X-Google-Smtp-Source: AGRyM1t8SV0TovFaopXn/OCjQL658Unl5oQDq9+5OLgkwnH+Hx5M8OmSMrLOMsSjOFghsRPPG1oumg==
X-Received: by 2002:a05:6512:3195:b0:481:620b:9bb2 with SMTP id
 i21-20020a056512319500b00481620b9bb2mr11795391lfe.336.1656962648944; 
 Mon, 04 Jul 2022 12:24:08 -0700 (PDT)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 k6-20020ac257c6000000b00478fc420ea6sm5252439lfo.244.2022.07.04.12.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 12:24:08 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 21:27:16 +0200
Message-Id: <20220704192716.257008-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cPU5IMIWGwvK7EgJhkLE9brSupOHfyTuEhJDiWPEFDA=;
 b=cB47WHSl/TWYejR2uxS5aIAWiWk8LSFJAB7kfc81jHiIgv5BQuat1kbW2QVl9ZACbg
 Atv962KFNnMbPGT3QAcUs2LRZZFcC3OmdSMc09+b+Ke+9cUMlxGgv0dlOqFkgk8+ypft
 6Z+RZ7jBQD4faMyJbETkBxQfF4n906LFk/eLyPA3IrLUCDXO4/P7uxhVzUDf52xEcdtQ
 m3bdpblJQjCxxsw9HPkx2Sv+MYgS2Y1bBb8vyGu5YMbZwCWA8tutxDAmb0czaGO02NlY
 7OyeB+vKFgCtU0/hA8DdGTJEPbRw7lXvVr6VOYbAfIwUf/p52/aCDPG9U2mPMW+3bSS4
 QYAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cB47WHSl
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2022.4
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 ...y-add-a-missing-include-for-stdint-h.patch | 24 -------------------
 package/libostree/libostree.hash              |  2 +-
 package/libostree/libostree.mk                |  2 +-
 3 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch

diff --git a/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch b/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
deleted file mode 100644
index 35f92c37ff..0000000000
--- a/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 4b7fc4f1e90bbeac89d2f939cde3070e69b4787a Mon Sep 17 00:00:00 2001
-From: Luca BRUNO <luca.bruno@coreos.com>
-Date: Fri, 6 May 2022 10:07:23 +0000
-Subject: [PATCH] lib/ostree-sysroot-deploy: add a missing include for stdint.h
-
-[Retrieved from:
-https://github.com/ostreedev/ostree/commit/4b7fc4f1e90bbeac89d2f939cde3070e69b4787a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/libostree/ostree-sysroot-deploy.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
-index 404f336fb5..96cc07531e 100644
---- a/src/libostree/ostree-sysroot-deploy.c
-+++ b/src/libostree/ostree-sysroot-deploy.c
-@@ -22,6 +22,7 @@
- #include <gio/gunixinputstream.h>
- #include <gio/gunixoutputstream.h>
- #include <glib-unix.h>
-+#include <stdint.h>
- #include <sys/mount.h>
- #include <sys/statvfs.h>
- #include <sys/socket.h>
diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 0395c1247d..d85b82f35c 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b823fd9dcd5503c5caf9febde24b0ed63ff46ca95188032ac567a2a95624f612  libostree-2022.3.tar.xz
+sha256  14bbd351a95066f68c3b283e0bd0ddd03562e862af66f6f6d894c6c328d7eb81  libostree-2022.4.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 75485a79e0..3210ed3707 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2022.3
+LIBOSTREE_VERSION = 2022.4
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
