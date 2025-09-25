Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A33BCAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E16B40DF6;
	Thu, 25 Sep 2025 20:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBumEbWkG1r1; Thu, 25 Sep 2025 20:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A7DA40D1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A7DA40D1D;
	Thu, 25 Sep 2025 20:06:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6397B12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6093B84371
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOAXNSv7Om-5 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.45;
 helo=mail-ed1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C421827D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C421827D9
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C421827D9
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:06:20 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso2782191a12.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758830779; x=1759435579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UT2vTojGFC7YUGLyjuKhJjkb4+davZXCjESQE6PCrFE=;
 b=iZgC3cpsXyt6YQP3nz0XvXmDCtPEoFj0i5CFuWn5PjMHy9RBXOUx5BR5S1OVhznNZj
 lWcsvwWPQ8iWiAexFiCGh7Cwpo17BZjun832U3e60axZ1RfWXxoXrkhkndVE7y0acYEt
 6ams6a6pJ6LDjeBLD+HDvVxVveBOmWI/eRyoAcayS5MsEj2K9FCiO++hnsFRUOeaQRzI
 rgxWXeqAIaS+5MGXRDv4O19LB+5/JpRyQNYKUQ3kAo36aj8BgEicXNoidWP0FG7ukwat
 NdSdHAVz+AiYdk9zc07k4g06wi0cBHLHoZzkPpCsnmrO5yuNFaQYQPEUBhe2fMIXS8YB
 sq7g==
X-Gm-Message-State: AOJu0Yz1VH5ONBVay0OuKMgKSbAyb5EabhHk2y41kiEVRkJH3Oo2yn3G
 d63fTB4aJATbLJzJG25xvtBcOOetjUm4KlMzjmJ7YIy9ZU97gB1XJFIs/iHc07NPBBw=
X-Gm-Gg: ASbGncu2JEbkm8f1yx5KdKiKVKFLj27U8hZvLkZNlLAKmZmlhUp2jAJdiPKAmHaXfuQ
 1+pbf9sy25zl0JM6SgcljTXapJUKjL/TtShbNkFYpzWkaXjez2v8RsNUSk97Eqk7Xs8oS9PI+UY
 o06JC5FP2lym6LTkO4lGxZe7ZAA+5uCkIwaNPmXSFeKnBVo4rVlab66+Dhwe6sbGi0LEK6/GL0e
 b7NgzvdOnYf8ctYQOWQ/+tqtCw2rnzbcEtF2NCL7SNcKZy4HrbK9TkXuwu+7A4/b9nkqan/VxkT
 MNtXg9hyXpETdPGKNqF91GJauhMZIcQ3NlKBj/NWr8dIttfG3vbc9K7OeupT7Q2zcqlF5BNmi/8
 h4ns04lqnHgrYmVhQNsQkk3MLUGh3NSgQMWteB+rDHl29JBkOOsZT8at8sIMjJCUtcY1sbGHxlP
 rqralcPjt6BQa1bui33uziP5KQ
X-Google-Smtp-Source: AGHT+IG2Oc6u1v32tXqNfimVI4XU84OA0ZBmFxs65Mr5qQ9R8Q6Nhs0Y4lNm5tKKptnb5O0ZkDy/7A==
X-Received: by 2002:a17:907:7f0c:b0:b04:aadd:b8d7 with SMTP id
 a640c23a62f3a-b34b684a751mr485200666b.13.1758830778664; 
 Thu, 25 Sep 2025 13:06:18 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb6f:7900:e15d:6e8b:7a28:901f])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b35446f7806sm234272166b.70.2025.09.25.13.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:06:18 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 25 Sep 2025 22:06:10 +0200
Message-ID: <20250925200611.206010-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925200611.206010-1-thomas@devoogdt.com>
References: <20250925200611.206010-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3 2/3] package/cargo-c: add new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Guillaume Chaye <guillaume.chaye@zeetim.com>

Cargo-c is a cargo applet to build and install C-ABI
compatible dynamic and static libraries.

It will be required for librsvg.

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
Superseeds https://patchwork.ozlabs.org/project/buildroot/patch/20250324173246.100112-2-guillaume.chaye@zeetim.com/.
v2: no change
v3: no change
---
 DEVELOPERS                   |  1 +
 package/cargo-c/cargo-c.hash |  3 +++
 package/cargo-c/cargo-c.mk   | 15 +++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/cargo-c/cargo-c.hash
 create mode 100644 package/cargo-c/cargo-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fc561eb1ea..4f017cb03b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1364,6 +1364,7 @@ F:	package/rpi-rgb-led-matrix/
 
 N:	Guillaume Chaye <guillaume.chaye@zeetim.com>
 F:	package/sane-airscan/
+F:	package/cargo-c/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
diff --git a/package/cargo-c/cargo-c.hash b/package/cargo-c/cargo-c.hash
new file mode 100644
index 0000000000..64353c5628
--- /dev/null
+++ b/package/cargo-c/cargo-c.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  757034535d42b345cd7b47c9d5e3624073332437805634153a19259439491be2  cargo-c-0.10.15-cargo4.tar.gz
+sha256  d69f24ad84ec2ade64c0b68bdb31b41170e997b158370342056918329cc9af1e  LICENSE
diff --git a/package/cargo-c/cargo-c.mk b/package/cargo-c/cargo-c.mk
new file mode 100644
index 0000000000..1f9e1f786b
--- /dev/null
+++ b/package/cargo-c/cargo-c.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# cargo-c
+#
+################################################################################
+
+CARGO_C_VERSION = 0.10.15
+CARGO_C_SITE = $(call github,lu-zero,cargo-c,v$(CARGO_C_VERSION))
+CARGO_C_CARGO_LOCK_FILE = https://github.com/lu-zero/cargo-c/releases/download/v$(CARGO_C_VERSION)/Cargo.lock
+CARGO_C_LICENSE = MIT
+CARGO_C_LICENSE_FILES = LICENSE
+
+HOST_CARGO_C_DEPENDENCIES = host-libopenssl host-pkgconf
+
+$(eval $(host-cargo-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
