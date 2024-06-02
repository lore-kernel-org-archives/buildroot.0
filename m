Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE149C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BED782125;
	Sun,  2 Jun 2024 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9FmB_WDz4DA; Sun,  2 Jun 2024 20:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E5638338B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E5638338B;
	Sun,  2 Jun 2024 20:41:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 001ED1BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E151D8338B
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdvEFWOzyJj8 for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:41:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F21C282125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F21C282125
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F21C282125
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:41:43 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-37491216a56so6406285ab.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360902; x=1717965702;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ndqyC4s7rZxkK56tNVz6po46FqyC8GRnPYx1u+9bg7g=;
 b=USaYmaSPMfXb9sEyliYIZRFLcTgBfZrbpb9hTRdP569Z9X/KIrMRLJQ+liAyyC8YCG
 7dvcyxnY4OLw7rNwBTtIKpF/UNaUUKvSNfMQ3oRLYG5tndP3VK4GkZ26rgaz8BiIFsCr
 KrHFBZOvKvW2Pw8BgNT4goLtsZUllJhBzJ/kGl6AaJQFnAvAIckCjwsadqKVFsMgIKkL
 93axEoiS9MqnzFklTiYpGOgyXISJn2IwWz+vUlDJl6x6tdMs2W2I2JErmJV4VeoPsiiS
 p/ufu+MOf22AWyjSt1Qwo4/iJBUaXqcawVAKbrNuexQdxtomnVFd2JSXTitNWL4Z+BSx
 nx3g==
X-Gm-Message-State: AOJu0YzjvgHVWsQ8+g6HYlM+eYP/TgDVca1d03o4ds6mb9h7xyFYkS6M
 PRPm3PGhbZdCJBtGfVfpRiXomE9RZ2OyS7hHJi0QKw00xM9eoXXzl/ktlQ==
X-Google-Smtp-Source: AGHT+IGXCLwWihrXAmEhr8frkmHYHsVaac+oseKmJtX3Kn6MnvEQzfzCfaTX75IzUTRhM9kJ5PFCTQ==
X-Received: by 2002:a92:c566:0:b0:374:5e74:4bd4 with SMTP id
 e9e14a558f8ab-3748b9d42b9mr87338795ab.20.1717360902487; 
 Sun, 02 Jun 2024 13:41:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3748a205a35sm13236735ab.39.2024.06.02.13.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:41:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 14:41:39 -0600
Message-Id: <20240602204139.2508623-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360902; x=1717965702; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ndqyC4s7rZxkK56tNVz6po46FqyC8GRnPYx1u+9bg7g=;
 b=J7L5oO45M6DkqLjhE0N6GP7FXBwDIg4/fsZ9OkFwUG/GBzhNH5pIyeHwDMNYtkjsZP
 42WyfX8wBqTaxDtxnkwqZ+LJEcXI8pcvc4RWPij/Ol8P0WTjc246qZKP3/4uhGc9gstq
 7ebQ3JThkLIugf8AJAIOPWvR/PBQbhpHFlgbl7g9yokW6aYprELxyuK1UD8CQXUn7sKf
 yzFhhKzaebyT0E/kX2SjxMtsD5Le15La8BE8ppuh3rPV6iGKPk93jRD1YVo+ydAD0Sjt
 fylgI/YR60mO8w/5tacGqYPCmZGcLrhkwFMgp1ZQEJE//pwNxwCFDIoEBxgYa8ofkhik
 2WAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J7L5oO45
Subject: [Buildroot] [PATCH v2 1/1] package/vala: bump to version 0.56.17
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set GI_GIRDIR env variable which is now required for configure
to function.

Details:
https://gitlab.gnome.org/GNOME/vala/-/commit/a9d38070ce86d7994b949f7cb426fbf670a953d8

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - set GI_GIRDIR in env instead of depending on host-GOI
---
 package/vala/vala.hash |  4 ++--
 package/vala/vala.mk   | 11 ++++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index b3716f0854..a16875ac6a 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/vala/0.56/vala-0.56.14.sha256sum
-sha256  9382c268ca9bdc02aaedc8152a9818bf3935273041f629c56de410e360a3f557  vala-0.56.14.tar.xz
+# From https://download.gnome.org/sources/vala/0.56/vala-0.56.17.sha256sum
+sha256  26100c4e4ef0049c619275f140d97cf565883d00c7543c82bcce5a426934ed6a  vala-0.56.17.tar.xz
 # Locally computed
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 415d996faa..a1c27240ac 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,17 +5,22 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.56
-VALA_VERSION = $(VALA_VERSION_MAJOR).14
+VALA_VERSION = $(VALA_VERSION_MAJOR).17
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPL-2.1+
 VALA_LICENSE_FILES = COPYING
 VALA_CPE_ID_VENDOR = gnome
 
-HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
+HOST_VALA_DEPENDENCIES = \
+	host-bison \
+	host-flex \
+	host-libglib2
 # Yes, the autoconf script understands ':' as "xsltproc is not
 # available".
-HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
+HOST_VALA_CONF_ENV = \
+	ac_cv_path_XSLTPROC=: \
+	GI_GIRDIR="$(STAGING_DIR)/usr/share/gir-1.0"
 HOST_VALA_CONF_OPTS += --disable-valadoc
 
 # We wrap vala, valac and vapigen to point to the proper gir and vapi data dirs
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
