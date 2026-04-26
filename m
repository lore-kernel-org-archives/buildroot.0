Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B18EFF885C
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 10:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0EC284A52;
	Sun, 26 Apr 2026 10:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtuzjo3TwAbY; Sun, 26 Apr 2026 10:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF35784A53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777198941;
	bh=pGAchTmZh3KqIiY+W17huj7D02YctinDn07xHXQEcaY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=du9/CFWIKXgU70uUJOsH9OGqE6slf9XBOmDOCQnm2Y73LKgPLDXQQY/LaGBHfaNGe
	 wCqDno4SRrj81nVMuUvXV1cej6tZLhi9A+4xRTDd66XLPvI0j6ffG8kmJl2X6CvNas
	 HDNfnrD4q01DFiz3EriN+579uUvL2ZvThYG0Rqd6Jhvd7zII04sc9NVdDW8ZLu+i3o
	 R8r+aoS7pE/OP5c2jzzDQ8vNAbnukT7K3D857pu8D8TbCBFtwdqoBytmI1gb/7WC6o
	 PZEDdq+iPGEJP6/6T+PoLs135PvSLLU5us5LrfehExeTfTVGOxiwuj2LwBoksPMFY2
	 DL6BruVmxMniQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF35784A53;
	Sun, 26 Apr 2026 10:22:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B39E6369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 10:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE2B5426E8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 10:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lIQJDx5XeqD for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 10:22:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B96B642456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B96B642456
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B96B642456
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 10:22:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 909E2A4C01D3;
 Sun, 26 Apr 2026 12:22:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59910)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGwcw-0000000048u-3VXX;
 Sun, 26 Apr 2026 10:22:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 26 Apr 2026 12:22:15 +0200
Message-ID: <20260426102215.3100043-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777198935;
 bh=fwDVXC8CHWd1WvxfIU4aLvHQczhvtqL1jJTOIsu/NiQ=;
 h=From:To:Cc:Subject:Date:From;
 b=nY8HZIjpvaPHSRnXKHMEEM3IEquMhuZEHNxMe2MPpzwJ1F/hHRkiw6ZKm2iwIZKTT
 YyuQ1fpsFt6b85kznSSxKRowBWeKHUDG5cuhrn3WwWOEzc6g1NwXdbCH98NtP64L/6
 7GPfVV2Ld9fsk/iexpV10mrNx7m6rIMRZn7hgXP0isjF58y34e2kClLdowNmDIKmP8
 d8NI70+hgaIj37YcTaOnj7GjxUEcpAlejbMM4dFI/iWMNgIRnyXZL5nyLWhLyJMgxB
 2MH0u90z1o863qzcmPvlor0T6e12KdUZDgcFsDR1OgM4ELpe5xn+6cvYyV7cJsV3C3
 Q7fkHehZmfsmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nY8HZIjp
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix non-MMU build
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

Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped the
package from 2.40.2 to 2.41.1. This bump includes upstream commit
https://github.com/util-linux/util-linux/commit/a3f1255f1891ddbaf3bb6a32af28569c0e6f3b91
which was added to version 2.41 and includes the usage of
pthread_atfork() causing build errors on non-MMU platforms:

libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
libuuid/src/gen_uuid.c:629:17: error: implicit declaration of function
 'pthread_atfork'; did you mean 'pthread_join'?
 [-Wimplicit-function-declaration]
  629 |                 pthread_atfork(NULL, NULL, reset_uuidd_cache);

The oldest build error of this kind can be found on the 2025.11.x
branch with version 2.41.1:
https://autobuild.buildroot.net/results/87c/87c74435be14956fd45f730269eac102e70d56da/

A backport of this patch to the LTS branches should be considered.

Fixes:
https://autobuild.buildroot.org/results/a21e81e64eccc866b575a4f3b1376c50f2ffd837/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/util-linux/util-linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 1271bc7dc0..99a6be976e 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -130,6 +130,11 @@ UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
 UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LINK_LIBS)"
 UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LINK_LIBS)"
 
+# pthread support uses pthread_atfork, which is not available on nommu
+ifneq ($(BR2_USE_MMU),y)
+UTIL_LINUX_CONF_ENV += ac_cv_lib_pthread_pthread_atfork=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 UTIL_LINUX_DEPENDENCIES += libselinux
 UTIL_LINUX_CONF_OPTS += --with-selinux
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
