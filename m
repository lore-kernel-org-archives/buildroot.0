Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB536C4345F
	for <buildroot@archiver.kernel.org>; Sun, 21 Apr 2024 13:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 806A0605C3;
	Sun, 21 Apr 2024 13:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1Z-FnYzqCoD; Sun, 21 Apr 2024 13:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96A46605C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96A46605C4;
	Sun, 21 Apr 2024 13:11:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D65C11BF3D8
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 13:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC17E605C4
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 13:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qpm-2gFzCD3 for <buildroot@lists.busybox.net>;
 Sun, 21 Apr 2024 13:11:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E387605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E387605C3
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E387605C3
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 13:11:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-416a8ec0239so19130355e9.0
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 06:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713705088; x=1714309888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CbUCzRopC9gb60GqgoEzroYRAdkkTVXxUP9p3is5Pr8=;
 b=rFRyBfZG26YUUwZuCK0zrciZ6Z8J2igrg9radwCfWRqOckl7LPWwvwjqFG/MvS75IB
 tvw/tgHqCBU1iFQuH/KubI6/TpxKWKU+kzI6gqVGYw6awigcQneWoo35IFFFa/3Y7udj
 nrkgR4zmy0p0czk8eXVrnZSP7xw6QrjXcAHVUCzqQkfsCuNQ5aJYEs6yp/4TY6OnNtI1
 UUa3mgQrKKGtNQ0XlyKMhtdddpaHsHM19eaBZMuPGya5SjM7KfyptdwwvDHQII7l6FYZ
 DlTH0MVqdnTtwiOsecurvq/KWWfdy5xVQST2ceeCsoRkFBPCukvrG7AA69yPwoiovJOr
 /Yiw==
X-Gm-Message-State: AOJu0YxkBeTXJ4CbUhtMsjSY3od3NpA4zLofHej3kj0kEzzoLHha9LQB
 1UhRU6TCKUPHbOj7pWswrkR7xWcATprFIsElytk1QZA/VHgFkHCd9LSh8A==
X-Google-Smtp-Source: AGHT+IHMvcuzshLq26FIAsWxAbmQW4oF7sRbS5rMlookjSHjDSTgw5jo55WlmIcNa8Q8zUvNraU64A==
X-Received: by 2002:a05:600c:524f:b0:415:ff48:59fc with SMTP id
 fc15-20020a05600c524f00b00415ff4859fcmr7868356wmb.8.1713705087620; 
 Sun, 21 Apr 2024 06:11:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 v14-20020a5d4a4e000000b0034625392416sm9302849wrs.104.2024.04.21.06.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 06:11:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Apr 2024 15:10:29 +0200
Message-ID: <20240421131029.18829-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713705088; x=1714309888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CbUCzRopC9gb60GqgoEzroYRAdkkTVXxUP9p3is5Pr8=;
 b=UQJaE0n/2Va/45syEkw2Xe8Q4RAhKvd8b6ou4JRlFcd2tcfZpBd55CkpwTb+H+/JiO
 f9CVMUa3jhOLFAPK+FlBrlDMa53pa8zFlE1Zg6slz8OSHGX64+Krfw60Rkibdsf8BnCC
 L1eOMIwX2CTTjGcR+8ezEHYmH7xkX7+khiN1UpLJAZiKVdTHrCzHfa9BJfEa0ckwCpPm
 6FCPQgtSYSWGTN6KAEjxnpxUb8kDiBp2DycQDj3tOSGFhmP5vWKMUzEnsVoe7LmZ0QQE
 dsdRNcLmpYtsoJ2zAaDduMj8h1Hn+FSbHh9mSYuOQVOWKdsMOTJr51Wn2SwMjLQ41nYq
 uVpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UQJaE0n/
Subject: [Buildroot] [PATCH 1/1] package/checksec: bump to version 2.7.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/slimm609/checksec.sh/releases/tag/2.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/checksec/checksec.hash | 2 +-
 package/checksec/checksec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
index a29866ba07..a53d39caca 100644
--- a/package/checksec/checksec.hash
+++ b/package/checksec/checksec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39d4158f96bdc7533ad6595703375c0046951fe4f6367b831ef92d9c66c1a307  checksec-2.6.0.tar.gz
+sha256  0f8b37741bec40756da6801cf243405f4adfc5534242c9d0f3095b566b6b176a  checksec-2.7.0.tar.gz
 sha256  55154b4be6dfcb3ff29d1e3648d0d07b3943a5fcc3af7c2e0e799b074734f722  LICENSE.txt
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
index ed9846ac2d..431640fe8e 100644
--- a/package/checksec/checksec.mk
+++ b/package/checksec/checksec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKSEC_VERSION = 2.6.0
+CHECKSEC_VERSION = 2.7.0
 CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
 CHECKSEC_LICENSE = BSD-3-Clause
 CHECKSEC_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
