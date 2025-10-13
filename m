Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5A0CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E04B413E4;
	Mon, 13 Oct 2025 18:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zen_iu1UVeLd; Mon, 13 Oct 2025 18:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F28E413E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F28E413E6;
	Mon, 13 Oct 2025 18:48:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 073691C9
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E13C482F51
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHf47aww9OE3 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F110582F4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F110582F4F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F110582F4F
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:48:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18301A4C6880
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:48:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42548)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8NaT-000000006KE-1zIC
 for buildroot@buildroot.org; Mon, 13 Oct 2025 18:48:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 20:48:01 +0200
Message-ID: <20251013184801.3617084-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760381282;
 bh=r56UBrRi6p8laIbK/DZA2l3ShvP+rDzCqpNB4o7JbJo=;
 h=From:To:Subject:Date:From;
 b=YW8EzAg3Qpo59V3YgqN+lxlk7dzOJD3CD3uTWolmggoJHW3CbRom9SLB1d0QnSo0J
 0+jTOxa/+ss1LIDb3TdCpXwLVyYi7DNrJmkWnZTAUFtaKQd1e8CXOvVEa9Z0EAjNQZ
 fn+gCjVCIoxwunHocdb2Wc7WI7F+za1J8EjnIEdjnQ1H+LlG7sEIeLc8hm+rHCrYoe
 M9MMZ9VLWKS2ESlSAH0i4lxp4N0b2UwuJl9hGc3yTr79Yg6wzHOKgQMumkYt3fB0/G
 k5olOENeFHceo6FcEw5t9PUqVU4sT7KPS0bCqbNS9D9p3QiV95Pp8vMTvsapwv+o5o
 TCtVhXLweupJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=YW8EzAg3
Subject: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: bump version to 2.2
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
https://lists.x.org/archives/xorg-announce/2025-September/003631.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/igt-gpu-tools/igt-gpu-tools.hash | 6 +++---
 package/igt-gpu-tools/igt-gpu-tools.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/igt-gpu-tools/igt-gpu-tools.hash b/package/igt-gpu-tools/igt-gpu-tools.hash
index 76e538e78e..fb4b702549 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.hash
+++ b/package/igt-gpu-tools/igt-gpu-tools.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-June/003614.html
-sha256  bf72beff71093db692f386c9359b557dfa8e8c45250439c952564b1b6fe343f8  igt-gpu-tools-2.1.tar.xz
-sha512  401e9912044e2d37cc581cf01ba03b4d14c2e685e28c4764cb544c481291c6ec36cb90beaadb51537ba7cc8dc33d4aa7139dad91b4484ae0b718cbe19c1a987e  igt-gpu-tools-2.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003631.html
+sha256  88178558b352a5e8a287954cb2eef05d775aedfacf43b88251509ea014b6182d  igt-gpu-tools-2.2.tar.xz
+sha512  20032b90e397ca73f9f8f5b453034fffc09e28372adddebd1a71b1323235e3e379bf452d5a4dd76b895e4c47df67595051c16b8a1488249e5aae946f6a35258c  igt-gpu-tools-2.2.tar.xz
 
 # Hash for license file:
 sha256  1b7e266857b05808660f42369a4a797459d7b7bec7245e378aa28a8db2f213da  COPYING
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index ce8ec5d1b7..e172d41a21 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGT_GPU_TOOLS_VERSION = 2.1
+IGT_GPU_TOOLS_VERSION = 2.2
 IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.xz
 IGT_GPU_TOOLS_SITE = https://www.x.org/releases/individual/app
 IGT_GPU_TOOLS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
