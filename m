Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85699CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 09:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC613408E1;
	Wed, 20 May 2026 09:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SH_P9bHUiYUh; Wed, 20 May 2026 09:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EE0A40819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779269065;
	bh=ONycHm8BibT42U7geAooqCprqbrwy0925gYQW9aJSjw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GtG3kxhA3q/84AwM0adEufM+LU9MkUBgTc72vYyLhEV+FOWUZjnaso4bW3LdlikE8
	 hjM+wW4AF9g+BaLe6mfrvXxR+CX5zzE7AgrMOZg6ZQSyBKBKzow51YEN1KHz3pRr4b
	 1MqzJQCfrmUKM/+1xj0HuOgRdV8uPPRNhETAkGcqZy7+w/YpnY9MxQvLAIH1SbSxsE
	 6rt/1jTFwnjwsiyVLHcJMVWqvtU1Z0DpqNfJKufOl5Hi3AB87e/c2ZeQaPpXrlsVNe
	 cjAl/vKyGfdAb9FxQWEAFqMljMO40Yx4SsQ1IlZ6lai11d4m8TKTBiuI+C5Dw+fMfB
	 kj3bSVmaad3Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EE0A40819;
	Wed, 20 May 2026 09:24:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBE5F1B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 09:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCD5240776
 for <buildroot@buildroot.org>; Wed, 20 May 2026 09:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW3nJ93Y8fS9 for <buildroot@buildroot.org>;
 Wed, 20 May 2026 09:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5E5B400B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5E5B400B7
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5E5B400B7
 for <buildroot@buildroot.org>; Wed, 20 May 2026 09:24:20 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id PdA1wQfMZJWrEPdA1wngf9; Wed, 20 May 2026 11:24:17 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 20 May 2026 11:24:15 +0200
Message-ID: <20260520092415.665898-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAvnXX7Uczij0U03x0aNwLgCui4tUIkyM/Jz/Et81gYUIga2A9T6kuwXxYJysC2gyNWmpUpE1lz7yMCurZbzhPkHlV1sQRYaUBnG/WI6wuSeOL9/Bpww
 e97pRAw8+HPHyMiz276m7ntwrhotXZY+9HrpB3V5nE2BVQ7tp353E/WfGjdTtKRn6Y7qdx2y9yMvR2BIVFA394iZTeMuKQpTPe3ab8f7ySQ2I+rsIi3uu4Cq
 gwgDacDK1msN1Ct/lQHUp14Rjb3+1oOeYeO2pEnfH1U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1779269057; bh=9tb9plT473r4IvNg6brAHAxQJc99UPl05LeCCenwwGU=;
 h=From:To:Subject:Date:MIME-Version;
 b=EypbzrI3wLud1u+U1hhTbuDOV4MiUhpBtsM/Wb3t+oKZhO8BuaFC6lIKPa/p2bTvr
 DFc5Jg/LrxDIyRMYdN06yMND3jSNBXP3FVPvkCp1AklUzvcu1spw0Nm5MF3bzgcavW
 lByPOnf8nWosX9hJcOowAUvSPSHCUrbf7siiEI6ykwU0nQ5GlaUjhS32cAY8+R/JR+
 jcgxfBfvEG0aycKOMc+v42alE2tVD+dGpImvmy+pILuvBj35OaSaGT6QZMbBt3eRJX
 yp8OpNKWffLJSpKzaDFJtQ7Pn8Hr6bv50q5qqrTteMlDZHAM7rtXPKJuOPfjay9Ofz
 iyCz7JKvvDlUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=EypbzrI3
Subject: [Buildroot] [PATCH] package/bind: security bump to version 9.18.49
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
https://ftp.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.49/doc/arm/html/changelog.html

Fixes CVE-2026-3592, CVE-2026-3039, CVE-2026-5946, CVE-2026-5950.

Fixes bugs:
GL #5804
https://gitlab.isc.org/isc-projects/bind9/-/issues/5804
GL #3589
https://gitlab.isc.org/isc-projects/bind9/-/issues/3589

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 7b268a49b4..b719012de7 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.48/bind-9.18.48.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.49/bind-9.18.49.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  c742a69bff2561c23099d7c70c6984c145bcca1c1e3c67fac1f68a8132e8e7c5  bind-9.18.48.tar.xz
+sha256  c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24  bind-9.18.49.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 17ea50c5f4..6c0d2f8a03 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.48
+BIND_VERSION = 9.18.49
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
