Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3563BCA101C
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 12:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC8B84079C;
	Sat, 31 Aug 2024 12:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEcghaRQPF2f; Sat, 31 Aug 2024 12:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99D44407A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99D44407A5;
	Sat, 31 Aug 2024 12:07:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05B811BF5F5
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 12:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F4097407A5
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 12:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCbApVcWncaB for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 12:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.44;
 helo=mail-wr1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E0EA4079C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E0EA4079C
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E0EA4079C
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 12:07:13 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-374bfc395a5so197689f8f.0
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 05:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725106031; x=1725710831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lDuJNw8IqCpPGMIH+3855jCqcWwtd6g45/98eRuqWIk=;
 b=AgWkJt7tP7aXrCht6fft4/8wjTqdQoFdOUu3ycq5UangA0u0SwMLWmJUdW8je3Qv3o
 PZ4kdQPGTwfm28N+daODM0xas98dNggnksUohcfGGOxRkwiUE+6sJBriX6uOcMrqtqJh
 +5XuR7leXsQ0ZdS9tEvMnhEgwNRIChlMKr0eN7HlF+nKugn4NDLylh1duWgw0Z2bHHCc
 wefphyQYU0UdoDgrFUeuJcOLegGc57QRaCjC30FHnXRCi+FxoP5i9EmpdI5DUsFrftoq
 fDrAUr0pNfRmirk8TEX74/faLcqNEacDaeXagcaF/cCvildstXzDm/R8iXjO+8GTXIkI
 H9nQ==
X-Gm-Message-State: AOJu0YzafW6+mKj0EJObtt10/QQBBELd9c+Qj1uAOzdPPEgRn0pykVmq
 i7rdYdifOVXkFSOvKJ4Ni0w2dnfz8/bl9wpxRC9XxO090Gwq8gaqkZeuljPz
X-Google-Smtp-Source: AGHT+IGvvXjQOzCCvmm/coFsGtuwoeL4MYO2+og1z0ZsMi3K9Z12WRrHcIdCOmc8oGJlxOi4gsX+8A==
X-Received: by 2002:a5d:5f43:0:b0:374:c21a:9dd4 with SMTP id
 ffacd0b85a97d-374c21a9fd5mr713184f8f.20.1725106030733; 
 Sat, 31 Aug 2024 05:07:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:d3c8:da3f:79f7:89e5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c2b29d2esm598273f8f.107.2024.08.31.05.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 05:07:10 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 14:07:07 +0200
Message-ID: <20240831120707.471306-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/webkitgtk: bump to 2.44.3
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
 Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release with many security fixes, including (but not limited to)
patches for CVE-2024-40776, CVE-2024-40779, CVE-2024-40780, CVE-2024-40782,
CVE-2024-40789, and CVE-2024-4558.

Release notes:

  https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-released.html.

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2024-0004.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 7da0e97e5d..b81a4c2793 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.44.2.tar.xz.sums
-sha1  e62b2c545011a2f180a914529a68950c4d34a2ee  webkitgtk-2.44.2.tar.xz
-sha256  523f42c8ff24832add17631f6eaafe8f9303afe316ef1a7e1844b952a7f7521b  webkitgtk-2.44.2.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.44.3.tar.xz.sums
+sha1  c9bcb2097d8f774b2c64ca650a4f8a6365ff54f6  webkitgtk-2.44.3.tar.xz
+sha256  dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54  webkitgtk-2.44.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 5115f3eec5..ff39ee01e1 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.44.2
+WEBKITGTK_VERSION = 2.44.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
