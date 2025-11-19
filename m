Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE869CF58FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 21:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 871F980CC8;
	Wed, 19 Nov 2025 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSmoJYHJLTwL; Wed, 19 Nov 2025 21:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B298F80CCA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B298F80CCA;
	Wed, 19 Nov 2025 21:36:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A681A2A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 969FA80CC4
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZiwPVBPCkWk for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 21:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5A8180CC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5A8180CC2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5A8180CC2
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:36:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca64.dip0.t-ipconnect.de [79.214.202.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 941A0A4C72A2
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:36:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vLpqp-000000005Zi-3ZAT
 for buildroot@buildroot.org; Wed, 19 Nov 2025 21:36:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 22:36:31 +0100
Message-ID: <20251119213631.3212239-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763588192;
 bh=H8ACfpAmi847Esa4uF9TH9j7CRvBTh/FRnoOEQJ20Rs=;
 h=From:To:Subject:Date:From;
 b=YbeHsDEqofAdRyn3h+9VTNWwzRv3cJ5IlQ0tt2AI5C5s2b0OQ/5SOXt+elKEHK1GS
 aVpw+ln4FYO8Mmt6tBfCbB9XiocBHu03VnmhR/BJWjwq2QLHIT2B8Q36XFx10AIsCk
 Cm/pI4rT0SbLx3APO+ir5WR6FDiR7GA8gU5iJinI+sFdrkEhlaS+pyNsQS+9CwYyhO
 ST+YXothIufDLV1SyAMstf20NAuOrWlzA4LvVT0C0NeliyzELf6XFkBg/AhBsuiUGF
 PdR33UN9pjgj0/DSL58R+XNWfB9cP5qqRE59hNqn/hkSLcPFkny2CWT6x/r4JmiHoS
 NerlQBtLIqJ4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=YbeHsDEq
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: bump version to 1.47.3
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
https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v1.47.3.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 1e97e4363a..3afae18f20 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.2/sha256sums.asc
-sha256  08242e64ca0e8194d9c1caad49762b19209a06318199b63ce74ae4ef2d74e63c  e2fsprogs-1.47.2.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.3/sha256sums.asc
+sha256  857e6ef800feaa2bb4578fbc810214be5d3c88b072ea53c5384733a965737329  e2fsprogs-1.47.3.tar.xz
 # Locally calculated
 sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 7f33b256c2..27e5e37bca 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.47.2
+E2FSPROGS_VERSION = 1.47.3
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
