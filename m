Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D219BC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 782A5813FA;
	Wed,  1 Feb 2023 05:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 782A5813FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ebnlr_4ugqjE; Wed,  1 Feb 2023 05:19:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A97A814AB;
	Wed,  1 Feb 2023 05:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A97A814AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3951BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA3F9813C4
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA3F9813C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id On8L4K7HpPCL for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B6580B54
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2B6580B54
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:17 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id g16so7490342ilr.1
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ObjKxvht5FkgBF/av+H/hmFkeX/4SFwvndsm88XGRY=;
 b=Gs7iTa2j73vUefCErII5RuwrH3O5l/rJTK7o6bKTSn3FQNNfr99ujntg8eMMervmyN
 6DGong/dYwzIRPxWG87l6yQhLJTXjEq+KgMKE6laddGafBn3Ik3oL9yxYQd3xURVpi5V
 gWkFUOPQg4LScPtVgYl3+uHb6AmTaSETRj1FHB3KCNJFGExvuhOwasXfObr8qwRNEM+v
 ybP0IXLH8yBWRweLFeyZl/n9oCEsTtquVyfJLJ/swpyl0wC686mlmkZXXLuO3/logREg
 fWHO9J598sahnfvl7tBe7ADmbQoPX7GpfsN+CtSXekneSuBq0CP1kI0mwYywPGAQaR0v
 2F/A==
X-Gm-Message-State: AO0yUKUU+Z6BGPpiZf4kYp4NqqbDCCl4XI5nT+RxyJx6A6jVIsIGfdLX
 kUS+bSJBrcZQ8PlA4vkMT1bbnQKJf/i5EQ==
X-Google-Smtp-Source: AK7set8TGiJtAjwh4x/IJz/2rznjXus9EYjwOVwEZYLkoEPgKCm24T1ubKxa5aaR2KfhVF1Bt7QqbA==
X-Received: by 2002:a05:6e02:20cb:b0:310:e8d2:91aa with SMTP id
 11-20020a056e0220cb00b00310e8d291aamr852096ilq.10.1675228636867; 
 Tue, 31 Jan 2023 21:17:16 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:56 -0700
Message-Id: <20230201051658.383420-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ObjKxvht5FkgBF/av+H/hmFkeX/4SFwvndsm88XGRY=;
 b=nXkvmX9kFKQoWQMMvG/YUFqxWFUYIu455MmpFjE9+NR7h14gc1anj0gaflUTQOtqzY
 Hz8hNMiqLAQ+z6P4rAy/4JtY1wUxJrbFHrIuAlQX2pFO9Uwmq3Rb/1jC33VOEr9nlXzb
 YwY0MMhVeim6uqDi7Pg58JelpFva+QDBUBeq2ZyJrUMBwkBeOgPdW+6vEDtt5WMIfq8W
 ulK64cHOFL1chcMhogjzpTC0BiEBQ+12Lw8OWYMIunZ1ui+NV3lW5JJ+2FpCCdTyIsIB
 irQ4oozpdGNlKp/mvGjSMWg7gCFImz1PX0vrBocaADVdoQlWGsDBGVSUhHVXsQap/w7H
 /Rdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nXkvmX9k
Subject: [Buildroot] [PATCH 11/13] package/gstreamer1-editing-services: bump
 version to 1.22.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch fixing an incorrect gstreamer-validate-1.0 dependency
name.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...treamer-validate-1.0-dependency-name.patch | 35 +++++++++++++++++++
 .../gstreamer1-editing-services.hash          |  4 +--
 .../gstreamer1-editing-services.mk            |  2 +-
 3 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch

diff --git a/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch b/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch
new file mode 100644
index 0000000000..6c190d3727
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch
@@ -0,0 +1,35 @@
+From c3edd999195445319ea619b6d719d7743f5b560d Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 31 Jan 2023 21:38:09 -0700
+Subject: [PATCH] Fix gstreamer-validate-1.0 dependency name
+
+The gst-devtools project generates gstreamer-validate-1.0.pc, this
+must match the dependency in gst-editing-services for detection
+to work properly.
+
+Fixes:
+Run-time dependency gst-validate-1.0 found: NO (tried pkgconfig and cmake)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3859]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index bdc47f5d8b..b949f55317 100644
+--- a/meson.build
++++ b/meson.build
+@@ -110,7 +110,7 @@ if host_machine.system() != 'windows'
+ endif
+ gstcontroller_dep = dependency('gstreamer-controller-1.0', version : gst_req,
+   fallback : ['gstreamer', 'gst_controller_dep'])
+-gstvalidate_dep = dependency('gst-validate-1.0', version : gst_req, required : get_option('validate'),
++gstvalidate_dep = dependency('gstreamer-validate-1.0', version : gst_req, required : get_option('validate'),
+   fallback : ['gst-devtools', 'validate_dep'])
+ 
+ gio_dep = dependency('gio-2.0', version: glib_req)
+-- 
+2.34.1
+
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 308596d7cd..bd5dcfdbaf 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.20.4.tar.xz.sha256sum
-sha256  aa03e983af5d79c1befffe3575b034e60960619a96bf877447cb73c28016fc41  gst-editing-services-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.22.0.tar.xz.sha256sum
+sha256  2a23856379af03586b66c193910fa8bb963024580bc2337c7405578dc077aa79  gst-editing-services-1.22.0.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 77feb15991..0ae9205c3b 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.20.4
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.22.0
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
