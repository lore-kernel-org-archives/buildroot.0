Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCFCC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A08041898;
	Mon, 18 Dec 2023 19:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A08041898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yK9Ac5F0dW77; Mon, 18 Dec 2023 19:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D12041946;
	Mon, 18 Dec 2023 19:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D12041946
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76A4F1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CC68408FB
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CC68408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mp696uWJFAXe for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:10 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74F6C414FA
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74F6C414FA
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d3b60c5054so10450035ad.2
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928409; x=1703533209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ud0Mfij3zlr6vmGysk2qQLugm7L12MhzE60J7jjnhbA=;
 b=CsqopatbUFoQHIvI14libiCYTibgLqbW8G6kcTidg50qnRqBGV39lXsyomeIXCLX0w
 Na02vxeInrA2zepc+gl2EB+ejx9/r3KsN+m+0gsOtGnFCszlDgBnrZl0T517yjvOfoaN
 LQTYk+dcnsHQMcOvT1ia4UfayLb1pl9So2KjwrNTiSDHOWzGjXuUQ+78uI3bvYXqgfHj
 qaS/sf0JpBYbMmeNC+zZd36oziFVUOvLkNUupEoZXuFntVrd5P0Vi3sc8ZDTtBJtinB1
 Vfsm9l+DqgUJ3twpnRaWxYjGkUszIo3lD2lbTw74VUjIs1UhJimoYlUJ1HTboAvEF0UT
 ihbw==
X-Gm-Message-State: AOJu0Yz4WR+mRsiJCCeM+0gxRKRmY3/yxFmomn9j2Mxem7ArRpZolC00
 7Haw/s2EYpJJQzuJHnNlUviyMzjNtO6NhS2ql20=
X-Google-Smtp-Source: AGHT+IGWpwhn2gPHiiLezUwuuflSt7xBPMa3vR8qCvhP6C3BqKQYWb8LwDJb4jiF/nqd0dUG+T0glA==
X-Received: by 2002:a17:903:228a:b0:1d3:c98f:9950 with SMTP id
 b10-20020a170903228a00b001d3c98f9950mr820751plh.101.1702928409459; 
 Mon, 18 Dec 2023 11:40:09 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:08 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:49 -0700
Message-ID: <20231218194001.544887-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928409; x=1703533209;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ud0Mfij3zlr6vmGysk2qQLugm7L12MhzE60J7jjnhbA=;
 b=evA/KZ8KORjCuRMHe/QHcRYd+hgPpUWVl6FgfmqaiYcnQjJn39piiw7mIjHiLBd1BV
 Kb2n97fe7ikp2+tAOphlqoF3K594ZdpX/U4JHN4GqUGzOd+4rjxVSJiyNaVjCTDREKDJ
 cOFYjtAdh7LKiZ0RPhPNz0t5FpA8uIcTzbC7k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=evA/KZ8K
Subject: [Buildroot] [PATCH v2 04/14] package/tllist: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Fix the sha256sum of 1.1.0.tar.gz

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/tllist/Config.in   |  6 ++++++
 package/tllist/tllist.hash |  3 +++
 package/tllist/tllist.mk   | 16 ++++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/tllist/Config.in
 create mode 100644 package/tllist/tllist.hash
 create mode 100644 package/tllist/tllist.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index acca5353b5..3b429847c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -40,6 +40,7 @@ F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/python-kmod/
 F:	package/python-versioneer/
+F:	package/tllist/
 F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/Config.in b/package/Config.in
index 9138f74b25..728692bc32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2202,6 +2202,7 @@ endif
 	source "package/tbb/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tl-expected/Config.in"
+	source "package/tllist/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
 	source "package/uvw/Config.in"
diff --git a/package/tllist/Config.in b/package/tllist/Config.in
new file mode 100644
index 0000000000..879119d13e
--- /dev/null
+++ b/package/tllist/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TLLIST
+	bool "tllist"
+	help
+	  A C header file only implementation of a typed linked list.
+
+	  https://codeberg.org/dnkl/tllist
diff --git a/package/tllist/tllist.hash b/package/tllist/tllist.hash
new file mode 100644
index 0000000000..2806d62355
--- /dev/null
+++ b/package/tllist/tllist.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  3f3fe2f7433719cec816c63937a7aa36e566bd317763ef46d11562073ab6361d  1.1.0.tar.gz
+sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/tllist/tllist.mk b/package/tllist/tllist.mk
new file mode 100644
index 0000000000..88a28d2427
--- /dev/null
+++ b/package/tllist/tllist.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# tllist
+#
+################################################################################
+
+TLLIST_VERSION = 1.1.0
+TLLIST_SOURCE = $(TLLIST_VERSION).tar.gz
+TLLIST_SITE = https://codeberg.org/dnkl/tllist/archive
+TLLIST_LICENSE = MIT
+TLLIST_LICENSE_FILES = LICENSE
+# header only
+TLLIST_INSTALL_TARGET = NO
+TLLIST_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
