Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0586C79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 08:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C8D403F4;
	Tue,  8 Sep 2026 08:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QagWXrsZ222K; Tue,  8 Sep 2026 08:39:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F3F68403BD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788856782;
	b=ao9RTqpstr3m7OejaBTlIlAplPJXyjtIIjI6CRQTZ5dRyGKIAIuWpNNoU/Rqb3ZGzL1j
	 pSdNAcqddfGX6hv6bE8Qc7/7oFOU0D2rh/4VWAc+mbj1XPMuVBVQPjBCP67gS88mGOK0/
	 uPpwo+8LCrlP2UxRb90JKZhXh6wvjixx4gfo6ASHm4voBt4FVt/WBOPtRo9qcUc+6/Df1
	 Wir3vu7QzasMSzOF53MaprFhhIVixkc8jnUg9Ur8pkdPeTP0tVJQppVDkmb/cDYlCFvzk
	 7OHbX9RR2CLLD866bvZ8F8+bGINRdHLaHJ2KNYEeKrEsATMG4yVbpDcw/8a2nkp170g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788856782;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:From:To:CC:Date:Message-ID:X-Mailer:
	 MIME-Version:X-C2ProcessedOrg:
	 X-CrossPremisesHeadersFilteredBySendConnector:
	 X-OrganizationHeadersPreserved:X-Df-Sender:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BLHnTsAr5UeOGnceHQuL0pNzg+d036dwpSUM6jvCV/I=;
	b=BVljDxqGS/1TTOIMQGtivUX5J6L7/SIL+Q+UQCZuRvIyNW2QKKuZMhbxkW5eAbHjXwKS
	 EEky9mRngk9iUJH7zuVh2lZvtTd5Lg1S7bQ5hBXs4kygn43YwCRQf6/c6vsVJb4IwrLDw
	 BjDgJ6dpWtwXH3oQYbipKlVrGINydlP6NKSzCVJ7a9cqfmaFdMQHO2IwPI/G5vm46AAEv
	 JZXcdoHwcZQMdAKjLKsQ+ueY9Au/ciNtu1TWbsyFtv4eOWBFl7EBeVyU8rrtTeTAnCGG0
	 0RPEHbY9Glxy1vfVC33QPBm5ULGg5b1dWRsQf8HXkSGVWNHbhOBAYN2NddOTlbza/0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788856782;
	bh=BLHnTsAr5UeOGnceHQuL0pNzg+d036dwpSUM6jvCV/I=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=geAZnYC3y0nadR4aPi434FHrITsLVgJ9QvXzKZ9M7IL151Eitg9Gcdv5kYSwi/T1M
	 wJh4SgqbGrGS1svAGheH/D9Gh9k9pHSn1Zu/9Pah9diNpFP0OyhU1ZIcktjrKAI2PE
	 i42dGboM5ruqxGqAx9l+TWR8J0d+ekLnmZKzqMpBHcTJpnx6016inq9nSGbHSvH5gP
	 Yi4/f7rSS6JwyxLyOJKYd7PxuwDNndcoaZRb7kWih34vyLcurkh7wfdqf5jE4NNc57
	 6JfBc7P/SxTkazEfuUTL1yvc7ra2PFc9B4QVaPKq8Pywex+JFu+uJel7444MeMxK6j
	 ONL/2idRuU38Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3F68403BD;
	Tue,  8 Sep 2026 08:39:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F05A6230
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1F1860690
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBBH8cAPtj17 for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 08:39:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B92C26067E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=80.67.31.31
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788856778;
 b=iHRB8f2GFbyvjMt1IqKqr5WqAlhJSSGrG2RDqBdK847SFuMKmhb+uqRrUx/FJT7Q2EWm
 CqSQ9garQ2SJE157G7hwDOOxvAIuUWIp4PD9pzsHFTZvV+ftAspT0vV9mjlmy7NFlptA3
 I/iBLc4TbYoQd44CU6zQyCR/JrtT7+2+8k+HVNp3SBHhq6LEyZNRWnpxHatfomguoJk1F
 CYZOfgEmb69uOl3tzH927ZS32GHAaDvWS/lImwxESa8Xl3sGVS3o4l6Xf1E9MbfSuz0Jb
 CBOSDQgLBtj9hO9la+wN4ChPukZucdOqHuTL46js6G6ZO2vTXUp7UvQHRnivNzSxhdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788856778;
 h=X-Greylist:Received-SPF:Received:Received:Received:From:To:CC:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:Content-Type:X-C2ProcessedOrg:
 X-CrossPremisesHeadersFilteredBySendConnector:
 X-OrganizationHeadersPreserved:X-Df-Sender;
 bh=MZPNWKA7MnyGRoFaYG/bmE+LRlc5SnJ4iOGQNoZcZiA=;
 b=IpEn0eZ4gKWSNhsfb3DdmIGiwLfGn71nwwYvFMaVzZgOOXKYl+cSwRPVCcmuHuPav3ok
 yYbw6jRwrAu0CE8eaCsJF6h8si0wfhNUgIspwosnIs0RHBpjxy5kLs+xpwrxLIMu6D2WO
 6t1jAzaGXyig8IKQyXhJZRsCQDpFt8QeQOUbyqETkKuBV/i1Eob+QIxY++vnA2dExTazM
 Z8Dp18UuQyUuhSjpzoAcKk1aE+GlWrc4iY3nPfrWIpGYATszKZ1AwDsLj1U8Q/YkHboKW
 izNaIETEgOUWKWYqTYrO2W9730jlmmDO7XgkLRjG9M5yyYSMAdMlcnhgOWn4TECZEkA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=go-sys.de; 
 arc=none smtp.remote-ip=80.67.31.31
X-Greylist: delayed 126 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Sep 2026 08:39:37 UTC
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=go-sys.de
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.31;
 helo=smtprelay04.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
 [80.67.31.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B92C26067E
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:39:37 +0000 (UTC)
Received: from [80.128.11.17] (helo=mail.go-sys.de)
 by smtprelay04.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.99.1)
 (envelope-from <mf@go-sys.de>) id 1x3rIL-000000004P8-2Qvc
 for buildroot@buildroot.org; Tue, 08 Sep 2026 10:35:09 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 8 Sep
 2026 10:35:14 +0200
Received: from go-sys.de (192.168.1.122) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.61 via Frontend Transport;
 Tue, 8 Sep 2026 10:35:14 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@buildroot.org>
CC: Michael Fischer <mf@go-sys.de>
Date: Tue, 8 Sep 2026 10:35:12 +0200
Message-ID: <20260908083512.83180-1-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH] package/libconfuse: bump to version 3.4
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

The backported fix is dropped, as 3.4 ships it:

  0001-Fix-163-unterminated-username-used-with-getpwnam.patch
    -> upstream commit d73777c2c356, released in 3.4

With the patch gone, LIBCONFUSE_IGNORE_CVES is no longer needed either.

3.4 also fixes three robustness defects that carry no CVE:

  #180  isspace() argument fix, could crash the lexer
  #182  stack exhaustion from deeply nested sections
  #187  null dereference on an empty comment with CFGF_COMMENTS

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...rminated-username-used-with-getpwnam.patch | 43 -------------------
 package/libconfuse/libconfuse.hash            |  4 +-
 package/libconfuse/libconfuse.mk              |  5 +--
 3 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch

diff --git a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
deleted file mode 100644
index 44e15468ac..0000000000
--- a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d73777c2c3566fb2647727bb56d9a2295b81669b Mon Sep 17 00:00:00 2001
-From: Joachim Wiberg <troglobit@gmail.com>
-Date: Fri, 2 Sep 2022 16:12:46 +0200
-Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
-
-Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
-
-CVE: CVE-2022-40320
-Upstream: https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/confuse.c | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/src/confuse.c b/src/confuse.c
-index 6d1fdbd..05566b5 100644
---- a/src/confuse.c
-+++ b/src/confuse.c
-@@ -1894,18 +1894,20 @@ DLLIMPORT char *cfg_tilde_expand(const char *filename)
- 			passwd = getpwuid(geteuid());
- 			file = filename + 1;
- 		} else {
--			/* ~user or ~user/path */
--			char *user;
-+			char *user; /* ~user or ~user/path */
-+			size_t len;
- 
- 			file = strchr(filename, '/');
- 			if (file == 0)
- 				file = filename + strlen(filename);
- 
--			user = malloc(file - filename);
-+			len = file - filename - 1;
-+			user = malloc(len + 1);
- 			if (!user)
- 				return NULL;
- 
--			strncpy(user, filename + 1, file - filename - 1);
-+			strncpy(user, &filename[1], len);
-+			user[len] = 0;
- 			passwd = getpwnam(user);
- 			free(user);
- 		}
diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
index bb968f7a52..19453828d8 100644
--- a/package/libconfuse/libconfuse.hash
+++ b/package/libconfuse/libconfuse.hash
@@ -1,5 +1,3 @@
-# From https://github.com/martinh/libconfuse/releases/download/v3.3/confuse-3.3.tar.xz.md5
-md5  a183cef2cecdd3783436ff8de500d274  confuse-3.3.tar.xz
 # Locally computed
-sha256  1dd50a0320e135a55025b23fcdbb3f0a81913b6d0b0a9df8cc2fdf3b3dc67010  confuse-3.3.tar.xz
+sha256  36bfa3928f9c323914c7c8317e8722cb22f41db69d7c9d4c24b4689fa955445d  confuse-3.4.tar.xz
 sha256  dc3ff4b62f851dd2e94a151061ffeb7d28ddfc880a442068dc5283dbaa927306  LICENSE
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index fff684a55b..ac3866f746 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 3.3
+LIBCONFUSE_VERSION = 3.4
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
 LIBCONFUSE_SITE = https://github.com/libconfuse/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
@@ -14,8 +14,5 @@ LIBCONFUSE_LICENSE_FILES = LICENSE
 LIBCONFUSE_CPE_ID_VALID = YES
 LIBCONFUSE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
-# 0001-Fix-163-unterminated-username-used-with-getpwnam.patch
-LIBCONFUSE_IGNORE_CVES += CVE-2022-40320
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
