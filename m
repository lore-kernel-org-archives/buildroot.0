Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B737D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 08:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15588405FA;
	Mon, 29 Dec 2025 08:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scC6DRXqO2UI; Mon, 29 Dec 2025 08:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EB6D404C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766996079;
	bh=qsimBj7nMIUsQqtVlDeCuXjb4mQRKAjMT0H5JgCnLr8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HFzOQs86BXi1v6w+CIsdb4S0DW2iFkCkHrqKtXOywhco+cEAnKzpxpaACkPSUiN5O
	 KSGZIj/3yMfbUa31M83tAatcWDlwlyiMHkmB19yMs+tnnhrv5Cn6xgitOQ7E4webkD
	 zaUBCit8HJDUl6Qmipg90Lk8VS50goMvbfAiu5iCif3eXv14qIeAkc+gBlQGCJCOuA
	 9onfZnEO6oNv9sGPI2DPZF5mSteRjiplGaialOfQiXJCgDzmJSNEXQJpcOLd//4CwO
	 J///QeWJXciQ5eBSEjsE9XlUmTAu85+EFQJyAtOBQGxRlSTRkGzaeIrCO/VpHPulda
	 Dz6d6++wGh+Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EB6D404C6;
	Mon, 29 Dec 2025 08:14:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88FB6D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7738D8125B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8T1ehVPpJ5Y for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 08:14:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93A378120E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93A378120E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93A378120E
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:14:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88FCDA4C10E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:14:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58536)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1va8Og-000000005Rw-44mx
 for buildroot@buildroot.org; Mon, 29 Dec 2025 08:14:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 09:14:35 +0100
Message-ID: <20251229081435.620201-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766996075;
 bh=DAZnioCG5mcymzUV7b+gknzycN3C9ET7aywM/mOGIw4=;
 h=From:To:Subject:Date:From;
 b=KytyXyMsvOadrzyIJ2o3mc4F1At22SwGmPF+haT0bSoO5oXmmpQDhXHLfnX2T8xvj
 7Vhh6GGqgTXWf4iFumioyuzgwyQv9nCZnWYkLcku8cBUz+FzHaQGXsrRwbJlbZ3YI+
 c8nB7IfXqXQqTneIPUodAtOz11RI8J4xt08FC3uxx++KncjC7drcrIbHAAmabcSosb
 8Bds5Y47ZktN9QU6TAmYT0j0XquX/Uw2dM2JNFXxHaoRGwTnANMqxaaKbbtegUvPNn
 TqKO0R8yJhxQLSVo+kXmzQb9eUmv0MfZhcNoM0S9yn/W/vf5Uf6Q/CNWO/70ECbVU4
 xDRppHNikqTaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KytyXyMs
Subject: [Buildroot] [PATCH 1/1] package/liburiparser: security bump version
 to 1.0.0
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

https://github.com/uriparser/uriparser/blob/uriparser-1.0.0/ChangeLog

Added sha256 hash provided by upstream.

Fixes CVE-2025-67899.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/liburiparser/liburiparser.hash | 3 ++-
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index bed9c8ee9b..f8d7124b7f 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,4 @@
+# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.0
+sha256  154a3f649d80a78d5095fc461ec032ffb45f5ed3619edec923ac68cff29a088d  uriparser-1.0.0.tar.xz
 # Locally calculated
-sha256  85645df1bb220a3867c42f8adeba4f6a4b2fdc1563e91ad7d9f92d14d3dd377d  uriparser-0.9.9.tar.xz
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 66ec72409c..731739e582 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.9
+LIBURIPARSER_VERSION = 1.0.0
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
