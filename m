Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F84E9D810
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 16:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91977406E0;
	Sun,  5 Apr 2026 16:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3CL1NBF72NM; Sun,  5 Apr 2026 16:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A116140690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775405704;
	bh=iXdNm7ZDuTpJKZwlnTh36F1VTChH8jyOA1KgPtsr0r0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lYFP0V9PEZxTuEK4Oq5ZQ1ZQ8DQoEVf++wkhK2zvetZThpdN//gBaJanqFrhh9sYE
	 KtqALx6/zDFBEMYrLBT3ZnxAQQ+Gg4UMQwemFlzg/EvtC8lce5UqP6dSLKeoTUmVmF
	 7MST/vbeiQD5BV2EQt6ef1RdV4UVdxykOUbUMi1RhIlzy1jFfTUzxDmJ2qdhsirxf/
	 MDfNNdKDo1S4QkQBdwoxy3shKBHi115eByDtYh/NZSEV1m4N48v8sXveUYv1yvF4ql
	 Tbt5nNHDsFuM8YhXXC8wI4pgPX6kAskwli5xVoWdglygB7jbG5WSmrOSe1ZcTs+UAB
	 uROkxsI6hVEmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A116140690;
	Sun,  5 Apr 2026 16:15:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC3C9219
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 16:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D12AF40636
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 16:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emQvHz3IgkrJ for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 16:15:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A49140630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A49140630
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A49140630
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 16:15:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BBCD5A4C026C
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 18:14:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45176)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9Q7l-000000000PL-1lVE
 for buildroot@buildroot.org; Sun, 05 Apr 2026 16:14:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  5 Apr 2026 18:14:57 +0200
Message-ID: <20260405161457.575549-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775405697;
 bh=dw21aM7tEhYZBNT7V+St9h61r8eRgXPPISvp6DmaB/A=;
 h=From:To:Subject:Date:From;
 b=Y4pcG3cV0J2aj/5X4LlIKuuKY4QspmAxsQci1rzyVJWCw2Ct+xuM5bVnZbJljNkl2
 ATUUV1apL6uz9lqOTQbkONuwc4ZJKKPhkIfpch1xQ00vwCMF6/NrtYPvx930eoqO37
 wbeCfpuVljM4jFNF29//HA5R6qXJcr1u/JUXFO2H+s+gGCjAj+KcEP1LJLOaPTc4Xg
 GxcYuvOPTjj8rZQ8teWtVv6zOwEOJS49PXImXGGmhW0inaLlQHtietCBxO3higTzUV
 hk4zYYj3f4lQ6IxcbGmgTdPKyahjwblhTNHAaMlR3NJ8rk7FDq/ds4eJgInKETwbZD
 GbnORzEqp5kkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Y4pcG3cV
Subject: [Buildroot] [PATCH 1/1] package/newt: bump version to 0.52.25
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

https://pagure.io/newt/blob/25a32726469ce1868fa7b7c7f7b0e4f91a50a639/f/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/newt/newt.hash | 4 ++--
 package/newt/newt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index 6d5f7c3dca..e8c945e4fe 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,5 +1,5 @@
 # From https://releases.pagure.org/newt/CHECKSUMS
-sha256  caa372907b14ececfe298f0d512a62f41d33b290610244a58aed07bbc5ada12a  newt-0.52.23.tar.gz
-sha512  c845d03946f72a6b46301152d7dc308f71d17b03d255d73d02ea7deb5392e22522dc8504f941fcffe5309c6c10f1b56742dac8585a16b0dc7e0c463f18871dda  newt-0.52.23.tar.gz
+sha256  ef0ca9ee27850d1a5c863bb7ff9aa08096c9ed312ece9087b30f3a426828de82  newt-0.52.25.tar.gz
+sha512  23f239ff599f63fdfec83ba32256a4b4e081d84fe7844a32a9770a0776df7e200315f794d031bca0f7c3526a9730fb3f62973bad40bf96618de6e336e97a8096  newt-0.52.25.tar.gz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 3c9efe132f..0d78fca345 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWT_VERSION = 0.52.23
+NEWT_VERSION = 0.52.25
 NEWT_SITE = https://pagure.io/releases/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
