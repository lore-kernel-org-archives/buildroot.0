Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9EEC87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 18:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D08982325;
	Mon,  4 Aug 2025 18:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyNIgl1RmIEJ; Mon,  4 Aug 2025 18:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CE748231C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CE748231C;
	Mon,  4 Aug 2025 18:46:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CB5C118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A0986135E
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWvVb_zFHnUc for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 18:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F9BA61333
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F9BA61333
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F9BA61333
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:46:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf8c.dip0.t-ipconnect.de [84.161.191.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C658A4C33FB
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:46:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50068)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uj0CX-000000008UE-2Tqw
 for buildroot@buildroot.org; Mon, 04 Aug 2025 18:46:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Aug 2025 20:46:25 +0200
Message-Id: <20250804184625.3337465-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754333186;
 bh=H5XpLF/l6kHiZ0Layon2QaPK0+QBtq0n+UXagsLsGjg=;
 h=From:To:Subject:Date:From;
 b=NqFRYrN51GfqdbCuuLgwR1IIZ/p/G4svlalw3kOXo+zQVa6wzLyLCuVp0XgqEHDqv
 9Fb5tzMw4lwKRffEuyemO4LXRv6+WhMJCATN4NEhuEIjEG4mLl7l+SjJYdrj0Ftnyr
 RtcmhZ9r+dqoIa747UCJtOs8sGIqpqN8TQqVNktlKCVQG36ZRLKcFkLpkSv4VwMANI
 lNCMYf4aWI0zSSOUNIEGZtNATr05zWBRDyRQH5ZLlTMjfQx44Hjr1vrWAvorvJfpLn
 cz4j3oDJdJf6910jfhqIq/VACCuJd/7nGrfPrTpeE+cn1KhOd+PvvuV1fGiNqfaUJp
 8lwM1RBlq7GLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=NqFRYrN5
Subject: [Buildroot] [PATCH 1/1] package/libdeflate: bump version to 1.24
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

Release notes:
https://github.com/ebiggers/libdeflate/blob/v1.24/NEWS.md

Switch _SITE to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdeflate/libdeflate.hash | 2 +-
 package/libdeflate/libdeflate.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index bb97c76c3d..231548feed 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f343c7bf2ba46e774d8a632bf073235e1fd27723ef0a12a90f8947b7fe851d6  libdeflate-1.22.tar.gz
+sha256  a0dda1c4b804742066db07b9510876edd09cc0ca06cdc32c5dfe1b2016a26463  libdeflate-1.24.tar.gz
 sha256  4ad69099cb4374836fd27583d9991e2838cd86b6e4666ab26b2d32582c91e73a  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 823ff442fd..08c94f9250 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.22
-LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
+LIBDEFLATE_VERSION = 1.24
+LIBDEFLATE_SITE = https://github.com/ebiggers/libdeflate/releases/download/v$(LIBDEFLATE_VERSION)
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
 LIBDEFLATE_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
