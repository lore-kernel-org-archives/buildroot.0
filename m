Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB84CF45CF
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3DD883D55;
	Mon, 12 Jan 2026 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id junMKzWqiiDj; Mon, 12 Jan 2026 21:09:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16D7183D2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768252190;
	bh=Ic8eL0NhOPVM/+dtaOVcti9fVR6oQPZXieWvKLx5gAk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hLx7LEBP0fDzYAO7kH+sVYQYA22zFEn4oSi7z5fDF9DnoZlqvGTPBGCVsqGfAxFKg
	 /KuG9mEndtMcjhohboXQCPljFHWwpBKDtwREjmaquFe1ROj/TfH5tjCoTrWLN8ggaW
	 LZrjkB72BcspT0L6zemyS4iN/6tS73Q+9/EIlhlzq9zw3bSHnlXVBKuTu0Rmr3/y0Y
	 YFW4FXlkGCXPwlcJUWxWqlYggtYqZzbmVZowKfwCQSKFueYxXts0PED1mPzXU7o/wu
	 sGXkRwsGXsdr7etwvGtWfp4SQo4ZWKTNBEuBn9vHKCATvsrwKYzOLDjQK6HMAkOD/q
	 gkzupW+2G7PGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16D7183D2D;
	Mon, 12 Jan 2026 21:09:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBCFD18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B27E440C4A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jelnv586akhX for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 21:09:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABF8F40330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF8F40330
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABF8F40330
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:09:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf07.dip0.t-ipconnect.de [84.161.191.7])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0704A4C36C2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:09:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59276)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfPAW-0000000027C-1Yix
 for buildroot@buildroot.org; Mon, 12 Jan 2026 21:09:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 22:09:44 +0100
Message-ID: <20260112210944.3767562-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768252184;
 bh=CN1xDs+6bYald5oKiUCp9yDZ92NLHQXdiy4xqlf9YYM=;
 h=From:To:Subject:Date:From;
 b=CEbHcfvsgei0Zm2dERhsNhQjEaqIYb+jUzg8MjZx3q5cmyIR9tLVyYMVXx2VKWlgq
 kbO+h4pSAuDbJ97cHum0YZ3jAKUF8HpK9UgGJljKTwnu+oqNicCCofIZZAYKUzqawv
 Vsf7xDf0SfF7lSZEt63uf+TDAVMkrUMF+8mgLleevYJ+9aOP6jlCfwkv6Mi7uRL8Dz
 /WO6Q9Bq9clW6QZ7ia3RwN/JAxAE7Qv29EH0IG/D0Ak4xhvVxC5a7/H5lHu/Tj9eps
 BNh/5485hQTiFaWhWO7IZ7WL7ABwuYzNRc2D3qHbGAFOlonKfIDcaUfb6M+SQu9DVB
 RJ/P0I4SgQAPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=CEbHcfvs
Subject: [Buildroot] [PATCH 1/1] package/privoxy: bump version to 4.1.0
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

https://www.privoxy.org/gitweb/?p=privoxy.git;a=blob;f=ChangeLog;h=4a45820271febac332f183dd763749393dc97adf;hb=ad5cec777f1180c28f6fa229f4b587a2f245adf1
"- Removed support for pcre1."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/privoxy/Config.in    | 2 +-
 package/privoxy/privoxy.hash | 6 +++---
 package/privoxy/privoxy.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/privoxy/Config.in b/package/privoxy/Config.in
index 4138c0d281..d1133976e4 100644
--- a/package/privoxy/Config.in
+++ b/package/privoxy/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PRIVOXY
 	bool "privoxy"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_PCRE2 if !BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_ZLIB
 	help
 	  A non-caching web proxy with advanced filtering capabilities
diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index 3c96c5644e..cfb6f5a5c8 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/ijbswa/files/Sources/4.0.0%20%28stable%29/
-sha1  d302cb0bf23536e67a1b5505d01486a335d9c4c0  privoxy-4.0.0-stable-src.tar.gz
+# From https://sourceforge.net/projects/ijbswa/files/Sources/4.1.0%20%28stable%29/
+sha1  6afc12dc38781a37670c7e4bb69700900123084f  privoxy-4.1.0-stable-src.tar.gz
 # Locally computed
-sha256  c08e2ba0049307017bf9d8a63dd2a0dfb96aa0cdeb34ae007776e63eba62a26f  privoxy-4.0.0-stable-src.tar.gz
+sha256  23e4686e5848c74cb680c09c2811f0357739ecfe641f9c4072ee42399092c97b  privoxy-4.1.0-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index 64e8fb24db..bfd4996292 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 4.0.0
+PRIVOXY_VERSION = 4.1.0
 PRIVOXY_SITE = https://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
 PRIVOXY_AUTORECONF = YES
-PRIVOXY_DEPENDENCIES = $(if $(BR2_PACKAGE_PCRE2),pcre2,pcre) zlib
+PRIVOXY_DEPENDENCIES = pcre2 zlib
 PRIVOXY_LICENSE = GPL-2.0+
 PRIVOXY_LICENSE_FILES = LICENSE
 PRIVOXY_CPE_ID_VENDOR = privoxy
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
