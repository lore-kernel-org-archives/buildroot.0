Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C243D5CC8F
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27BAF80C5A;
	Tue, 16 Dec 2025 09:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUK2P6ePEIME; Tue, 16 Dec 2025 09:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9035080B78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765877372;
	bh=c117rpsv/pzveewTCDzDWjHEhMYtuaTR+TyYn4A1G4Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NuctsNb6X+8NVx+NyoN32M8fApWM1lgPE/OB5SipoefBWlqZfU7+QHEBReDCX1L9y
	 XFj9wQ0YwjP0rRaajs/KgnDjsCnAU7TiC/6wsNBo9Pd0rEnYNQ6mAWkR26G3TuMd7P
	 lwZt60WKrN7pKI53H2G23adWi1VYurO0pHexLqoGTAICRpfkjTlTAsI/37vfE1S63e
	 ci6goYcDqBu2K0rTt2S5BALJtOrLswW/uAfgslqeBzWRD9AsFfA+T8LgGh7UexnoVl
	 pFec3wgbnXmzkesE5CClcdSwOpQXKIjcOJc41RrGLAb5oEQDn66sSXBOtCg1RiuVs4
	 xInpkGaU2JmfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9035080B78;
	Tue, 16 Dec 2025 09:29:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9BCE372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F8C160F23
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0NXm7uX_mwm for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A181D60C29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A181D60C29
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A181D60C29
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:29:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EB088C19D30
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:29:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 487E86071C
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:29:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1634F11943287; Tue, 16 Dec 2025 10:29:24 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Dec 2025 10:29:15 +0100
Message-ID: <20251216092915.1354213-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765877365; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=H8jCmvNcNmp9Sir+31dBEY9Gvrh9Hhgs0QAqC8mkNEA=;
 b=Xn0h+vK+81yaAeQFIaR6SfnUg4ur100eztAPSLM4+QqUu8GgjaN/ZkvTPi+uvNam36RmIR
 h9oPX97+RY4SbjuLnKldPk99oMtjJA7o6k+fLZdVXfFcaCaE1LIjO3K0/dvHTv57RqZM9T
 a+sBAszOpdEb5+Z7PEJzTc9uqKthTJO4kW5uzPmzx0TzK+BY1pALRrEsg0wvVm5i+Ep/Kn
 qPVNpH/tF1hvClRVf0m1i0wvRyHF4h/WHHjv/bLZuE5LQpg9nWNi7LAMey7CJwlAXa0Us+
 dWYz9M4L6t801V7jc5SPBleUspuXoEPCEybv03L8sR/DJfSah6mPBmoNkzpAcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Xn0h+vK+
Subject: [Buildroot] [PATCH] package/libcuefile: fix build with CMake 4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

  https://autobuild.buildroot.net/results/b92211c11edcbf4a0c5abe823e0deaa14133ae89/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Upstream is completely dead, no commits for a very long time, still
using Subversion. Another option is to just drop the
package (libcuefile, musepack).
---
 ...akeLists.txt-fix-compat-with-CMake-4.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/libcuefile/0003-CMakeLists.txt-fix-compat-with-CMake-4.patch

diff --git a/package/libcuefile/0003-CMakeLists.txt-fix-compat-with-CMake-4.patch b/package/libcuefile/0003-CMakeLists.txt-fix-compat-with-CMake-4.patch
new file mode 100644
index 0000000000..c1858f3fa5
--- /dev/null
+++ b/package/libcuefile/0003-CMakeLists.txt-fix-compat-with-CMake-4.patch
@@ -0,0 +1,35 @@
+From bf7598c2f5a40d16f16a9649bb6415c3594c0a45 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 16 Dec 2025 10:26:49 +0100
+Subject: [PATCH] CMakeLists.txt: fix compat with CMake 4
+
+Fixes:
+
+CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: N/A, dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c1e4a8b..96bf5b4 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.4)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
+ 
+ project(libcuefile C)
+ 
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
