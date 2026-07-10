Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F90DC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 07:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECE0B60697;
	Fri, 10 Jul 2026 07:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJhsKSGYQl0S; Fri, 10 Jul 2026 07:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136FD606AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783668035;
	bh=W9ZuGAT7/dE/2m82x92aLyfb3+9uTZ/Drj4nBtdn7u8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G6S9AKQyb/qCRJN7+WSAlDM8pkwdQvAcUQDnoSGbX2CKbVqXZSh2CUKcU3+dz0bYl
	 SbGNGGwB2ZhX+pXHAaSH8R+0vdA1fCaCnQmCaMeeMZZbcuVzx6FPirYyR9cT9Q96Li
	 cayMfSfscfnQ1QkJpt5An/wBO86lVM7h5YNg18d1MXfI3CLb9FGHCQUpyrFL0v2G+2
	 ekBGuINmTYKHL8tFxsfEOY6llgfQpbThF1im3n+EpKzI3I3n2q69G61hwf6IL6m7sp
	 nCq/bQkTIZM9eWzLNATQUPlwmnADlsLKP18Cegs8G5selzxLcVFKjKpr0Ls7js7UyI
	 YPH9Eic+hWEMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136FD606AA;
	Fri, 10 Jul 2026 07:20:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E840320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40D5640120
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3OQwSdA3DqS for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 07:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 250DC400A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 250DC400A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 250DC400A1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:20:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4f9.dip0.t-ipconnect.de [79.214.196.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 959EDA4C324A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 09:20:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wi5Wl-000000008GF-2FHy
 for buildroot@buildroot.org; Fri, 10 Jul 2026 07:20:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 09:20:00 +0200
Message-ID: <20260710072003.160464-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710072003.160464-1-bernd@kuhls.net>
References: <20260710072003.160464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783668004;
 bh=oezjHnB91UuPa7Ax890ML8CvGaTW2MjI9OcQsgWEmQ4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Qj33nVx0rMx4GCNA+zQ2A9t7gzYNBTSqIV5YCrL4lnoZJb7SuKmRgSp7SVZX0bHLq
 XYsgDEqCe3vqzxHaQ9bwlc47PsQm/0nsP+XqF7dKnC7cSYQecqjWZUbG/5yx/3dLJy
 BlCteK/hZRLpzXnTOCkCP+sauwooJpe+HoF5l73YOv9RPWswwTl9Hb5mEPlldJgKgV
 zMRIFh/Tn6QunX2OicZqluRj+4d5AXIFUFgndt2IVMnh9XiUKzS4BE4VrYA5eqjezM
 ybZo+yePTTFzff/EWUd6gCAL6GeFlZBjZfMyiHvRfqc+7FU9eU6cVSL+O6KrcMai8v
 ef0o5p/PmVNDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Qj33nVx0
Subject: [Buildroot] [PATCH 2/5] package/libva-utils: bump version to 2.24.0
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

https://github.com/intel/libva-utils/blob/2.24.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/668fc1fd6c25e7abbad7dbfe140e34c7187e1f75

 package/libva-utils/libva-utils.hash | 2 +-
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 6888647865..d7b1a0789b 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fa7ff29847b55010fbbb775b35382f97f29b7b97abe9a2f6fb3e22b36db5440a  libva-utils-2.23.0.tar.gz
+sha256  bf959a1ced3cde8176a7ff50ad358ee98e93301ac068581a8b2617c5b83afcb3  libva-utils-2.24.0.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 3fdb6bcf70..38dd14610c 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.23.0
+LIBVA_UTILS_VERSION = 2.24.0
 LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
