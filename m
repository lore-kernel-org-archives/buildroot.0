Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB61CAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D340760770;
	Tue, 17 Sep 2024 18:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nasrI3T9O0yi; Tue, 17 Sep 2024 18:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F121260E3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F121260E3C;
	Tue, 17 Sep 2024 18:21:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 966891BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8572780BA1
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ySXOiODkghI for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82C1880B9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C1880B9D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C1880B9D
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:21:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0e02.dip0.t-ipconnect.de [91.58.14.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A41DEA4C20DF;
 Tue, 17 Sep 2024 20:21:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52062)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sqcpl-000000000nL-3GJZ;
 Tue, 17 Sep 2024 18:21:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 20:21:53 +0200
Message-Id: <20240917182153.3009755-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240917182153.3009755-1-bernd@kuhls.net>
References: <20240917182153.3009755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726597313;
 bh=SJ0sft38pQ34oP9/drzUY3fVK2ixEMpXviZtU2TdXwo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DXlTLYyTexdM0cMUwaT1t8zyMtZuL6BBPQBmtlWaOgc5WgLdzsorkO4yUJvtSW2sq
 jZiV+oztWMocdMDJ8f8wvJa66rUPUTgi/+PdtjcOqGsjF/+4aldV5Qrd81/TSw9RJM
 6xtK6YQkmrhBJllhUS5DFfLoIaKxLTSpgfCIQ0z84h629/aQpFDJG3jlUbMmkhXdjx
 afodmqh07KvOgWsIrr+OcstEDuB+QODMhv1hoHQoqkBCCqCqZJVBthIOdLB46KeDPu
 jkJk1cljkJ16xn3DPb5HlGMXwdROEv5whIU7WnnGjO24C9MZrPkFmr41FS7bXi2TSb
 sAWK2eAssZV2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=DXlTLYyT
Subject: [Buildroot] [PATCH 2/2] package/python3: security bump version to
 3.12.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://www.python.org/downloads/release/python-3126/

Fixes CVE-2023-27043, CVE-2024-6232, CVE-2024-7592 & CVE-2024-8088.

The fixes for bundled libexpat are irrelevant for us because python3
depends on the buildroot package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index d680a96810..0cd852c325 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3125/
-md5  02c7d269e077f4034963bba6befdc715  Python-3.12.5.tar.xz
+# From https://www.python.org/downloads/release/python-3126/
+md5  cb669514937d3e894e74081627722aa5  Python-3.12.6.tar.xz
 # Locally computed
-sha256  fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397  Python-3.12.5.tar.xz
+sha256  1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c  Python-3.12.6.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b31e6df141..4b328f70fb 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
