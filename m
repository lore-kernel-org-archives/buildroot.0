Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AB4EFCE3B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 19:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60EC080B53;
	Wed,  4 Mar 2026 19:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Spg_VeS8hjTH; Wed,  4 Mar 2026 19:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFCA480B5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772650909;
	bh=TVhtjyVV/AvJHAzvCs5x+xAJJeQkmzhoMFm9o60a3uo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PPiud8uSseIv3wAZL9Fiua7EvQz5ZFooI8Bta9zC4k+0yWmHpjz0jmbA+PrjxaA4w
	 bOkma8jpchsDbL6mgth+3OXcj5zcj1i5ISeGDm2kYAAMHv5IfyHeEegyI4C0TK2hp2
	 55M4iADUYsyanIOhTO98OgIAudoMKitHzJW18teZGc5FkPcmt7nq/DFaNMcIfAPLtt
	 OklZLhP/sVABc5QXcJdvtrhtwrWFew8VzrARw+EZetsWmalB7c//o1hP1xB8yw3rs1
	 2P+0b9LwuMmbMvTF3FPbjqercTnU8M+2T0n4OnN6FmxjNj8X0sT7uf9pmM0f2SfZkv
	 8s5W8bBySYlsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCA480B5C;
	Wed,  4 Mar 2026 19:01:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CB5D25B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 570B34048D
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YyB2D_mDjg11 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 19:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65FD64056B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65FD64056B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65FD64056B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:01:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b996.dip0.t-ipconnect.de [84.161.185.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1E345A4C3370
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:01:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38054)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxrTc-000000004Ue-0Eyv
 for buildroot@buildroot.org; Wed, 04 Mar 2026 19:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 20:01:43 +0100
Message-ID: <20260304190143.3481181-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772650904;
 bh=f+qb4ESb0PLUoBegqc+qvELoH8Veys5pz/E/4AhHJcQ=;
 h=From:To:Subject:Date:From;
 b=NXvnOxy5kStHcwypTniAEvy3cQVMtwYv6I/gcockfpwsFsHLy8MLQicnaLxevIQq/
 NawLic27KGNjnYnHVLV4cx6vtb4zzaFogqgrQMsg0XBL8Fz/PgkaIvphd8gwaMBikb
 jWLmjyGrIN8jZjabklypL/b4Ae7v4BqF1RG+Hzquj3+mnuPr8XWb50apkDoh/cgHPp
 mEmR4NNBp7uIJBG0nXu/1b26lGqWo3+Q2lzWsIfMUzqi1k/rh0iC+f8WkLKaIgr93E
 tDyYq8PWBqB/xxv4gctDerUXwtxOoTTdDEXYV+oVbZidzF0Eo/05RkTInbES2rvBaY
 CS5vvMDP6s0/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NXvnOxy5
Subject: [Buildroot] [PATCH 1/1] package/freetype: security bump version to
 2.14.2
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

Release notes:
https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/

Fixes CVE-2026-23865: https://seclists.org/oss-sec/2026/q1/253

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 2c6ab20e19..520e6c2bcf 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.1/
-sha1  20f7a9a3e2996aab82b0648e82d49a78e8813bab  freetype-2.14.1.tar.xz
-sha256  32427e8c471ac095853212a37aef816c60b42052d4d9e48230bab3bdf2936ccc  freetype-2.14.1.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/
+sha1  28200b8f8df5a524f476bdacb20f05da1c33280c  freetype-2.14.2.tar.xz
+sha256  4b62dcab4c920a1a860369933221814362e699e26f55792516d671e6ff55b5e1  freetype-2.14.2.tar.xz
 
 # Locally calculated
 sha256  bd36c8b474855fa294c2ec5c184544478ef3720aad37d65a6296a4f264fd2d3b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 00743fe358..fbf9d13235 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.14.1
+FREETYPE_VERSION = 2.14.2
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = https://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
