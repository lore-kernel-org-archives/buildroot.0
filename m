Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36DCFCA174
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 18:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4616161286;
	Mon,  9 Mar 2026 18:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvI6hN7gxf-j; Mon,  9 Mar 2026 18:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13CDB61271
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773081585;
	bh=64mkxnhDmtb1aUfzU3NrmOBP6pW45x1fSECGww1Aw5g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AZIN7xMwrGVhx7v2rW0N+J0XKVpu1WUflX6i9dgK14aopUsUkFwpVdOuGD7dA1fH8
	 VEGTn416l8inPaR8REIF6nTql6j4JkmzedmFXQPuSnvV1Q6fLAb++U94hg76bzSd1P
	 lnen9kewGmmN+DPHzYyas2mzJhg8eVQdpU/Pgj/XoHkw8/ioopoxKjK+6SBjbETrlh
	 M21CzjiOE0sTgbPysTvkZT9xaN1gxPlWQoOWDRt3xtQNvorH4vZuOsaqbmSTcC5Xa/
	 5t4Lxa5SXBAADCsWjy6krCRpqPkvcjrKf2aoyUTu6Wcb6N+wIHTyHOCZrceSZcdpWO
	 /Kojb3jap1wVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13CDB61271;
	Mon,  9 Mar 2026 18:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07788158
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 18:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED4E861271
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 18:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4W11F47tbkH for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 18:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 134BB60ABD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 134BB60ABD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 134BB60ABD
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 18:39:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0224.dip0.t-ipconnect.de [91.58.2.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CF4AA4C01A1
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:39:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56948)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzfW0-000000001Ru-2fOq
 for buildroot@buildroot.org; Mon, 09 Mar 2026 18:39:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  9 Mar 2026 19:39:40 +0100
Message-ID: <20260309183940.1662086-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773081581;
 bh=Jgr1z7dvC6HOKFDif2WK+WSdxOnaz3qpskZjMTHpHyg=;
 h=From:To:Subject:Date:From;
 b=LBvgwjOyzzsG/GKqvZ9/+dQ8o6xndgFu0OITX6xLsEtL06CXHxatzsg+qkc99voBB
 HIZGA5YIS/BAzTusF7o0EScUOfhR3+g3l0s3a2mGy3I+lye0RXnvwchK8dSD8J72Di
 MBKmzsb2bMLBDqjvWeo7EpnArcu+P4rUZzLe6MLFu+btFLLUSJm8qyeK6+3UguqcP8
 jrJZ0pRnVJ1hIBS9LJ4bohWKVNijbFEdO/KSpncw1xiDdsIdKwHWF/hRgP96JQKx0I
 wuOxKA4LnhLfTJKawDsFhNPKxc+LIpV4Nc2J3a6IdFd2ZrRz07vniThBxz8063fp6e
 j+mrMgKJjUpNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LBvgwjOy
Subject: [Buildroot] [PATCH 1/1] package/libiconv: bump version to 1.19
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

https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=blob;f=ChangeLog;h=62fd4ab5f345d8f0b98c9c385e34b19a0844e19a;hb=a8850dc314a906b7bbe49a7c60424c7b10f57236

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libiconv/libiconv.hash | 2 +-
 package/libiconv/libiconv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiconv/libiconv.hash b/package/libiconv/libiconv.hash
index 9fa38c567b..6129debaae 100644
--- a/package/libiconv/libiconv.hash
+++ b/package/libiconv/libiconv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  3b08f5f4f9b4eb82f151a7040bfd6fe6c6fb922efe4b1659c66ea933276965e8  libiconv-1.18.tar.gz
+sha256  88dd96a8c0464eca144fc791ae60cd31cd8ee78321e67397e25fc095c4a19aa6  libiconv-1.19.tar.gz
 
 # Hash for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index a102ff18a4..49b3fddda0 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBICONV_VERSION = 1.18
+LIBICONV_VERSION = 1.19
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
 LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.1+ (library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
