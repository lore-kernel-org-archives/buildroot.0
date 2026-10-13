Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A756CCC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D5DA6074D;
	Tue, 13 Oct 2026 08:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBFyUIApcPJJ; Tue, 13 Oct 2026 08:14:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 31A4360755
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879280;
	b=Jv/HXLSeC6sNH1dEqATek/jhjZlbvwOiOPzg18Y7CCNha4WeXRjlWmMni/y3ZMx4qXTN
	 ZP9bTKJznsZ62BF/e9ZLHCz4lw3xNh7wNfgUFQO/bgcaM0dlJHOkpfbVjzEKHvZAndynu
	 WP4PPiPQw1MEFFDr+OuEvKboKWDLaNJ2ScLAGgxB+OB30RMoBZp+JWHdbxI0OPXKeAdAI
	 OO1b69D7v9wFqOgzlLj1xZbXqljhC/m/IDvTOjCMH838P3khSGjSYQ1YaGoRTfj+LHmMR
	 qORxlrulYB7XO0h1qRZCL9+WtyGJmoYd8g8R4PEgvZsyaeoQipaWAnkYx0gHGuTXxNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Yq5LH5vEUT8gYrPqRvCXr4p83rVhZgoXjkof8QFVnFY=;
	b=WsHR0tMeW4KUbMPQ1Sn9452u05Qi1zx4TPWJHrqbEE+YVJEeN+z/ufRwo4Yx/9Ew2I7n
	 sGKYwu3U6M3O/dFa+x5wHm2rEI5KWw/qGfjooZvpm08bHe9bHMavHJYG7S43yY46eyQ/T
	 K0ibZ+wsNLeEWq7dLAUIZHaHyolanlnu8HeVcu16p7EnZ2WTK98Xf9HyxugJSiK+UmVvf
	 izkJqZQlvaWpp6Jz09IpqIygHRbVCfd4m2GevUjuXREG0csF4/OWfjn6id3EF4cD/i8xb
	 g/0ddh/sDHz2wQnb3yZP3tT2Yj9hnCUxP8dgz/1IPAKGnNVHEmzwFx57j5NTlTcJ3tw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879280;
	bh=Yq5LH5vEUT8gYrPqRvCXr4p83rVhZgoXjkof8QFVnFY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bBUi3mij7KL0UfIuXUCGioU3y633CeH0lGb6NV2/6mnljzGFJodxcpBmy6DMd9o/i
	 NoNOEahdiMDJgoM0ZiyxsbQZ5Qji1S9QcmoS/3CtCJJuFgnbG9ZcqLVOW9ZP8d7bXa
	 dp7VbvBcf+Us+GIex1DN9rtiFZI4qHs1x/mD+Q1OKbzlMbAZWGkxh0jRagIIppf0yZ
	 jqYjuLSTk+wpYIkXNKkOuIJtvnUaaL9HmO7C+L+QDQgVzaO/VM/1OBR+NgjX00ync9
	 ef0G/Wpl0Ao3da+k09IjO+PxKosPgGrWPs5O/hMb/omXhe22wdZN6rhILIny9D2OgI
	 92c+XMTw1/1GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31A4360755;
	Tue, 13 Oct 2026 08:14:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71AB51E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 638EB60755
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hlav_Ambz5J6 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 936056074D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879278;
 b=KwBm3R0QKIuEU8a8xbglTcZGLH7Y176La5QKtsc0o8OUMLuE4EVFQe1YheDUhSTS5OXI
 fCCcTzedPsTARmxFRaWJMd9XT0x3edMv8Sz64EAoitjPkRGaTmk/WL4NLDGHEXrMryOh2
 BBxTfvzUo8zlImerQDUoeibB59JYFl8qwPaIEDTA8YQqSdSWDujgRcvM8eSpcq28LlbTy
 8LPti10wU0Q2NacjLEyW+bKI/hbQWa0sf1meP3cYu+rijHIXwLdve6hANGM7CsvvXB8Yj
 E/n1TDKIutPQVp78ilUfq5KeQOs88AHbDteIPI3iQlzLhcdSGRH3zblRWc6JAizqHrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879278;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=quP+zQFZ9fYTtf7AQO5G3B6CdoOmD/JrJyy8MGswxgA=;
 b=n8MdVKHgXBP9bJLQ8mr7N+aeATePf44eULzefcdw/FX18LpCgZ4vOKrI1t3AeF8REBHB
 GYrOG2ltiwoLLsN20+KQFZHZpse9ZhpHd+tdGLaDK2pq4tbMskF9K3jBXqgOIS0+OuUYf
 TU6uCeT7c6c5PZ2AENmd7stwoBybj+tBVmyksvelnG1zENvrkZkgKBQjwRj9Tw3ja3lV4
 vJGmS2+EUYVLqw9ELHYQ7V1TTVOhmEZ9+07hkeXYVsqSvlNV1efziyjMiCrIQ6Cm5x0YG
 kJg7aFLW5N9F2CtMzBiotg8ToKU4CwNnmH3r9jHbEGFtakC4pAhLsl5cK/UpCGf5MrQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 936056074D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:14:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 111A595482; Tue, 13 Oct 2026 08:13:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:13:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 747aa911f6a471558a5fb2a9e1b133d13104cae8
X-Git-Newrev: 107e7f54ae047cfed1aa844680f17cbc5e645f7e
X-Patchwork-Hint: ignore
Message-Id: <20261013081319.111A595482@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: patch to remove
 pthread_atfork dummy for noMMU
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/107e7f54ae047cfed1aa844680f17cbc5e645f7e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For noMMU pthread_atfork() is only a dummy.
This causes build failures in util-linux: the configure.ac script
detects pthread_atfork() presence because the symbol exists, but the
build fails because the prototype isn't there.

Fixes:
 - https://autobuild.buildroot.net/results/936/93637dfaabad0a1f11a94488421f6cc73882817f/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...linuxthreads-add-dummy-for-pthread_atfork.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
new file mode 100644
index 0000000000..66605aa657
--- /dev/null
+++ b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
@@ -0,0 +1,43 @@
+From 2e902dccb925f1f185836bbad2284e2879550cb3 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 11 Oct 2026 16:25:53 +0200
+Subject: [PATCH] Revert "linuxthreads: add dummy for pthread_atfork"
+
+This reverts commit 9e38e0aa45cca21d5023d0af94377f0e1e41d2f4.
+
+As reported on the uClibc-ng mailinglist by Thomas Petazzoni
+this dummy without proper prototype is breaking util-linux
+compilation. My usecase in 2017 was curl+libressl. Since then
+I moved from libressl to libopenssl and that works fine without
+pthread_atfork(). Tested with curl in Qemu for RISCV64 noMMU flat.
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/2e902dccb925f1f185836bbad2284e2879550cb3
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libpthread/linuxthreads/ptfork.c | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/libpthread/linuxthreads/ptfork.c b/libpthread/linuxthreads/ptfork.c
+index a1bad3d54..74d630830 100644
+--- a/libpthread/linuxthreads/ptfork.c
++++ b/libpthread/linuxthreads/ptfork.c
+@@ -150,16 +150,4 @@ static pid_t __fork(void)
+ strong_alias(__fork,fork)
+ strong_alias(__fork,vfork)
+ 
+-#else
+-
+-/* We can't support pthread_atfork without MMU, since we don't have
+-   fork(), and we can't offer the correct semantics for vfork().
+-   But instead of failing, just provide a dummy */
+-int pthread_atfork(void (*prepare)(void),
+-                  void (*parent)(void),
+-                  void (*child)(void))
+-{
+-  return 0;
+-}
+-
+ #endif
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
