Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A31C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 08:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 852F28174F;
	Sun,  9 Jan 2022 08:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gcG7r9Yl85eQ; Sun,  9 Jan 2022 08:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBFBA81363;
	Sun,  9 Jan 2022 08:47:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B74F01BF3AD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A55B460B03
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5R4vRvuXa1Gw for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 08:47:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 231B260AD0
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 08:47:38 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id o20so2268228ill.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 00:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s045EqpVLpUNK/18n4VWWk8qdUMar4sVR6fgf5lzY3I=;
 b=ZBKhO7+mo5CsvBdACbpoTtU8mVNeCK+FwmvSZucaI7mGqWEGPSU0mD+RXZy4m7U9Ij
 3hKUXTCP4MVNq/WHLeXeZfv99MofeKF+xAPQ5i4kmq+C9G1HH2i2lUG9KcQwTKlY9xG7
 8MfR2E7YTrYTN7eUxM0NJt7wEAjRPKjPbnroazlP8bvELgkZjWlXfi1/rI+l5CYTiAEK
 SFUmKv3B6YomSJCLtNqMgIRJA3zV0rKFLt0xxIJPMOHyVmKLvApShQKU4o6Eo1Ti2rA6
 6HLmLDYoTu8s4f1mFHIzrVs00H3HnfMO5I+knUi71kzunHKRXgz84n9bhbvKhi6UbrmZ
 ALjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s045EqpVLpUNK/18n4VWWk8qdUMar4sVR6fgf5lzY3I=;
 b=ZUhief2oR70u2lsqo8s88qiqAWXZ4QPTg5dKcqkeip7ykDD+lfjzOpyUtZcBACwNbo
 Y4BtR2ynD9J6gu/8+G8Xihoew5jsBjIW0nHUZLNmht7KHNJuqUKsQiWTUAPYfYO76j4n
 lyO1I2cLDB59w16MLhgklieEBafFMXLfK98T+z8M3yAa3KKUgz1bQIWCh+WbEGZ2Mt+a
 zuQxaxfXXE7vNiTUJ6kbzApsalaiG19EVvgL6ikCAt/4y+Byudq+VHtRVstH2rcA92/0
 XUuhzTY0afLDWL6ZV0/1oV6ZBNtPyI8eTT8UZ3Q7TI2kjK8YPf/X9R2Z6gA9WS3QPO7L
 z0wQ==
X-Gm-Message-State: AOAM532xJpnR300tSZN4nm4DAyr4g27UHk+glvYSYCY7iiVvWH98BV8N
 FvMSj4BUwQyODJsnLDrdKW6Xjm8nSTs=
X-Google-Smtp-Source: ABdhPJwFCJUF9DTAIfEXnk7bLPZPj+C8ZSe8FcXTtdhz21cGXDu8MO+547dTZx1EHiMQtjNS13+OMw==
X-Received: by 2002:a05:6e02:15c5:: with SMTP id
 q5mr35462213ilu.218.1641718056996; 
 Sun, 09 Jan 2022 00:47:36 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id n2sm2533406ioc.0.2022.01.09.00.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 00:47:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 01:47:32 -0700
Message-Id: <20220109084732.2567404-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: enable -Z
 target-applies-to-host via env
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

This should be more reliable and fix the host == target bug when
doing indirect invocations using the cargo env.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47ae86bfae..b6cb65c4f0 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -27,6 +27,7 @@
 PKG_CARGO_ENV = \
 	CARGO_HOME=$(HOST_DIR)/share/cargo \
 	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
+	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
 	CARGO_TARGET_APPLIES_TO_HOST="false"
 
 ################################################################################
@@ -88,7 +89,6 @@ define $(2)_BUILD_CMDS
 			$$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
 			--manifest-path Cargo.toml \
 			--locked \
-			-Z target-applies-to-host \
 			$$($(2)_CARGO_BUILD_OPTS)
 endef
 else # ifeq ($(4),target)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
