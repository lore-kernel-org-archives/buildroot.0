Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B32ACCD194
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 17:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 508AD60F0E;
	Wed, 15 Oct 2025 17:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOiFQ5-s6BTv; Wed, 15 Oct 2025 17:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7957A610EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7957A610EF;
	Wed, 15 Oct 2025 17:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B13AD4C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3138610EF
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m36pAXZnzjl8 for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 17:08:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5263660F0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5263660F0E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5263660F0E
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:08:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E62E7A4C6B6A;
 Wed, 15 Oct 2025 19:08:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44850)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v94zN-000000001UY-0xmA;
 Wed, 15 Oct 2025 17:08:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 19:08:37 +0200
Message-ID: <20251015170837.1887771-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760548117;
 bh=Or7MQG0G96VEWqwqCFzgjyUzyNUSKLIU/tvD9hiyshQ=;
 h=From:To:Cc:Subject:Date:From;
 b=mqh3zSK5w8CGdnwu6Bm1nkOtEPgi0SdF5+hhYpysiRZGevlUo7bvqVKxAjg+K8U3n
 p2P4VZQVBGOAw51nshodx+DZH6ERN8pHYeBggEtIouFMpPLicrGfJsnsEoRf+FTAPG
 h7cmCKDl3zeNoCOfCqCb4xUBWMPf3Kxps8OLIGodKNMHou1sKr7Nj8wAT1e5z9BSMW
 4MWoffuNimmWWcO3F/zpGhfyioRnhRMJnNh/uYNRrDuop8OwXZXS1J7thljp6aj5O+
 ZyNwxn03iaLMfZNGc7libKuBJRYDgab5ZmQmm1rRI1ChB2gZNIkH0EXaIgUmDBF9Bx
 eJk94+AN92mSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=mqh3zSK5
Subject: [Buildroot] [PATCH v2 1/1] package/python-automat: bump version to
 25.4.16
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/glyph/automat/releases/tag/25.4.16

Switched setup type to hatch following upstream commit:
https://github.com/glyph/automat/commit/643f7ce4ff0dfbe0269d57e0611b24fd5a149d93

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Switched setup type to hatch (Julien)

 package/python-automat/python-automat.hash | 4 ++--
 package/python-automat/python-automat.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-automat/python-automat.hash b/package/python-automat/python-automat.hash
index 4edc9f3f09..562c15dc63 100644
--- a/package/python-automat/python-automat.hash
+++ b/package/python-automat/python-automat.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/automat/json
-md5  c023f8848366053a76f99cffba3ea34e  automat-24.8.1.tar.gz
-sha256  b34227cf63f6325b8ad2399ede780675083e439b20c323d376373d8ee6306d88  automat-24.8.1.tar.gz
+md5  a725256be8545c32048eb12239caeebb  automat-25.4.16.tar.gz
+sha256  0017591a5477066e90d26b0e696ddc143baafd87b588cfac8100bc6be9634de0  automat-25.4.16.tar.gz
 # Locally computed sha256 checksums
 sha256  b2201301678d0a937d938543827ca1360712eb34e23de8ee3f3bfffbd4c0e376  LICENSE
diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index 85bc890fc5..807846b4af 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_AUTOMAT_VERSION = 24.8.1
+PYTHON_AUTOMAT_VERSION = 25.4.16
 PYTHON_AUTOMAT_SOURCE = automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
-PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/8d/2d/ede4ad7fc34ab4482389fa3369d304f2fa22e50770af706678f6a332fa82
-PYTHON_AUTOMAT_SETUP_TYPE = setuptools
+PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/e3/0f/d40bbe294bbf004d436a8bcbcfaadca8b5140d39ad0ad3d73d1a8ba15f14
+PYTHON_AUTOMAT_SETUP_TYPE = hatch
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
-PYTHON_AUTOMAT_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_AUTOMAT_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
