Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890FBC5475B
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 16:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0106C4064F;
	Mon, 11 Mar 2024 16:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVG9j78B0Gnv; Mon, 11 Mar 2024 16:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD7F140AF7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD7F140AF7;
	Mon, 11 Mar 2024 16:03:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA40D1BF38A
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 16:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96B5281C56
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 16:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TObcxf9zjJNb for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 16:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F3B281C46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F3B281C46
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F3B281C46
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 16:03:28 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7c88a2173daso111638339f.0
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 09:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710173007; x=1710777807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g8LP6THrAgANUjW9VDvPOmgkcQ4r0ZtDree5En0T4+Q=;
 b=NdSEujCBZXl3Lpxy69MkHxK2v6kxBGZ31rNya1QcN/YPk62dedJwHoZa3ZD7KPwiLd
 L/W1YvH/tXXcBlVdmDRI9TphNmYyxyK+DdDIOryqysuPR49wDnYMYRWfyMECKMTKcAdw
 YTXfUwWPwE3f4amrvICDjxWmJ1m/n7mde0B/+VEddwbA8U5lL5C8Qnfum7MF9fhN3WFB
 PjK/ilyWzf8yz2seQo1iKXJp7HPsedPn+DYulFFqFbtD0g2PSSCm+elYykuLtWw76LE5
 menuDiYzFGYl9mUSAjekTgGUyMd6VoKSlqlgdG8fsxKaJndfQrdZRBWep0GTCs/Yfpy7
 0LRA==
X-Gm-Message-State: AOJu0YzNnMJRuJLtqb05yk9aaSzZQfePx/MSREGtmb8WQDKYO4t5RYah
 wSME/rtHra3+QF2D5gwNrFlu1ZvphuaCeSmmHxp8mBwVqJyqUYsXgdep2oG+M2A=
X-Google-Smtp-Source: AGHT+IH2x7GX2Z0OiEVXYFjRzZ2PeVRuxRv6N+AlMupHuRHCg1YiMuJs+sG8bkfRp+JqNUnoCYsEWA==
X-Received: by 2002:a05:6602:298c:b0:7c8:ac77:1799 with SMTP id
 o12-20020a056602298c00b007c8ac771799mr5243810ior.8.1710173006759; 
 Mon, 11 Mar 2024 09:03:26 -0700 (PDT)
Received: from james-x399.localdomain (97-118-232-75.hlrn.qwest.net.
 [97.118.232.75]) by smtp.gmail.com with ESMTPSA id
 r7-20020a056638130700b00474f0fe1b44sm1760737jad.15.2024.03.11.09.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 09:03:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 10:03:23 -0600
Message-Id: <20240311160323.3015689-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710173007; x=1710777807; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g8LP6THrAgANUjW9VDvPOmgkcQ4r0ZtDree5En0T4+Q=;
 b=TKIufDRnZmTLi6W+cyZx2e/3GHQRH0rRWSu8ctof19rPlbQtrZGH+hTOTdi21MMlPh
 aKHzNtVazdylS1BHNdVq3nbefjpa7ucExSELsXtenlbhCO47Aw6FFTDglqXazOrPgu8X
 F1gcSko8Qf6iyObVT5zJe8HyOw/9VFLH+rvG+CM/mXbwUxj4XOaei4sXvJ9xtqGWungs
 prKxCF45EeO1QPn4Ab6+M16gwhpq/u11GwYxFGNrZp23AR8xv4nJFz1HqqXH41gAiGWs
 bE4IxeO+mkyjImlzqFhRa2wIBkeg0UIhiauyM3A12ekgl/Z+fltYkdke4bxUt8canYHk
 LcIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TKIufDRn
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump to version
 1.46.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

CONTRIBUTING.md hash changed due to details added:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/5481ba156804f979cb2d585df3dc012ff3002755

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-curl-timeout-callback-non-repeating.patch | 44 -------------------
 package/network-manager/network-manager.hash  |  6 +--
 package/network-manager/network-manager.mk    |  4 +-
 3 files changed, 5 insertions(+), 49 deletions(-)
 delete mode 100644 package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch

diff --git a/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch b/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
deleted file mode 100644
index 8e25805d0c..0000000000
--- a/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From abc6e1cf258ab332bed161036a358bbe9c2d1e90 Mon Sep 17 00:00:00 2001
-From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
-Date: Fri, 13 Oct 2023 16:46:09 +0000
-Subject: [PATCH] connectivity: Make curl timeout callback non-repeating.
-
-This reverts commit 05c31da4d9.
-
-In the linked commit the callback was made repeating on the assumption
-that forward progress would result in the callback getting canceled in
-cb_data_complete. However, this assumption does not hold since a timeout
-callback does not guarantee completion (or error out) of a request.
-
-curl tweaked some internals in v8.4.0 and started giving 0 timeouts, and
-a repeating callback is firing back-to-back without making any progress
-in doing so.
-
-Revert the change and make the callback non-repeating again.
-
-Fixes: 05c31da4d9cb ('connectivity: don't cancel curl timerfunction from timeout')
-Upstream: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/abc6e1cf258ab332bed161036a358bbe9c2d1e90
-Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
----
- src/core/nm-connectivity.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/core/nm-connectivity.c b/src/core/nm-connectivity.c
-index 92de44f17d..d8b0004c38 100644
---- a/src/core/nm-connectivity.c
-+++ b/src/core/nm-connectivity.c
-@@ -406,9 +406,10 @@ _con_curl_timeout_cb(gpointer user_data)
- {
-     NMConnectivityCheckHandle *cb_data = user_data;
- 
-+    cb_data->concheck.curl_timer = 0;
-     _con_curl_check_connectivity(cb_data->concheck.curl_mhandle, CURL_SOCKET_TIMEOUT, 0);
-     _complete_queued(cb_data->self);
--    return G_SOURCE_CONTINUE;
-+    return G_SOURCE_REMOVE;
- }
- 
- static int
--- 
-GitLab
-
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 0196d68c55..8a3c3895fe 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,6 +1,6 @@
-# From https://download.gnome.org/sources/NetworkManager/1.44/NetworkManager-1.44.2.sha256sum
-sha256  4b58bf3ac57e2cefb5652efd0945eb0b4bc36a63d92a61ab471d8bb2c9a420e1  NetworkManager-1.44.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.46/NetworkManager-1.46.0.sha256sum
+sha256  722649e25362693b334371473802a729b0ec9ee283375096905f868808e74068  NetworkManager-1.46.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  e7cf3d92bda8e5365eaf4514d572146a19e93336f7a966493778d0d0c4476fae  CONTRIBUTING.md
+sha256  9f7f0d40116e5a0f1566b9da71e9c95738c99364e4b5437d8115aa614490372b  CONTRIBUTING.md
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index f6ef923d55..09bc6aed02 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.44
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION_MAJOR = 1.46
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
