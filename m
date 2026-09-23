Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3F1C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342C940ED6;
	Thu, 24 Sep 2026 18:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxZMdMJXfqbe; Thu, 24 Sep 2026 18:58:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BFF2D40EC7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276281;
	b=rrLzABQGSCqa92vaueedyDEFbpIZpHi7dtF9AdsdSjilKJcI192dZVhOSsWbt+wcSGXK
	 qgUSPbQg44UBGGMz/0FeIW8Km18rhWyhhuzRvqCx9CqH+Wc45JwPNsc8EeCisXfpXkG7W
	 wihrrYfue/IgcXKNEE0CaAXgE/khCtW8cpLCSgXBEucUAIOWmm2SYzjzCKWSIyBJ3ezbR
	 R1gjH9cPBYU3ZYlduP34K8BVc8698i9xoDCEGQI0cNGhGt6TqPY5b0y3ANGi9X3dDq0/Y
	 m0joMX5Fqvmy9Il+IH/YurNbXul8DuzNun2TI4pUF9P3DNbLgBaH0V6vSp+LV9YOIBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=l0RImRto4dKRTd353PxROftjnk+gZAM/RlL8k7iaYqs=;
	b=dG6VAU2TeclueUL4R5NBY4DaCeznmcptcbododXQsW506fU1iF3r+RXMUGFjCBT+oSEK
	 a/fR3Cr/qLBJ5V2Gf7XPDjLmw8/fONnkzu+pkxWGhMPFkQrxDvr4wmGZ15VyhU25BLBjQ
	 zBB1mTtdSxYq2YcoXABuHRgda8ZWuPg2IIMTP4fGWPBOOMIG9CIzjUz1mlUCzGmI/dsAZ
	 aByNocDIilDMOTafPax7825NKk7OaSl3LI77rQckn2gOr6AFNZHTpJBy6VBBr93qA4UBO
	 ZmDLlIJbogdrJFpdXuk8oKdAb0501oxpc7KJ/+ihGgC3jTLstS57s9e02UoTefPNmKQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276281;
	bh=l0RImRto4dKRTd353PxROftjnk+gZAM/RlL8k7iaYqs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PdAyni6JN6GLoVwKfuk9qotmSDOdTnbCboU1v8O5GvgV3pRgfmda+ARvQyFAJVANf
	 sUbCowGJ3auqoManHUq0l1Wu/e8a2jO1JpTOntACaGXCQtukQYxb7hcb6dpx3kTr/2
	 f3wjjKJLCnxCnBQkgXgpZU1UfmfU536uxA961D368XqVrleglEQqVRT6KYjuyXJZm4
	 cwYqIrkAxJk/jxafbY/r0aEyVzrYd+R6SK4dbPadhJgzvEU4IDOhqG5FVq2QYdA5mC
	 vBKKf3GmWRR85zS4dVqChy1+GQp45EVGft0BO/UmHMf/ivf8uq6nWu3p0Ux43PvWV8
	 h7xqc07DaI9Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFF2D40EC7;
	Thu, 24 Sep 2026 18:58:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 900F3332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7437540ACD
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ow3SDUMyKvxn for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E07A140AD8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=WjhEkg06RymIpoio6AIYCORpB5BFhBy/2s+ZpnVFY+ga7xOpbNsBTb2XQJTZVNDDZNmF
 phOXQo4d0f306ciWQQKqfwASxoh7+Q87Wk8ylz8z47WMb3Mpp2wT5coTgjg49fIRkpBaW
 GXrORu5pXcXXSRv2Q6xk+/1LEI0iiRrhfizrptdVJWdl0T1a9v0ff57/tmjrGXFZt4fHz
 m5xVbXVz6OZafhhLyu2lCiOZINn2hgfMWK6u9ozcsYQT1giq5WJQhRPAfY2FySsCKVFNv
 BI8quNUaFoLhoylUR9+2wzgp3EhqlxznU0MaiUKh9dSv+5IFf4Mus+KAVDhGaZWTucQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EGfNl3wkAVmMWpm5aryu7+tyynzEh6NBViPmgw9GK6s=;
 b=frdY5y7BiPGish69MlioHbcywDxJ/h9RkHDAvDD7TsIEADhA3ta52RpJ5xq0LQ8gwg8E
 BpGzMgrfSXjmgXGxpHAbjSGOY7jdDKcRUg87HdzGky75B2y7KuXuGz1zjwKWJBDfmIEcC
 7ywFW71Fe/O4x4J5nqbLJVQnpeXNCssi/OFo10n4Ah7Jmc2aiMdv0UsoFygNlWw/asZ6W
 0Wf+iR5FKZWM8MSwXUfk0WqSYh0pZLQUu/Lc5UCaMgr5uOrfs5Krvbw71ASLKawSh37xc
 Jof6SCQVwMi+VLdLj4EDbxk6GaVf5OQyyiVblGoUgqfIl6qZWo4CxPtQMKSnBKS5Icg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E07A140AD8
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8433B96FF8; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:28:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8671ebb501c29b036ad414321929f72cd25cf34f
X-Git-Newrev: 022aa807334b5b14ef0df19a7ae442e048605c74
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.8433B96FF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tensorflow-lite:
 fix Config.in comment
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4230992497960026240=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4230992497960026240==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/022aa807334b5b14ef0df19a7ae442e048605c74
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This commit fixes 3 issues in the Config.in comment:

- It is displayed even on unsupported CPU architectures, so we add a
  "depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS"

- It doesn't mention the need for a glibc toolchain even though that's
  part of the dependencies

- The requirement for dynamic lib support should be part of the same
  comment as the other dependencies

Fixes: fd29fee3a3ac0ce45404ed256d2059836c352728 ("package/tensorflow-lite: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 101d543e38e5be14f2b545362fdc0d795c0fab24)
[raphael: resolve conflicts]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tensorflow-lite/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
index baaf5b6d86..4c448b0352 100644
--- a/package/tensorflow-lite/Config.in
+++ b/package/tensorflow-lite/Config.in
@@ -31,9 +31,8 @@ config BR2_PACKAGE_TENSORFLOW_LITE
 
 	  https://www.tensorflow.org/
 
-comment "tensorflow-lite needs a toolchain w/ gcc >= 8, C++, threads"
+comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 8, C++, threads, dynamic libraries"
+	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
-			!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "tensorflow-lite needs a toolchain w/ shared libraries"
-	depends on !BR2_SHARED_LIBS
+			!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS || \
+			BR2_STATIC_LIBS

--===============4230992497960026240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4230992497960026240==--
