Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833F6C44506
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 18:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08CD0853B4;
	Wed, 21 Jan 2026 18:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxEMJZpJo1Nz; Wed, 21 Jan 2026 18:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A10228540C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769018758;
	bh=Jls2v8lj49XIFMYeGRbh5e2qcADFp8NzKE7BD/lKuF8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WJnpQTLQbSsOX2SrCeo+nSoonisMBs2sP0yct5exkUjnRuT7jl//O6/NXuM+ycv3X
	 qC13BhMz5sKrQHe1OW/NTRPypBg0guaSL2UFDFcyIqpGm3NIFFtmCXVEDTSzGWx+e+
	 28KupAzicEwFJog0qpy4aO5eviEP8LWGrc4QRAjzDuiUzQVc2V1sUWZA8/DAAGlp37
	 eTjq44JL4PK0Rb4jhKRmyFnfedlDfWPfp4FjBDISLoNdTKGICsLrIeXxKt87Sie398
	 4uYQa9T10cNTiiM7KOTG+ae07mjt9OwhefRgv035frkGFoGJ+XMhbnjY66uVdrOYJZ
	 6sFxKFUrNyL0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10228540C;
	Wed, 21 Jan 2026 18:05:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D83E158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B3D9853B4
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ne7ywJ_iW9B5 for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 18:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC14B85415
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC14B85415
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC14B85415
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:05:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9AA5A4C4668;
 Wed, 21 Jan 2026 19:05:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53394)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vicaT-000000006HP-0UHU;
 Wed, 21 Jan 2026 18:05:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 21 Jan 2026 19:05:49 +0100
Message-ID: <20260121180549.43744-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769018750;
 bh=IskZd5MwZHzyuA3Qed50GmCn+Z8dxKqqcyzT1AH46P8=;
 h=From:To:Cc:Subject:Date:From;
 b=fCTlA3JQfRT1vmdcSxsqDTi8rJ4/hGe6MrEtIDelXKIDvESTqd3jh2Wzl0z5RDGtI
 4Jz3+gL7cJmp+SXm0tFFSg27PZAvW1Tc9NIQfkzfy+UzAWZyhmv0JOfTAQ1t4pRocf
 gq5Fkq5PpqREe6z+LvjVl1adVCV7aevExRrLWez3+czhylJzzi6swQv3cXSUydJmmC
 jlsVZNJP3NO/JW/mgriIkh5T+dgN9MFXtVeXvbx84RhE1mp3TMhDmU6VhdoO+bU4zA
 OfDpsSNuBc4pwz2adNokZNPTzKZc1dAoKiDKLRKmL1Xr2siusEr/ByXPlGkm+W4nrv
 wVx7W5eu3R/rQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=fCTlA3JQ
Subject: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.10.1
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

Switched to tarball hash provided by github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/meson/meson.hash | 6 +++---
 package/meson/meson.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index d07ea4d1dd..7ac7c8364d 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.10.0/meson-1.10.0.tar.gz.asc
-sha256  8071860c1f46a75ea34801490fd1c445c9d75147a65508cd3a10366a7006cc1c  meson-1.10.0.tar.gz
+# From https://github.com/mesonbuild/meson/releases/tag/1.10.1
+sha256  c42296f12db316a4515b9375a5df330f2e751ccdd4f608430d41d7d6210e4317  meson-1.10.1.tar.gz
+# Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index ca42edf63b..6b2a25f1dd 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.10.0
+MESON_VERSION = 1.10.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
