Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B491BC636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 12:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4977A81947;
	Mon, 13 Feb 2023 12:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4977A81947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBE7OFD2HF19; Mon, 13 Feb 2023 12:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D5A819B4;
	Mon, 13 Feb 2023 12:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D5A819B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA3B91BF387
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 12:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C444E60FA6
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 12:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C444E60FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ooOZNNEvMDr for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 12:40:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8B8160FA5
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8B8160FA5
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 12:40:34 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qb15so29443225ejc.1
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 04:40:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E7MSkHUGLHmGM2ZDeFN3S4W10YzkRXVXu1My/Afr0ag=;
 b=q0IVUrCNW+EFb4587KHC7thDEmieUoWUa2TdYvWeNDkHhAIjfyD67GjAyRo+J1ZqJb
 rYxknBQoInTw6Oc2GWqmQ/lYVirW0fXvF2y2psygObt0qKf/SC6ViBvfKfliVz/uhQdT
 TKMfBj+u0p0D9XZA1VOqP/MvEwqJxIHXx3liS35sFnuhojuweODDoKkHQGNd6HKSzYfi
 +AK3BOLuPjvqDrcRRLAgHrIQxV+v75Yhv8B/neDUH0GioljoIv+mk+z6s8Xi7CKKZkkE
 YsEzV2L0+PCqiAmWPtuD5/1mJsehLc6FhlkC6j1p0m8NRHVaOQ4N2dVSHvZLSu3Dr0rM
 ISUg==
X-Gm-Message-State: AO0yUKVK1qjlMC1/bLwHkE7YrsmwFFXe5NCcVtJldadgemYATz8LBnIi
 fF5xBtyOiePRi9esuNHg7ZGD2YYN0mfzOg==
X-Google-Smtp-Source: AK7set+kjfUfN5tiledtv1b/9WTVJdddO5534CPePIQXxG8o4ec6l18wDam3uFz0o80snu3zG1TUtQ==
X-Received: by 2002:a17:906:1e8a:b0:870:6554:92ac with SMTP id
 e10-20020a1709061e8a00b00870655492acmr22524729ejj.18.1676292032363; 
 Mon, 13 Feb 2023 04:40:32 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 c15-20020a17090603cf00b0088bd62b1cbbsm6716791eja.192.2023.02.13.04.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:40:31 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 13:40:23 +0100
Message-Id: <20230213124021.12522-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230213124021.12522-1-heiko.thiery@gmail.com>
References: <20230213124021.12522-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E7MSkHUGLHmGM2ZDeFN3S4W10YzkRXVXu1My/Afr0ag=;
 b=n+Hohl8XR5YL7o+TrR9xKOJSCKPFyO4M90R4HyiSgQCbzTFT+hRCN9ioE/KDo2rAWH
 GZ/gJVeLlQWhjGlxiI4+V1kTQpFoPcJjtlWf8fL2Cl/pBfnS+EINaEKl6tPEI6TuPHED
 ev3514E2//anL70eTigRunnoHwSC4u8IQUEK3LDMKzRpYAKQxkajZm3+EPjNXQ41gwTP
 cb26AOE0v5qwFYjedOjfjkJCtyGfAeNbfeMvBVX3iSZmNjbc5UPSYdeuFSIOIWb3PUb6
 mINXcyQSEmfl10QjE8vB21OmjJcLyVadmSo3v6RFw10Cq8A4QFgGKxz8pYWDmy2dvbKh
 na3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n+Hohl8X
Subject: [Buildroot] [PATCH 2/2] package/network-manager: bump version to
 1.42.0
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 3895c1ffc3..270699d63a 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.40/NetworkManager-1.40.10.sha256sum
-sha256  fa251455df3c38e2bf1e1ff806b4bc4346938dd135a3568bd250e92caa85eaf7  NetworkManager-1.40.10.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.42/NetworkManager-1.42.0.sha256sum
+sha256  2f6756d507bb6b46716594b67e6fe7491891e1b5b167bbafc5157dfa7753d5b4  NetworkManager-1.42.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 87932c75e4..9188af29eb 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.40
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).10
+NETWORK_MANAGER_VERSION_MAJOR = 1.42
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
