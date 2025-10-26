Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42664CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 09:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2B6B40D01;
	Sun, 26 Oct 2025 09:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUoTHdrblAcX; Sun, 26 Oct 2025 09:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CD3840C62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CD3840C62;
	Sun, 26 Oct 2025 09:32:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CAA815F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 09:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62F0682896
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 09:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEEfBZi3V6ys for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 09:32:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5274982893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5274982893
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5274982893
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 09:32:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3A3FCA4C4782
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 10:32:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47272)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCx7L-000000003Uh-0dFe
 for buildroot@buildroot.org; Sun, 26 Oct 2025 09:32:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 10:32:50 +0100
Message-ID: <20251026093250.1042540-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761471171;
 bh=6J9bYtajdcru4E1fCKOtXXSiIeAoU+xUG0trJqikRzM=;
 h=From:To:Subject:Date:From;
 b=KHga/0+pK/JEgToRzRMbKzDEol3rrxVYNP7ZUiMhXb+yzyHYva29k0W4y7yazx9xB
 jXsfIQoRTZ1g6gTAKpm9xuMLczzaluAxPdnZ+ZT++a5YucMFYAjRaikc7Wpa+uoPJJ
 MZiZhijM160bMAmagQBtD4skUf4G9P5Q207uO2lLA9javRPUvRvmDfbwQS+P23Jrgr
 NDpBE4o66zHbLA+8K0SIgEFY56AE87axHQIpfOyKPpEcuC2BBfjACwzI5MWnQJg3OX
 JV2IZurJe5BTCoqybHMfXr88oQbAK8stfe3w1NptoIx74EpNZ9nHlyKctug3m39wou
 9+yy+K5rDJ4iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=KHga/0+p
Subject: [Buildroot] [PATCH 1/1] package/openssh: needs libxcrypt with glibc
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

In contrast to the comment in configure.ac
https://github.com/openssh/openssh-portable/blob/V_10_2_P1/configure.ac#L3621

"# Check for crypt() in libcrypt.  If we have it, we only need it for
 sshd."

libcrypt is also needed when the server build is not enabled.

Fixes:
https://autobuild.buildroot.net/results/9b2/9b2333e40bd4727bcbe23c1949a6b78c59b1dfee/

The oldest build error to be found on the autobuilders dates back to Sep
2024 in version 9.7p1 so a backport should be considered:
https://autobuild.buildroot.net/results/642/6421d8536ea0940e666ac44ddbdbd8afa95ac856/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openssh/Config.in  | 2 +-
 package/openssh/openssh.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 25843447a7..2f9b5fe7ec 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -22,7 +23,6 @@ config BR2_PACKAGE_OPENSSH_CLIENT
 config BR2_PACKAGE_OPENSSH_SERVER
 	bool "server"
 	default y
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Server programs: sshd, sftp-server
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index bcbfc39755..2f800d5eb2 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -46,7 +46,7 @@ endif
 OPENSSH_DEPENDENCIES = host-pkgconf zlib openssl
 
 # crypt() in libcrypt only required for sshd.
-ifeq ($(BR2_PACKAGE_OPENSSH_SERVER)$(BR2_PACKAGE_LIBXCRYPT),yy)
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 OPENSSH_DEPENDENCIES += libxcrypt
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
