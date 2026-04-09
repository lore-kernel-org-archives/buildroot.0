Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A769E9DE6C
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2157F41052;
	Thu,  9 Apr 2026 08:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNZoe-VP4dwo; Thu,  9 Apr 2026 08:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D10241088
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724280;
	bh=Gi/PXtZgBOrmjIlKU4TWYz9ANLgQMj5PTiWqfKFCxNM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GFGmP5FFvHKXjHVeGriNenVh8QvdXGL/HrK2JstFFCjihoVzM06D2vbJbN01kHYE5
	 OiXMJkRSX7hNCPtyOQGIuNzOCU/M/q3DMZcLJZFTAy9Aj03oNHS5s46a6ra8bqo3vo
	 Emm19aCOB+3mSxlhnwYixhtZL9gPdy+AmC84hYiy0JnGyA/UhKQhrE3dC15OuTOjvj
	 1OKp/Gce8vIUl3ozBGIsD+Fqcd5gigFXhcxPeq9VTXCvcmeSIcr8xuOLSz5nPuDVHQ
	 EwsmFAvVOeqV8ksiP4fBM10Tl2Vpo/9XF0xN9mjEkrL1IKh8FY7/x2UPw3gKGsOP49
	 24ogEZmYl2vJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D10241088;
	Thu,  9 Apr 2026 08:44:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6B391F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACF7141088
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFl6j2mdW5g7 for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:44:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9360241052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9360241052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9360241052
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:44:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E2DAA4C09B5;
 Thu,  9 Apr 2026 10:43:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyk-000000004SH-0wZ4;
 Thu, 09 Apr 2026 08:43:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:43:02 +0200
Message-ID: <20260409084305.3960494-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724200;
 bh=NQmSwMNoAKyJNSG0crMW3ayLUndnAqF1jF6PORzdUDc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GZz1zANWxKgzSugDErMnbb/fY4JHIoZJ6vbhEoh6jKKm1IioSUjVveITyHsS2Al0w
 jX0iXeb/7e6stcd2UG+5KVe5z8yyZI6JPn/ZZhfL2TzxfmvOqbrwCd9wj5oNuQyYB4
 40wsaSao4EsSx1H48gs+YIaZBo3/0+whNmmoJQHPZkLaTypwddUZYvpBMS0QLDdF7N
 s6A/pRqutGFc1X5xabnYMAf8Bbrqjx7RoJj1lbM6xXNERjTKBZ2r55QxJEiPBCXRww
 LLtd8qhbHNl3J/r4hR1JMy4yIwms3lPuKi2r9CFPMCKSwcTajJGFgqLZTFpFXT1Mjs
 lAq6lN6xtgm3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GZz1zANW
Subject: [Buildroot] [PATCH 18/20] package/slang: disable pcre module
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The pcre package is unmaintained and will be removed from buildroot.

Slang has no support for pcre2 so we remove the pcre module.

For reference see:
https://fedoraproject.org/wiki/Changes/PcreDeprecation
https://bugzilla.redhat.com/show_bug.cgi?id=2128372
https://src.fedoraproject.org/rpms/slang/c/40c4fb0556a06ad3ad9abf01bcaef50dde0dc8c2?branch=rawhide

https://github.com/LibreELEC/LibreELEC.tv/pull/8299

https://packagehub.suse.com/packages/slang/2_3_3+git16_89d32bb-160000_2_2/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/slang/slang.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 2b3cbdf27a..5d85e40982 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -10,7 +10,7 @@ SLANG_SITE = http://www.jedsoft.org/releases/slang
 SLANG_LICENSE = GPL-2.0+
 SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
-SLANG_CONF_OPTS = --with-onig=no
+SLANG_CONF_OPTS = --with-onig=no --with-pcre=no
 SLANG_MAKE = $(MAKE1)
 
 # Racy and we don't have/do libtermcap
@@ -26,12 +26,6 @@ SLANG_DEPENDENCIES += libpng
 else
 SLANG_CONF_OPTS += --with-png=no
 endif
-ifeq ($(BR2_PACKAGE_PCRE),y)
-SLANG_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
-SLANG_DEPENDENCIES += pcre
-else
-SLANG_CONF_OPTS += --with-pcre=no
-endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 SLANG_CONF_OPTS += --with-z=$(STAGING_DIR)/usr
 SLANG_DEPENDENCIES += zlib
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
