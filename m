Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF889E7AD67
	for <buildroot@archiver.kernel.org>; Thu, 25 Dec 2025 21:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B248E406D5;
	Thu, 25 Dec 2025 21:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zr1Zwa5blqRN; Thu, 25 Dec 2025 21:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2505406B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766698393;
	bh=os6TAMVyllaKG67HR3Q6xgowjW/xDbdJyIbQ/a58zvQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=f+Y4LgDe5EEdB9XMLw31uX/mO4KRaOPQnCmcT/PNyGBb1EObxZhWkNM56GuZXUl5r
	 ABrfepV3rQVeMvZ0EiYjmpaxOPD9lxKYBhvtoyjfoRnaXvbzSOFVjMoFaD8ajZLAIQ
	 rBZPQ2amVmyw0yOY7s8xjUiFAnH16mwKJEkQZZIhsiGTjSNsO8cUNh3V5dPYgXEOoV
	 2wCpnvcJEjEBhUtAemf3ZwR7s33TMeCFQpfW24e+qLLslJ7zcPl/4Lj+/bbMWjcfpk
	 KUBC5xKN8l9Evw4T9+Td0MxYgYcDtU98L9r1t2ToDHvZzhVaOYB/3lKy4K8pAhlkxD
	 MpZ9/6BLvQbFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2505406B3;
	Thu, 25 Dec 2025 21:33:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CA29B9
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2590406B1
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijDcAOcJtZXe for <buildroot@buildroot.org>;
 Thu, 25 Dec 2025 21:33:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DD67406A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD67406A7
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DD67406A7
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:33:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 31461C1BEA4
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:32:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4EE9D60742
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:33:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E9D7103C8CAB; Thu, 25 Dec 2025 22:33:05 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Dec 2025 22:32:57 +0100
Message-ID: <20251225213258.416296-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766698385; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=k1obkMjF57VBUXSeqHG6fhYZllWk79JudEukB7BxCME=;
 b=Pbqh1m6DdnF+j7uVjt00J1jIxCrnLSXbHxKfMu3PX5uAPrv26PgjzuvCM+/IAs+LKSc6mG
 e9+z/UchTsDEKWUqMQmKyANnkSV/cgtRhHYeki2uQJ2fIa1U4XYNMrmIu0p+S87NlEAtss
 I+ADoNUKqlEqydGYwwJdryzvo96HzH0jbPhMVr/D5Mq/EleEKmkkkqc98H3DwBnEneVd36
 2p2e5M9FJAgYRfpcnVxUQUiizmAP0UD7L5EvS4GK4bBzzy96pkuWuqtYfZPfXBN82H6/9w
 ShqdYom0hzWW+5N5wol4ayHg4Rrb4FK6aw5Zb0TUFkakcliS+z/eLThWhm8LkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Pbqh1m6D
Subject: [Buildroot] [PATCH] package/freerdp: fix build with CMake >= 4
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

freerdp upstream is now at 3.x, far far ahead of what we're using in
Buildroot at the moment. So to fix the CMake >= 4 build, we add a very
simple non-upstreamable patch (upstream 3.x has a much higher CMake
minimum version already).

Fixes:

  https://autobuild.buildroot.net/results/51365593ad059325e1164d36fff06905d1c6e8af/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-update-minimum-CMake-version-to-3.5.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/freerdp/0004-CMakeLists.txt-update-minimum-CMake-version-to-3.5.patch

diff --git a/package/freerdp/0004-CMakeLists.txt-update-minimum-CMake-version-to-3.5.patch b/package/freerdp/0004-CMakeLists.txt-update-minimum-CMake-version-to-3.5.patch
new file mode 100644
index 0000000000..5f8ad5175a
--- /dev/null
+++ b/package/freerdp/0004-CMakeLists.txt-update-minimum-CMake-version-to-3.5.patch
@@ -0,0 +1,59 @@
+From 27f9300b55c483a9f2ff482833ee4fae01447c69 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 25 Dec 2025 21:03:37 +0100
+Subject: [PATCH] CMakeLists.txt: update minimum CMake version to 3.5
+
+This fixes the build with CMake >= 4.
+
+Upstream: N/A, upstream is at freerdp 3.x which already has a much
+more recent cmake_minimum_required() [but the patches are too invasive
+to be backport].
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt       | 2 +-
+ rdtk/CMakeLists.txt  | 2 +-
+ winpr/CMakeLists.txt | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3d4a5e515..0538d026c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(FreeRDP C CXX)
+ 
+diff --git a/rdtk/CMakeLists.txt b/rdtk/CMakeLists.txt
+index 764a545c2..389ad1db8 100644
+--- a/rdtk/CMakeLists.txt
++++ b/rdtk/CMakeLists.txt
+@@ -15,7 +15,7 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(RdTk C)
+ 
+diff --git a/winpr/CMakeLists.txt b/winpr/CMakeLists.txt
+index 77ff23302..f5bffd644 100644
+--- a/winpr/CMakeLists.txt
++++ b/winpr/CMakeLists.txt
+@@ -15,7 +15,7 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(WinPR C)
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
