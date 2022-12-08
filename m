Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0C2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A1DF40339;
	Thu,  8 Dec 2022 21:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1DF40339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jWz15ItuVf5; Thu,  8 Dec 2022 21:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3B7D40102;
	Thu,  8 Dec 2022 21:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3B7D40102
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E78C1BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7599A400E7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7599A400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8lzoU1XK9gt for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:19:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 369F5400FE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 369F5400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:19:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so2045035wmb.5
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:19:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zr1uUfEpLWJ4a/robUZipkGV8dAkGdiEoJHOR9xTijg=;
 b=eU+kMN7s3Cs9skDuQnRqZF3ZMJPCWhJiZueQGH4VuRrsmZzR/SMY3iHjqLDxKSdZjy
 Ys7KCP1IWZPdPy49x0qKPv+q4EUHMvhX+COBzGdNy7unhpHg+4haY6jgiFCiKmzX09TN
 /ozFK34JEFd5kMQk0GNEq6UJBZlOKI8Lj1DF12MEDllx/55AGbEWolG9iugfWnwGVZkN
 uU7Qd8Xi6PJU65OtuD8qAOvzhThFtoqmv53SowvjO2ZgqGGzsLYzJGqpBLMRhfTtV2Rv
 Ax+nALSe50oc7MdD5DylAORoXXJ1km9NIWtBvmQqaMPD2fMCyJrzbbI3W5+YISKpYhzJ
 00+Q==
X-Gm-Message-State: ANoB5plmvbfo1PRVfK+EMf6ZQPC5jQXYLmQBsbCUAGBro3aBWnAJRcCT
 2d1oEGZuu45i+4IUYjc7MHVa6sUJmQE=
X-Google-Smtp-Source: AA0mqf6PUrV6yUxU/O7Jd4j1YP57QxqLgKjijD4LTDDHvrNMr0uHE6WO13TEpRcxHrzYIS7REl9vQQ==
X-Received: by 2002:a7b:c417:0:b0:3c6:e63e:8155 with SMTP id
 k23-20020a7bc417000000b003c6e63e8155mr2928376wmi.12.1670534347980; 
 Thu, 08 Dec 2022 13:19:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m188-20020a1c26c5000000b003d1d5a83b2esm5922590wmm.35.2022.12.08.13.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:19:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 22:19:04 +0100
Message-Id: <20221208211904.57054-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zr1uUfEpLWJ4a/robUZipkGV8dAkGdiEoJHOR9xTijg=;
 b=oE9Qq8JWq0FerOiccTCvGUw96UFCLuhgBtktU9lsmBqzWNJntSZB3uA5HMe1Bf6G6I
 SQ6IXZmatOvj9OJU9CgAlA7EjGOIFpgz1SmUUy6951aKb2ClriYk8RzX/+IYceniL7K8
 0Xj/4tEShCxA7s31CjCgwSwFvp4oWBqQ/jU5GumZUowEEVpciaew5n4jvA5hDAXIWc7o
 4VlvA2ijbS+jCNf0lbYP9IuJbRkNcsdBB6wCCWGBlBSMFsQbsVV4XzQtAlaXeODloNpJ
 XrykoCLIkKVgupNKO3wUiFE78ZUKIYAjGBq2KxRf4Qjn4b+BIIOr4Nl1NLNH/R2x5zMY
 ULJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oE9Qq8JW
Subject: [Buildroot] [PATCH 1/1] package/pugixml: bump to version 1.13
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://pugixml.org/docs/manual.html#v1.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pugixml/pugixml.hash | 2 +-
 package/pugixml/pugixml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
index 190dfb6a6e..b828e03561 100644
--- a/package/pugixml/pugixml.hash
+++ b/package/pugixml/pugixml.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dcf671a919cc4051210f08ffd3edf9e4247f79ad583c61577a13ee93af33afc7  pugixml-1.12.1.tar.gz
+sha256  40c0b3914ec131485640fa57e55bf1136446026b41db91c1bef678186a12abbe  pugixml-1.13.tar.gz
 sha256  206f671b6d342557adcc973088c2c638df0ec0b1dabbcd24e65aadd2191778d2  LICENSE.md
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 9137f04630..c796186827 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUGIXML_VERSION = 1.12.1
+PUGIXML_VERSION = 1.13
 PUGIXML_SITE = https://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
