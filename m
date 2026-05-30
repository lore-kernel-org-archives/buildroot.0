Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A50CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AA2F853ED;
	Sat, 30 May 2026 20:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2L_UlLJMkt8; Sat, 30 May 2026 20:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4680B853D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780171447;
	bh=cKSGGcRAgquqswwLSn1JmqheopQpINSuNrzIvSLrF5s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FGi0zgHJoKlqxwz+Q3YPlgXBi7EiEOpZy5yW7t1+erkLN0++GZ5U3Ric8g5qIfwGZ
	 rIdQaBsGqO+WpLUdP4SMBos4pVe30F+UAk2UBskmM+PjfkVBpRJr008CVqRl/kHTa8
	 z8Hzq+mFqbcnlfcelFQA4cqwasb3u37ycj+VAP/8b2qfT+0q+Vv9jI1LaKWNXj5C2i
	 6e2LAaW4YLSlTvuohKn8CyueUeQMTX1+hWiPoxCnU9kbYqz1pChyPmOUBRn7cKXWFB
	 MDdePgZKXWm1W7CIB9FAkWF2AxIschEbccAZIHzRlYXjsU6Flrh7rNV01AgelX+y+g
	 3mY6QPm52LenQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4680B853D0;
	Sat, 30 May 2026 20:04:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0338D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C141342F25
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORjizDnE00MF for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 172CB4287F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 172CB4287F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:04:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF70687550; Sat, 30 May 2026 20:03:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 20:18:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2deee0c87dfc5db94da8ac9213f5d09a4d9a3038
X-Git-Newrev: fca527be89945d5b77bc489ef4b4d25e99a7c848
X-Patchwork-Hint: ignore
Message-Id: <20260530200351.DF70687550@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: fix build
 with Linux 6.19
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fca527be89945d5b77bc489ef4b4d25e99a7c848
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add upstream patch to fix build failure with Linux 6.19.

Upstream: https://github.com/aircrack-ng/rtl8812au/commit/f17facc866cb36bc889f873beb36e7991fa5e71c

Signed-off-by: Christian Stewart <christian@aperture.us>
[Arnout: update upstream reference to merged commit]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../0004-fix-build-for-kernel-6.19.patch           | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch b/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
new file mode 100644
index 0000000000..83ed1600f6
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
@@ -0,0 +1,37 @@
+From f17facc866cb36bc889f873beb36e7991fa5e71c Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@aperture.us>
+Date: Sat, 14 Mar 2026 14:53:48 -0700
+Subject: [PATCH] Fix build for kernel 6.19
+
+With kernel 6.19 and CONFIG_X86_KERNEL_IBT or CONFIG_KLP_BUILD enabled,
+objtool runs on the linked module object (delayed objtool via --link).
+The module Makefile passes --strip-all to ld -r, which strips local
+function symbols. Without these symbols, objtool cannot determine
+function boundaries and reports errors like:
+
+  88XXau.o: warning: objtool: rtw_mp_cmd+0xf8: unannotated intra-function call
+
+Replace --strip-all with --strip-debug to preserve function symbols
+while still stripping debug information, allowing objtool to properly
+validate the linked module object.
+
+Upstream: https://github.com/aircrack-ng/rtl8812au/commit/f17facc866cb36bc889f873beb36e7991fa5e71c
+Signed-off-by: Christian Stewart <christian@aperture.us>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -22,7 +22,7 @@
+
+ ccflags-y += -I$(src)/include -I$(srctree)/$(src)/include
+ ccflags-y += -I$(src)/hal/phydm -I$(srctree)/$(src)/hal/phydm
+-ldflags-y += --strip-all -O3
++ldflags-y += --strip-debug -O3
+
+ ########################## WIFI IC ############################
+ CONFIG_RTL8812A = y
+--
+2.50.1 (Apple Git-155)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
