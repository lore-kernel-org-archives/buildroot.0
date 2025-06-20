Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF71C71155
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 06:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8089240C18;
	Fri, 20 Jun 2025 06:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzW9t0t5xTB1; Fri, 20 Jun 2025 06:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E98640C2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E98640C2B;
	Fri, 20 Jun 2025 06:25:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9688EE2
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 860E160EF4
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9e-GzCBWbZ0L for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 06:25:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7D9660770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D9660770
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7D9660770
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:25:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1867A4C2461
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:25:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50750)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uSVCC-000000000yP-0Me4
 for buildroot@buildroot.org; Fri, 20 Jun 2025 06:25:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 20 Jun 2025 08:25:51 +0200
Message-Id: <20250620062551.20738-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750400752;
 bh=h0zB75vzr0TvdwRVmzkebVvRAmdyRT2ejzyUGykjkmg=;
 h=From:To:Subject:Date:From;
 b=cTkdEWFGSNUdBBjwDQ0jAPeYtoT0DTa62oZUYSAthqQtv+KTFDZUxiN+e+5xBLyfw
 eNZIbDujTVHJfkfE6+QM6MoD8YjiVOslNi2uRiggeroW+ANa6mVpr1iiZ0uKVt0Np8
 qf2INQO0cUcRhwb2l6XXgAEm3dsgfARB2Kwf7UN4h/Efamy5pPnwn5iOfArsvy/kzg
 3hRSyvxigVY2pnrJ8DDjgJSvQSTaeMSjMWaj/++40c9Gl9K3qIChf9P+W3NO+00ldD
 PC6PyYKYp7YsvIsXRJHHnRoWSyHAa0dbE3EjQ0w/QfI/GlXLtI2/2GqNccCjV44BOF
 RZN4hpcuS6SMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=cTkdEWFG
Subject: [Buildroot] [PATCH 1/1] package/libcec: bump version to 7.1.0
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

Changelog:
https://github.com/Pulse-Eight/libcec/blob/master/debian/changelog.in

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcec/libcec.hash | 2 +-
 package/libcec/libcec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index b019f53a5f..ad6da123b2 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f9e57ae9fad37649adb6749b8f1310a71ccf3e92ae8b2d1cc9e8ae2d1da83f8  libcec-7.0.0.tar.gz
+sha256  7fd60dfd25b0b116c58439bb70158c1d5fd8fd492ad2a1a3b39b826bb50b54f6  libcec-7.1.0.tar.gz
 sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index a45f074c30..e5c3453689 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 7.0.0
+LIBCEC_VERSION = 7.1.0
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
 LIBCEC_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
