Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28B2C83013
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 06:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73940409E6;
	Wed,  2 Jul 2025 06:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FH6Uy4u8l23R; Wed,  2 Jul 2025 06:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D8B40995
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D8B40995;
	Wed,  2 Jul 2025 06:36:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17971128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 06:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F22F960A44
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 06:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryQjyU7XBotG for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 06:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF4A360A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4A360A9F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF4A360A9F
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 06:35:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1555091226; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Jul 2025 06:35:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uWr4Q-008nJK-21;
 Wed, 02 Jul 2025 08:35:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  2 Jul 2025 08:35:49 +0200
Message-Id: <20250702063549.2096156-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iR+h1o72vohUoNh1Q4Xverd9LpFOn6iu3vn7OOjIwojeVcAcbgmNzPY0opxZkuK+QjfI1bGVmaVF0DQsLA6TQBVMiqZU0Ip2ybAhSIrMmsjClxmuCvJ4HMLd6a6S/kG+t2DiPHzYmej/G/UeL9g9579gRZ7uyGiz9tD+a+x54CRHsVhh5h3WJLXNb89RucNCvs5CWghp0FGQPygLnG9zNOL78dPZ2nBcmBt8JlI4DlfUbpAgVgl3qkJvZfXK46CdAR+XpFZFN64KG4NM8zeC0SUx9piDgmzvYTdgvckdTpD2tA9Y16SgqSKXmOlkOl0ExzrfkOmHX+iXUXfgXdrZEQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=QlFvd3EmRCyMFHs3dR1U3lNNdBiG4YEZC+bfZxIE6Fs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=iR+h1o72
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/sudo: security bump to version 1.9.17p1
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

Fixes the following security issues:

- CVE-2025-32462: Sudo before 1.9.17p1, when used with a sudoers file that
  specifies a host that is neither the current host nor ALL, allows listed
  users to execute commands on unintended machines (since sudo 1.8.8)

  https://www.sudo.ws/security/advisories/host_any/

- CVE-2025-32463: Sudo before 1.9.17p1 allows local users to obtain root
  access because /etc/nsswitch.conf from a user-controlled directory is used
  with the --chroot option (since sudo 1.9.4)

  https://www.sudo.ws/security/advisories/chroot_bug/

Update the LICENSE.md hash for a change in copyright years:
https://github.com/sudo-project/sudo/commit/30729312c2091f3891daa39b571efa40cb261785

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.hash | 4 ++--
 package/sudo/sudo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index ed4e527f36..3bbce74cbc 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c  sudo-1.9.16p2.tar.gz
+sha256  ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32  sudo-1.9.17p1.tar.gz
 # Locally calculated
-sha256  a6e4ec823f2ba58f840b0ff5fc5459e4893f46a91bbcd6b2a2d91315de5a2d2b  LICENSE.md
+sha256  41eb34d6b184c2638d6d32c6e7f70b8dd6423e68b91da959e0cf773aa01f62d7  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 1fe713ab2d..4e1405eaf1 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.16
-SUDO_VERSION_MINOR = p2
+SUDO_VERSION_MAJOR = 1.9.17
+SUDO_VERSION_MINOR = p1
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
