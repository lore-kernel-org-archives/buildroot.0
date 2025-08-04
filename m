Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE7CC87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 18:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6D608225B;
	Mon,  4 Aug 2025 18:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptajmejIpVs5; Mon,  4 Aug 2025 18:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E37A782322
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E37A782322;
	Mon,  4 Aug 2025 18:47:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A99E118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 815E361333
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ml8f97SpstkY for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 18:47:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F5C860FFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F5C860FFC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F5C860FFC
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:47:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf8c.dip0.t-ipconnect.de [84.161.191.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4197A4C33FB
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:47:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48584)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uj0Dc-000000000F8-3xiK
 for buildroot@buildroot.org; Mon, 04 Aug 2025 18:47:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Aug 2025 20:47:33 +0200
Message-Id: <20250804184733.3337644-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754333253;
 bh=myhAIgSKS6v1LdauDoEL0+aK2KNc9v6Z6kPF8FQCq6A=;
 h=From:To:Subject:Date:From;
 b=BR0VBstguEZKKnEgbk2+vrzSi+4fz769Ag1Uy1dQ1LhP/C/lmhKtG4i/24EZOej42
 OR7gvOKXKI0BacpCix4yDhkHfq0pQ3iiaIvgYI0CVKxi1eyXNajkdAcGDnmgYV5DsK
 gT6ubU3hvtjB8mGHl/NZJ4L26SX55ASOBPo814o5J9VjApbrjjIhz4IXs0lT00ju45
 xkyZNNnBjrVRgPaWvRK5U7hSggdDefWi/x/easRVns3VKM5wo3VbMy+tZdknn/4AQq
 vZzELQjBr1LGbXJ9YhOJBcRsxWU/VcduSjRc1Q/uUoAidI+gPmyO9FPR8qiuCKJmag
 Zyt8P31lTzeOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=BR0VBstg
Subject: [Buildroot] [PATCH 1/1] package/libmspack: bump version to 0.11alpha
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
 package/libmspack/libmspack.hash | 2 +-
 package/libmspack/libmspack.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmspack/libmspack.hash b/package/libmspack/libmspack.hash
index 9e97063f01..a4fcb61bef 100644
--- a/package/libmspack/libmspack.hash
+++ b/package/libmspack/libmspack.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bac862dee6e0fc10d92c70212441d9f8ad9b0222edc9a708c3ead4adb1b24a8e  libmspack-0.10.1alpha.tar.gz
+sha256  70dd1fb2f0aecc36791b71a1e1840e62173079eadaa081192d1c323a0eeea21b  libmspack-0.11alpha.tar.gz
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING.LIB
diff --git a/package/libmspack/libmspack.mk b/package/libmspack/libmspack.mk
index f806192eec..2f64e992fb 100644
--- a/package/libmspack/libmspack.mk
+++ b/package/libmspack/libmspack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMSPACK_VERSION_MAJOR = 0.10.1
+LIBMSPACK_VERSION_MAJOR = 0.11
 LIBMSPACK_VERSION_MINOR = alpha
 LIBMSPACK_VERSION = $(LIBMSPACK_VERSION_MAJOR)$(LIBMSPACK_VERSION_MINOR)
 LIBMSPACK_SITE = https://www.cabextract.org.uk/libmspack
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
