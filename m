Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69BCF5A8AA
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 18:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2B380794;
	Mon, 20 Apr 2026 18:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWBtMxiixowJ; Mon, 20 Apr 2026 18:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B18FF807A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776708599;
	bh=kqA5sHShRqDj2t8B2qIotNgjys4WJDjGs/2e4nAEnig=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KnnhhnMfZJ6E7B/Z3+0RHePTi+j4tSLjfc3zEbYWASZcao6qlzxX9nJrymMtVCYNV
	 CGwGaZ1C5V2YoJNjbaMs0JSoqmhwarZqHGKErgg5uAEaS86gwN2EBMjP4+QfNYQAqM
	 61mXuGdTgkX0oJgJYlMl85xfYFX+TiA3t94V9rz2IRfDdKEdwGEh97P+oV46xvDdhr
	 qXBlCfe5iR271EQm4WAza0SxqSyWT1SYGfDknApPJ8j54626odCxeV+lh62phsJdUl
	 69G2clz2xwaHIOLo22Hnz5NO7YY3tZ4/Xp94Ei9rwtMuFBL/cixSLssdmHVDSftgpa
	 qsF9akw4lZWPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B18FF807A3;
	Mon, 20 Apr 2026 18:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D51B24D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 18:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55A6C402F3
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 18:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mWxwnq4oe3D for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 18:09:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67826402E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67826402E1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67826402E1
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 18:09:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cdab.dip0.t-ipconnect.de [79.214.205.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 57406A4C38CF;
 Mon, 20 Apr 2026 20:09:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43016)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEt4E-0000000028p-479u;
 Mon, 20 Apr 2026 18:09:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Apr 2026 20:09:54 +0200
Message-ID: <20260420180954.3749024-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776708595;
 bh=U9D0SflJjkhcrbxukONBYMIWHI3Xid/Dj87nQ68dObI=;
 h=From:To:Cc:Subject:Date:From;
 b=XAWyuuNvCho4MJo0PbI1As5sxyr0xutOXV49TaTrPQVu/+gj8VGCVHgJuf8VZXBkk
 P8N8+OwXBiE1Z7lX1Z3mYvKBJtxvG5rINOJ3ZYlaWKiPbxhkJwYFhhpU7ek2Fd/7P3
 G7wkVsvupTM1RpVZjQJmjYQH0Xf2jQA652nNNg5v85X504x4aB4iq/njkPiFPOkHXX
 Wi0EmPcFAARUwT/iFBJIdsALVd6/wUEoSb05aLqIFvjErZfVafa64nZJy3aAGcJD/K
 Y8PbVCciLvaRzJcwVyRt4fY7bbnEVMPpfJrQZmvs/z4AixT5fyjuji4EfSzSa2WXAO
 oo8zP2CPqEIHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XAWyuuNv
Subject: [Buildroot] [PATCH 1/1] package/boinc: bump version to 8.2.11
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

https://github.com/BOINC/boinc/wiki/Client-release-notes

Updated license hash due to upstream commit
https://github.com/BOINC/boinc/commit/44742026e2e30e1c97fa846796236cbb73e43521

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boinc/boinc.hash | 4 ++--
 package/boinc/boinc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index 3955cffb31..ee3168b148 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  e577072b06f590d3230c25c94b221dba528b0938681e645bbd870778f8958077  boinc-7.20.2.tar.gz
+sha256  0697781686bd99f0294d639d19d7184f884e5d8b11ae8fae720b855f58bb3f5a  boinc-8.2.11.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
+sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 421c8a1455..6227d464d2 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BOINC_VERSION_MAJOR = 7.20
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).2
+BOINC_VERSION_MAJOR = 8.2
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).11
 BOINC_SITE = \
 	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
 BOINC_LICENSE = LGPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
