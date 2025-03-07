Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103C3C19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 15:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3141605E9;
	Fri,  7 Mar 2025 15:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TL0dCucHI7OU; Fri,  7 Mar 2025 15:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCB9E60754
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB9E60754;
	Fri,  7 Mar 2025 15:39:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FF04944
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 15:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42FBF81F59
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 15:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cktCFhmPkVbR for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 15:39:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=208.88.110.44;
 helo=mail.savoirfairelinux.com;
 envelope-from=luc.beaufils@savoirfairelinux.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F5E782052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F5E782052
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F5E782052
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 15:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id DA9E29C4038;
 Fri,  7 Mar 2025 10:39:17 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id qKSsDqbCEjd4; Fri,  7 Mar 2025 10:39:17 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 7908B9C89C2;
 Fri,  7 Mar 2025 10:39:17 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7908B9C89C2
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id umnxP49bkWnH; Fri,  7 Mar 2025 10:39:17 -0500 (EST)
Received: from jean.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net
 [80.15.101.118])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B2E3F9C4038;
 Fri,  7 Mar 2025 10:39:16 -0500 (EST)
From: Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>
To: buildroot@buildroot.org
Date: Fri,  7 Mar 2025 16:38:53 +0100
Message-Id: <20250307153854.2597393-2-luc.beaufils@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307153854.2597393-1-luc.beaufils@savoirfairelinux.com>
References: <20250307153854.2597393-1-luc.beaufils@savoirfairelinux.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1741361957; bh=kofI4KrmkA6ThI8GtK4eyvzUCrDA0rOdTMmylIPgOKA=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=NNvYdiXf8GhuD+Qmmw04ErA5Hq3Jis3IvvDSKl8xf7eZ7KSZK+kNwimsA3M61WV6T
 CervhyG63MrfD/dm9bJ31dPmuGrwnvPqmOB+2ok1JA5lJYwisXf5hZC+DSsPIuAyM8
 za12dE5mRtiRf5vuP/ARAHZimJNh193gv9MLBhgZOuVAceFvbGvEQGkHrEgZqD44a0
 RoN4f8Bz2bSltIp0qLm5EJMcBmXaaMRC3TOvdl9Gv2TmAHY3LV5eEy/o1OP2oUceVg
 mIhbvCaRB8u3KPmIbRLDBYlvGzbuBTUQwfta1O5PjwdEKfoKaJ1H1+x+9PjDe4vk4C
 Ty8V8YzwqAiBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=savoirfairelinux.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=NNvYdiXf
Subject: [Buildroot] [PATCH v3 1/2] package/byacc: add new package
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
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
 Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Perrot <thomas.perrot@bootlin.com>

This package provides a Berkeley LALR Yacc parser generator that is
required by the i.MX Code Signing tool.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>
---
 package/byacc/byacc.hash |  3 +++
 package/byacc/byacc.mk   | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/byacc/byacc.hash
 create mode 100644 package/byacc/byacc.mk

diff --git a/package/byacc/byacc.hash b/package/byacc/byacc.hash
new file mode 100644
index 0000000000..d2ad441df3
--- /dev/null
+++ b/package/byacc/byacc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749c  byacc-20220128.tgz
+sha256  654a231fe9cd4d36e580214962fa777a1df0771d6889cfc74d19a3d414f14711  LICENSE
diff --git a/package/byacc/byacc.mk b/package/byacc/byacc.mk
new file mode 100644
index 0000000000..7ca620b425
--- /dev/null
+++ b/package/byacc/byacc.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# byacc
+#
+################################################################################
+
+BYACC_SITE = https://invisible-mirror.net/archives/byacc
+BYACC_VERSION = 20220128
+BYACC_SOURCE = byacc-$(BYACC_VERSION).tgz
+BYACC_LICENSE = Public Domain
+BYACC_LICENSE_FILES = LICENSE
+
+# To rename the binary byacc instead of yacc.
+HOST_BYACC_CONF_OPTS = --program-transform-name='s,^,b,'
+
+$(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
