Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBCBC88E5C
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 06:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1766A806A4;
	Wed, 16 Sep 2026 06:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWU2SioiRuHj; Wed, 16 Sep 2026 06:47:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BC2C680799
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789541232;
	b=KS4DS6UPlOKGh9mCKtf3iidlCm+NQ4o4zIvJLNcHYapfzrs0sfTtlpOwIHeHWqFEXZ3v
	 7zzOhqy+aUubFplKFIOIKhwNyskCNSl8JVXAb9gqfDmVBLiYS15koS5pV7lrS5vFdPsvh
	 jGPSEv1mcrFftKx8v0HqtoOdWdcurqSvv5zwAYgUvLFVs5hLton+I/lYcSkfUSutC74s4
	 6y+rkVrmmOoAdElNiyibpBuIyb5qJNQIgZN1owzxuY3p8ndWGIq0vNauIUHfNcMyTEmDA
	 J29Q49Y0yw8G4RuHkE9L0HzHkeFp4Q9KkzFhMtGmBFmZ0LzwqONfEHnsNgKhz718BkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789541232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=XqyVR6Dg+B+08ip9GQGFQZbrliC55dtE8Fmhib4BIiM=;
	b=I5vIayvoMFm16BEvr+6/qEd1Yzyc+7hg0rFyzDxJqqOjXLq5AQkO2UaI1QiN53RbGwGW
	 mh5dEjOMhiX6DwsD/lYSEuzS5QBATjg1Rb5CZmnBS3QvANiMRDs5Cyqbozfr0GM8XO5lr
	 uiXzMJiSL9NgmnmyzmJf/ZkT6rC0ahugwh0FLGCO2N5TJDuiERQlQgmBgv3wKseDLOm5s
	 l5Lo1FWOQFKh8h+REKq4+JesCgTfJG7el2e/bV1DueCh6RTOx6sokRbcvfhB8rftq5JVh
	 dnkivhLEXR8yJV5tsEM9wMyLq0sggPOqR4o4OKXaiQksCxhZTbefQmitpcp5unAuisQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789541232;
	bh=XqyVR6Dg+B+08ip9GQGFQZbrliC55dtE8Fmhib4BIiM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oNTQCRSXr3BI/MlWgZSvsmA6JV6supIRhbvyuRlKdz8pwwKFNhfWBOFP+5v74gfzB
	 acTJQRjlQdxZgP5n+qGudws85NCejTkUUHpJJRN4P5oEzazz46I5Sj6oB5i/b9Halv
	 zV7HLVvNamZQOX3QTQD5dacfhlCMu5AjeLurlXgzbl8jXeYH3IZrtbaQYDFyg/schQ
	 hcvRUlIKJLVPBlhuT9oKPJB3tliK4nppMGQPPI8AD/gfAsqjzv6XCssLumYjlXXT/z
	 RVA9WFOGSs8eRFS5QZgLDBYlqPH79rURJonKq7gsOhKB2NQ8JJFj4KWG0WS2CstLzb
	 FHu51BBCXf4sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC2C680799;
	Wed, 16 Sep 2026 06:47:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B69FE259
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8432406A0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Sy61RI6ARuL for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 06:47:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7340F4048A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789541230;
 b=SRnUj8OsTogtUW0MuVfkN++GmiEdDGK5j8KLXChFSNSwT5yzmkrue0mfKM/FeGVNACEt
 P+BIqxddf4rH9mNzH1Fb5zpvjAuB800Wp6wPMjwYmh792d5vj6e2ubB3/mX2yBLP9tydH
 /T+Xyradp+p/HgydWq8Ob6lKzd1QA605bObDF0D9ZtDzH/vXJ+1Fdv78wVMSqjHtDHFaF
 e2fJt7fifsnvtciWCcwRZeMQR8qeqeLTUYu3JLqVUpWEcO7Sx5RMPH8T5byqH9D6ZD+xN
 AHlx4qAvJqFKxTP8645f4iJsY8n5t3n6kUG222M+T9T2eSPKT/j7q7S/5lxQjTPeWWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789541230;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jJZ37OPVw710C9wHw2WN9ZXE2t08HD6pwnhPyryNua4=;
 b=ZXSR4UEEG+xHJNpKd5coao4pQy0RnX6mBBHAfKmR9uoIxNkMZK8O5C5nFlqfrAFxHcrE
 qDIBQpLSNOuKUyLsCqfRug/FqNdAHLtIScXNBwgr8pUMHRli3P+0ZlUIunM0J3FZmqKq9
 c9gRE9gd0AiaC428bfuSuLY+N1GzQ/RBKefZTJj7ziWd/R3cz356VIxVUQqGC9HHHPnfX
 vOJ6VLjhNjKqRJvMYz90GF0qTgmGMWhKSvIc9WchooZDD8tTT91G+L7Ym7wGQy7XBXo5A
 h5uCGgb6YSjPNk3NfiDC4pSV62RRfVoivvGoFa22GV54TRtM/R+z0vxQ4DDZstW3RXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7340F4048A
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:47:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3242795CC9; Wed, 16 Sep 2026 06:46:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 08:44:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22540e0d41382a8085af110462e2aea6508da4d5
X-Git-Newrev: 05021d4075ee14b5fb177c6435b3625323b55ef4
X-Patchwork-Hint: ignore
Message-Id: <20260916064604.3242795CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haproxy: bump version to 3.4.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05021d4075ee14b5fb177c6435b3625323b55ef4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.haproxy.org/news.html
https://www.haproxy.com/blog/announcing-haproxy-3-4
http://www.haproxy.org/download/3.4/src/CHANGELOG
https://git.haproxy.org/?p=haproxy-3.4.git;a=blob_plain;f=CHANGELOG

Version 3.4.x is the new LTS release which also added OpenSSL 4.0
compatibility.

Removed patch which is included in this release.

Disabled static builds due to upstream commit
https://git.haproxy.org/?p=haproxy-2.8.git;a=commitdiff;h=eaba76b02dd41e0a1a2e85a3e71f91dfc529916d
which was added to version 2.8 and causes build errors during static
linking:

/builds/bkuhls/buildroot/br-test-pkg/br-arm-full-static/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 /builds/bkuhls/buildroot/br-test-pkg/br-arm-full-static/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/../../usr/lib/libc.a(free.os):
 in function `malloc_trim':
free.c:(.text+0x24c): multiple definition of `malloc_trim';
 src/pool.o:pool.c:(.text+0xa14): first defined here

as suggested by Julien:
https://lists.buildroot.org/pipermail/buildroot/2025-July/782675.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-atomic.h-may-need-compiler.h-on-ARMv8.2.patch | 36 ----------------------
 package/haproxy/Config.in                          |  5 +++
 package/haproxy/haproxy.hash                       |  4 +--
 package/haproxy/haproxy.mk                         |  4 +--
 4 files changed, 9 insertions(+), 40 deletions(-)

diff --git a/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch b/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
deleted file mode 100644
index b3b1f732ab..0000000000
--- a/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 5ab3c61932af7619518169da744ba6346f060405 Mon Sep 17 00:00:00 2001
-From: Willy Tarreau <w@1wt.eu>
-Date: Thu, 8 Dec 2022 08:32:57 +0100
-Subject: [PATCH] BUILD: atomic: atomic.h may need compiler.h on ARMv8.2-a
-
-We get a build error in ncbuf.c when building for ARMv8.2-a because ncbuf
-has minimal includes and among them bug.h which includes atomic.h. Atomic.h
-may use "forceinline" without including compiler.h, hence the build error.
-It was verified that adding it doesn't inflate the total headers.
-
-Since all other C files include api.h which already covers this, there's
-no real need to bapkport this. The issue was already there in 2.3 though.
-
-Upstream: https://git.haproxy.org/?p=haproxy.git;a=commitdiff;h=5ab3c61932af7619518169da744ba6346f060405#patch1
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/haproxy/atomic.h |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/haproxy/atomic.h b/include/haproxy/atomic.h
-index f60be95..7e3c826 100644
---- a/include/haproxy/atomic.h
-+++ b/include/haproxy/atomic.h
-@@ -23,6 +23,8 @@
- #ifndef _HAPROXY_ATOMIC_H
- #define _HAPROXY_ATOMIC_H
- 
-+#include <haproxy/compiler.h>
-+
- /* A few notes for the macros and functions here:
-  *  - this file is painful to edit, most operations exist in 3 variants,
-  *    no-thread, threads with gcc<4.7, threads with gcc>=4.7. Be careful when
--- 
-1.7.10.4
-
diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
index 320508f7ee..4db0ef00ce 100644
--- a/package/haproxy/Config.in
+++ b/package/haproxy/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
 config BR2_PACKAGE_HAPROXY
 	bool "haproxy"
 	depends on BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	help
@@ -15,3 +16,7 @@ config BR2_PACKAGE_HAPROXY
 	  HTTP-based applications.
 
 	  http://www.haproxy.org
+
+comment "haproxy needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS
diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 2575c408d7..9f3a08c500 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.32.tar.gz.sha256
-sha256  8791585ee3bd24cde652d1d840ac7b1f73f086d5e9ec41c5e079592703ea52a4  haproxy-2.6.32.tar.gz
+# From: http://www.haproxy.org/download/3.4/src/haproxy-3.4.4.tar.gz.sha256
+sha256  b0c5053c4d46840ecdee3925736fe9a3de6472559b43c69183d70e593d9133df  haproxy-3.4.4.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index f75f18e031..d2fba7f920 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).32
+HAPROXY_VERSION_MAJOR = 3.4
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).4
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
