Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5118F10AB822
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 21:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E514009B;
	Thu, 26 Mar 2026 21:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tu-hyPBRpGj0; Thu, 26 Mar 2026 21:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3437F4010D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774559779;
	bh=u5whri2noglgTAI6kEb6vwLqHfHiFSwV1fph2cfkjdw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zyh089MRf0Omg4LDpp+khefq+FzasnKAlTcTdn2FGcFFOHKnHEJHFQPh0mie1TeHp
	 iyb8O2h/0Xjeb8KkH94YCYH4epyeMg5YgDCMvjkRhp9FhWBBjt7y9yrFVSr+vVFOx9
	 RPxwb1Wc15W6nOOhnyGLx/2YGNbjznnXGMEpeVYUFfBChTWQij9B00FqMGHn+lmHSi
	 Avtq+79jW/xgVKdtznTi325xH8eS+/LREwgopAWGt0QlzqiF9x1NLEjKD5sJ+zTz2N
	 RkTV09HodMZx8p7lFifMSXSeET1CDEf0XyWqHi76kzGvz+3/12gZaq4sc3eAjIXVi9
	 6Yuq6BkWGmvyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3437F4010D;
	Thu, 26 Mar 2026 21:16:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1FEB2D5
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF30460DE0
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1ua_-nh7yrK for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 21:16:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC03060C24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC03060C24
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC03060C24
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:16:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c201.dip0.t-ipconnect.de [79.214.194.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65030A4C0DCF;
 Thu, 26 Mar 2026 22:16:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47696)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w5s3q-0000000079X-0KRF;
 Thu, 26 Mar 2026 21:16:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Thu, 26 Mar 2026 22:16:14 +0100
Message-ID: <20260326211614.3598784-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774559774;
 bh=Mo7GDY8z3KcVnDFPEG7T8lt6NvT7Jzk8Xu6vAL/nZGc=;
 h=From:To:Cc:Subject:Date:From;
 b=bpUC819QS/dDtAI3LBM51skXuljPyJkZ8yDUXnuuDvIGFu89civ82DK6kt3cxD2N5
 ssZfoA76sPWogDjVuuAXBlpOwXK4fj9AFg3IQYaOImjxm0mbgF6j53FECWdpqBBbKQ
 A/ceynGZMpPJlbBC8EZmpUzvWzoLdPTLCKy0z0/aHuo2ruq/9XHnGU5ZL5GxNmcfMU
 SiV+nA4w3183hfEBm9x48svDI0jEjg8mZrUw7FUYs4yl8BvCVrFZ3JU5I5AGhkdxgy
 DKvsumCl8ouhq+8vWQVeol30WTF54tf8RjJoesj3ufuwBFOtznYEvIblil/u2XD+Ui
 7BMpWYGvkh29g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=bpUC819Q
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 22.1.2
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

https://discourse.llvm.org/t/llvm-22-1-2-released/90308

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 528591ba09..095dc76dfd 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.1
-sha256  9c6f37f6f5f68d38f435d25f770fc48c62d92b2412205767a16dac2c942f0c95  llvm-project-22.1.1.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.2
+sha256  62f2f13ff25b1bb28ea507888e858212d19aafb65e8e72b4a65ee0629ec4ae0c  llvm-project-22.1.2.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index b358b80e23..becbcc0612 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.1
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.2
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
