Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F9CEF584E
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 18:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677F583A7D;
	Sat, 14 Feb 2026 18:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uItbneNvvGoo; Sat, 14 Feb 2026 18:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A8CA83AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771092415;
	bh=LPTdpE86BBk7TBofk/8RfVSGdFVx4xipxHv55bD8vpM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=meWLswNdCFXVA4NTsfLlQT/brfJgXrZz0xtb0cRcbD/D7xqQR1LGhLh8Uu1t0YR2l
	 8jaQIAUZF7+zXf4XreiR181XbUBsA9FC84a/CnZAGG2jEy4UGjFe0LAoslP2GZr6AW
	 3KAl3YPV/JKz5WUQPvn0bEDAXqmzReZnnwfQgI/MeF9xmOEiauzE+QX2VZRrp0T1uv
	 6B9HwWCF6raPiOgCcs28+TekWU41wO7+7crhhwqThidu19iM5gFbSFTZTxx5FzGy6q
	 huls1a8nii3SOlV3akewVaaWH5mNGmv+vEdWSoFsrqksEo5pJd2PEd9txoXcPevaI2
	 PnVcNgrRsgLlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A8CA83AB4;
	Sat, 14 Feb 2026 18:06:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7899D69
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 18:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A47F83AB4
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 18:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3y-PLncRoXzm for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 18:06:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEB6483A7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEB6483A7D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEB6483A7D
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 18:06:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 35434A4C0358
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:06:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52482)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vrK2Z-000000000Tj-0FFe
 for buildroot@buildroot.org; Sat, 14 Feb 2026 18:06:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 19:06:47 +0100
Message-ID: <20260214180647.1863688-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771092408;
 bh=wnVnrV6YOm2PSTluaFi753MIHxTfSAnxvcZTuVFqNM4=;
 h=From:To:Subject:Date:From;
 b=Ly7ubiCuPanImGeOeTjPEsx3cjZhfNXMwwVwuTuoU/e5rUh+IhIPlte+ED1wzMIL6
 Bj+sOJEXDNEiYcQ87AlO/W/smxweu45W935s9dIiGQ8hIDtxVbixwT7yghzB1qIbm1
 Piuaj8qNW+LvOgN2oOVq2jxCmKAF393DjWX08qQuCVcBSdTNVa/yuW2OBRzft+7bUa
 BMDxXqbUbq3fuH1sXVn8U1CzBZZcFy+KcnSBOdcxrkInTHx/hMrhmCJ7VIVNWSlgyl
 fUDb94pYlcNeC2Auqkxm3utGwcZbdtlAH/qc/AElkRw5HqhVCL5i4uirTYdWGuNy2p
 naWJmTBLoxiYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Ly7ubiCu
Subject: [Buildroot] [PATCH 1/1] package/libplist: bump version to 2.7.0
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

https://github.com/libimobiledevice/libplist/blob/2.7.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libplist/libplist.hash | 2 +-
 package/libplist/libplist.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libplist/libplist.hash b/package/libplist/libplist.hash
index 9bc79bf3f0..ecc8984716 100644
--- a/package/libplist/libplist.hash
+++ b/package/libplist/libplist.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3f5868ae15b117320c1ff5e71be53d29469d4696c4085f89db1975705781a7cd  libplist-2.4.0.tar.bz2
+sha256  7ac42301e896b1ebe3c654634780c82baa7cb70df8554e683ff89f7c2643eb8b  libplist-2.7.0.tar.bz2
 sha256  7619c753cac95d4740220223bde48a032606fcaccde5e546f9bc444c81ab356d  COPYING
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 0b8a69455b..2c7edd38ef 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLIST_VERSION = 2.4.0
+LIBPLIST_VERSION = 2.7.0
 LIBPLIST_SOURCE = libplist-$(LIBPLIST_VERSION).tar.bz2
 LIBPLIST_SITE = https://github.com/libimobiledevice/libplist/releases/download/$(LIBPLIST_VERSION)
 LIBPLIST_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
