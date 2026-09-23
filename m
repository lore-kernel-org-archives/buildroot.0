Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1983AC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1BC1411D1;
	Thu, 24 Sep 2026 18:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmfJXosu05dx; Thu, 24 Sep 2026 18:59:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 93F3E411B7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276382;
	b=lgx3IR2X64n6RCdalsHE2izdbyuNGoqyAGQAuLQYtIKsBgmEjZ/Lhg6jlwM86jTMDqwA
	 jrtVOZJUkLTTLMdvuPci7eGOXYpZlqrBFgkBTdFinA49T9imFePLUdeaek1tV7lPBlGOR
	 VqNRfyk4+zxbm1xIykmGJl1GnEOzF7MaFVJJNO9WSisTnuZaYZA08iTzL7L9pgGkQJkae
	 IzzHfzcDsho+nU0QLthD4TAqtx1yyiuMrzkAtwGhic66E86IZDJV1R6oz9hPvuR3zZ7pE
	 6t/qqy6JpJTQS0BEaSfkkVZuATTQLVS7tKo+G7XrrtGSskpb0y91FCAS0aAsefJ/+oQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276382;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=KnGuWDBlBeOE40q7+k59Gpd3yqbsos7pIUBW9Bge+ls=;
	b=ZsGm+tuwzK8hNNt/aGzk3EuRL0Sp17JUFHAWWVaLpYHU7U5DRAM64rz8dtLCwvkEPLZd
	 hg5CzMn69KEvJSAwPqvrn1K/N+iSdhuXiA68N5ryJqWs2HFCvRBQhZr5VZ87s+j7HlHY1
	 ZGuuoZ4FmJpTEr8zx2uRz1Mh23JxsHBZz140psQxEP0WH9yVq9rpfwsuJ5aRzsCv8JxSl
	 KCQHtCJUyg5bZjoX8d4vFdOZ4P56smGwHlfxTnDywS/06oksgq5y4T9Qa8M5ghGL2zz40
	 sKA0xOLXuywzKyiWaku2CO1eCZK0hDKPnRwgmd4Xv5j8u9T753xxwdj9+423fxxAawg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276382;
	bh=KnGuWDBlBeOE40q7+k59Gpd3yqbsos7pIUBW9Bge+ls=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BiJwG0MH8w138vBif5vEo/GLcRCHyi2BXFY1dxZVcTubJ0jpy5BHzF1Kp/ap0OHyP
	 L17owJNQfyPmUaTB9gfRrLxW8Q/KR1th3WGuDtauZ3qGs7CBNqk2yQsxua6XYF8Z7r
	 +2+jzpH1xtYqSelX5XWt09sqxE3lW12x8VVRPD0VtWYtnM/XcdmIUwhrqPPKb8rccg
	 X1ekMZYKeLP0wTVAPGCeL3ZR3DBJCaOX2oQzvvQn7fws0Xo4y2idexlt122FI2G/8u
	 66iPZHK5gi6O9U18qX1rmZCv+DNwWpA8VuNGvHBURgTBPG2gPQ3RRsMkh5tJIjutyM
	 4iPtCFDmSekrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F3E411B7;
	Thu, 24 Sep 2026 18:59:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3927392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89913404D7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcBdRdP4q7Bf for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B400F4017A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=MLPU2zeJGpX20mPdRQs/Zxgz851I5fq0SlVJE+MwriI1BjeLnWQh/L3iP9BnI7zuI0Ei
 Sshqy5qvFOCsXmwnvQVWaZRfSoH1WD+jPkbRvXcDKAG03RYD4z9//2OUgJBqGIkV/h1Mu
 PddA0Kc28pINY7J+F+tKp2ThY5xftqNQWg+mF75cMXRZW8g0Mz4eb6UYtVhyW9hc/ptkU
 CuG/XXKbSPeO61HX6B66Z7wOhjJJjSyg1XxNabxjbeckOm5rUkUYxINpW4empR5BytzN2
 /7fA10IDfz0L/NdlWRZiA2fa/2nssJ2tgSAFzhq0Ba0oD7Pl+GX6pdVuUT1xuB2//7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oQ5t1gVQx3QS9nCBC2BUjEPdxT3+7HwcuuECsLnk08A=;
 b=DMFfUEb3CVcVEdUT3uvleosQJugFlZz8A4YSa9B/XAQaLQSfL80tEUQykn/DEDhHVBSE
 M0QmPD2zZ5xZJOUmS1J+5cFOcgApM1PH04yJIHOyd8eW2qodoHEWavUnERx5yIE/W2XPf
 wPQ9O6daCDEUm7x2LDyiL3yafjFmcnpfga6xmX7BWEOhUVAB4EzfRXDNm3PRJXQ8U69qQ
 +XGGdta/7lcJ9Ji1WdA0O2E8ZQJukgFdyLjIDf3gdAqWVksTcsGfPDOFJ5w0VJu3JOTih
 2l/byUMBwfzsfPuBxFbMT3yqh33wBgJ4dbMI+y2l3bK0RGaIOZbTJBxkPveAzZJ3eBg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B400F4017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 581DE9835A; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:32:12 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 08e14ffaa8d0eebf7c3b92d24235a0437bb21288
X-Git-Newrev: 8ad879736ec00ed644fe78a82cab2807783903be
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.581DE9835A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/tensorflow-lite:
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
Content-Type: multipart/mixed; boundary="===============5756074182830947731=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5756074182830947731==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ad879736ec00ed644fe78a82cab2807783903be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============5756074182830947731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5756074182830947731==--
