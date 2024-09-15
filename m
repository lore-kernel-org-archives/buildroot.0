Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84057C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 13:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EA1F80C06;
	Sun, 15 Sep 2024 13:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmuOyVSMpCB0; Sun, 15 Sep 2024 13:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A58B80C1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A58B80C1F;
	Sun, 15 Sep 2024 13:22:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CD831BF283
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 13:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ACC840386
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 13:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBf0fiU199F4 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 13:21:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=hugo.cornelis@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92B544035B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92B544035B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92B544035B
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 13:21:56 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cbaf9bfdbso19018485e9.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726406514; x=1727011314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z16P0t4KjyMmkyqtVhcnO6/MBTfekLI0gWknQ/lrYSw=;
 b=uZRQlmiFdXX6muB4PbdDwEhG9MfYZzBP/3j9ejovUIKa28igEtM+uJ8n+UKLJM+QHZ
 O6Uf+sszguYD5jTuEN+Emsoy9Sbp+ZImaQWkWB2J2C0gPXl89ky2cOQJhby7D0SXbaCg
 uXIAl6/mKts/UhtL0jQjqGmeWrmwFuMi1Fbq3ala9FPBhiYuOV+8yAMEPxZwuDGSEFXg
 Zw42R0gQFF1R9cLBfsVkLnCW8l4gxcsmwDxZZjDWPb89iAu5FdZHS+12OpMDz2EfYreP
 BN3l4sdaNQVd0GtmxdBmfYUgsUBUIQ5KDM+E6dRQXTawn+lF3Znk777BDCxfEs6e/56M
 riBQ==
X-Gm-Message-State: AOJu0YyrUCrXLhh8PWkVI2DYQLRP1+1kyvUQBG2lIsRL6+6tl1PvMW52
 RdrrK9uKOQMKsZHepno7V9APp5IqHMTMiH5WR41IR39AUdwwlxGMBVODDTESUrdZeJ4D1weRrbs
 4
X-Google-Smtp-Source: AGHT+IFnGtK8LWGWgj9lC71fcQmsJh4IIyFrO4MCYyJg+9ZE3LCLDWxOwJ+hftJMumVuLHAUKB4yzQ==
X-Received: by 2002:adf:ec0c:0:b0:375:133e:27f3 with SMTP id
 ffacd0b85a97d-378d61711d5mr4890503f8f.0.1726406514259; 
 Sun, 15 Sep 2024 06:21:54 -0700 (PDT)
Received: from hugo-IdeaPad-3-15ALC6.home (roof.metalab.wien.funkfeuer.at.
 [78.41.112.119]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e72e49d5sm4703562f8f.17.2024.09.15.06.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 06:21:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 15:19:34 +0200
Message-Id: <20240915131934.1636336-1-hugo.cornelis@essensium.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1726406514; x=1727011314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z16P0t4KjyMmkyqtVhcnO6/MBTfekLI0gWknQ/lrYSw=;
 b=gswbpLLjJOEiZ0hv2mE2CdsfiWO/JR0EGXqFe5NXZuWJ17H5xcMyET3aEr/NJ2EFGh
 d0FHZDYh5sfHuBgIpRvbFpcVlLpWbDvxieEhXau2flfW7KGQLMQSA4doXVVQIySiaBwS
 0H7UI7RbBsbsKDPBQse1IKDGSByixi4ZelxGwovVniwxoHpyZCE3BLx290qpJQSJtSk7
 5JcRUQEUSeXaGoyMrQaA5FCj17vpmL8LmdgU4TzCVzE7QHGh75bs5a7zA51rPpnmZsuO
 14brsercmQmnPrZ6GZLDtmf8qLgqD4Fr4XND1cpOyyY2O+9FCJi89G30e7DVPFzn7DwL
 7wjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=gswbpLLj
Subject: [Buildroot] [PATCH 1/1] package/ncurses: put headers in the common
 include directory.
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
From: Hugo Cornelis via buildroot <buildroot@buildroot.org>
Reply-To: Hugo Cornelis <hugo.cornelis@essensium.com>
Cc: hugo.cornelis@essensium.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When wide char is enabled in ncurses, packages such as procps-ng,
expect ncurses.h in a 'cursesw' subdirectory.  We have to disable
ncurses overwriting header files in the regular directory.

This fixes several builds running on the autobuilders (see below for a
few examples) but not all of them.  For examples this does not solve
the similar but not the same build problem:
http://autobuild.buildroot.org/results/e7665f43b97c6f90a7a8ce83eb16cfc364c3fc1a/

Fixes:
  - http://autobuild.buildroot.org/results/72d8bf3e618ae7797f3311fbbdbd90d77dfed4ad/
  - http://autobuild.buildroot.org/results/809dac9945e24c7e0bb6cb37c38cb258b41b3276/
  - http://autobuild.buildroot.org/results/12b348238bd3ef8116ac48a35d0a9d18dad38f04/
  - http://autobuild.buildroot.org/results/f86546cc0934f44e0d1851a932d64d2d29790f17/
  - http://autobuild.buildroot.org/results/93ca9899542d4ef31f3609219e09ce1db8ba7cad/
  - http://autobuild.buildroot.org/results/901e5a5e394d6e0b67bff15946ece9d66398b73d/
  - http://autobuild.buildroot.org/results/10c23c9f5d79dcb8a68551a15009e9d1b3be1fff/
  - http://autobuild.buildroot.org/results/38e8aeb5469314f31c78506f62a714f57ff030d9/
  - http://autobuild.buildroot.org/results/9e09b7ba0c6213471c73ffc6cb3c777b4aa33b23/
  - http://autobuild.buildroot.org/results/82d747d0d6b7150cba0b921cc9431c0f5bdf86f7/
Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
---
 package/ncurses/ncurses.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 00e1c0d424..71e2b9bc75 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -29,13 +29,21 @@ NCURSES_CONF_OPTS = \
 	--disable-rpath-hack \
 	--enable-echo \
 	--enable-const \
-	--enable-overwrite \
 	--enable-pc-files \
 	--disable-stripping \
 	--with-pkg-config-libdir="/usr/lib/pkgconfig" \
 	$(if $(BR2_PACKAGE_NCURSES_TARGET_PROGS),,--without-progs) \
 	--without-manpages
 
+# When wide char is enabled in curses, packages such as procps-ng,
+# expect ncurses.h in a 'cursesw' subdirectory.  So we disable ncurses
+# overwriting header files in the regular directory.
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+NCURSES_CONF_OPTS += --disable-overwrite
+else
+NCURSES_CONF_OPTS += --enable-overwrite
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 NCURSES_CONF_OPTS += --without-shared --with-normal
 else ifeq ($(BR2_SHARED_LIBS),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
