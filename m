Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AD8D7497F
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 16:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A356412A5;
	Fri, 19 Dec 2025 16:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jP1BdAKtrGcH; Fri, 19 Dec 2025 16:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C12340FA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766162497;
	bh=OCnveEFibgxP1YeFTcPy/4ivYCM5aL4KsJzQjVzOs7c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QpdOgkVDZ4MIIIcTmN22HEYDbZUu/fFvDGeLB6yy/pJx6PwG/5sSiIEfCGvcBh2yL
	 kAArjVg8YPjleeJEXEOpYlyhs1udCcym0PdimTgfv6a0ixHec7soKQKUeFeHwFHZEy
	 rlgeAWpqf+rZA9kr6FW3GN4HcDo93j/vhYpSUx/b8t9meY7ab6yi1kooqH2MAQvSQb
	 148FZarowrc6j8To+aaauWs1P73aTIYbSqeqK1caUoJTzKc3X3pWTydBBsd4HO1d/d
	 1AG70C54RbKmillWbxYOIcbLNUYLk1xl1iWXiw0EU/jCOKnSRwC8S22eHqnvknnnVp
	 RxsIeVfQIQldg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C12340FA9;
	Fri, 19 Dec 2025 16:41:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFD8A293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 16:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6D5340100
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 16:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwqVwhk6dgGo for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 16:41:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A962406B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A962406B9
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A962406B9
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 16:41:32 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vWdXl-00Ehwl-31; Fri, 19 Dec 2025 17:41:29 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id cca6f505;
 Fri, 19 Dec 2025 16:41:27 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 18:41:25 +0200
Message-ID: <20251219164127.3999273-1-aperez@igalia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Es+3jcwW1kTYVTDJjHnDdPgzqIXVx0aDKt9kMhhYPPw=; b=cPsXGaTO7Zoh3YaCDPlq+fP3a4
 stFQNCtWoDpWGowVJ1zTnrTt0IIQoW4FXt0BvkWf2DEn5EoUvukJaRQfq2gQ3YY7WPLpch2rvgom7
 6NDegPw5zI+lFBAatH5J4lv7OMVMV17cfuuTAEHFXdvK3vIDnat6XH/cHQNAoSg6HfotEvE3rswGU
 j2aKVTvpU5YTcKGC2IKet1p9UWqED7lGKzKMHV0ExLF1PMrtkxl5A3Fe4N5tcyv9muUIet+DsY755
 AILoagbO57tLsme1xc/7LJgggB1fPlsh5/mQOTxrr2wfBG9fw/SfHjWSDWmFQROo6lI2UH7KLQXfS
 CqoqlN0A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=cPsXGaTO
Subject: [Buildroot] [PATCH] package/wpebackend-fdo: bump to version 1.16.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This maintenance release introduces support for newer versions of the
Mesa library. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.16.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index f0578808c4..5e36137524 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.16.0.tar.xz.sums
-md5  38f488aaa6d68252b593b65ba3e2d9d1  wpebackend-fdo-1.16.0.tar.xz
-sha1  8a06e51aeb2c94b4cf254d866c19eca587d3cd37  wpebackend-fdo-1.16.0.tar.xz
-sha256  beddf321232d5bd08106c179dbc600f8ce88eb3620b4a59a6329063b78f64635  wpebackend-fdo-1.16.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.16.1.tar.xz.sums
+md5  a112358168e03abf4937c0cecfe1dc9d  wpebackend-fdo-1.16.1.tar.xz
+sha1  4ed9d1d568ef805f79b691baa0d1cbdff17ef453  wpebackend-fdo-1.16.1.tar.xz
+sha256  544ae14012f8e7e426b8cb522eb0aaaac831ad7c35601d1cf31d37670e0ebb3b  wpebackend-fdo-1.16.1.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index e5972754f6..6dbe6edfe3 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.16.0
+WPEBACKEND_FDO_VERSION = 1.16.1
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
