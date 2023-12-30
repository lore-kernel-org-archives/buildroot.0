Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F928C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 20:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E280B60B1B;
	Sat, 30 Dec 2023 20:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E280B60B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27OBaosSo7t7; Sat, 30 Dec 2023 20:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52E0560A87;
	Sat, 30 Dec 2023 20:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52E0560A87
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52AC11BF5B5
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26CA960A87
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 20:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26CA960A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23p_v1JyyAUn for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 20:55:05 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09B9D607CA
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 20:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09B9D607CA
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5f40ce04so30931645e9.2
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 12:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703969702; x=1704574502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LDc0DCZyjL9TdCi/u+jxR2bdFtGVLLWyoEuqAvaNeJg=;
 b=oT6oBIRzOfbP3AeK0ABep23LwvpnDg90eVicqWQYQ0r4kiNGUdYz5JevHH35lqHp4R
 DpkvHUvBJ6WDCJcG+RSvPyUBwcwYD7tJ52daMF1w6qHZxswr1tKByUgQ39nw2FcIPsB8
 FHfTOoG5uC3OltJCjxEavKz0Cw8gSPcMtTLyNWeGyBiOW1GOqWVd+8Pd18IeHRuf5nZQ
 LqvutwHtLTumqFMNQ/08wa1JejSJso3uXfXjFN/MnXsz9nHNx60XYX/JiUS5U4AbdsVl
 vZ71mUMmpYfYHKc0xaucImw6q282OSmJhC0K08wHO54XLrmKg6OZM9UM9l9YJF0oUxU4
 lvjQ==
X-Gm-Message-State: AOJu0YxFB6F+ibPEQJLWyX5OAhHrDPOS3wN0dH+tco1kxN8+JJq451X/
 9u0J8zdCgrooXfxo+bV4dg5q4DikQK0=
X-Google-Smtp-Source: AGHT+IFKmM1YtcflDN4QlPSlTScDNsBoRZNr9raKf3iUXs1e6PT0UuIgLmgqNbk75Zqd5ljAeagMcw==
X-Received: by 2002:a1c:7202:0:b0:40d:719e:1ae with SMTP id
 n2-20020a1c7202000000b0040d719e01aemr2143693wmc.140.1703969702070; 
 Sat, 30 Dec 2023 12:55:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay26-20020a05600c1e1a00b0040d83d796c8sm2776800wmb.36.2023.12.30.12.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 12:55:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 21:54:59 +0100
Message-ID: <20231230205459.1237158-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703969702; x=1704574502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LDc0DCZyjL9TdCi/u+jxR2bdFtGVLLWyoEuqAvaNeJg=;
 b=F+J8o0NXBX2OlvaYWEleugI1VaWo6VIuBLu71b/I6UFYVDoN0APePlx3+xOLi5F+sp
 JT9jWCg0zXr/JqDXR56FBtrlSrvyUYJlcuPASVUFqKpZz+69a1Ep0DP+1OEC/N7qPaLE
 c8gltZAqVF4aHyMvj8M7KpKsJqRrPJyQhC2ydwK2Hn5F4jl+8X9fixLtNOt1Ts3nQPUw
 vLUWYfRVFZVLSBb7SBfGQLAZQBgZiec8daOk27d7+ztwt09Y6qtcZYMDyC/xOm2PSx4U
 /ni3WlQclwwhc1Qvzu6uBmDxC1fzKBiukSd1XIDMoZWtT6X5nCSvWMHV/eL8SHGoIWTA
 Bi0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F+J8o0NX
Subject: [Buildroot] [PATCH 1/1] package/libucl: bump to version 0.8.2
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
Cc: Nimai Mahajan <nimaim@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/vstakhov/libucl/releases/tag/0.8.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libucl/libucl.hash | 2 +-
 package/libucl/libucl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libucl/libucl.hash b/package/libucl/libucl.hash
index 164b00276f..4ad166dc7d 100644
--- a/package/libucl/libucl.hash
+++ b/package/libucl/libucl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a6397e179672f0e8171a0f9a2cfc37e01432b357fd748b13f4394436689d24ef  libucl-0.8.1.tar.gz
+sha256  d95a0e2151cc167a0f3e51864fea4e8977a0f4c473faa805269a347f7fb4e165  libucl-0.8.2.tar.gz
 sha256  1bf976835764c1d827e07472a0a75adb098682df56681878af05fc0db7439b03  COPYING
diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
index 9f0378ad9c..bf5e368f2b 100644
--- a/package/libucl/libucl.mk
+++ b/package/libucl/libucl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCL_VERSION = 0.8.1
+LIBUCL_VERSION = 0.8.2
 LIBUCL_SITE = $(call github,vstakhov,libucl,$(LIBUCL_VERSION))
 LIBUCL_INSTALL_STAGING = YES
 LIBUCL_AUTORECONF = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
