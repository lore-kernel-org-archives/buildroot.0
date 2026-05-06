Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A39CD343B
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 15:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDBE740E8B;
	Wed,  6 May 2026 15:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bc17hJk7ajoR; Wed,  6 May 2026 15:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 069D740E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778081285;
	bh=PHRvD4STRGor6P70N9QxVIC68aagCouysgO2Z8Pd3yE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oNKh6x+hzTg1Uuh62F/5VcqSbeFDGw7LkCicMwly7AtC0xFbIfaIIZsCZGvrDFfQE
	 Vqu3BgSX808y8IvEVLClkGGUlp+OnlbKxUQa0uh44XRF8NSd0c8cp5kpR37MDTKkAy
	 w8t7gF08ex57bAM34tE/BrSGDjRbIYOYgG9IxKOBZKMVbcLlWnlpxH7+JMbFz+LUOy
	 cqeX8kEK3rijyfDxSCOy3Dt5ONHvA/sfGZeFV99rWZUqnOxVtvEJLvzJfdFIR5eWAj
	 208bgbDGoXbMq/DrvrjRb0LgW2X/G7ZjX1k0X6Mn6oo/lzPQcT4yjvNUvoCeoMPh3F
	 9iDnEYJpJA9vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 069D740E96;
	Wed,  6 May 2026 15:28:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99D6B11B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 15:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97FD460E67
 for <buildroot@buildroot.org>; Wed,  6 May 2026 15:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfRj2g1xAzuI for <buildroot@buildroot.org>;
 Wed,  6 May 2026 15:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.x.weber@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AEF960E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AEF960E60
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AEF960E60
 for <buildroot@buildroot.org>; Wed,  6 May 2026 15:28:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso51052935e9.0
 for <buildroot@buildroot.org>; Wed, 06 May 2026 08:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778081280; x=1778686080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQX/Tthd5yLz2daw09R6X33kL+QmrRNOMT8irq/pNhE=;
 b=aUkcBjuUnx84ZtSrEAiRF8fAYUV1p9y+b6mps4fLsI8BI91aAmAMbgSsnhhV3k80e8
 +C2hJzT9CDCTZ20YB1HJyhOAJ+F0W3TzD6pyB4QxvLUhRaE52ITIbc8tcdX+72wizgVc
 RVh7gNtlExrR0nJ5Dah+975Hb1lcen6LVBsltqF59M48SP5hAj6Vff4LU23fi8rafU+j
 5C5itfd2/UAjb60f6HBVJYMYg1ao69k1Azao37Pk22HZDzXsfwcYjrVGZKUAgfbTXSkB
 yPIcZLcTS97E/qaa+lKb69r0x57GiMjEx3Vnt1TbEOa7oX4AWTJqVuf8MBk+fbFIgiGh
 8GMg==
X-Gm-Message-State: AOJu0YwIdEn40j1QALAj1Aors9VIagAh0kb9ZSox1h+DHTDMSVYH3xFG
 NEa7cDWmK7A7VB69FaIaSI/arCZV6LO3vOjc3OUqood0XAmfEr+h6lan6alpyQ==
X-Gm-Gg: AeBDieuAiWq9zRmIKNiaSq4LZDzvDIGE0BjG+RLSc6uhdeHwmUerB4iIVeR9yMvF6aU
 QtSbgcB1Hgv07Dbo0HqZn/gPYMgQVTrqerQ3v+ybIXOdEqN2Mo+CUnPocgvkAMsYLpNoyDHzySe
 Dc9iZilKT4OXkhtGvmKLSbLgx62O/epdD52HyCsrbWVyQjufvTQvv05INo64welMyV4JLAn9Mm9
 Quc5CZgtdgk4sswLmPzYUmLfyT+dpLHu1PayTmzSHNzUUnzmC0m21QBLmU05LtafxphWV7TmDgt
 JJLemR1Cx9AMCA67LxYvYt7mbESQ5Ar2hBTILmlaaZmJD0J3NpkXHh+UyrxI4zoYk7xYs2EzLvH
 et8yy7ylhoDVuAVX7ZFU+hm8RV7Y2ixgpNct2RC/0EoQTm7KNVr5uW++5Pfi4O9sJnWKvP3Wx77
 ItywMOobDnfU993iwR1YXzgsmGt4Bh27te64TK1SmzCseEwJ6TzLRa2douuAu9tkx5HfYTKwdcV
 s7bYF2vE3XoK+5FrN4nsBNsupLWK5U=
X-Received: by 2002:a05:600c:c4a3:b0:489:ad:7b5b with SMTP id
 5b1f17b1804b1-48e51f45d33mr66666855e9.24.1778081280374; 
 Wed, 06 May 2026 08:28:00 -0700 (PDT)
Received: from LA-DE-0220.emt.local
 (aftr-185-17-204-104.dynamic.mnet-online.de. [185.17.204.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e5390f854sm52779845e9.14.2026.05.06.08.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 08:28:00 -0700 (PDT)
From: Thomas Weber <thomas.x.weber@gmail.com>
X-Google-Original-From: Thomas Weber <thomas.weber@corscience.com>
To: buildroot@buildroot.org
Cc: Thomas Weber <thomas.weber@corscience.com>
Date: Wed,  6 May 2026 17:27:55 +0200
Message-Id: <20260506152755.399373-1-thomas.weber@corscience.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778081280; x=1778686080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KQX/Tthd5yLz2daw09R6X33kL+QmrRNOMT8irq/pNhE=;
 b=QusXGAAiF6IY7SfozlXk5zzWuUeU+9U2orcV8z5n+9ctoAEyd96Lu5SciT4TJSEZ7i
 e2wMrz066BBR7IIfyoOxXutYMPxkRR3L8UNbDwQd8rhOmnqhGCCMo7zW3rrU5D0Qqgrh
 Jb6bsSaxNVPWLfn5cJpnCsRXtwqAIsqC+UhJZH7RL4DvF51v72Am52PszkBIaugAYVha
 ruxQNYjbjB8va7K2yJk5TOxvDBXhMmQzTtWYYRE04nSp4+tn479cLlxC54kjvUS3icGm
 MxKkpZFjD338N/jg1ystaGPUuRHQSh6m6xjwXMPAB6GjT+YV9A0JuKvbD49DHfwEqfQW
 6qHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QusXGAAi
Subject: [Buildroot] [PATCH 1/1] sdmon: new package
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

sdmon reads out the health data of some industrial grade SD cards.

Signed-off-by: Thomas Weber <thomas.weber@corscience.com>
---
 package/Config.in        |  1 +
 package/sdmon/Config.in  | 10 ++++++++++
 package/sdmon/sdmon.hash |  2 ++
 package/sdmon/sdmon.mk   | 22 ++++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/sdmon/Config.in
 create mode 100644 package/sdmon/sdmon.hash
 create mode 100644 package/sdmon/sdmon.mk

diff --git a/package/Config.in b/package/Config.in
index 9cae377fb5..9f27f62680 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -240,6 +240,7 @@ menu "Filesystem and flash utilities"
 	source "package/nfs-utils/Config.in"
 	source "package/nilfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
+	source "package/sdmon/Config.in"
 	source "package/sp-oops-extract/Config.in"
 	source "package/squashfs/Config.in"
 	source "package/sshfs/Config.in"
diff --git a/package/sdmon/Config.in b/package/sdmon/Config.in
new file mode 100644
index 0000000000..121063a1d1
--- /dev/null
+++ b/package/sdmon/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SDMON
+	bool "sdmon"
+	help
+	  sdmon reads out the health data of some industrial grade SD Cards.
+	  sdmon uses CMD56 of the SD card specification.
+	  The output of the program is JSON so that it can be parsed easier in
+	  applications using sdmon
+
+	  https://www.ogi-it.com/portfolio/sdmon/
+
diff --git a/package/sdmon/sdmon.hash b/package/sdmon/sdmon.hash
new file mode 100644
index 0000000000..7f551e3449
--- /dev/null
+++ b/package/sdmon/sdmon.hash
@@ -0,0 +1,2 @@
+sha256  641c3d0cfa3efa23bb7deecaaef1271916065cd0a20d6f63594c7ad6b37fa3ca  v0.9.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sdmon/sdmon.mk b/package/sdmon/sdmon.mk
new file mode 100644
index 0000000000..2baf70f4b0
--- /dev/null
+++ b/package/sdmon/sdmon.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# sdmon
+#
+################################################################################
+
+SDMON_VERSION = 0.9.0
+SDMON_SOURCE = v$(SDMON_VERSION).tar.gz
+SDMON_SITE = https://github.com/Ognian/sdmon/archive/refs/tags
+SDMON_LICENSE = GPL-2.0
+SDMON_LICENSE_FILES = LICENSE
+
+define SDMON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS='$(TARGET_CFLAGS) -DVERSION=\"$(SDMON_VERSION)\"' -C $(@D)/src
+endef
+
+define SDMON_INSTALL_TARGET_CMDS
+	$(info Installing sdmon $(SDMON_VERSION))
+	$(INSTALL) -D -m 0755 $(@D)/src/sdmon $(TARGET_DIR)/usr/bin/sdmon
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
