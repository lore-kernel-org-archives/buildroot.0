Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F21CD98F2
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 17:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBCD44296E;
	Fri, 19 Jun 2026 17:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fr4t1NmcATiw; Fri, 19 Jun 2026 17:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DBA24296F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781890095;
	bh=2ZPfCIa1Um810qvfslTmUtH17VE3yu3CCU5Mx4HTGu8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GTj8AVQ97Jx4y6cSyxpMQX9Oyt9RId2sQkJ63v7mRO5aBU0N2xdj9mND8dQtysZt2
	 Nx7bwWrzlDha29+5B1Xors/kNxLB9d7+P6ziZtqmp6jAV3QNj2EUJW27CziEsGLo8G
	 J+e48KqzEFyOEjppW5ePGlL1R5GaGUAQB3p7qgZb43oSKRRkWbdnzrczjKk1BE74Fe
	 /vJqIcPKTNrcoGGLWtO4isCBoF6Hbyfvy7o0eulbB8zM1SMdBKvR3WQQjL5qyeqsPi
	 cA1k11sRh9inQepvtZ0nR/JIXz4vZ3PcBKzSlAXB3DdSdqTmF0Mf1d539JwU/DOBVY
	 sBFIoqMHF02fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DBA24296F;
	Fri, 19 Jun 2026 17:28:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76FEE367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 17:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 664714296D
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 17:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQYp6GLw2Y82 for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 17:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13CC84296A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13CC84296A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13CC84296A
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 17:28:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a031f.dip0.t-ipconnect.de [91.58.3.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88FCCA4C060A
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 19:28:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34396)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wad0j-000000007j7-3ibJ
 for buildroot@buildroot.org; Fri, 19 Jun 2026 17:28:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 19:28:10 +0200
Message-ID: <20260619172810.3337739-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781890090;
 bh=l/YGDAEKi9lwJg5GYL3xlKKPfW0n8h1xQY/oE98EwMk=;
 h=From:To:Subject:Date:From;
 b=gHo5hjsOHlRIbFuOj1/4Wlh8HBdgR0BA+4xm+0AOZP7J9WaoMb0Qqnat4t7+cnO68
 R7ZPwFzYfWAzIrcFnYL4U3bvFnPfDkArBjfbpuI7Mz9tC/61c0LL7tubVHnWaIw83E
 ys8wxHvZHGhdALJdN+rEQljdK/1mK2D9GL3mlwqSLiqlq8W+bg52+DHAr7T9HgF6mU
 Qa2aS+kkP3lALt/UrWAZDoXzPDJRpLqNsnImHF7gH/CrAuGleW8xYdeckW9v7S2RVc
 Z1FrHFQrGa6uU+y8WnzQtRk6MsMLFjPRauXvTsadhBtGrnoisT0uyWHtpT+vcvnXMc
 /0H0u63Qwx3vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gHo5hjsO
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.07.1
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

https://ghostscript.readthedocs.io/en/gs10.07.1/News.html
"This release addresses a number of potential security issues."

Renumbered patch which was forgotten during the last version bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d32cbd8763906d5edae166f4f9020475ba03bc8e
with the exception of an unrelated build error with the
bootlin-arcle-hs38-uclibc toolchain.

 package/ghostscript/{0002-brotli.patch => 0001-brotli.patch} | 0
 package/ghostscript/ghostscript.hash                         | 4 ++--
 package/ghostscript/ghostscript.mk                           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename package/ghostscript/{0002-brotli.patch => 0001-brotli.patch} (100%)

diff --git a/package/ghostscript/0002-brotli.patch b/package/ghostscript/0001-brotli.patch
similarity index 100%
rename from package/ghostscript/0002-brotli.patch
rename to package/ghostscript/0001-brotli.patch
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index c2e48b01e6..94017262df 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10070/SHA512SUMS
-sha512  1c2a14951223c975a53bd9767c28bd3a6e420c385a5e0d7a60a5ff5b091bc027929c815bf57cddf97611e8d265ece1c219321737f2cabb5646685c6e8cdb85c9  ghostscript-10.07.0.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10071/SHA512SUMS
+sha512  7b38ca10fa7ab648924f7db3e2e4933c3d18e04c8db1346fca4d4f7b85dfbd7888d5fc46f413613b46429fb47b675a593994c25e50e9de4dcdbee3bdd8a5e449  ghostscript-10.07.1.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 23dd3d3860..08e2667981 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.07.0
+GHOSTSCRIPT_VERSION = 10.07.1
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
