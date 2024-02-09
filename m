Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C429C4828F
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 10:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03DAC4EC0C;
	Fri,  9 Feb 2024 10:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRTGkMKuXGO3; Fri,  9 Feb 2024 10:47:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC85D4EC1B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC85D4EC1B;
	Fri,  9 Feb 2024 10:47:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C08E1BF31E
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 10:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 162DB4EC1B
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 10:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTK-cpAPxlJK for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 10:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=sebastian.weyer@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6257C4EC0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6257C4EC0C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6257C4EC0C
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 10:47:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4105a6be071so4375715e9.1
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 02:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707475644; x=1708080444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hfA5SiMLfScgqFLL0/mDAfnNrSk0PIwK7iEQXazXpY4=;
 b=RDvGIjxteqUXzznU7lQjB321V7uDOYgpr0JY4MLhzEydy3+fnBhgM223rMW4FLs0ra
 qbJcIy/2xOMuFveYV+yiNMrWDgJTHlO5XJ3ymT8ktktiPuznTg3rYcdBGjUwcLn2FoHZ
 smccEIRw0DBbhH9MCpEuSyO7aKKwxJpDU4sEtDle4LOjehaDpEQoCSpTLjt9zHHilZ7+
 h+Z8PiV6bL875av7lS96D9MQlHbbbetiowuU9J62AghvpoorA5KSW35CSJ+K8PgWfSeq
 EglDmdtiV9HvW9DTJ3ukKsSOfAiScQwvHW+mRkcBeHEG/cf1JmOMc5rOmYTru7VmA2kN
 E7sQ==
X-Gm-Message-State: AOJu0Yz6EfJ1KY4PbJXeN4Pr+9oJkM4VNEZUpoeC5gVM2WYUcJAL2Ki+
 8fbY3+hBXgjTzDG/54ZW6xt5xaDZkEcaZXrfpCMW+k0C65PrFGHiMQ3gIb+ljI601SILNE6HG80
 0
X-Google-Smtp-Source: AGHT+IGLyk432iJKgAdQnkSLvurXqvd6pId1PWeSh/V/EtCmfpaB2RiRhHLGqgxTSbWWhwovcLekjw==
X-Received: by 2002:a05:600c:4ec6:b0:40f:ba02:d172 with SMTP id
 g6-20020a05600c4ec600b0040fba02d172mr793143wmq.17.1707475644324; 
 Fri, 09 Feb 2024 02:47:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWS164qtpBenjGOMGtfhnjAMB4XQvlhirxwQl9g86Rd3YmKg+Zm7iom/+tr5LNc5TVJrg2U042GUQoilM5j/E5WfmltjQvrfrTI4VzPOf2MMxguvFepM+PTYTfQ2datMglycaqgEO9npVnGNiI=
Received: from DJJ6N8Z3.kohlerco.com ([136.144.97.40])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a05600c654700b0040fa661ee82sm205283wmb.44.2024.02.09.02.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 02:47:24 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  9 Feb 2024 11:47:04 +0100
Message-ID: <20240209104705.1825396-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707475644; x=1708080444;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hfA5SiMLfScgqFLL0/mDAfnNrSk0PIwK7iEQXazXpY4=;
 b=f0z4/1Hat8VSyKNnnN5pphQAtiDSxXxIPPN5H2Aupl92zlIh1wesjAIhAAa7cIIl3T
 IYdqKSQUwBJf9kZ+j8106zepyBbdBG9RxAAIGgIE+urkOtKe/oAiaxF5Ou0QtRmvxgPv
 XZco8YbZV5mvv4qdujVggrzNq1OCtUEcCgUC1jko+4tAJVIQHGhIDo2mRQzgfYns32Vo
 aRrWxk3sYYsIAkyuHFi6K0vG0EnMjF1uy+iLKrdbQ3c+E+90MroALbyZtHj/OZByPvwJ
 fRILWjjz9l7gMEAZSVRP+NS/uc7QgAjpcnH+m3bnPKl6oVsS1Aw0FZfVdp9ID260Hwch
 bHPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=f0z4/1Ha
Subject: [Buildroot] [PATCH 1/1] package/qt5doc: bump to latest kde
 submodule version
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump qt5doc that was missing from the latest version bump to latest
submodule versions from:
https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
This was not the only package that was not touched in the latest  update
of the submodule versions. Here is a list of the missing packages and
the reason why it hasn't been updated:

- qt53d: does not compile
  qgltf.cpp:29:10: fatal error: assimp/Importer.hpp: No such file or directory
   29 | #include <assimp/Importer.hpp>

- qt5coap: no tag 5.15.11, last one 5.15.2, already at latest version

- qt5enginio: no tag 5.15.11, last one 5.6.3, already at latest version

- qt5knx: no tag 5.15.11, last one 5.15.2, already at latest version

- qt5mqtt: no tag 5.15.11, last one 5.15.2, already at latest version

- qt5opcua: no tag 5.15.11, last one 5.15.2, already at latest version

- qt5script: already got updated to 5.15.11 during version bump to 5.15.10
  in commit 6b23dff9e71786191797d3b41ce80afe659f0396

- qt5webengine-chromium: no tag 5.15.11, last one 5.15.2, already at latest
  version

- qt5webengine-chromium-catapult: no tags in repo, not sure which version
  corresponds to 5.15.11

- qt5webkit: no tag 5.15.11, last stable version 5.5.0, currently used
  version 5.212.0-alpha4

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/qt5/qt5doc/qt5doc.hash | 2 +-
 package/qt5/qt5doc/qt5doc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5doc/qt5doc.hash b/package/qt5/qt5doc/qt5doc.hash
index ec84ecdcb5..13a3167211 100644
--- a/package/qt5/qt5doc/qt5doc.hash
+++ b/package/qt5/qt5doc/qt5doc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  87ef0ba72ede78148dfae8fbe78c839f0e9966e1ab4a58d7725041144c0de70f  qtdoc-897e90fe304d844beaf694b82a93a50237fa8b9e.tar.bz2
+sha256  1dda7d710bc463cc0d33ad6c88762f5a7fe4606ad9cb73feb24b3c4ea8ab66f5  qtdoc-b7b96305c8cdc23bfd63e77a336802d0d3d99004.tar.bz2
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5doc/qt5doc.mk b/package/qt5/qt5doc/qt5doc.mk
index 77845a347f..5dbfafd94a 100644
--- a/package/qt5/qt5doc/qt5doc.mk
+++ b/package/qt5/qt5doc/qt5doc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5DOC_VERSION = 897e90fe304d844beaf694b82a93a50237fa8b9e
+QT5DOC_VERSION = b7b96305c8cdc23bfd63e77a336802d0d3d99004
 QT5DOC_SITE = $(QT5_SITE)/qtdoc/-/archive/$(QT5DOC_VERSION)
 QT5DOC_SOURCE = qtdoc-$(QT5DOC_VERSION).tar.bz2
 QT5DOC_DEPENDENCIES = qt5declarative
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
