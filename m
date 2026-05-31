Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282BACD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 16:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2E642A46;
	Sun, 31 May 2026 16:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9NXQt0Dx5Wd; Sun, 31 May 2026 16:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 076B042A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780243376;
	bh=Bibw5A1PzcBKz00M+Ebj0v2I8i2v5Spc6iROW4Boibw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rFZY/S9iNrSBr9ob8yC8xjOEhgo0g3du21OaSe9aDKzPRuSxa2It7lC3kC51JJiQ4
	 3zuLLYt0W8+p/YjOkcIO56GZsrbLIThhGin3p8cP420BVW/bLRs+bp5F+PNZCrdg5X
	 MHX4i3Y00Wcr9iB4ilyy4dhZGEenXfHM4aePauj7KptfzZKZtZR40vAvVvqX7VrDxS
	 6EH0boB/OOlltT1as7GUKWWMTzZi8VdGxpH8FuPnMWtVdt0kPAjHUyq35rj2yfE3vW
	 wbiityhDKuSwrZpi5EAYho/76nQ+6Zy8paiEsTTcs1WvkiHOSOvE0ORyUaWQDOh7og
	 jc5+2DzrBlBhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 076B042A44;
	Sun, 31 May 2026 16:02:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E308257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 16:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 001D9405DC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 16:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdQUaPva6X3Z for <buildroot@buildroot.org>;
 Sun, 31 May 2026 16:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86C9B405D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86C9B405D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86C9B405D8
 for <buildroot@buildroot.org>; Sun, 31 May 2026 16:02:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C9F7A4C34EE;
 Sun, 31 May 2026 18:02:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34230)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTicl-0000000070t-2WXg;
 Sun, 31 May 2026 16:02:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Sun, 31 May 2026 18:02:51 +0200
Message-ID: <20260531160251.2333017-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780243371;
 bh=rdnln3IvyUobDPV5Tdrhc1QGVqPIcrKliHLW2VlxHSs=;
 h=From:To:Cc:Subject:Date:From;
 b=KvPBx4B+Pn+/b3PU1tEQVeTGqcKrTqahgaBgUCtKxfFphG2CqQK4BbvKRMyexfx2H
 vSi4hH+jUso2MIytipG6zyHIM/DlOL3Z7/bQrdvX6R+S6ZRHDwNt9sOLTdgDrEwPFV
 0s3WIBEi1TvAeqacRTsXgXSLVvkH/xbb/M9ICtvlG9ETK5zhsqe7HxFS+f2AUn+q6o
 VVsDCDFsWGJC3iQiONsvqDAlUrtKpMBf4dCjV2kdp53+iRFHlPMZ1RTgi6MGfjqYD5
 26O0AYYldxG19F6j3VqhA1ShFJewkt13RyUgJAzasdqWE09HSUVJ2yHZQrgeXwXrxJ
 999OBOZOzq8Jw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KvPBx4B+
Subject: [Buildroot] [PATCH 1/1] package/libpthsem: update project URL
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

The previous site went offline, the last entry dates back to April 2026:
https://web.archive.org/web/20260401000000*/http://www.auto.tuwien.ac.at/~mkoegler/pth/

Update _SITE to the bcusdk project which depends on libpthsem and stores
the original tarball. Update project URL to github mirror provided by the
linknx project which also depends on libpthsem.

Fixes download error:

ERROR: while checking hashes from package/libpthsem/libpthsem.hash
ERROR: pthsem_2.0.8.tar.gz has wrong sha256 hash:
ERROR: expected: 4024cafdd5d4bce2b1778a6be5491222c3f6e7ef1e43971264c451c0012c5c01
ERROR: got     : 01d9027268f27aab3ca5c6c649a7f7a444db5bc889e496d80c8704e4e120346e
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Fixes:
https://autobuild.buildroot.net/results/0d9/0d9e957540d15302ac55bc5a2207db0c45279b37/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2565507140

 package/libpthsem/Config.in    | 2 +-
 package/libpthsem/libpthsem.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
index c2856c52fd..65dd8c0cc7 100644
--- a/package/libpthsem/Config.in
+++ b/package/libpthsem/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBPTHSEM
 	  GNU pth is a user mode multi threading library. pthsem is an
 	  extend version, with support for semaphores added.
 
-	  http://www.auto.tuwien.ac.at/~mkoegler/pth/
+	  https://github.com/linknx/pthsem
 
 if BR2_PACKAGE_LIBPTHSEM
 
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
index dfe25af319..0ddcb3ebf2 100644
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -6,7 +6,7 @@
 
 LIBPTHSEM_VERSION = 2.0.8
 LIBPTHSEM_SOURCE = pthsem_$(LIBPTHSEM_VERSION).tar.gz
-LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth
+LIBPTHSEM_SITE = https://sourceforge.net/projects/bcusdk/files/pthsem
 LIBPTHSEM_LICENSE = LGPL-2.1+
 LIBPTHSEM_LICENSE_FILES = COPYING
 LIBPTHSEM_AUTORECONF = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
