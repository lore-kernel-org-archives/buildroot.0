Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535A2C61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 20:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D976070B;
	Thu, 27 Aug 2026 20:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXy6sKrQqBZj; Thu, 27 Aug 2026 20:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787863272;
	bh=VDy8XUdgyHOvoDbNUbaX1And7QVPJUicf4f0fwIegdU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jYFFHRCVI49fSY/j7PaH64aOjIzC6mfl/TltF76SjKc8GwOQvQGLR/hpHVR/gB4dE
	 4Xiiryx/CrrhFmO27Q6opaTVVYStpTquz1I3vjD5hx8mEasCRkLcqdLBOtUosMtwvr
	 6AmH1JAxqGLEIqY/FNhib7bR3xJ2Ift/k0vdjHbWEUxS4mA3LDjbpey5CnF4Ex0eR0
	 evzBPt7dFHNY3Ru4JwWVYFBFzOiFzUhbTj4+H7xN/6LWIAlSa05XVw1hgBTAQ81jtf
	 zVc1ctX21s01QJgz0Xc3Xx2/6miSPpkJmuoUMvwpnaeBVYVbjwzqug9vrE+TbsdHrZ
	 kY4jgFr8RYgUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 322BF6079B;
	Thu, 27 Aug 2026 20:41:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49302465
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45D2680EEA
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfYsU6P7JVpO for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 20:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F27480A5C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:41:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3909920D9; Thu, 27 Aug 2026 20:40:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 22:40:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d950fff290b1318fd72c7f09fedbd1b87b96155f
X-Git-Newrev: 34473e672b7cb4dabcf6ed36a4cb41ccb1e04641
X-Patchwork-Hint: ignore
Message-Id: <20260827204012.B3909920D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/olsr: fix build with GCC >= 15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34473e672b7cb4dabcf6ed36a4cb41ccb1e04641
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit introduces a patch, submitted upstream, that fixes the
build of OLSR with GCC >= 15.

Fixes:

  https://autobuild.buildroot.net/results/650edf74dec513ad540f80f4d3ef8c8222dfd711/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...r_types.h-fix-boolean-type-check-with-C23.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch b/package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch
new file mode 100644
index 0000000000..dbb167fe96
--- /dev/null
+++ b/package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch
@@ -0,0 +1,35 @@
+From 6d7aab6d01ffa68f79b0b238d812a074051d94c4 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 26 Aug 2026 00:00:00 +0000
+Subject: [PATCH] src/olsr_types.h: fix boolean type check with C23
+
+GCC 15 defaults to GNU C23. In C23, bool, true and false are keywords,
+and <stdbool.h> no longer defines __bool_true_false_are_defined. Therefore
+the existing preprocessor check incorrectly rejects a valid C23 environment.
+
+Keep the check for older C standards, where these identifiers must be
+provided as macros by <stdbool.h> or by the GNU C fallback.
+
+Upstream: https://github.com/OLSR/olsrd/pull/139
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/olsr_types.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/olsr_types.h b/src/olsr_types.h
+index 36d2b723..ce2a0559 100644
+--- a/src/olsr_types.h
++++ b/src/olsr_types.h
+@@ -82,7 +82,8 @@ typedef signed int int32_t;
+ 
+ /* add some safe-gaurds */
+ #ifndef _MSC_VER
+-#if !defined bool || !defined true || !defined false || !defined __bool_true_false_are_defined
++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 202311L) && \
++    (!defined bool || !defined true || !defined false || !defined __bool_true_false_are_defined)
+ #error You have no C99-like boolean types. Please extend src/olsr_type.h!
+ #endif /* !defined bool || !defined true || !defined false || !defined __bool_true_false_are_defined */
+ #endif /* _MSC_VER */
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
