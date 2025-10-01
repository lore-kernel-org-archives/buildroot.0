Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E06CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71BBE614CC;
	Wed,  1 Oct 2025 21:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDZewx_UGsLo; Wed,  1 Oct 2025 21:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A3E0614D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A3E0614D5;
	Wed,  1 Oct 2025 21:06:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 048171CE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEC4384034
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6HU--eOt9Xy for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B6E784032
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B6E784032
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B6E784032
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:06:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0767.dip0.t-ipconnect.de [91.58.7.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C01CA4C5864
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 23:06:26 +0200 (CEST)
Received: from [192.168.1.144] (port=39502 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v441q-000000001qX-0FDC
 for buildroot@buildroot.org; Wed, 01 Oct 2025 21:06:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  1 Oct 2025 23:06:25 +0200
Message-ID: <20251001210625.2321875-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759352786;
 bh=c/X4ElmShqcBka680JHYwbPPi7QhOFmVVt2oWwjJT/U=;
 h=From:To:Subject:Date:From;
 b=IpZ1S1GAjTc99JsWP93vpI8vx+QWx5LJ5QmryB+C4tJLqnZBA2mkwf8bjrSLxjYu5
 Chx6hwuBc8zjWNaqSMLRNMDvwe8azLRpNUJ8nQ9WjXvk7efbm47EEE/hQrxVuPCqoI
 R53h42JzqQD6kyr3GXRfK5I3UMDAPSPbgxY78WGAez2AEVLPqclky0Em6bPR+uR6vM
 MSLbV6t+4K9jubv9M+PJrPwUWgnekP+ITo4wgARYy2gRJDfdooXaOto1nY3zZ2Ctf9
 HX2kHRawfTmT9VlAoKIdaR2QqfAiGPwGU2gatrK89NReyVmuFOx6Dyj5/ShPK9m+ZH
 RO5YXz6eL98YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=IpZ1S1GA
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index bf1281f818..abe1ac11d9 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  287c875ed08aa9ad8e2b90c209d57ec300ac89b2dfbcefe060a103eaf24dd3f7  tvheadend-0af87f13f786046df7bb610f8a6b291c26af1b14.tar.gz
+sha256  44765f50b16325721e4e6938aa32bdd368d516c94e6985ea3ca1ef6c6bfe75c6  tvheadend-5fd594910abbff1091e11b606124905a1cc92bb6.tar.gz
 sha256  0420f5d2e0df002e31320d9f58fc5454cbb8f53fa0ab1fc85afb8821c6b103e3  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index cd0bb68380..dd3e20c2be 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 0af87f13f786046df7bb610f8a6b291c26af1b14
+TVHEADEND_VERSION = 5fd594910abbff1091e11b606124905a1cc92bb6
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
