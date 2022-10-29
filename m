Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4DDC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 09:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 448F560E8F;
	Sat, 29 Oct 2022 09:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 448F560E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MDU6GcwQ2-H; Sat, 29 Oct 2022 09:39:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FF2460B09;
	Sat, 29 Oct 2022 09:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF2460B09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4D71BF319
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 09:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80D5881467
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 09:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D5881467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f91SqH2KKOOo for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 09:39:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94D1881462
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94D1881462
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 09:39:53 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h9so9493717wrt.0
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 02:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kUU47HOqdQIbEWRe8jQ3jWwT5jqPfsmwh+7NwT/S+B8=;
 b=Rx4XmxG3b3u9oaf8WdZBGW/pgyopL3GWrE8pfoyT6YLw9Nw016nVgZqfZO3E8I29B+
 N/YyQDbWU9WjOc9NO96hMDNHU4ryGG1pQg3/dI7E4zkC6bJultD42y/kiV96Vc8/qH9N
 jg5Q1oorNdDihtEDPfbwogyfTSEq5CxEm3e8mMoJuAiT83k5/XP2zmdfqzw5obFVG56D
 mbHGqf5leHXr2O7k2DHlxYfOi19v0VTofD1zAuvyTXwtp/xBk/Kty+VtTQT8TvRM8yW5
 b0hSo1KburTI7lABJa8CQOgmoLr7VD0SulReTX8DWdX0oxsEe8m/LSi4wrzmR5axZiqH
 ztFQ==
X-Gm-Message-State: ACrzQf1chcjwwdtYRG4eWh6iOiMvnIYhFLM6Ugd8Jor7PcgMaswj9+sl
 UsDewNKs7IZ61qZJUx5AZlNrVSrciUs=
X-Google-Smtp-Source: AMsMyM762Fk7oLZApMEqF+GmSOlKvBUk7t6u/VGfDcxV4ZzWHu+4oQmv0IIHe2xbKhObjkzVhgGXtw==
X-Received: by 2002:a5d:52d0:0:b0:21e:4923:fa09 with SMTP id
 r16-20020a5d52d0000000b0021e4923fa09mr1997513wrv.244.1667036391360; 
 Sat, 29 Oct 2022 02:39:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 s4-20020a05600c384400b003c3a1d8c8e6sm1124444wmr.19.2022.10.29.02.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 02:39:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 11:39:47 +0200
Message-Id: <20221029093947.124529-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kUU47HOqdQIbEWRe8jQ3jWwT5jqPfsmwh+7NwT/S+B8=;
 b=XXA4kOCkoZFaAqZPxiX+TqKrpVoP+r2M0Y2tGUX19rbvM5U127Fe6JsX2QBOdu4cBh
 QXBwUPn0Xtxq7H0rBgL5q/1INf11tFCIYujvyitTXT+aeBSs3BpbvsTs7CKikHPBxxMA
 wfcOfBkkJGLhsrKs4axe7ECUm0qlYzPXeLZgnAgiUN27iUk0vCJTPjDToLcF3wdKR81g
 zOgJbZxju/ObHwyT1BhheS636vAa1oKHhwnHa6XMyMd5WzQcDlu3UbuTSJLE9NOImYN3
 c85yZL1Y3UeG2an2l3xLShJJdTTyFmwCqU1cXel3f4a2eUYqolMVzUUvNYXzoIU2nvx8
 aDUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XXA4kOCk
Subject: [Buildroot] [PATCH 1/1] package/mtr: bump to version 0.95
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

https://github.com/traviscross/mtr/blob/v0.95/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtr/mtr.hash | 2 +-
 package/mtr/mtr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtr/mtr.hash b/package/mtr/mtr.hash
index d6062ef08f..399799f49e 100644
--- a/package/mtr/mtr.hash
+++ b/package/mtr/mtr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ea036fdd45da488c241603f6ea59a06bbcfe6c26177ebd34fff54336a44494b8  mtr-0.94.tar.gz
+sha256  12490fb660ba5fb34df8c06a0f62b4f9cbd11a584fc3f6eceda0a99124e8596f  mtr-0.95.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 07c58a1e93..d3e3b1a97a 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTR_VERSION = 0.94
+MTR_VERSION = 0.95
 MTR_SITE = $(call github,traviscross,mtr,v$(MTR_VERSION))
 MTR_AUTORECONF = YES
 MTR_DEPENDENCIES = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
