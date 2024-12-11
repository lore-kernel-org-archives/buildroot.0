Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9DDE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFBDF4093A;
	Wed, 11 Dec 2024 19:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sbCmc8QhROf; Wed, 11 Dec 2024 19:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8345409EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8345409EF;
	Wed, 11 Dec 2024 19:26:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2765D962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 081D461114
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2B_IGmSbLk9Y for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:26:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 219316110C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 219316110C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 219316110C
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:26:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E2C6A4C2545
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:26:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40064)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tLSLV-000000004dq-2DWR
 for buildroot@buildroot.org; Wed, 11 Dec 2024 19:26:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 20:26:03 +0100
Message-Id: <20241211192605.1631785-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1733945166;
 bh=EC7243mjb3juL1dcQIZ7p3dgqdP85vw7hihbK3w6iOM=;
 h=From:To:Subject:Date:From;
 b=M2uILqLNUapogQX7cEC7p+b2Un5FnWliOb/g1EWUw4KRp6VJhLcRT0cGptY2jUi2c
 1iyvapJYqNQgaJWGICC+6F01848LiWPW8QcJlGIAjRDZ1CsUwM/lQqdnlxG1FCfi6+
 WNRmoBHLAYKiL4S/7A3sv/G6rDwIVNCUA4cfZIQclnHMLujS0xyYQpV8v7EsAIeh48
 HejHQSXIdDkYW1qBjD5Tg7RD2sDlGdrXDsrqnnn0i+xMNk6uNFMgnNfgpm83qLjXuF
 8f/Fa52Szs8GPu8LgHXbkWDI9z0FzBsvo8EJk2O6VmCTXELo4g1ar7DCABMaMDunS4
 CXJFjOQc4KvSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=M2uILqLN
Subject: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to 22.5.5
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 1accd2e205..9c2f3526bb 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dbf7cc401de7ff386306a23c1c61b3cf7bd86a4d9001b3a1d16a81e6b0e3ab2b  intel-gmmlib-22.5.2.tar.gz
+sha256  08db696071510b7e03aa2d9fb7375c6c35f7c327ecd6747424c664c622bb4377  intel-gmmlib-22.5.5.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 3698d2fff0..81aa1a9af8 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.5.2
+INTEL_GMMLIB_VERSION = 22.5.5
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
