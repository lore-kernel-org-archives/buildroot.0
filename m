Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E9DFD9E0E
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29497606AA;
	Thu, 26 Feb 2026 20:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQNHerzw4DCQ; Thu, 26 Feb 2026 20:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D963606B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772137419;
	bh=Yc/qz+KG/xEoVObXRlG+QSQBYnBXzjysuUbdtC5av1c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UyMI+mICwYpTnCSpx18QJB68QfXtECxPd3UrumDPPb4F0qssp0P4/LPx4olhyZuwO
	 Ay539Iez7NR+knzpnVoL/S85V1leuaBH/40JG38jaWworI7NnwK1KSQ52mdkriYeNB
	 cPNpFW7KJlb7GE35SejMlukynT+e8htxQrv07GcbRQNH/AIMJHci4rtCyvKqUMeAQl
	 2/WKhbpUGSbYt2wEwPmkd2I8Z53lw8Kz6bwSBODDX2zA1/u7HFEHjjfb6p+k7bD5xl
	 TtKDf8/Uy9yuBaJkGWiaLUeRuXTssrH+gMhGOU37V9JNW4R/bdUScfpOYi1yWVco7v
	 q0wWBCgW+C/VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D963606B6;
	Thu, 26 Feb 2026 20:23:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 369DE23D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BFA8606B6
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOUZfJLPepPg for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97A39606AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A39606AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97A39606AA
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:23:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2D7BA4C2E88
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:23:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49730)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvhtW-000000005av-2gGK
 for buildroot@buildroot.org; Thu, 26 Feb 2026 20:23:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:23:34 +0100
Message-ID: <20260226202334.2275873-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772137414;
 bh=lxzYF1JLZZzx43m47V1tPZUTKDNKa8sBQu2k32wmYOU=;
 h=From:To:Subject:Date:From;
 b=hlGHDd+4PHwL38fZUb7vwRYsZUiunIGn6NsnNpVijZMqfrVLYBL4KntQd/xz5UhmP
 k6ki6A5DbKJdOXdcyonjjr73PTC1fiN3dKsxcVfLo5yWPWLNz86cMLAH6dJuduJ14A
 vofM6m8rHiHYjU4g6iYuPXI6re2tnFbtAMb3eq9no0nyzHx0WkVbf3unxaLKAndMzL
 TUUFuCb0wGVCueIagScgyOWYSwXeCQwqbpmPB1OFr8vcBVv+tVbfplF0Q4i0GW+bgu
 lbk1nqtbzA/eW7aXhfWn1POirA1pC303C8raQ9MIXTumyjQOl6uU5Apl98/SoF+0dr
 bkMgjC/auU4Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hlGHDd+4
Subject: [Buildroot] [PATCH/next 1/1] package/libbytesize: bump version to
 2.12
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

https://github.com/storaged-project/libbytesize/blob/2.12/NEWS.rst

Added tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libbytesize/libbytesize.hash | 3 ++-
 package/libbytesize/libbytesize.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
index c3962d7bbd..3697afd982 100644
--- a/package/libbytesize/libbytesize.hash
+++ b/package/libbytesize/libbytesize.hash
@@ -1,3 +1,4 @@
+# From https://github.com/storaged-project/libbytesize/releases/tag/2.12
+sha256  8356bac2cafd2f31f39bf1ad373cef8448cab08b817aeaee5c526d54e81c3c5a  libbytesize-2.12.tar.gz
 # Locally calculated
-sha256  1f6ce157750ed1201ce83edd3c23d997a615c7da30f9a0e5bb44635f66768d81  libbytesize-2.11.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
index f163b9ad21..c786105118 100644
--- a/package/libbytesize/libbytesize.mk
+++ b/package/libbytesize/libbytesize.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBYTESIZE_VERSION = 2.11
+LIBBYTESIZE_VERSION = 2.12
 LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
 LIBBYTESIZE_LICENSE = LGPL-2.1+
 LIBBYTESIZE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
