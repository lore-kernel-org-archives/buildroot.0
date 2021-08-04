Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB16BC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:57:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D7160F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2D7160F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4AE40403;
	Wed,  4 Aug 2021 21:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJfNNtCJgyvY; Wed,  4 Aug 2021 21:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6357B403E3;
	Wed,  4 Aug 2021 21:57:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 684241BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56A72400F8
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:57:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-9XpwcaPMUB for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:57:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD27F400D9
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:57:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id u15so2026502wmj.1
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XVAtbPA1+nHEXcLVAUA7RUX1XmLJYYm4mTRn2QY3l7o=;
 b=up6BYgWM4X3SwO/1hRpad+WrAIqTD+tqq8dNabT4VATMvQ6Ra8zdk5MYfX4hbQ4lvP
 mCX2peYEh2Fx1vR/RuLIvdNqUeQ7UtakIiAZANGf6mKq7wRypSUn1PNa1Cwb0ywKHmxh
 AwejCYZ6GBc2KUh9qr9H0z/L3AlCxEl1Lh9xKMA82pl9IaWOR4o0eBElPnJq7Bhz/RDD
 HAJtKfgM9R3Hi+R3c163w7v4Q7F1amL68sRWyeGtWHxhYcgxnkBqLZLDcTpX8qjrKDPs
 LmRtwO3Yw3PL9Mlqdth1CbsRt1R/BUxX5yaZNCBEn8d2pMcsWCDJg8mUUVWTHQmq86CI
 O0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XVAtbPA1+nHEXcLVAUA7RUX1XmLJYYm4mTRn2QY3l7o=;
 b=HFXGbBnWQx3kqJw3INcYZHUIqoniux+Vp5cXJfwcY/x9Yx8hU3FTDn5LxRnNtwBBn2
 s3bb0yLw0wgb4vCYSIrZZk2808RCyglKtKrfHd7WeeMAh7XrljsJr4unn3/9eCYB7pl7
 f6/y6oAfNnVRjh0bBUrMDT/dKeEWsVLIzwToQPBpkb6Z+YPYTpnVbZ4IburEJyZzW9Mq
 3wYqhwAPckW6PKUXXEzQMc1tGTTjbbCkkxszAUzHcA80p5Eey+oc9ExxKgWrbM5HeQVv
 cb+lzTYS83fawqFcRrOAeEUtypEoqFb7mU6ebngP0r8O/fI4QNV0vMuUKGEYhPkR3U/z
 9h5g==
X-Gm-Message-State: AOAM5328bc5DxcVyxBmLyZtbzt1dgQESLgBN3Dr0X4Vt+jCVSVSVJ5jQ
 oo/Sv3mGLqO1gVOtg6M6oq5v7nCDoB3+tw==
X-Google-Smtp-Source: ABdhPJz/cv8wyBzsucyJLSnVZXvENG+jVDqI7yM6xBkT4Up9WoQKfB1j3bjN0+siOoCpSdCOAj0sPA==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr1560651wme.31.1628114221048;
 Wed, 04 Aug 2021 14:57:01 -0700 (PDT)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id h8sm7049154wmb.35.2021.08.04.14.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 14:57:00 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 23:56:50 +0200
Message-Id: <20210804215652.14775-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/2] package/zstd: rework build and install
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Move PREFIX=/usr to ZSTD_OPTS, even though it is only used by
libzstd.pc for now it should be available in every step.

Create libzstd.pc in the build step instead of triggering a
lazy build during installation when it is missing.

Attach '-release' to the targets, since the default is to
build lib-release and zstd-release.

Signed-off-by: Norbert Lange <nolange79@gmail.com>

---
v4->v5:
*   rebase, remove the parts that are already upstream
*   improve commit message
*   try to keep changes minimal
v3->v4:
*   revert to previous scheme of BR2_TOOLCHAIN_HAS_THREADS
    fixing build options for both static and shared libs.
v2->v3:
*   use normal = for assignment
v1->v2:
*   rebased against upstream/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/zstd/zstd.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 5a96c11309..d7a0320df4 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -12,6 +12,7 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
 ZSTD_CPE_ID_VENDOR = facebook
 ZSTD_CPE_ID_PRODUCT = zstandard
 
+ZSTD_OPTS += PREFIX=/usr
 ZSTD_OPTS += ZSTD_LEGACY_SUPPORT=0
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ZSTD_DEPENDENCIES += zlib
@@ -60,12 +61,13 @@ else
 ZSTD_OPTS += HAVE_THREAD=0
 ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
 endif
+ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))
 
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
+		-C $(@D)/lib $(ZSTD_BUILD_LIBS) libzstd.pc
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D) zstd
+		-C $(@D) zstd-release
 endef
 
 define ZSTD_INSTALL_STAGING_CMDS
@@ -76,9 +78,9 @@ endef
 
 define ZSTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
+		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
+		DESTDIR=$(TARGET_DIR) -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
 endef
 
 HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
