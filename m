Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA89CFF8862
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 08:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 822E9834D3;
	Sat, 25 Apr 2026 08:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gC7zWtZnvby2; Sat, 25 Apr 2026 08:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E592833DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777107437;
	bh=2gKyUj8YAALibt74/87d1UkvV8p9k9VS7TZIDJd/vQo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ZC456NXNv0fEsFtsBzEx1pRDdmvSUJ+S0PYMut+U5OanD/ROn9nyfwzWIOvCZ2MyU
	 pY1+Dm3dK5h6nnpTyV2LT30B1gbLKpdcsLH079AZ86SppipEYpiP+rJZ/Cu+pKZO/b
	 C+dokdWfWUmt2cC/Wqbby0lxOi1pnZImL3t7JKiJ6iqc5ZLlacVQaQs9onv9AbJT+f
	 Hogn9iFmOcoOk52XwOiWdYE2+O7Zx6aoR2VP7GUxGcgxsdNdo82FKguJI8t2e2R7/3
	 9Rlb16xoDHzdlyhjEYGh/aZKTD9kbbPecjWtq2tC1fGw0ixLynor1O19oltrn1sVNv
	 0VB8wAoYW/swg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E592833DB;
	Sat, 25 Apr 2026 08:57:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9183E231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7438860DEA
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIMCZ2NlGzVb for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 08:57:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1BFE06071F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BFE06071F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BFE06071F
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJhO-1vXMdH25m0-00ZEw5; Sat, 25
 Apr 2026 10:57:11 +0200
To: buildroot@buildroot.org
Date: Sat, 25 Apr 2026 10:56:55 +0200
Message-ID: <20260425085657.474422-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425085657.474422-1-fiona.klute@gmx.de>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:U+M6iw27xDkrvm+cLdsKMvEiIZEOli7GBpaTaMjjBDzSCXR/IJ2
 oVKJY2dubwzd9Yc8W2G1gEj7I15yxdWHZw7zjMdF/PrczAxsMenqbMbnakpUHE1rovMoNQy
 o00lMMyz3d7NqqajHhjd/c0o6SZ1CyuzXjjyYsUieMhTI+Hk5YxAMPBg/P7HmEpSnLVqT+J
 4y2By+8xoT6WDX0wVI9Ug==
UI-OutboundReport: notjunk:1;M01:P0:ceVWqVg7zNg=;YgJDc5pWMbnKYiybBBNZ5kbE98c
 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
 ArNULffx/Mw01DuAn6ytn+Y2ELw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777107431; x=1777712231; i=fiona.klute@gmx.de;
 bh=4xFx9VESPZHrDGK78y/LIOHfD9wBn+Lv6Hc+RZ4cxDQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ibQXcBAQSS3ESIp5pJKcM5gPiIomWvyePp188CkJCAPkhd/gxJLD1uvb27BWM8Ep
 5/vuAbPPCgNgieuEjDN+ebX9DTpafs6iPQKErmNzG0uKhMw+VaaY4nXTOEZ9NDBOK
 p2G6PyjIz2jfUnCjuBzYonmDwRwNKx8m4XP2qlSLMBgfY3G6xRRO6NdK50cCS7sae
 Ur6NwMr+9Yv8TYmLZ843kaG3ClQvB+wiSTVQ52vxoAk+AwMAsvwL5QPd9DKeGSiQp
 vxfS/XYdR8CSVdWW2ClxitgInM8kVngVJwU+zb63XB+nncTszWlvGg2gvk9pOX6oT
 8Rt7ChcQOM1m3xnnmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ibQXcBAQ
Subject: [Buildroot] [PATCH 3/5] Revert "kmod: workaround for microblaze ld
 bug"
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 0d81107f021bf2a663f102bace1e3f9590641170. The bug
the workaround is for was fixed in binutils 2.29.51 (first release
listed in bfd/ChangeLog after the fix), which is by now far older than
any version supported by Buildroot.

Compile tested with qemu_microblazeel_mmu_defconfig plus
BR2_PACKAGE_KMOD=y.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/kmod/kmod.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index db9b3cdf21..bcf65fd9be 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -17,12 +17,6 @@ KMOD_LICENSE_FILES = libkmod/COPYING
 
 KMOD_CPE_ID_VENDOR = kernel
 
-# --gc-sections triggers binutils ld segfault
-# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
-ifeq ($(BR2_microblaze),y)
-KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=false
-endif
-
 # static linking not supported, see
 # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
 KMOD_CONF_OPTS = --disable-static --enable-shared
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
