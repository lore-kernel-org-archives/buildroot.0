Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29A6CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 18:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B7F382215;
	Wed, 10 Sep 2025 18:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dk0UpopigiEF; Wed, 10 Sep 2025 18:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD26821DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD26821DA;
	Wed, 10 Sep 2025 18:35:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CA0E443
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 18:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E734612CF
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 18:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGuSiLojGU4F for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 18:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA1346129A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA1346129A
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA1346129A
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 18:35:05 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-8877677dbaeso119099039f.0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757529304; x=1758134104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDwA8BO11cjxlas9+6cSAu2DcpFFftIEPnMGGdJkunU=;
 b=ADSF2LTVpT1n9BSBbQnP7+YChHbjQSPHlxPJhnBkWHF6Z8F4NXwd6ZKLwFnmsD9msG
 JKnCBUZ5o5U8AYKlKFAuDSQF/z2QtQ3Zo1YQXZ1467wg/AovGME4JZAYbuhXK0i/Jc3P
 8WcTk3MJaW2Q1ZcxEUwKKrHlN6kA8ojPdwhclYkHiXOcQnKRfW9hDaceU0L2NtpKMMnh
 T6kzeHkS2uSJrGEndesGNLnhzPYpCjbiGYST3ceRbO/0d3OqiZMYwQ7vPMziLmf9C3Cf
 CuXYYPx5P25ZgEPpEPOw+jwRhUBZ1nYwnvi0ijdKcqSF0lEkEKhP0clgeUVXkzj9AU3V
 mlqg==
X-Gm-Message-State: AOJu0Yztc2rHfg9GzPDSetwTuRIANqQRU5iSlSbeX0QwUL9QdXFCvyOd
 jxf6I5WyfLadT0lSXbjzQpQfWaYkB3k6gCfwPf5w0BzgiwXQnmV57r1eiDIgBQ==
X-Gm-Gg: ASbGncthKTqJYiH7HbseKvXjkR8J+X4gOzGGNIaOajNLKl56rYZNhohgFWom8xW/A+B
 lDS/MCsRvFxM/KU1zFwQk11BuSwf0rOgELhQx/V+Uj6gwBxpX8kiz+69hKnKy0kG94xo6L2fD8x
 20ZWglaed/H33tmsnBD3JPG+cdONSih1l52l6PUDnzW5cSZntJ+2/Cj1Cql9DiTiLyp4xMmorpv
 eMKNEp1drXXjAibKCV2Cir9yTKnB0Gb7SAQgE3c19yX3K2rM3B6ciXmVRWd9K5mEh0/iAYTVY78
 8Bdb8YNiKaK2cZlW7iyzId2j74cXix3E6Qd86ke+E/X248JUxjpNc4kf/hwZS1f6L4hqr/F+DXB
 O5dR9P7N2t9B66j/QmPJ9ZS9pUTHsF6AJDHs3Ro17s6L5jIBBMegp/+ct4qYuLC9uoEbVup5trs
 iMQrhCA/Oa7KE=
X-Google-Smtp-Source: AGHT+IHSfplsLITK+NJ5Tngs3drFQ4JEcjgq5nkIqbOxW6QgOCzNci6nje/DFdPsCSoxwkeh1qj/fQ==
X-Received: by 2002:a05:6602:36ce:b0:88d:9dce:2916 with SMTP id
 ca18e2360f4ac-88d9dce2a43mr622787539f.8.1757529304377; 
 Wed, 10 Sep 2025 11:35:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-88ee6b12228sm2323039f.3.2025.09.10.11.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 11:35:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 12:34:57 -0600
Message-ID: <20250910183458.1288165-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910183458.1288165-1-james.hilliard1@gmail.com>
References: <20250910183458.1288165-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757529304; x=1758134104; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDwA8BO11cjxlas9+6cSAu2DcpFFftIEPnMGGdJkunU=;
 b=O401O6Qmn9D7vY6M3FNpsQr0GZj9+8gb5hBLYG+MWQZwxIG1qdjgDsewIrtvnVyI/3
 4qy705koLbnvGTZepg00t3f1gplpnvnuoJLMXsZWPxBOuvFUmSnqIAT4cTPjpX6l7ofZ
 iqt45kYq+Dehybd2fOmQn/HL97te5hDxQn34sxIdC1fjb07W6bPDGzej9ROirN7EUcBI
 GdT0XohKD4+lGltjnEbGZ7BBSmXu8l1Z3A74I5FBQf/oKAxp4l+PzCPH9luyaTgNLA6B
 cWFKLd4ymYnSAIbbVeIgwJAE0mj8xx4wKLkIZ2lrcnTdZ+ZRxEvh9M39QEgi8uTolXAz
 aKNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O401O6Qm
Subject: [Buildroot] [PATCH 2/2] package/cloudflared: bump to version
 2025.8.1
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

Also set BuiltForPackageManager=buildroot so that cloudflared's update
command informs the user to update cloudflared via buildroot.

Without BuiltForPackageManager set:
cloudflared update
INF cloudflared is up to date version=

With BuiltForPackageManager set:
cloudflared update
ERR cloudflared was installed by buildroot. Please update using the same method.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index f199160a94..407d24ccdb 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f9223cdefaa4b75aa1c49638936af9d5007b6c7bd943ab70203bb75bf32467da  cloudflared-2025.1.0-go2.tar.gz
+sha256  803d3e162dc91da6b3b4f7961f57c113fa818d45517758511f72d254d68a46ba  cloudflared-2025.8.1-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index bf341b6b62..03b6a8fae6 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2025.1.0
+CLOUDFLARED_VERSION = 2025.8.1
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
 CLOUDFLARED_CPE_ID_VENDOR = cloudflare
 CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
-CLOUDFLARED_LDFLAGS = -X main.Version=$(CLOUDFLARED_VERSION)
+CLOUDFLARED_LDFLAGS = \
+	-X main.Version=$(CLOUDFLARED_VERSION) \
+	-X github.com/cloudflare/cloudflared/cmd/cloudflared/updater.BuiltForPackageManager=buildroot
 
 $(eval $(golang-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
