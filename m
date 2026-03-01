Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90DAFD0060
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 12:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F175560F9A;
	Sun,  1 Mar 2026 12:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdf6LKvKJoou; Sun,  1 Mar 2026 12:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F5560C0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772368959;
	bh=QbwQzhCJ8RTW4nCEkvKgXKSLN06fU+Cl+CFu1A6/9AA=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dsI+6k0jnW89cl8bQ5/ofRz68mY0+B1M1+wmP5RALFPmdcgSBUteI6qjT0iWpI+Za
	 n8yUtLFAbOLTQBD802lsLf2YkrGVLhkRQdr/6EHizQOvqbW2Vw3PNZWfXPmkKmfG2T
	 dB2s4Mb07RKjPbA8mg4usNe5T9d9Npw8KlbgetzSwX0jAI4rX/Uwmkqf8JSpBR7B0F
	 wKr/GuPHjE69sdX4oFUS1RVKb+lxzL/rH2G5H8ZIaJ5TfNvuLewYJjnBKWFm8znW/P
	 vXLIx8FrVJDgSH/GjpNETPmGz41QEeLf5pcFZFNBzF0GZ4wikyDZg4nzo97MY6csnu
	 QONBbose4U2ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F5560C0F;
	Sun,  1 Mar 2026 12:42:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C202C24E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A806740B96
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNDhI-ARPd_V for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 12:42:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8589840B84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8589840B84
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8589840B84
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:42:35 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id CA83731E0C11; Sun, 01 Mar 2026 13:42:32 +0100 (CET)
Date: Sun, 1 Mar 2026 13:42:32 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1772368952; bh=A8Deb21vKQCCFi4CxhXqFM0eHbUBZOwgat1vNnLpODc=;
 h=Date:From:To:Subject:From;
 b=s5YOf7RZsLnA5KCi6tIe5rmwRFgWFmQS8x6eFjKP9QWspYwbl2tZIW0SpQ9iaxYwp
 AHIL7ice8cNDTC/h9ZXP8f30NNHHsF7dMJLI1A53IEB9w+H8CqsGV5xkN870pTQSvc
 GY7DGZjq0Nb2wWzln47meTfpy6Q3lJ9K3v98dGTTtJ+RQJt+O5l4VyGnEsmSByUwtf
 mok2CZYsYwtbxVcS9jH3Jn925wl7bKOMuJUrsjpZ//CLvAmv0iJZY07qk1GkHnylvM
 0jlkJ5WOLJGfNT8bzmOeQ2abEZoj4NXtRnTtudBsY0lZuSOOFPHDsNtxfR1AEXhUmJ
 2kaq//Ek7VTng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/uclibc: bump to 1.0.57
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

Following changes made it into the release:

Joris van Rantwijk (1):
      Fix adjtimex() with TIME64

Waldemar Brodkorb (8):
      sys/stat.h: remove _STAT_VER/_MKNOD_VER
      fix gettid() declaration
      add statx syscall wrapper
      sparc: add optimize build support for leon3
      sparc: sync with Linux kernel definition, fixes gdb compile
      fix compile error on earlier Kernels predating statx
      select: fix compilation failure with very old kernel
      bump version for 1.0.57 release

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 6a96e57069..e0dba1b6b4 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.56/uClibc-ng-1.0.56.tar.xz.sha256
-sha256  23c9cab54c113e020fb20b9dc06be4a49560df791b78fcbc2ca899a6e8f213dd  uClibc-ng-1.0.56.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.57/uClibc-ng-1.0.57.tar.xz.sha256
+sha256  8bc734b584e23ff6ae3d0ebb4c0fb1d1d814c58c82822b93130d436afa7ace8b  uClibc-ng-1.0.57.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 69eb73510e..0c91a176fa 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.56
+UCLIBC_VERSION = 1.0.57
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
