Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81295D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4056F822CF;
	Sun,  7 Dec 2025 14:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ql5wuvvlzFkp; Sun,  7 Dec 2025 14:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 242DD81178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117618;
	bh=ZF8xtz03wS/mBHvuYkgLxwaNYhITa+OzJ4FVnH+oc70=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M0KLNJK6loe6mXi+89jt3w7sRvhxUqQ2yM3M4Q1C8txjtanEMY6U+xvw2RtP92/m9
	 llCjSQcnf9E9D29cFsLK1ATGAj2nZSmuHZvwyPMOtS6ScObyvwkAeuLF/aMMdnmtsA
	 LA4fasnhGcTPoS3HWlk4MAsc2T8fAvI1zKOoLgDhPMU0WtFPX7wtE1/8IhWFMzi01V
	 hBt49qQiNIrqs7FdmGNaQumrvNE2GihA5WN/01ChV7VzdzdysmPDujKhP6s1a2DUTs
	 lkUBaoM5Nh4iruW55oY/2QNxKwKvfxfiagyh8nPeZB94xulRCOQRjEd84+P3H2LT1R
	 izWFBZzXynDTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 242DD81178;
	Sun,  7 Dec 2025 14:26:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C321FE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A960581178
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycmGdKuLXxG7 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E50E381119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E50E381119
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E50E381119
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:26:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B49B3A4C07F4;
 Sun,  7 Dec 2025 15:26:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFis-000000001Fk-3zJO;
 Sun, 07 Dec 2025 14:26:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:38 +0100
Message-ID: <20251207142651.3695074-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117611;
 bh=4w6ZKyy+g7y8Styxob3zmKneUEJpEJSl+z/lfuNxHG4=;
 h=From:To:Cc:Subject:Date:From;
 b=vs5PsEBE3zLrVG7W4K5Zsyx6Rz/1VQG7PRkLanBSZ4svXxHTYqDhgKL432laNhMno
 1nr3D2zhNBrVQ/kI/8Irn+Zjv/EagKBCxXBEK+ZatYN16Cr6QjVXe1XAS1o7zI3+WW
 bQkQ4XlbfwCqGjQUTxvF1VdfHjX4rejLQeE+2LxJOzH5qRMqu1b3+yfRKo0nRJYMg5
 bqv1OOcatjbPtBh31IlR1vlL324qsAOECoICetnXux0l8xWuTzEKe4RRs5a9kICA7M
 SkXKVO1xsSwMVFHHJ58FSAfnVdHPWkOz8qWR1+4eh1O5VyqxdNwyDX7BzRQDXYP14t
 n6oUZQKnqfVfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=vs5PsEBE
Subject: [Buildroot] [PATCH/next 01/14] package/pulseview: fix cmake 4
 compatibility
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ate-version-range-from-2.8-to-3.31.5.patch | 38 +++++++++++++++++++
 ...t-Fix-the-version-for-the-manual-too.patch | 26 +++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 package/pulseview/0004-CMakeLists.txt-Update-version-range-from-2.8-to-3.31.5.patch
 create mode 100644 package/pulseview/0005-CMakeLists.txt-Fix-the-version-for-the-manual-too.patch

diff --git a/package/pulseview/0004-CMakeLists.txt-Update-version-range-from-2.8-to-3.31.5.patch b/package/pulseview/0004-CMakeLists.txt-Update-version-range-from-2.8-to-3.31.5.patch
new file mode 100644
index 0000000000..2233887ab5
--- /dev/null
+++ b/package/pulseview/0004-CMakeLists.txt-Update-version-range-from-2.8-to-3.31.5.patch
@@ -0,0 +1,38 @@
+From c0676b3493fda29d97c271cfeb76267019b35695 Mon Sep 17 00:00:00 2001
+From: Soeren Apel <soeren@apelpie.net>
+Date: Thu, 15 May 2025 16:38:53 +0200
+Subject: [PATCH] CMakeLists.txt: Update version range from 2.8 to 3.31.5 to
+ avoid abort
+
+The error with CMake 4 on the github CI looks like this:
+
+CMake Error at CMakeLists.txt:22 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: http://sigrok.org/gitweb/?p=pulseview.git;a=commit;h=c0676b3493fda29d97c271cfeb76267019b35695
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to 0.4.2]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ec86073d..8580fa8e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -19,7 +19,7 @@
+ ## along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ ##
+ 
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 2.8.12...3.31.5)
+ 
+ include(GNUInstallDirs)
+ 
diff --git a/package/pulseview/0005-CMakeLists.txt-Fix-the-version-for-the-manual-too.patch b/package/pulseview/0005-CMakeLists.txt-Fix-the-version-for-the-manual-too.patch
new file mode 100644
index 0000000000..8c7518dd6e
--- /dev/null
+++ b/package/pulseview/0005-CMakeLists.txt-Fix-the-version-for-the-manual-too.patch
@@ -0,0 +1,26 @@
+From e2fe9dfb91c7de85c410922ee9268c3f526bcc54 Mon Sep 17 00:00:00 2001
+From: Soeren Apel <soeren@apelpie.net>
+Date: Thu, 15 May 2025 18:19:24 +0200
+Subject: [PATCH] CMakeLists.txt: Fix the version for the manual, too
+
+Upstream: https://github.com/sigrokproject/pulseview/commit/e2fe9dfb91c7de85c410922ee9268c3f526bcc54
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to 0.4.2]
+---
+ manual/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/manual/CMakeLists.txt b/manual/CMakeLists.txt
+index 3b881a56..d6c54d61 100644
+--- a/manual/CMakeLists.txt
++++ b/manual/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ ## along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ ##
+ 
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 2.8.12...3.31.5)
+ 
+ # External dependencies, required and optional tools.
+ find_program(ASCIIDOCTOR_EXECUTABLE NAMES asciidoctor)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
