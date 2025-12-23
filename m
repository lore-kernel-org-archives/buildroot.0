Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C679E6FE29
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 126194038F;
	Tue, 23 Dec 2025 19:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBIloHOotRVt; Tue, 23 Dec 2025 19:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF2B403A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766519159;
	bh=P2ycVrZIsTFgV47fE7m6Re9wDjpPFNZa3592rS3yBM8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NF8Lvjn00PIiGAIrVWkgLOwDmn0VxwB2fvcdq33kyx9YDnSOiS/hDaQE/hvAJiRsl
	 yev+Z5CtL8/V08G5fb5Aea5g/jh1chuIJQunrX0gXhEVFsEhZhcUmiX2PuHhnkZ6Nb
	 xVGOLfRNBs3yTnPWyDneDzSYTr8xlM20anBbeoJMCY44InouPpYhtg6JUMNW5OTSIF
	 R2jVdHakT8FwjVNPUaEZ5xAUTNGBp7SBj/+Qzdrp1L05B4sb17mbebyog/OTYWdVKH
	 uFUpO84kItWxdaE/naqmsjcL0xgpduyzIRccaPOn5zTL7+GzqiCQ+xIaWO2fKuCxoP
	 IhCtFxYaOFJPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF2B403A6;
	Tue, 23 Dec 2025 19:45:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5C97119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 19:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B210F809CE
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 19:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYpjkXMFRn-U for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 19:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16389809A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16389809A7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16389809A7
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 19:45:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B400719F57E;
 Tue, 23 Dec 2025 20:45:51 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 23 Dec 2025 20:45:47 +0100
Message-ID: <20251223194547.293956-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766519152;
 bh=RXd4I64efJWdMRWhduyMM7rXBEWzEN6jMZwB+yFKvVY=;
 h=From:To:Cc:Subject:Date:From;
 b=ZB8AAfX612Mr6zrRKFhP+9b6VfJu+41lGIKQhF7QZZqUIHoXEl7pwG8O/bl/Ntg9N
 3jBk/iO21Dw/24xC5ydwdP23vFDvDURiCoSd6r0I8l49Grp7enQxAKESwUqV/W+axD
 NFKaxLQLOjBAAnqGRLA7sNXc20lgOJJChP+GBn1G1k3qVIcrAq/ZiOqbjkxAtwlYMy
 avqHsS10wVpHCh5GxzCJ0ll7WgxO0UrREn2Nk8tdGtXH0qYYJvD1FKuqy5T4IO0VJI
 Iq28ekykxW1Ti7PoA7XG1J4AFe5/fOYf9X+2WuJnc9zqMDcluVEpdIwDhv4zJAXp6D
 U34VuqxluisiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZB8AAfX6
Subject: [Buildroot] [PATCH 1/1] package/oath-toolkit: bump version to 2.6.13
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announce, see:
https://mail.gnu.org/archive/html/oath-toolkit-help/2025-07/msg00000.html

The COPYING license file had minor updates in [1] and other license
files were removed from the source archive. This commit refect those
changes.

[1] https://codeberg.org/oath-toolkit/oath-toolkit/commit/e0fcb3b73d788f0cafdaff0a069e8273d9987777

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/2230445114
---
 package/oath-toolkit/oath-toolkit.hash | 13 +++++--------
 package/oath-toolkit/oath-toolkit.mk   |  8 ++------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/package/oath-toolkit/oath-toolkit.hash b/package/oath-toolkit/oath-toolkit.hash
index a89dd6bb94..d44b7bb742 100644
--- a/package/oath-toolkit/oath-toolkit.hash
+++ b/package/oath-toolkit/oath-toolkit.hash
@@ -1,12 +1,9 @@
 # After checking pgp signature from:
-# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.12.tar.gz.sig
+# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.13.tar.gz.sig
 # using key A3CC9C870B9D310ABAD4CF2F51722B08FE4745A2
 # From release announce:
-# https://mail.gnu.org/archive/html/oath-toolkit-help/2024-10/msg00002.html
-sha1  0bfb6ad29d59628487c9e180c7a43f4ca301e4d1  oath-toolkit-2.6.12.tar.gz
-sha256  cafdf739b1ec4b276441c6aedae6411434bbd870071f66154b909cc6e2d9e8ba  oath-toolkit-2.6.12.tar.gz
+# https://mail.gnu.org/archive/html/oath-toolkit-help/2025-07/msg00000.html
+sha1  62807099befb8141e429d3e38750772041ea9056  oath-toolkit-2.6.13.tar.gz
+sha256  5b5d82e9a4455206d24fcbd7ee58bf4c79398a2e67997d80bd45ae927586b18b  oath-toolkit-2.6.13.tar.gz
 # Locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  liboath/COPYING
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  oathtool/COPYING
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  pam_oath/COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/oath-toolkit/oath-toolkit.mk b/package/oath-toolkit/oath-toolkit.mk
index 5e8fabb05b..37b00a8241 100644
--- a/package/oath-toolkit/oath-toolkit.mk
+++ b/package/oath-toolkit/oath-toolkit.mk
@@ -4,14 +4,10 @@
 #
 ################################################################################
 
-OATH_TOOLKIT_VERSION = 2.6.12
+OATH_TOOLKIT_VERSION = 2.6.13
 OATH_TOOLKIT_SITE = https://download.savannah.nongnu.org/releases/oath-toolkit
 OATH_TOOLKIT_LICENSE = GPL-3.0+ (tools), LGPL-2.1+ (libraries)
-OATH_TOOLKIT_LICENSE_FILES = \
-	COPYING \
-	liboath/COPYING \
-	oathtool/COPYING \
-	pam_oath/COPYING
+OATH_TOOLKIT_LICENSE_FILES = COPYING
 OATH_TOOLKIT_CPE_ID_VENDOR = nongnu
 OATH_TOOLKIT_CPE_ID_PRODUCT = oath_toolkit
 OATH_TOOLKIT_INSTALL_STAGING = YES
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
