Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B07C001DF
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 22:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D12F611CD;
	Tue, 15 Aug 2023 22:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D12F611CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRRW6VL7yEM8; Tue, 15 Aug 2023 22:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 801D6611C8;
	Tue, 15 Aug 2023 22:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 801D6611C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF7371BF47F
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 22:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 979474149B
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 22:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 979474149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODuZXgBV60OM for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 22:28:52 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F20D4149A
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 22:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F20D4149A
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-686f94328a4so3988012b3a.0
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692138531; x=1692743331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JNWxRa9W/L3a7H7yrWFlutHg25cNFEepUVkxKOXxKTE=;
 b=jJjjHsmseI+OposcGS9uTLsUoonadAveYNXSEXKcu/vvOhqmaspIqK0uOdB9CEHaNk
 T7Cw7iVOm3yRX1lglyuYU3u5iyCyhGFt/OYfGKmsMVWPJmgR4eDcZ8sAk892P61Tve3x
 ulER/rRsNEwisBoKpN5kpH+On9IEVq56ExwGBBFGav51Of8hD0GUddh0GfbI8fz3mS0L
 E7dW2g+mr4sPSfkDsoh+PpBLfrypjuFeJfh5igtuvkEy3XFU5knLup201bCSFpBJzi8i
 yINQctSkrDmvdVMVoxtwof3MeP3IJtUPDSD2rB82FDFAG2om3ChbC4sq+dKnEFQGzhGm
 jDNQ==
X-Gm-Message-State: AOJu0YyDE/ziIqHVSSp/PLtmvnjhxfCkYY1RjHsx3REUrdAZQ6suEP40
 uYfrgmHjRsni5JHJmjNohyoXT9r/pBFpI8hmMLA=
X-Google-Smtp-Source: AGHT+IFSnO7SJsmQ74AsLNhO0TWnAeoMkLBPPJE5VwEY/WXkZQhsZBSBhrLzNlBDJkLy9IE1UUsSqA==
X-Received: by 2002:a05:6a00:2e87:b0:666:c1ae:3b87 with SMTP id
 fd7-20020a056a002e8700b00666c1ae3b87mr4770004pfb.12.1692138531042; 
 Tue, 15 Aug 2023 15:28:51 -0700 (PDT)
Received: from fedora.. ([174.27.153.162]) by smtp.gmail.com with ESMTPSA id
 q24-20020a62e118000000b006873aa079aasm10177758pfh.171.2023.08.15.15.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:28:50 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 16:28:44 -0600
Message-ID: <20230815222847.2460201-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815222847.2460201-1-adam.duskett@amarulasolutions.com>
References: <20230815222847.2460201-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692138531; x=1692743331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JNWxRa9W/L3a7H7yrWFlutHg25cNFEepUVkxKOXxKTE=;
 b=k1udRoQYU3mfmdYinbG3T0ewVQrrSbywzzUlr7zs9gh2axWT1AVgnrDqNc3022pyb4
 FNmorpBn5qXZiHZ9BAVX9iCy9rdpL7lqgpdhdEVhyzyBcSniXoa6bxrsibroFW57Y+XS
 pPeUo+D6iLrfyjZuV2Ac9tWg5dBxXb7PMDum0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=k1udRoQY
Subject: [Buildroot] [PATCH v2] package/depot-tools: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Chromium and Chromium OS use a package of scripts called
depot_tools to manage checkouts and code reviews. This package
also includes the gclient utility.

gclient is a Python script to manage a workspace of modular dependencies that
are each checked out independently from different subversion or git
repositories. Features include:

  - Dependencies can be specified on a per-OS basis.
  - Dependencies can be specified relative to their parent dependency.
  - Variables can be used to abstract concepts.
  - Hooks can be specified to be run after a checkout.
  - .gclient and DEPS are Python scripts. You can hack in easily or add
     additional configuration data.

.gclient file: It's the primary file. It is, in fact, a Python script. It
specifies the following variables:

  - solutions: an array of dictionaries specifying the projects that will be
               fetched.
  - hooks: additional hooks to be run when this meta checkout is synced.
  - target_os: an optional array of (target) operating systems to fetch
               OS-specific dependencies for.
  - cache_dir: Primarily for bots, multiple working sets use a single git
               cache.

gclient is necessary for checking out the flutter-engine source code, as the
release tarballs provided on the flutter-engine github are in no state to
compile. Google expects the use of gclient to download a source directory
structure suitable to build the Flutter engine.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
V1 -> V2:
  - Remove Config.in.host
  - Remove DEPOT_TOOLS_GCLIENT helper wrapper as it is unused.

 DEVELOPERS                           |  3 +++
 package/depot-tools/depot-tools.hash |  3 +++
 package/depot-tools/depot-tools.mk   | 24 ++++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/depot-tools/depot-tools.hash
 create mode 100644 package/depot-tools/depot-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 69ab723c0c..1769f4db61 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -29,6 +29,9 @@
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/firewalld/
 
+N:	Adam Duskett <adam.duskett@amarulasolutions.com>
+F:	package/depot-tools/
+
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
 
diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
new file mode 100644
index 0000000000..2109096901
--- /dev/null
+++ b/package/depot-tools/depot-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8e0bccdd6b1231f58d5453dc14a5e1d195295ac8d466dec34961e951e946b50b  depot-tools-4e87f5bfe244e903f712408ea68dc3c3a6fe2d00-br1.tar.gz
+sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
new file mode 100644
index 0000000000..84402e8965
--- /dev/null
+++ b/package/depot-tools/depot-tools.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# depot-tools
+#
+################################################################################
+
+DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
+DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
+DEPOT_TOOLS_SITE_METHOD = git
+DEPOT_TOOLS_LICENSE = BSD-3-Clause
+DEPOT_TOOLS_LICENSE_FILES = LICENSE
+DEPOT_TOOLS_CPE_ID_VENDOR = google
+HOST_DEPOT_TOOLS_DEPENDENCIES = \
+	host-python3 \
+	host-python-httplib2 \
+	host-python-pyparsing \
+	host-python-six
+
+define HOST_DEPOT_TOOLS_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/share/depot_tools
+	cp -dprf $(@D)/* $(HOST_DIR)/share/depot_tools/
+endef
+
+$(eval $(host-generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
