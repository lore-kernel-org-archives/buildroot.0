Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6885BF99C95
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 21:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E067660EA4;
	Sat, 18 Apr 2026 21:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhYkkazJ--ca; Sat, 18 Apr 2026 21:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2E4760E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776549342;
	bh=ZK0YWX7FcI0i/71CB3HOZrSGLjEwM3ZaA6oNNkmpPSc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EN8pD7YChQYge2QSBZ3Yj3fhfqKYhU0UwQXVUj8nzQQgQgVW4nexXaYe8pP60iu0L
	 /ZGiDvQyC3Y8H2aEpHzpKSSHqcalsvEiudMKBpaCGwLZfWx3yvjEu14Zux6n+7bhcu
	 iBiRn2DNGW1mtgPHomEO3rYEw4PqsBzKHo1V5VHt850iUl68o6H+d54UpY2j/jGRSn
	 KSWFi/XOcOmSRkty51eb/y2p1YCgBdghQpeaat43UtZ5N1R1bC29oSdxJe5HpCYd0t
	 HN/hsofx4THtymSdczRtwdkpjvUNzkJAy15VUMa77dDOhhKSujDQURLH+XiyUMcZZO
	 sCneOqHqnm+YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2E4760E87;
	Sat, 18 Apr 2026 21:55:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94D0435B
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 21:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A41D813AA
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 21:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQS2fZ5b37Vx for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 21:55:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AC1A813A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AC1A813A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AC1A813A9
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 21:55:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 455F1A4C303E;
 Sat, 18 Apr 2026 23:55:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47536)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEDdY-000000005tT-3uAG;
 Sat, 18 Apr 2026 21:55:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 18 Apr 2026 23:55:34 +0200
Message-ID: <20260418215536.55054-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776549337;
 bh=WFuX2ok+cL8bxn/zrG22YzNS9GObChbv+q28sh8B8+A=;
 h=From:To:Cc:Subject:Date:From;
 b=lv7oSis+WM1DJBzoqiJEIcd6vtgo0YOo7ijKnVUqrzbbYvgRj3ctW95nMr80wxXaH
 21Ia65IZ1rnLx+V6H1EJB6oLfcdKuglwiWOddtwot3x8FD6qiXyVJdcJSvg40Tg9sp
 mUyuHenlzgktL/kj75+tr3xI9/HRKpvH2y2eRCmWTlLmcXUVozMEDdW0Z9RB98hqk6
 hF4bHgeJryTth5fTIOlCGJIH7Rk9dcuKUyfZ029TwnQEzbUHQJjQnBdt5S4HhN13Vf
 elEx9wygwJgLQOuzPodRj0u5IfIzvfdeg3kkhLJ4d99+Wd2ANprTeFN0yUQAVS1s1Y
 h504qTSrsSGGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=lv7oSis+
Subject: [Buildroot] [PATCH 1/3] package/jemalloc: fix build on m68k/uClibc
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

include/jemalloc/internal/jemalloc_internal_inlines_a.h:16:32: error:
 implicit declaration of function 'sched_getcpu'; did you mean
 'SYS_getcpu'? [-Wimplicit-function-declaration]
   16 |         return (malloc_cpuid_t)sched_getcpu();

Added -D_GNU_SOURCE to CFLAGS because

  extern int sched_getcpu

is wrapped with __USE_GNU:
https://github.com/wbx-github/uclibc-ng/blob/v1.0.57/libc/sysdeps/linux/common/bits/sched.h#L80C1-L80C17

Fixes:
https://autobuild.buildroot.net/results/57c/57c68aad9abcce7621fbff52081da041485e8830/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jemalloc/jemalloc.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index bd8a2d7654..0c46f65029 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -12,11 +12,15 @@ JEMALLOC_LICENSE_FILES = COPYING
 JEMALLOC_INSTALL_STAGING = YES
 JEMALLOC_CONFIG_SCRIPTS = jemalloc-config
 
+JEMALLOC_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
+
 # gcc bug internal compiler error: in merge_overlapping_regs, at
 # regrename.c:304. This bug is fixed since gcc 6.
 ifeq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
-JEMALLOC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+JEMALLOC_CFLAGS += -O0
 endif
 
+JEMALLOC_CONF_ENV += CFLAGS="$(JEMALLOC_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
