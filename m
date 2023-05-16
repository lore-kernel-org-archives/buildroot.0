Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5135EC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 08:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C73384195C;
	Tue, 16 May 2023 08:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C73384195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ii_IBf8-QZHV; Tue, 16 May 2023 08:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 869D841946;
	Tue, 16 May 2023 08:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 869D841946
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE0901BF2CF
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B803940588
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B803940588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrxTudzMEjWE for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 08:22:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 070AE4018F
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 070AE4018F
 for <buildroot@buildroot.org>; Tue, 16 May 2023 08:22:27 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-96598a7c5e0so2238541566b.3
 for <buildroot@buildroot.org>; Tue, 16 May 2023 01:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684225346; x=1686817346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PKuLHry58C+6cQvDwd5UGCV3qmLJ6UigvnItoavJ0o=;
 b=ZcBjA+qTM+kQEcrVI/JmfLhAkN4NpDdwrYoUfREp0/CPqD25V16aMB0hfQgMZvwEYO
 jhv6qvXAwAtvewp0HRTXyK+pCpOP4k7yROZ6zQVeMJKgnVmkfNbmQu6hx03SXa2b+Q6p
 scFRDhEPveS6nNN7tNpHuMHVJcNHNMEoe6piVXnTjAO9QGsg9G5pKs4RwbgWpQnyteIo
 am1YpIaw6xJRro2Lkq7310Gt6z0hhi4+q4A0RdXYuccNBon7ulhXdIodgYQu15aYuyJH
 0+TcqTTxGXFZ/4Kue2rSwKzx1sH//bD7BddTfZUmfmoAoOnFN/uP9yqYh/A049yezQqa
 B8TA==
X-Gm-Message-State: AC+VfDw0/C37RRgR6F/151pYCVOZzVbQGE/kGeXwvNvTX1r00QuJ/xqK
 AOs2dgPCPFhRyFkGs7X3KjG5NH7nNxipnhI5
X-Google-Smtp-Source: ACHHUZ6vg2AARHJJ+k5HUH36Wjappc91B2PHyWv8yDOZgsrrzROtUoTAPvsaZ+RyxK8vscTYO5lWrQ==
X-Received: by 2002:a17:906:7304:b0:921:da99:f39c with SMTP id
 di4-20020a170906730400b00921da99f39cmr40277163ejc.12.1684225345712; 
 Tue, 16 May 2023 01:22:25 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:5cb4:21ec:50e8:94f8])
 by smtp.gmail.com with ESMTPSA id
 lt14-20020a170906fa8e00b0094efdfe60dcsm10422528ejb.206.2023.05.16.01.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:22:25 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 10:21:55 +0200
Message-Id: <20230516082155.22014-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516082155.22014-1-thomas@devoogdt.com>
References: <20230516082155.22014-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 4/4] [optional patch] pkg-cmake: make ninja
 the default for all packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, John Keeping <john@metanate.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Use ninja as the default generator.
A fun fact is that we of course have to disable ninja when building ninja.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v5: add this optional commit
---
 package/ninja/ninja.mk | 1 +
 package/pkg-cmake.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index b7bc1a4f1c..85dd2e05aa 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -9,6 +9,7 @@ NINJA_VERSION = $(NINJA_VERSION_MAJOR).g95dee.kitware.jobserver-1
 NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
+NINJA_CMAKE_NINJA = NO
 
 define HOST_NINJA_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 36ab88d3a1..dab87c81f4 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -52,7 +52,7 @@ endif
 define inner-cmake-package
 
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
-
+$(3)_CMAKE_NINJA ?= YES
 
 ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
