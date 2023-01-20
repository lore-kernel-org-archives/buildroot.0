Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5ABC05027
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 19:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F2F9612CA;
	Fri, 20 Jan 2023 19:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F2F9612CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJw30alGL4tj; Fri, 20 Jan 2023 19:31:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CAC1612C0;
	Fri, 20 Jan 2023 19:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CAC1612C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6971BF2BB
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 19:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B1D341CF3
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 19:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B1D341CF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDu6bfBqUwpe for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 19:31:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC7F141CD9
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC7F141CD9
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 19:31:15 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e3so5719314wru.13
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 11:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8OG5Kjsx1M3uAlKnIYeJORpgRKFCPXDhM25nC+2fU5A=;
 b=tEnNsoE+U2NjOsQ4/S4MHS0M5km2IuzbyzeyCxBSgNxLkZy0C65GOqZ+crypFcrSLR
 hO54peopfZg4zg6A2WejVGXt3JFRC76Z2c//UtPowPDi1IgnKFnqDHy6Gsw3p2Fm2jz1
 n4bAYILJXAahQpeJP5GVdXyUAUyOketGrH2cUzM5NCyb8NdP5WxSlCkqjlPe6WaTdKfN
 4ZSmiffzGHWa0x9EqltlFs1iwLNog+aaI9RyBrczzcsbZL6wkp4VXZwiuVTMwzHLDj7s
 HanktoSjAKlKfSjo22HNFnj3hLY0229AmVHvhxflZeJ7yEZIm0tC147vlP1mxlYxHnJU
 x0OA==
X-Gm-Message-State: AFqh2kp85vpSTA8ZFT05voMZWf8b8uTCVsZ9T7bb2Z0UIpqOen4O/FOW
 Rhco44wjycxnZZrjo9vMKE80fU0MIa0=
X-Google-Smtp-Source: AMrXdXshcXPikhOrlscu215nhUK2PpZX5xfj9XDBEZN9izdpD3nPQZfzQwAtmU8wA0gNGc/EZmoLDQ==
X-Received: by 2002:a5d:6b50:0:b0:2bc:7fdd:9245 with SMTP id
 x16-20020a5d6b50000000b002bc7fdd9245mr13149145wrw.5.1674243073755; 
 Fri, 20 Jan 2023 11:31:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bcaa47bf78sm27128664wrr.26.2023.01.20.11.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 11:31:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Jan 2023 20:31:10 +0100
Message-Id: <20230120193111.9280-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8OG5Kjsx1M3uAlKnIYeJORpgRKFCPXDhM25nC+2fU5A=;
 b=VST3mfb1ISObQAdgETSvWxuJ0SWc3gImp4ah8xrUZQ9oaHqMae3/iwX1BEjJakpT59
 SJM/9rOxgtDLXsljrsAMTT/rJD4VSWr8uVIXGn0iFyEnTHomxFEYa1hjJKKBz/kexk8K
 dCoNtVJJyGSuDbK7vsYfvDbFRQ1LAjP0iJTViXG9q3oxRo4qxWCT7yzsMsCwzy1I81Yd
 h10L2N/h4L0/nLBhZzZIIhqnKr7vHfTf/0ufikOvRG3zXOjqOZz/N3GUo5girTx4RPxy
 oZ1CHBhVdkel3lCqDw5qsQ8LU5j3ptCGlX40MnRrd+dh3z86xbQh0RsLeplc4DvsMqOu
 WHRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VST3mfb1
Subject: [Buildroot] [PATCH 1/2] package/c-icap: bump to version 0.5.10
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

https://sourceforge.net/p/c-icap/news/2021/10/the-c-icap-0510-is-released
https://sourceforge.net/p/c-icap/news/2021/09/the-c-icap-059-is-released
https://sourceforge.net/p/c-icap/news/2021/03/the-c-icap-058-is-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-icap/c-icap.hash | 6 +++---
 package/c-icap/c-icap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-icap/c-icap.hash b/package/c-icap/c-icap.hash
index 6aa81c2641..9a596cf375 100644
--- a/package/c-icap/c-icap.hash
+++ b/package/c-icap/c-icap.hash
@@ -1,6 +1,6 @@
 # Retrieved from https://sourceforge.net/projects/c-icap/files/c-icap/0.5.x/
-md5  82fd2fba1a08a8a0cf3567fe24aa035d  c_icap-0.5.7.tar.gz
-sha1  3b2470e00abd1418bec3a440d3073d7a6231c4c1  c_icap-0.5.7.tar.gz
+md5  c8329684588a906d10a687e84ba4a478  c_icap-0.5.10.tar.gz
+sha1  2901aa19c8c4b09b700164290942290c34132076  c_icap-0.5.10.tar.gz
 # Locally calculated
-sha256  01ef17d7999d3476fe705abc56d0da562c2f180aafe08fc1269f419cad8521a9  c_icap-0.5.7.tar.gz
+sha256  541d503354907f06d1d72fa90fffd031002f0f4346150fb7b2203ad5825ae49d  c_icap-0.5.10.tar.gz
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index fb66c75e61..707069870d 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_VERSION = 0.5.7
+C_ICAP_VERSION = 0.5.10
 C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPL-2.1+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
