Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E804C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 22:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7702416C9;
	Wed, 27 Jul 2022 22:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7702416C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNOuHe-Z1nTj; Wed, 27 Jul 2022 22:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 289FD415D8;
	Wed, 27 Jul 2022 22:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 289FD415D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA6A41BF47F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C073C409DA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C073C409DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11LyJRoBGbbZ for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 22:12:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5882D40469
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5882D40469
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 22:12:21 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l22so4679040wrz.7
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cx53gC1Lutm10uFzKcYGrOhU3lxTyLV7DACO1JXdU/k=;
 b=ZSVGZ9bOLzw99xwSlkHewk7VXDgR+KMsPUgnI1V+USsvYcuTXTDuTJ3TPwEvkmmkt/
 lZ4eFFPLb0lqkNrE2O+4vXS/sRPCzjzYY8idXOUGxMtdMk1MpsxexVWsr4bU41/fEvbK
 K7AJzt0Je9/a7EmFeVUNQhegXUB54Itnv+KFEHekqW90UP4BuG3zJLFkAM390147aPVP
 Df/Uh3xtH+0jDlMSWIuCurW8aRI/hfktflnHCZslS5+ho3XVVxkHyKjqHtE5gjFXRJxs
 kVtp4HhJ9NQx1urEvW5f0sHH7d2LVC/jSD37KGIESepiLCgll1VjA7Mh0UUUV6lFujXv
 W3Uw==
X-Gm-Message-State: AJIora8JBPKsjcbhJ8YIUVckmILKKcFG8PgH7qZ/uU/2gU3/05Tmavzi
 DOdIKufCSXYUVtTlASeMR3Mz6RgVMMHaDw==
X-Google-Smtp-Source: AGRyM1ssV5UylwoGeX4JJfbLPIbNZ0PL5/4m8xK+x5xjxPTmwQiI6ZMdWsQ9kEEVOp0h8eoUDxasMQ==
X-Received: by 2002:a5d:5989:0:b0:21d:b2bd:d712 with SMTP id
 n9-20020a5d5989000000b0021db2bdd712mr15710492wri.698.1658959939118; 
 Wed, 27 Jul 2022 15:12:19 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1c2643000000b003a30af0ec83sm3413037wmm.25.2022.07.27.15.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 15:12:18 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 00:12:16 +0200
Message-Id: <20220727221217.1072588-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cx53gC1Lutm10uFzKcYGrOhU3lxTyLV7DACO1JXdU/k=;
 b=cX4P70owzyq9ZG8Byi8rrA6iMQscbYEXBq6Zny7N4jPyPqJ3Fozfd65xPzpYZ5gul1
 W4bU6Dlw9NP7+0cprk7FYeTtC/8Wud1cN1z53vhsn9wuF1dPEzhn6hbwnjBGe8T8/1fA
 hsFboVh50J/MASdh3FsqWocx+bmT0rxsscP4Kdk/KfE8RJjZAbshfyazGWoElzgnVo/B
 5Y6+V044mZl/20G0BJ0nNwgCSNQoTvLnXphlm8PWUcKXmCsMw9sfwaGYfbKY4rELbQdZ
 Gj3sGdvZAtCLTtPyO0SUkMjvLEK6DP4IZK2KugxBvhHjwGDoWP+6cfBhKmvuRxWlNqpt
 cQ8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cX4P70ow
Subject: [Buildroot] [PATCH 1/2] docs/manual: introduce "Integration topics"
 chapter
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We want to add more information in the manual about how a system created
with buildroot works overall. We currently already have a chapter about
SELinux, but we want to add more information like that, e.g. details
about how systemd in Buildroot works.

Create a new chapter "Integration topics" with an introductory blurb,
and move the SELinux topic under it (as a section rather than a
chapter).

"Integration topics" is not the best title, but we couldn't find
anything better.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...x-support.txt => integration-selinux-support.txt} |  6 +++---
 docs/manual/integration.txt                          | 12 ++++++++++++
 docs/manual/manual.txt                               |  2 ++
 3 files changed, 17 insertions(+), 3 deletions(-)
 rename docs/manual/{selinux-support.txt => integration-selinux-support.txt} (96%)
 create mode 100644 docs/manual/integration.txt

diff --git a/docs/manual/selinux-support.txt b/docs/manual/integration-selinux-support.txt
similarity index 96%
rename from docs/manual/selinux-support.txt
rename to docs/manual/integration-selinux-support.txt
index 21137ae6c3..1f6bcf47eb 100644
--- a/docs/manual/selinux-support.txt
+++ b/docs/manual/integration-selinux-support.txt
@@ -2,7 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[selinux]]
-== Using SELinux in Buildroot
+=== Using SELinux in Buildroot
 
 https://selinuxproject.org[SELinux] is a Linux kernel security module
 enforcing access control policies. In addition to the traditional file
@@ -30,7 +30,7 @@ upstream https://github.com/SELinuxProject/refpolicy[refpolicy]
 project, enabled with +BR2_PACKAGE_REFPOLICY+.
 
 [[enabling-selinux]]
-=== Enabling SELinux support
+==== Enabling SELinux support
 
 To have proper support for +SELinux+ in a Buildroot generated system,
 the following configuration options must be enabled:
@@ -42,7 +42,7 @@ In addition, your filesystem image format must support extended
 attributes.
 
 [[selinux-policy-tweaking]]
-=== SELinux policy tweaking
+==== SELinux policy tweaking
 
 The +SELinux refpolicy+ contains modules that can be enabled or
 disabled when being built. Each module provide a number of +SELinux+
diff --git a/docs/manual/integration.txt b/docs/manual/integration.txt
new file mode 100644
index 0000000000..bdfbfa59de
--- /dev/null
+++ b/docs/manual/integration.txt
@@ -0,0 +1,12 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[integration]]
+== Integration topics
+
+This chapter discusses how various things are integrated at system
+level. Buildroot is highly configurable, almost everything discussed
+here can be changed or overridden by xref:rootfs-custom[rootfs overlay
+or custom skeleton] configuration.
+
+include::integration-selinux-support.txt[]
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index b5cc044805..8ba0c76d32 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -38,6 +38,8 @@ include::common-usage.txt[]
 
 include::customize.txt[]
 
+include::integration.txt[]
+
 include::selinux-support.txt[]
 
 include::faq-troubleshooting.txt[]
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
