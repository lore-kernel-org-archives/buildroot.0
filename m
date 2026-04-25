Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C158FF885C
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 08:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38DA260DBC;
	Sat, 25 Apr 2026 08:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtNUfPzbzn-S; Sat, 25 Apr 2026 08:09:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F58B60DBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777104589;
	bh=N5PTW9+D4sbgAtRXROouwbrHTrFkW+NfcnuQPAL3fiA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c1nK3V5PXMvHKfN7iH9jn8sO3k+1zmuI7s8RDibOgIIDIwxbxBIFK6LpGwfC8pm90
	 8b01h6UVYwh/HBv9V2sojE8c647sHp2azQF/VfBVaGMdD8eIWS04DGZYZFQC+oAxIN
	 hCQUX931iA90bX2hvcMxPo/Qy6ckdnk1AwBZq7hapGAkvvs5t5Z3aHk4grCpJWFXeO
	 fbtM2HvNTyN/eYplJ6zH8BOW3xfqDDFE894/2fkawlltLJm5+hBDnytCg3gEJbDP5E
	 TETM05ifnbzR20Y+18N3IcrEZ/zvDXFwJUXogdClcX76TquA10pKSwhxbwQdQMxXhO
	 Bjq8IDo4gTUPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F58B60DBD;
	Sat, 25 Apr 2026 08:09:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 807492DF
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66CCF411BB
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W83JBsvEeHlm for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 08:09:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04073411BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04073411BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04073411BA
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:09:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07a9.dip0.t-ipconnect.de [91.58.7.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B445FA4C0432;
 Sat, 25 Apr 2026 10:09:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40604)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGY5A-000000001cC-23b7;
 Sat, 25 Apr 2026 08:09:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Sat, 25 Apr 2026 10:09:44 +0200
Message-ID: <20260425080944.790046-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777104584;
 bh=fDBuy2JrQFrLi13IMI9vuVt/YY0bIYT/eikscz+B5hI=;
 h=From:To:Cc:Subject:Date:From;
 b=vNoY5YvW3la4daVNtl4wYrtawUeDYGqeEFAVxl+zvyu7htPme0mrAiLbj04wbww/x
 Jp1efkBSftem11+9zf9Bt9aC8G4X04CQtDWK6b9bdES17HBB7QdCadx0dvEwMPzVBb
 PMzaReyVsNn5X7nnnTCxvcayh3z/TyplsFWOMXQqxWYYQG+qH/0BkWB3D+3tE/R8ke
 wC6TBDxzkxDQUfiKkRcZnRlOpe7gkmS+qBGLQUCCcfZ2ALCYH6ksaOd9XYShFKi4nd
 713qGjUgPZm8B5ZzNblnQrbEYSAIfJmOPrIh5jGnoxdzKXmFjnZbdgPwsq5SQYvWGG
 oFfci+FCqlYnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=vNoY5YvW
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 22.1.4
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

https://discourse.llvm.org/t/llvm-22-1-4-released/90622

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 282bca63f7..eb3775659f 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.3
-sha256  2488c33a959eafba1c44f253e5bbe7ac958eb53fa626298a3a5f4b87373767cd  llvm-project-22.1.3.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.4
+sha256  3e68c90dda630c27d41d201e37b8bbf5222e39b273dec5ca880709c69e0a07d4  llvm-project-22.1.4.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 6f12cbaa58..1aa02e0800 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.3
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.4
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
