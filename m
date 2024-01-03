Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F5CC3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 18:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEE5960A9E;
	Wed,  3 Jan 2024 18:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEE5960A9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RZUTtMF49Tb; Wed,  3 Jan 2024 18:18:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A40C60A62;
	Wed,  3 Jan 2024 18:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A40C60A62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93CDF1BF4E6
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 18:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7986681260
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 18:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7986681260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JqkBt_T8865E for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 18:18:33 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB4AB80FA4
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 18:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB4AB80FA4
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d899205c7so23317605e9.2
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 10:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704305910; x=1704910710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z/g9sDEgoNUUfOGvy/tiUirITOT6Yl5FIeqgXXYRk1E=;
 b=EVs3UpUwkhR92teN2JlkX7SFq5CkBsZiccDnKP6duCiVRnO6u3naUf04iG+5e4Hb67
 HY2njiCYUN6RxPCrSzZRHnjsy7xaBKioioNf5O85TrlWz6PVA5JsLqz7R0P9wkb9IyjY
 iZzq3VJfvDN/c0zvN5dpvrh8Ff26D+QKprTq5heha7XY3sYh0/h6cj6EPsuJE0gB2RtE
 XwFnkdwoRX/nXiWza2wuEAZe8f4h2JkGydBXXRNczCbF9bp7ARefosasbos9y1BpD6Uk
 gcOeXb4nbNV5ZP5QyVKsyECmk6wg6lKT+aHQmAdPNi9+6u0mRYLCmgSqFcCIHjIQbtQV
 Pp9w==
X-Gm-Message-State: AOJu0YynJMAE25zqupDFnUOsUdVjMkvITzojW30F2XIAIKKJHjxiXDV+
 dkCWf4FlWeGcc31EXOTfJFyw7VCRafM=
X-Google-Smtp-Source: AGHT+IG6oZCBCLfl7rnl3q9D/VpY5hUprVA880HkK8+u8B6MUFdOW/Ut52Vv6sSJZQ/dzkeXshvxkQ==
X-Received: by 2002:a1c:4c06:0:b0:40d:8506:f8be with SMTP id
 z6-20020a1c4c06000000b0040d8506f8bemr3199355wmf.152.1704305910096; 
 Wed, 03 Jan 2024 10:18:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bg35-20020a05600c3ca300b0040d6ffae526sm3073419wmb.39.2024.01.03.10.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 10:18:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 19:18:26 +0100
Message-ID: <20240103181826.875567-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704305910; x=1704910710; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z/g9sDEgoNUUfOGvy/tiUirITOT6Yl5FIeqgXXYRk1E=;
 b=Lp7tGL66Uu04ieM1JE1eE7+VdAYmZ50PKaA8Idu48ugxDAY4K69PIKQ3+rdIqwkFdF
 1Z5ZMHvtGC1G2voxYypxGs4xxNQXmF6k//7PSZWBuK8OXee9NQCd7XvwUdoRcc5F8OHk
 +m8MmDKY0kPSwXbUINJh8FzeTD1RXb7RNiC7BTRoETuptzUt/9bCzhO7suEba87Y7ixU
 8g59fqcdsHDE3GV//ZnhCbYVYcsBqPKX+nj14+JjF8IGpHhhaIHarQuv0wvYs3y8VERp
 hlTI0k8wvWHPSiLPVkLvsZTEjoP4Zv6UvYHPXuunepLlHpddv7thHG4tKl946qDyQYNg
 5/gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lp7tGL66
Subject: [Buildroot] [PATCH 1/1] package/utf8proc: bump to version 2.9.0
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

Use official tarball

https://github.com/JuliaStrings/utf8proc/blob/v2.9.0/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/utf8proc/utf8proc.hash | 2 +-
 package/utf8proc/utf8proc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/utf8proc/utf8proc.hash b/package/utf8proc/utf8proc.hash
index 658ffa1f7c..7fee89968d 100644
--- a/package/utf8proc/utf8proc.hash
+++ b/package/utf8proc/utf8proc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a0a60a79fe6f6d54e7d411facbfcc867a6e198608f2cd992490e46f04b1bcecc  utf8proc-2.8.0.tar.gz
+sha256  bd215d04313b5bc42c1abedbcb0a6574667e31acee1085543a232204e36384c4  utf8proc-2.9.0.tar.gz
 sha256  3b510150d34f248a221bb88e1d811238d6c6c18b51231822c42974c39bb07256  LICENSE.md
diff --git a/package/utf8proc/utf8proc.mk b/package/utf8proc/utf8proc.mk
index b08c6e7109..42ec48e0a8 100644
--- a/package/utf8proc/utf8proc.mk
+++ b/package/utf8proc/utf8proc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UTF8PROC_VERSION = 2.8.0
-UTF8PROC_SITE = $(call github,JuliaStrings,utf8proc,v$(UTF8PROC_VERSION))
+UTF8PROC_VERSION = 2.9.0
+UTF8PROC_SITE = https://github.com/JuliaStrings/utf8proc/releases/download/v$(UTF8PROC_VERSION)
 UTF8PROC_LICENSE = MIT
 UTF8PROC_LICENSE_FILES = LICENSE.md
 UTF8PROC_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
