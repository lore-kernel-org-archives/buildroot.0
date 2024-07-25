Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47130C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 19:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 161786076D;
	Thu, 25 Jul 2024 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoP9ZS54wwLb; Thu, 25 Jul 2024 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FF6860A7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FF6860A7B;
	Thu, 25 Jul 2024 19:52:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DFD21BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 19:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C7FC409C6
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 19:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAH65wCGQiDU for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 19:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D65804062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D65804062D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D65804062D
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 19:52:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2dc.dip0.t-ipconnect.de [79.214.194.220])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 021C5A4C2C40
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 21:52:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53300)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sX4Ve-000000005EW-2u3r
 for buildroot@buildroot.org; Thu, 25 Jul 2024 19:52:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 21:52:18 +0200
Message-Id: <20240725195218.2966267-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1721937139;
 bh=3faXEN7uUledVF7XcJ+Wcah6X0GepvXILY7L+D1zCMc=;
 h=From:To:Subject:Date:From;
 b=Mx79fTpumo24ymKNETbFpVxh8ePI33d0h+bn1iC2cWncO119JZdSOIZWQRCyZyCsj
 ymIGVGW0TdwZ3YxRYrOL2bdWFl4cY+jSWww+O6ECTwD65fGbbRbEEnsTdNfJJC/B5f
 g3Bb0PKZYpMJHOnn3AYMDhmJbMGXFtPqbokcNrnYLOQzauymUR7hG5Fsgy/9cNNA4+
 T9jqCNuEW+dqce3pi8KqTnT1rQfHbPyYT4gyjS9fyZvSMU9fm3J5KaDFI8KsSqKmvi
 KI+zVN8ZLYBvBiKDNDMFNFOXNjGt5b/XjM4XXBKQwLh8cesJ/F3hF8Z6E3p7U3oU/W
 TzOCu8samLKzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Mx79fTpu
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.4.39
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
https://sourceforge.net/p/fetchmail/mailman/message/58797299/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 3c0403fa78..12612ecc48 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/58731594/
-sha256  a6cb4ea863ac61d242ffb2db564a39123761578d3e40d71ce7b6f2905be609d9  fetchmail-6.4.38.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/58797299/
+sha256  75109a1f307b538155fa05f5ef298e8298cb4deae95aed24c16b38d36ff0a186  fetchmail-6.4.39.tar.xz
 # Locally computed:
 sha256  6d87443b61041067a5eddb2cabf8aebff15b8b40771ad6b5e4754e607ec21b39  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index c74b259698..a9239d0855 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).38
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).39
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
