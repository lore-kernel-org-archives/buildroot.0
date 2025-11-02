Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA08DCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 12:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8438884A35;
	Sun,  2 Nov 2025 12:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkxW3AtMqDQl; Sun,  2 Nov 2025 12:30:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C33784A43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C33784A43;
	Sun,  2 Nov 2025 12:30:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F897222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7182084A30
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUw8tkhckMXp for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 12:30:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88CCE84A35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88CCE84A35
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88CCE84A35
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:30:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB8A7A4C5F22
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:29:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36956)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFXDb-000000007AK-3WVX
 for buildroot@buildroot.org; Sun, 02 Nov 2025 12:29:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Nov 2025 13:29:59 +0100
Message-ID: <20251102122959.1716666-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762086599;
 bh=DLP4GAq99WrblhTjLzLoRyr2U0boXdNV4jkCMyfn8aw=;
 h=From:To:Subject:Date:From;
 b=rfd3y5lodG5FWH3T69AbAlNVw2JyGopJZwAzazheC74rSQCfyXXBfrlqxw2rwSIBw
 xRw9ZjygDcbd+eh2lIwHhpQ3zltegJCkbZd7gQezN7CYJeTob0ulZ5o339cShE/hRp
 m7WLlFHin+WwUk3K3X+kwUMF5cFaeJrz+8n1baYwsehPy73NPKJ3NRaQN21j9pS6U/
 0d9yKc/rXrKZyGasMlr5RhHHEUOy2FBW1PLpo3COeFEjcSBac488qnc3a6z8fUqHgP
 /HJeczHZlVmmYFSvuXlgwv3uwgE1ZJteN4XvsojyWTV3k/s5b+GWG29l94fxu79CNJ
 4vfhYMHPJUtZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=rfd3y5lo
Subject: [Buildroot] [PATCH 1/1] package/util-linux: Remove -lpthread from
 uuid.pc for non-threaded builds
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

Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped
util-linux from version 2.40.2 to 2.41.1.

Upstream release 2.40.3 contains
https://github.com/util-linux/util-linux/commit/e143539d30fd18afb3ba6d3c6e50a260d4219895
which unconditionally adds -lpthread to uuid.pc causing build errors for
other packages using non-threaded toolchains like erofs-utils.

Upstream was notified:
https://github.com/util-linux/util-linux/issues/3210#issuecomment-3477915953

Fixes:
https://autobuild.buildroot.net/results/582/5827995db2a805e0c8a04fde8498eff6f28aa6d8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/util-linux/util-linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 555a1e74c0..5b58154c09 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,6 +37,13 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
+define UTIL_LINUX_POST_EXTRACT_FIXUP
+	$(SED) 's/-lpthread//' $(@D)/libuuid/uuid.pc.in
+endef
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+UTIL_LINUX_POST_EXTRACT_HOOKS += UTIL_LINUX_POST_EXTRACT_FIXUP
+endif
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
