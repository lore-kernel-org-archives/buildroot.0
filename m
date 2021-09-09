Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F95C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 08:36:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7730961178
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 08:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7730961178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A7C360ADE;
	Thu,  9 Sep 2021 08:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZ2gWw-nq4oU; Thu,  9 Sep 2021 08:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E42060ADC;
	Thu,  9 Sep 2021 08:36:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABEF11BF873
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 08:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A361583EFD
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 08:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXeJR3sP_SZW for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 08:36:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC94382D45
 for <buildroot@busybox.net>; Thu,  9 Sep 2021 08:36:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so756834wml.3
 for <buildroot@busybox.net>; Thu, 09 Sep 2021 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sGs60xi8S1lauwdYgNuAF4K7bTeMfKrgEDCkbjX5hGE=;
 b=eW7rg3Zcui/Cs1g5bb3yM5CEL3Sw2x8dCh9KQ+GFv2cUhZVl5eAFIgUb8utwvYGJyJ
 15Mr2+FfM405g88QfJhnMDPAl4YcozgeNcEJugUMglo4Rb3AkUGeMPHKkzosanVXRKT1
 FYf47MZhKznldfdIfhnHptO3eBMvbkjEv/sNLYEBmNuN4QbBWjJM0fr8Obg519VbJYvs
 Sg5Eeqr7Fhq4LONRD5RZIs+ahWQZFvPIxrqwg6ANxcAEX+2GCccehJkWC9fTaGUhwaIE
 dvgmZK8miX1gSvH2UC8VGFGtm/STPzQWKOJ1vQJlNpYM6Jlrd+DjG+DdkspQgrGQeSRg
 MzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sGs60xi8S1lauwdYgNuAF4K7bTeMfKrgEDCkbjX5hGE=;
 b=5G36eCpC6jNbpE+IW/onpKN5OQsweOGKDH0QEulD++pzuw1Tr6TesmPjHJwTapp0qI
 NPfYhBxKkd041+8qR1Jb9nizBQKwmmiCPdnJWnirEFFoLFZwleeUs/LBKC/yTbj0T+Zk
 D7BlgsP265zvNMNGRjUD8eqVxh+Ts/M9ntfX/obuics+gS3LTSP5Ymywc61PLRXB1OCc
 iwR6wHC9Uiq9HE1/HwnBVbwqoZ19qod4qjpkmv5HnxT5jCW/op5scyPxJPXEn0S+vuJh
 Z4Sn6qgMBu3D9VrRH/1VDoezorOHfOxcC3wV+NUeTaL6kx2guKUm9+fDBwlAbKZHB2io
 MQFg==
X-Gm-Message-State: AOAM5306v1/R43vOPfNqqI1MZjuXwxlKTqhDjhEgNvsq39+CX0FLqfrR
 QSEgLywwZzJcHhWlrd7TUHxWz5WdApA=
X-Google-Smtp-Source: ABdhPJwVrzi+346gp66z+XyBFbkU8VwFu4db6ztHEBW7NB8mZ2vd9wzJRar/m/97ccs8PUY0eVwo8w==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr1652154wmq.126.1631176576982; 
 Thu, 09 Sep 2021 01:36:16 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id j17sm1061034wrh.67.2021.09.09.01.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 01:36:16 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu,  9 Sep 2021 10:35:36 +0200
Message-Id: <20210909083536.2067036-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pcre: bump to version 8.45
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pcre/0002-Disable-C-unit-tests.patch | 8 ++++----
 package/pcre/pcre.hash                       | 2 +-
 package/pcre/pcre.mk                         | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pcre/0002-Disable-C-unit-tests.patch b/package/pcre/0002-Disable-C-unit-tests.patch
index c5c1a49f2..1c9f26eb2 100644
--- a/package/pcre/0002-Disable-C-unit-tests.patch
+++ b/package/pcre/0002-Disable-C-unit-tests.patch
@@ -27,16 +27,16 @@ index 6d03912..2c42b3e 100644
  @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_25 = $(GCOV_CXXFLAGS)
  @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_26 = $(GCOV_LIBS)
  @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_27 = $(GCOV_LIBS)
-@@ -362,9 +356,6 @@ libpcreposix_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC \
- @WITH_PCRE8_TRUE@am__EXEEXT_1 = pcregrep$(EXEEXT)
+@@ -190,9 +184,6 @@ libpcreposix_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC \
+ 	"$(DESTDIR)$(includedir)"
  @WITH_REBUILD_CHARTABLES_TRUE@am__EXEEXT_2 = dftables$(EXEEXT)
  @WITH_JIT_TRUE@am__EXEEXT_3 = pcre_jit_test$(EXEEXT)
 -@WITH_PCRE_CPP_TRUE@am__EXEEXT_4 = pcrecpp_unittest$(EXEEXT) \
 -@WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest$(EXEEXT) \
 -@WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest$(EXEEXT)
  PROGRAMS = $(bin_PROGRAMS) $(noinst_PROGRAMS)
- am__dftables_SOURCES_DIST = dftables.c
- @WITH_REBUILD_CHARTABLES_TRUE@am_dftables_OBJECTS =  \
+ am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
+ am__vpath_adj = case $$p in \
 -- 
 2.7.3
 
diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index 628d61735..a84d63e1b 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d  pcre-8.44.tar.bz2
+sha256  4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8  pcre-8.45.tar.bz2
 # License files, locally calculated
 sha256  0dd9c13864dbb9ee4d77a1557e96be29b2d719fb6584192ee36611aae264c4a3  LICENCE
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index c8498b7ac..264eaa10c 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.44
+PCRE_VERSION = 8.45
 PCRE_SITE = https://ftp.pcre.org/pub/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
