Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21CBC54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 04:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A58605E0;
	Tue, 27 May 2025 04:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kRMwdqiz0Os; Tue, 27 May 2025 04:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8DBC605A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8DBC605A7;
	Tue, 27 May 2025 04:21:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9558C19D
 for <buildroot@buildroot.org>; Tue, 27 May 2025 04:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BE6440442
 for <buildroot@buildroot.org>; Tue, 27 May 2025 04:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_eDXSwddI9P for <buildroot@buildroot.org>;
 Tue, 27 May 2025 04:21:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=mscdex@mscdex.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C54054004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C54054004D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C54054004D
 for <buildroot@buildroot.org>; Tue, 27 May 2025 04:21:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a363d15c64so2020986f8f.3
 for <buildroot@buildroot.org>; Mon, 26 May 2025 21:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748319697; x=1748924497;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BMXZWaNLH2o2h6Ic+MKiiOEYoQ6iabyY6Hyy2mThSXc=;
 b=CHprIu34MtvX/J8eXU43pyEYBK+LwrON9RjWcOYs1Kl82Ai8jfllVIkFH3g9e56+S+
 rHAGHfSCNl+7xKfPqbLk8AIAzvIE4u0fNzhNE2cIJoHYRCUbokWJ/oSJQjWVOiUz+YlV
 cCMePDAmcUd/v/0jyCzEBbclSmB2posNr/+ZMxAvJMxoEIvay+7X9CZGHqFyKcu+RanR
 F7PxCIhuSn7fg3ffe26zkGEopq0VYSUm7ZLi8jcAf4kuLIfLI3c48kSxYpP9Kdu4tp1P
 J5oY+jYeNZGKuFE8R5KHahAlVSztzH00B+EFtOhCLmSpk/68BQL5rhuxkKTaOBTWhjoa
 CMaA==
X-Gm-Message-State: AOJu0YyxcMMOUccIsaUWSofsNizhZctji6fxbAUhzcixZ7exUzE8mS+s
 k+RdnPJtOyyEFxze1JhtnftM8gLyRYdu2qTpwzB7Xj9Dj6eTkccgD4A4OPpR4BAV0gH5T4ZeFPs
 fwlvrn2Ycevcg1Wo+Uk1XKGiGnzcSS0snUA5MeisNz9BBywI+MAAjBns=
X-Gm-Gg: ASbGnctKxec9IhsMfCAY86Q1TAQCV+21mEHojrxb7YNLXZ5maQkocQBfV4ESvcT8cYz
 ng+/OGPRn8wjQ6D1ihnNBjuh6FPLvCVNWD1qRfqJNG8ylPjIPe+GGyNPt3HAYrHEaiMZdLkDKrU
 fmnBrNVqB5p1Re0qXDOyeomAXJI4sKDeYr
X-Google-Smtp-Source: AGHT+IHjf1mHRDG5LlzyK/7ZGWveg6pKnNLhIIUt7LyPA28sQuFV2F4xjpahe6vbUqen91fwcpmsDgFeqCk+Mh2t3Yw=
X-Received: by 2002:a5d:5cc8:0:b0:3a4:cfbf:51a0 with SMTP id
 ffacd0b85a97d-3a4cfbf52bfmr6570822f8f.21.1748319696628; Mon, 26 May 2025
 21:21:36 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 27 May 2025 00:21:25 -0400
X-Gm-Features: AX0GCFsIzMOLcZXJh1-xJhIn31wyCdeIJCnHiVEQjbDLm1v2q1oJI0KJb5nN3lU
Message-ID: <CAPqAjCxGOApih6xj_6Nj-RUUsguzUjtLyp5qa6Zv4p9sw4NAWA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscdex.net; s=google; t=1748319697; x=1748924497; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BMXZWaNLH2o2h6Ic+MKiiOEYoQ6iabyY6Hyy2mThSXc=;
 b=HuAw/0TfuPpdqAMnl6d3lYjekVySfz80fjVdUhyyV0GhTrE0E9D+3viRDm1ew48xNM
 REV0Qvbw8Hlks+JeyOaoATmwSxatlGQI9zxwBbQcQA4vYtyafBP4S6QE9DfFvnsDSaeM
 wtHXvEn8LudPDmtC/yV/DkMNUYTs3UANKuESZxkZKZAcyfKMcMaxyK9w4b3jFq7Rx1mK
 ByPnHoueTf3z4ha+Rs19w8/aJA1cjJbFqCQtWYTiRWN6lM/l4IO08ta1Uz8pSocBlZbX
 pZpHwQkQMPrZtJZNgEd9ZD474/f8mUGZIPoIeCX28Psvs0fCVsEAxaX0gsMGckXDKOgZ
 CDIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=mscdex.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mscdex.net header.i=@mscdex.net header.a=rsa-sha256
 header.s=google header.b=HuAw/0Tf
Subject: [Buildroot] [PATCH 1/1] Makefile: include lifecycle scripts in
 build-time.log
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
From: mscdexdotexe via buildroot <buildroot@buildroot.org>
Reply-To: mscdexdotexe <mscdex@mscdex.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This gives a more complete picture when using build-time.log
to determine what is taking the most time.

Signed-off-by: Brian White <mscdex@mscdex.net>
---
 Makefile | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index c14023fd98..3291af90b7 100644
--- a/Makefile
+++ b/Makefile
@@ -587,10 +587,12 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
        @$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT)), \
                $(call MESSAGE,"Executing pre-build script $(s)"); \
+               $(call step_time,start,pre-build,$(s))$(sep) \
                $(EXTRA_ENV) $(s) \
                        $(TARGET_DIR) \
                        $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
-                       $(call
qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS))$(sep))
+                       $(call
qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS))$(sep) \
+               $(call step_time,end,pre-build,$(s))$(sep))

 .PHONY: world
 world: target-post-image
@@ -807,10 +809,12 @@ endif # merged /usr

        $(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
                @$(call MESSAGE,"Executing post-build script $(s)")$(sep) \
+               @$(call step_time,start,post-build,$(s))$(sep) \
                $(Q)$(EXTRA_ENV) $(s) \
                        $(TARGET_DIR) \
                        $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
-                       $(call
qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS))$(sep))
+                       $(call
qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS))$(sep) \
+               @$(call step_time,end,post-build,$(s))$(sep))

        touch $(TARGET_DIR)/usr

@@ -828,10 +832,12 @@ target-post-image: $(TARGETS_ROOTFS)
target-finalize staging-finalize
        $(Q)mkdir -p $(BINARIES_DIR)
        @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
                $(call MESSAGE,"Executing post-image script $(s)"); \
+               $(call step_time,start,post-image,$(s))$(sep) \
                $(EXTRA_ENV) $(s) \
                        $(BINARIES_DIR) \
                        $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
-                       $(call
qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS))$(sep))
+                       $(call
qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS))$(sep) \
+               $(call step_time,end,post-image,$(s))$(sep))

 .PHONY: source
 source: $(foreach p,$(PACKAGES),$(p)-all-source)
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
