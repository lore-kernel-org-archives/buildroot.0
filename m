Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D17C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 13:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95F9F81DE3;
	Sun, 24 Mar 2024 13:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCYDTYTcE8yR; Sun, 24 Mar 2024 13:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB8681DF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFB8681DF4;
	Sun, 24 Mar 2024 13:08:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 275B41BF5A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14D7A60780
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzh6nL46WD0N for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 13:08:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 294CD605F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 294CD605F8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 294CD605F8
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 13:08:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4E66A4C3336;
 Sun, 24 Mar 2024 14:07:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49344)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1roNZK-000000005iJ-0GHa;
 Sun, 24 Mar 2024 13:07:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 14:07:21 +0100
Message-Id: <20240324130721.29945-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240324130721.29945-1-bernd@kuhls.net>
References: <20240324130721.29945-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711285642;
 bh=2QNZrKtTUtnwQaIkiHvFb8yRw4GePaXVIIUwEd9pSqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TukZ2lw+A1AwgkjvYhb3lgAPyt0AZRFUTio/SIK2HG/QfxfYLMAN2LFhrDwSwRXyF
 SAh2RooRyP+MhEoaPxupiUDbrRAqHaaqsyDjOjG3+++ubBdbedv9zaIv2VJsrYGWhK
 PdwUoLtlR6ZXGpf7ad9S9rRFa+PMb9HUifD8Xf90NujWEaEoRJsBaWTZapr8EoxRlE
 reTmce1Sr8oKfY270uQMa3cOiaGUscwc5yalHsdZRlocEL0IYhuXZbxXQZAz0FEciH
 SKVjznfVb5M5yXakMM2xVvTDhscUz4UKALxzJceQUD5Kh0/EMtnpiXbv/OOAfQwviT
 tFNv560XIXcDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=TukZ2lw+
Subject: [Buildroot] [PATCH 5/5] package/libva: bump version to 2.21.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/intel/libva/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libva/libva.hash | 2 +-
 package/libva/libva.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 2fffe8701f..24825ddc1f 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  117f8d658a5fc9ea406ca80a3eb4ae1d70b15a54807c9ed77199c812bed73b60  libva-2.20.0.tar.gz
+sha256  f7c3fffef3f04eb146e036dad2587d852bfb70e4926d014bf437244915ef7425  libva-2.21.0.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 4481be9e7b..79dbe577c8 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.20.0
+LIBVA_VERSION = 2.21.0
 LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
