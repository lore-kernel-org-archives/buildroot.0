Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B636BC531CC
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 09:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A78FF80D2C;
	Sun, 26 Jul 2026 09:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUUmHRAsGOV7; Sun, 26 Jul 2026 09:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 443BC80D17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785057917;
	bh=+b53mAKwZFm+rtDEzor3fUiFqEcbbj/ZFCNPlIMU8mk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZcTfGNHGc+CgN9mL1p0i/IseIn1yRAFDTrUROhXk5IJI933enrTDhsnOm76ifwSBP
	 0B20HBVXo5O1uzNzKe9Vy/P/uIsKxWQakTQCrmMDc+yFacr5SZDWGM2DA+jiidZyBT
	 7tODxHp7BZu57gUNuAqa+Hus0Sa0OyrP4jokXQ+F4hBW9Ahi4ctFXHXTrn0hpzW5Um
	 9ncrVucO7yei9mkA0i/S0c+uiE8LBPr83u/G1bcxALC7G/E+aoSzgR9UIio8N5Ci6T
	 xfCgxHN5cz3aNkkXAqaa34QSyttQ81VkyCXd4yommaxUwxJkxV08jAzsxuWBcYa+qz
	 t6NTtd7n1DTrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 443BC80D17;
	Sun, 26 Jul 2026 09:25:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F835490
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 09:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 711AB6062C
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 09:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrCTss6nx4y6 for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 09:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 924FF60623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 924FF60623
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 924FF60623
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 09:25:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb30.dip0.t-ipconnect.de [84.161.187.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8CDAAA4C3F64
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 11:25:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34942)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnv6a-0000000030p-241J
 for buildroot@buildroot.org; Sun, 26 Jul 2026 09:25:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Jul 2026 11:25:08 +0200
Message-ID: <20260726092508.48248-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785057909;
 bh=k0tOZT5F1zNJ0YMyqIkB61YIiwpkGs8U8ibTIZLIcKY=;
 h=From:To:Subject:Date:From;
 b=KLDoc7UhgyMk7F2c/i9aKxDl2xjnWxxvho3oUv90MNG52SE2kznGqAMsDT9zG1TKl
 UbKweM+PEBh85z/6oHKrmOzkhL3q/F4+1si5qiDW6fdrihtPeh7Jyxbm0cVmBgsHMo
 j03TaI2c5/n5zWih4+2efv+HBMOe/2q+QDkpFxsTvPnz33KJ1UAceNloSuw3a7HwSo
 F/+27RuRZbT/W0qN0iDw2V8vXMfEnzoRggCDKn/rKor4LbiYR/GjgeguJOEKCrZ5Mo
 wqaio49GAWwnPEHqpIH35gLvWWc8BZHld6Un6t70fJPZDMBpAEzR6UOLSJfJg5nzL1
 1Z7R9lh351KjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KLDoc7Uh
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: bump version
 to 1.86.0
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

https://download.gnome.org/sources/gobject-introspection/1.86/gobject-introspection-1.86.0.news

The hash for giscanner/scannerlexer.l changed due to small code
additions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ada2907a0bb320453854d2c0abd66facc41e0ffd

 package/gobject-introspection/gobject-introspection.hash | 6 +++---
 package/gobject-introspection/gobject-introspection.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 044216c65f..866b12c5ee 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gobject-introspection/1.84/gobject-introspection-1.84.0.sha256sum
-sha256  945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794a84779  gobject-introspection-1.84.0.tar.xz
+# From https://download.gnome.org/sources/gobject-introspection/1.86/gobject-introspection-1.86.0.sha256sum
+sha256  920d1a3fcedeadc32acff95c2e203b319039dd4b4a08dd1a2dfd283d19c0b9ae  gobject-introspection-1.86.0.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
-sha256  60cf20b6532aa2f5622f753a55672630b789c04174acca361033e6f1ad29f8ab  giscanner/scannerlexer.l
+sha256  2596a580b8be710642b734a4ef459b9593db5f148b204a9ce65415e2db4fc87f  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index dbf0ee3fa8..0e8bf11954 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.84
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.86
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
