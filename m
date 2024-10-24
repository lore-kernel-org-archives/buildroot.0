Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC253D0E415
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994F74038B;
	Thu, 24 Oct 2024 20:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rq1Q1xpawpR0; Thu, 24 Oct 2024 20:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F3A40555
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F3A40555;
	Thu, 24 Oct 2024 20:22:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CDA54960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C1F240A49
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEqi--a65LWb for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84C404055E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84C404055E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84C404055E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:22:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf36.dip0.t-ipconnect.de [79.214.207.54])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 567B0A4C0C4B
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 22:22:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34062)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t44Lu-0000000059l-3PxG
 for buildroot@buildroot.org; Thu, 24 Oct 2024 20:22:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 22:22:37 +0200
Message-Id: <20241024202237.2629544-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024202237.2629544-1-bernd@kuhls.net>
References: <20241024202237.2629544-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729801358;
 bh=MY5D45Tg92IsTMXU1U3XtwbE2XM3b2IkqJfVmODpeIA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iAr/WT4XQ/frYNOgI0DMVlMF7u6HV4OpMgkTaroRf1CtCuN0qw6xvX+QkerWvfFG6
 kvNKSKwrpuFOGrSJ+AqQZzOgs/VYnbID3bxQHpw9v5kh9x1MAKjBc/bK7qH1fooW3Y
 cRPxbF8Ob4iMNBLJSC/G7cEj6wAAPJBFQ2dASwOboUPoD2Id62uRoh3Irsen2LKvq/
 ShF0YAXnonTpXdz71zzi/UV8IqNsKoXV6fy4CKQE+lPeZJqecEKcjJb+3OwGkjpTXy
 CdJbuTc5PRNJ+jN+sC8+BR2MUjk8trWDV8J89gu4p8wVSPhwHNQgFODViGKKamrA2D
 i1TNU477F/GRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=iAr/WT4X
Subject: [Buildroot] [PATCH] package/kodi-pvr-waipu: bump version to
 21.8.7-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 3a78f23b35..2214674bf2 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11819542b32a8dc9a4b6f5cc2fb98153298be1156bbf36a1b2aaf569be9842ab  kodi-pvr-waipu-21.8.6-Omega.tar.gz
+sha256  1fd3a101f09c471deaa83ac5b673be71df97957060e4aedb4d7a890e355608f2  kodi-pvr-waipu-21.8.7-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 15a25a871a..97a830115e 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.8.6-Omega
+KODI_PVR_WAIPU_VERSION = 21.8.7-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
