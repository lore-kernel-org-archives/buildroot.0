Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08439C83F07
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 14:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B595C61448;
	Mon,  7 Jul 2025 14:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yvJonJl8gsT8; Mon,  7 Jul 2025 14:15:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC5F9613F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC5F9613F2;
	Mon,  7 Jul 2025 14:15:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D853912E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA5AD81C58
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCZsZEWw0y65 for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 14:15:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC35A81CBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC35A81CBA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC35A81CBA
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:15:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 771433807; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 07 Jul 2025 14:15:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uYmd1-00Fpu6-1k;
 Mon, 07 Jul 2025 16:15:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  7 Jul 2025 16:15:29 +0200
Message-Id: <20250707141530.3774427-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=uYXyHQlxoJNUzsmGgPE/56kkHKuQRQOs++eYTv7PA8b8CzwEvTM/LI978znx6iE2oOtEpBOAvJDnZ63pPuiw8Y54V0U36UQg2akBaJA3anchQkt6NTVAlyHTOUL2M7FeLYRUhxKC0jiMVZsNL84xyo5q/RN0XahK4oKaCJQncyw7Q3nSWTJ5kkG3ETUvsAHhDRleq2FuRlbN1iXSQe+TOTg8p3q5BCfm3ZvS06MH8XHSVLiOPMYspUZdMuAipGzpHbwR/19ovF6RX/7N1HtdYPwcWEMNzPxzbW2PfgcDNdLHihksf37jXIIRCgpgajscFdv1x2iSQx3nwiZF2H2NkQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=x2yZPFG3D0FEGMhSJSswrKUIRLxx1d0hZo3aKREUE5Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=uYXyHQlx
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/libconfuse: use current upstream URL
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/martinh/libconfuse/ now redirects to
/libconfuse/libconfuse/, so use that instead in .mk and help text.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libconfuse/Config.in     | 2 +-
 package/libconfuse/libconfuse.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libconfuse/Config.in b/package/libconfuse/Config.in
index b96b8f2811..ee55409010 100644
--- a/package/libconfuse/Config.in
+++ b/package/libconfuse/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBCONFUSE
 	  environment variable expansion, functions and nested include
 	  statements.
 
-	  https://github.com/martinh/libconfuse/
+	  https://github.com/libconfuse/libconfuse
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 76123a7e6b..fff684a55b 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -6,7 +6,7 @@
 
 LIBCONFUSE_VERSION = 3.3
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
-LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
+LIBCONFUSE_SITE = https://github.com/libconfuse/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_LICENSE = ISC
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
