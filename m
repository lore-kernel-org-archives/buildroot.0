Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DBEC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 09:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98DC26069F;
	Sun, 16 Aug 2026 09:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wr8mRTzBTKcW; Sun, 16 Aug 2026 09:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1488060657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786872409;
	bh=gyQi7TAeWwaIlssmkjP5fflrqfhVXMJwJx7fZLFRDYw=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MuHzOzFSwUmPx8f6g/WIU+8cBadMwzSYYLN0NmyzhW4+7DTIjcDGwVRg5B/8cG5ie
	 CfBbMiiarofY3L+YTa4p8Rq6yTngnJZcDQEKnsPgS6kuYExOlqOzEjINotw01VziWM
	 ZDaKpQiq1aKaLDi7G8Oex4CLXUCHmIlpXkeTbiv6gwgXqH2VbJO9C9YFkglekjDo7O
	 H3lNxOkw36T8WqpAkBzezuDyBaTcLVsp3yBqcV623GQG5niNSsNAf846fdiKjl9Ub7
	 BUBq6mwuzTx13cK9ryZnZ4HYLyeoH9BscxG+OgCZI2TFaisfaV/3NLG5nqUG8NDnTT
	 tM+IBgilJ6kKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1488060657;
	Sun, 16 Aug 2026 09:26:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 49CCC33B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B7C940475
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynaWiTQkiGtL for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 09:26:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DF164046C
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF164046C
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DF164046C
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1786872404; bh=foA8HVQLM8nDsm1GyJjhwQoo89NkGbg0LKBOG4N0dKU=;
 h=Date:From:To:Subject:From;
 b=puSX+/cRJv0bN5ykQWiW4DN2LTWR9lYr4y+sfcB+Rf6nV5wWLoIkzF4OMUz55ypd8
 ULOEJBiyQtSgF5mnGHdeibjbhu1M6acIiou/Ci/PDsGdnZPmGWE/wgfXxjwTnKnAKq
 443F6+mTa0RAbpjoTjZPGB9TbxiGOjuzVLzgJrKX3U9ZAVngyvwUhtOFIR0xhWbp0/
 i70RhS/NTFoXDqRNfgMaZDdOb4FpEwEWtq6yn0Aj6qefAtiP24zcKQHKUea3eqcuMu
 3+GDWCEZe25Vza/XBcSnMHvve5012givcASrkaGliFATRB/0Lct3QtiOZ82Za+9RSh
 odq50/gWfVy1A==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 358D331E0AF6; Sun, 16 Aug 2026 11:26:44 +0200 (CEST)
Date: Sun, 16 Aug 2026 11:26:44 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aoGCVOA28ZKnveLq@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/uclibc: automatically enable uchar when
 wchar is enabled
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

When wchar in uClibc is enabled, just enable uchar support, too.
Adds 5kb to the C library on aarch64. Makes the default uClibc
config more compatible to musl and glibc.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uclibc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c19328e87a..beaa32e67f 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -365,6 +365,7 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 UCLIBC_WCHAR_CONFIG = $(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_WCHAR)
+UCLIBC_UCHAR_CONFIG = $(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_UCHAR)
 else
 UCLIBC_WCHAR_CONFIG = $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_WCHAR)
 endif
@@ -431,6 +432,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_THREAD_DEBUG_CONFIG)
 	$(UCLIBC_LOCALE_CONFIG)
 	$(UCLIBC_WCHAR_CONFIG)
+	$(UCLIBC_UCHAR_CONFIG)
 	$(UCLIBC_SHARED_LIBS_CONFIG)
 endef
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
