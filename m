Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F484C001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 11:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A156761160;
	Wed,  2 Aug 2023 11:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A156761160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8uRo70T1ZfZ; Wed,  2 Aug 2023 11:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2AFF61148;
	Wed,  2 Aug 2023 11:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2AFF61148
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E77C81BF343
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 968DF405A1
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 968DF405A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zR76cQgAOr6U for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 11:15:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E004D40569
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 11:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E004D40569
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-31781e15a0cso5749692f8f.3
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 04:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690974914; x=1691579714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+r3CQDFhZGOW9cMwIJNYSgh4/+yMReaqaXheZQoHlw=;
 b=JdmDh+VftXf+GhFA8Y4dhdKsdCSj6nWD/yOg9QRbLospzizG13S/N0ZK0EQUbb736/
 /CyyxuBME974QKsAnSHMdh2ouMA2gch92WBDOutUTJCkg/0+Px/Hlbqvcm948n1pMWU9
 hbLDZJO6K9OSi1gViD4uK67Ix7FlQHKvKEGy+WjKoOlcOkXNmPYPg6uk8lDABwFtOaSj
 EsyVSOPXAj+xXnCe40QvaJSSwMOhkMQs+CakpQpuE+HoGWrKQBnDOYHvq9H4Ysd6tXj/
 EOwc2qiYOE/8ZY9F+exPNYka2pE9K9aWln5p4mgLmCWbns4yuQqKA3z5Cwj0czIRO+vW
 LOyQ==
X-Gm-Message-State: ABy/qLa7YhrxNENLYgEHUh7tL894apll/qcFXMBI7hjEvLHIIP+C+p7e
 85gYXErVjbjWu4ZQHBNhR9IVhCa8M5aMLAbKP3w=
X-Google-Smtp-Source: APBJJlH9eMD/ExyRfktFvnz7yUX2uDnpHrYlBfuqBmL6R/Q5hV8MZufXrCWRUyyJ3ne/i+V3T0nLbQ==
X-Received: by 2002:a05:6000:12d2:b0:317:4bdc:6f34 with SMTP id
 l18-20020a05600012d200b003174bdc6f34mr4288519wrx.64.1690974913634; 
 Wed, 02 Aug 2023 04:15:13 -0700 (PDT)
Received: from KORLIN44614.home ([2a02:a03f:eb68:2f00:d6c7:beba:8b4a:76a7])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056000104400b003143b14848dsm18653128wrx.102.2023.08.02.04.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 04:15:13 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 13:14:47 +0200
Message-Id: <20230802111447.41714-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802111447.41714-1-thomas@devoogdt.com>
References: <20230516082155.22014-1-thomas@devoogdt.com>
 <20230802111447.41714-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 4/4] pkg-cmake: make ninja the default for
 all packages
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
 Samuel Martin <s.martin49@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
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
v6: rebase
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
