Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10432C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 20:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 977D7423ED;
	Sat, 28 Oct 2023 20:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 977D7423ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olmUZu8T8Tld; Sat, 28 Oct 2023 20:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4CA84224F;
	Sat, 28 Oct 2023 20:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4CA84224F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 270B41BF2E5
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C5BA613A4
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C5BA613A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTCEt6XzPTrJ for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 20:51:06 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 080546139E
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 20:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 080546139E
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso18546185e9.1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 13:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698526263; x=1699131063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zGKcohGCruubGUL0op+LtNeb0di5lNSkSJg7QOG6QB8=;
 b=gTHre3CtsUWfDtrBEpLQet6q+pydjHJC74Xp41uGqiBTtQMZbpDpRLGH7un6itNGm1
 03b+5QWhAFJJ3vu/CTad7CNKCIUqzGrOTYqLAeEAC8B8ORPzPmpm6W9Uj3Lltg0uZgpC
 yTfeWsmQhtXm77q3WOg7WET6W+LhxvhvBgoxflEanXp+sErPkw8Sf79IFhqPb8AfZupU
 PBy4DfdHd/xucDkjdM6Gtk8vAs4SUgSrVT5OAl6lgoy0I89LGoL8GKtsIHRiSEWrEzsE
 cER2NXFE3iCjIS8mON+OKwGroMQiY2olqJM4byHKaCw9hu9COur6ZB7IyXL1hsvTBkH9
 YMmA==
X-Gm-Message-State: AOJu0YzjiUZP6BW4ZStMYhqttMIL9hJhFNKNeLhUvxXAySV8PA6IcUwt
 99uct/RXMLLF9jq6xdL7SlKWsYXyQJg=
X-Google-Smtp-Source: AGHT+IGM16C8fimMQJfjig/VJ4Laczue/Hh7d4XvE3pQabd2RwSyV1ZlfqVyFjG3uRk7hFfHbmkrAA==
X-Received: by 2002:a05:600c:3c97:b0:402:e68f:8a4f with SMTP id
 bg23-20020a05600c3c9700b00402e68f8a4fmr7077912wmb.0.1698526263366; 
 Sat, 28 Oct 2023 13:51:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 26-20020a05600c021a00b0040813e14b49sm8359679wmi.30.2023.10.28.13.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 13:51:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:51:00 +0200
Message-ID: <20231028205100.1220118-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698526263; x=1699131063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zGKcohGCruubGUL0op+LtNeb0di5lNSkSJg7QOG6QB8=;
 b=PAYQMPuWoUEjq/UapJl4QYgbhrdz2K56c9A0zAV+XhDVtI+7XX2YBHB8JHhcGDp9u+
 uOtMOGERJMOAmvnWLQ+m83V1DFREH0RJcXYf5kSgsND2y2dRKdzzhbYEVI1Gehpq58li
 13WmuOKYYnGuhnkI12gOGSn9htTQ6Tod0PMBKEF+9USaUfVL5betCPLRRKrVfb4OgM8h
 gnepg97/EthLJldTgSruvYYk+uN9AAinK9sJDwK1rHWZwgZE0K7H2aOG7cpErry5K7DS
 p/h+NEyYM5s+PyqSBjLwjOksTml+1bBeLAL9SWFbyeCY1IYJu7LPf2gVr0wqNvTiNeBz
 kfGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PAYQMPuW
Subject: [Buildroot] [PATCH 1/1] package/acsccid: bump to version 1.1.10
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
Cc: Juha Rantanen <juha@codercoded.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sourceforge.net/p/acsccid/news/2023/04/acsccid-119-released/
https://sourceforge.net/p/acsccid/news/2023/08/acsccid-1110-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acsccid/acsccid.hash | 8 ++++----
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index f43a7930a4..5310d78144 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.7/
-sha1  c0062401e5fedf3ec12c8c2d375d6e1561a8a8ed  acsccid-1.1.8.tar.bz2
-md5  3eba7b2527aa0b14c73b1a620a1d72d2  acsccid-1.1.8.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.10/
+sha1  6284a693b8edb511f2f80d9069af9b4a41fd55ae  acsccid-1.1.10.tar.bz2
+md5  4d2b7f34414aed029084c96dd05a0e7d  acsccid-1.1.10.tar.bz2
 # Locally computed
-sha256  f86fd846bc88594a569ea27040cb441d933b7eca8d51d2a90bacf161e7740051  acsccid-1.1.8.tar.bz2
+sha256  5ee112febdcac6656629025f3a85923f155f6ca150b2d24fd716f9043265528e  acsccid-1.1.10.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index db74e9cb76..463f0f24d6 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.8
+ACSCCID_VERSION = 1.1.10
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
