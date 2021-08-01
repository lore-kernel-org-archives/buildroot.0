Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460EAC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:33:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD4E460EEA
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD4E460EEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E0D4050F;
	Sun,  1 Aug 2021 13:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRXCYiEOfHYW; Sun,  1 Aug 2021 13:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E50FE404F7;
	Sun,  1 Aug 2021 13:33:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C522C1BF578
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2DD2400DB
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjgvaMuAUVCl for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 13:33:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75C0E400D2
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 13:33:36 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c16so18099622wrp.13
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1GzBQAPKaczSYC1yl4os0Y8ILUkzovx311DShoFG4GM=;
 b=GN/I5MUQmIluyZS/ewLbND9jQdFBQ6jXVw4INBekSMO/tj0qelVGHB4AAL52d1+uNC
 Dfs4IfmnJHvkXMsR40OQOqHf9y9pO6CAa9y60Y2la3N1ZsUG8gvrKBxMvbCHiFhCoY5k
 FZSvX02AEs2N0hZBwZdPmZsGPjd19qJTiT1D1GPv/bWDA5jWHyIoFTGv1LSNFfKi9CJb
 MDvD16UypQ2uToS5YOndWi0OA2g3pz9sskjYVed97kan8vEdmY+NzMyGb9tOVJGApxji
 uqTHm9c8e9C/o+bOOhSeRCNZVe76cwxMLN+eRWN0WLa+9Q1pdZjeDrpzDExflDyCzJds
 mzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1GzBQAPKaczSYC1yl4os0Y8ILUkzovx311DShoFG4GM=;
 b=FSmmh2fUWngW7rDOL22tDSoIoIH4gWXe+2B7iNvVku5RUI2E0e+ONRr+GxsqKBzEDn
 Bzy1EagtjeZHyodDvt55mjWbRN/GuWBFeVhIHNmNX+BbhSHhfCARGfs3rm0WjW+q4Olx
 MzpMKu6mC7dB+T1WIZ8hS/xecIZAqTwngReASDs+UNckx6K7aziRJuBLlsm+dItPajAJ
 HM8WDwt+fVdbfVTItJ+VqPqJYs1frSiuIq+b/pcrc/QgUtSIbSQywfr8+SzlOW5AbN8I
 XchlqueeyKJ+2duhQN0cEvqSsFqtc+m85gdCM6vYl1fevoV4HDdXqgXz3QDSeRg3oBf3
 vEkA==
X-Gm-Message-State: AOAM531YW3mIMuMH3/he5giBDd0hvwUoNKmSrR5EkNGbvxBw9O0LhXVc
 IAc5lliPJtE27qlABVhgQFcHUQPimuGFFg==
X-Google-Smtp-Source: ABdhPJx2Y2QJ5pKNSfXIWgkjhAoVtyuLWrAEdtqdKcItKIdrmCrPUr/oyKXumkWBp8reLHdsa3U6Hw==
X-Received: by 2002:adf:f202:: with SMTP id p2mr12697387wro.240.1627824814420; 
 Sun, 01 Aug 2021 06:33:34 -0700 (PDT)
Received: from kali.home (pop.92-184-116-155.mobile.abo.orange.fr.
 [92.184.116.155])
 by smtp.gmail.com with ESMTPSA id s14sm7243142wmc.25.2021.08.01.06.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 06:33:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 15:33:24 +0200
Message-Id: <20210801133324.3658611-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: add libxml2 optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

libxml2 is an optional dependency which is enabled by default since
version 2.17.0 and
https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e

Also set PATH to avoid the following build failures related to
curl-config and xml2-config:

/bin/sh: 1: curl-config: not found
Error: libcurl is not built with the OpenSSL backend
make[2]: *** [Makefile:54: check-dep-libekmfweb] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/s390-tools/s390-tools.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index b5843fe0d6..3d3f24c181 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -15,6 +15,7 @@ S390_TOOLS_MAKE_OPTS = \
 	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
 	LINK="$(TARGET_CC)" \
 	LINKXX="$(TARGET_CXX)" \
+	PATH="$(STAGING_DIR)/usr/bin:$(BR_PATH)" \
 	WARNINGS=
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
@@ -56,6 +57,13 @@ else
 S390_TOOLS_MAKE_OPTS += HAVE_GLIB2=0
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+S390_TOOLS_DEPENDENCIES += libxml2
+S390_TOOLS_MAKE_OPTS += HAVE_LIBXML2=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_LIBXML2=0
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 S390_TOOLS_DEPENDENCIES += ncurses
 S390_TOOLS_MAKE_OPTS += HAVE_NCURSES=1
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
