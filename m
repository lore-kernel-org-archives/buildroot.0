Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B25F357DB
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 07:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE3C841E4E;
	Wed, 25 Feb 2026 07:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOiGq7sJBsin; Wed, 25 Feb 2026 07:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9563741E4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772005568;
	bh=Fern5EAW/kpnjaV7Hps1t2JghVJEFNGKcthRoN8how8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HrMwu+q33PT7kjJhpotLPnr30uudVOIz4loPKUO5Twsu37iPYvgfc2+7xH1/SzeXU
	 o8etnqj5p+kY7yeoVIKTXy/oJpe7OOGbnLoMoE4LooVMWAsTU7Tk1FbFHwVRjbCKaX
	 e3Qw0zpMknTT2vpjfLf7DiTgW84lMrB3Vxrq7zBHdHIsBhLZVRSfIlmcHObFZaM52A
	 an2fQe4NzD/cIBPNQF1kTv196R4ze0Xpr9giBrqQlqzgPsagYoaHXxtnG9WqfoOeCU
	 dag6zsTisEKqCW6JDSLPuSSGC32GjIIva3/fEXeTghraBhzm4x/XssZ88ZBrLnnpYP
	 oT6+dwnEEcDkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9563741E4F;
	Wed, 25 Feb 2026 07:46:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F39C523D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 07:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F08E54031E
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 07:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPve4ndRuImB for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 07:46:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6AD440119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6AD440119
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6AD440119
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 07:46:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4AE3A4C2D04
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 08:45:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46952)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vv9ae-0000000054E-3Nm5
 for buildroot@buildroot.org; Wed, 25 Feb 2026 07:45:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 08:45:48 +0100
Message-ID: <20260225074548.2781869-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772005557;
 bh=UogTPjyRCrnYWm2BBb2vyNaIphUzrKUgPovNyyeciAU=;
 h=From:To:Subject:Date:From;
 b=CLxyqhkTq0ZFU5WnEGYizDFE4rMdVGrvCopsgmw5jbML7yj+HUv7zHtTU2/tyE3hq
 hT3+MuDTX0SObhX5S4cgA5csrnWqBJyHJfscGflb5pkmzgBOj/CS+Jth+jbrGjQHnv
 ICkyYFlJTYSEWy/4QbCq4qpvjyf2cpAuzqBhckGceUSVfqqCKGp9TOdQWRvt+Wp+WL
 hii0g9FrPmsBVgRCIGk1GB8yPdGNxhLrKLU3Ng5EDDmc21s9oSYGDj1Ls3hBWi5dc9
 92bL4uUQeGsqBh302owByMt56/r9cvbXWPxPi0q6VIQEShjpxN7PYQ5nFHIaNXWzCB
 dJkaiLnIpEx4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=CLxyqhkT
Subject: [Buildroot] [PATCH 1/1] package/docker: Fix build with gcc-15.x
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

Add patch from Debian to fix build error with gcc-15.x

Fixes:
https://autobuild.buildroot.net/results/495/4956555fd033d43c1877e66141789bcd06aff5be/

Patch sent to fork which is used by Arch Linux:
https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=wmdocker

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...tibility-explicit-fallthrough-undecl.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch

diff --git a/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch b/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch
new file mode 100644
index 0000000000..49b46d14b9
--- /dev/null
+++ b/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch
@@ -0,0 +1,40 @@
+From 55054532589041e3c7b970fefaeeeee871f4f6be Mon Sep 17 00:00:00 2001
+From: Tianon Gravi <tianon@debian.org>
+Date: Wed, 25 Feb 2026 08:24:26 +0100
+Subject: [PATCH] fix gcc-15+ compatibility (explicit fallthrough,
+ undeclared/unused arguments)
+
+Downloaded from Debian:
+https://sources.debian.org/src/docker/1.5-6/debian/patches/gcc-15.patch
+
+Upstream: https://github.com/mdomlop/wmdocker/pull/1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ docker.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/docker.c b/docker.c
+index 4cc8d78..6105ab8 100644
+--- a/docker.c
++++ b/docker.c
+@@ -46,7 +46,7 @@ void signal_handler(int signal)
+ }
+ 
+ 
+-void parse_cmd_line()
++void parse_cmd_line(int argc, char **argv)
+ {
+   int i;
+   gboolean help = FALSE;
+@@ -283,6 +283,7 @@ void event_loop()
+       case ReparentNotify:
+         if (e.xany.window == win) /* reparented to us */
+           break;
++        /* fallthrough */
+       case UnmapNotify:
+       case DestroyNotify:
+         for (it = icons; it; it = g_slist_next(it)) {
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
