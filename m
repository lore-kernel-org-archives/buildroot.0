Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E67EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C4C682B1A;
	Thu, 20 Jul 2023 17:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C4C682B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MreftPJNxr_r; Thu, 20 Jul 2023 17:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88FB582998;
	Thu, 20 Jul 2023 17:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88FB582998
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6DCE1BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBBF782998
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBBF782998
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lf0Bcvlfsg_m for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:53:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CB8A8291C
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB8A8291C
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C65EA4C042C
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 19:53:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34104)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMXq3-0008NS-1H
 for buildroot@buildroot.org; Thu, 20 Jul 2023 19:53:19 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 19:53:18 +0200
Message-Id: <20230720175319.151079-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689875599;
 bh=3NkZyimZRVI0DpQKs4KTtqedu8QPDN5At03ti5wrxG8=;
 h=From:To:Subject:Date:From;
 b=YHMv02CFXK9v3niEb0eJ4q/p2fXVb9s3i2390TQyHaSkTE38N1uSTrfTDAOjCi2w3
 +jQkYqJL1ohJpbZ3e/UyNLDONy9MzeRc3pXLIF/5MM5JoGw3sWLXELhLdwxMbTSMED
 KY5wxi5EAfpjafDzHaCIVY4p2T8aIOD8zAZF/0d0mYatWJgJqeJz87BZdDy7ee0hBf
 w32XR28+DfHTpQ6XbsfW5l5fYA+LFpz9R2kVQZWU4XuWVns79bYrmaJ4VD+BBuAbc4
 /E/Dz05gcGIYK6xhLxoP5DAPmLatQzvKHwczbeeeTjtyPfScjWGUYrCTJKXa99C7At
 Jvpz1kJcEa1Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=YHMv02CF
Subject: [Buildroot] [PATCH 1/2] package/openssl: statically-linked openssl
 does not provide threads
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

Add blind option to mark availability of threads, needed for tor.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openssl/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index c7641ecefa..f81ed1a00b 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	bool
 
+config BR2_PACKAGE_OPENSSL_HAS_THREADS
+	bool
+
 config BR2_PACKAGE_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_HAS_OPENSSL
@@ -17,6 +20,8 @@ choice
 config BR2_PACKAGE_LIBOPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_ZLIB
+	# https://github.com/openssl/openssl/issues/14574#issuecomment-1584122617
+	select BR2_PACKAGE_OPENSSL_HAS_THREADS if !BR2_STATIC_LIBS
 	help
 	  A collaborative effort to develop a robust, commercial-grade,
 	  fully featured, and Open Source toolkit implementing the
@@ -36,6 +41,7 @@ config BR2_PACKAGE_LIBRESSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uClibc doesn't provide __register_atfork() without NPTL
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_OPENSSL_HAS_THREADS
 	help
 	  LibreSSL is a version of the TLS/crypto stack forked from
 	  OpenSSL in 2014, with goals of modernizing the codebase,
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
