Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC6CC001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 06:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17E9A405F5;
	Tue,  8 Aug 2023 06:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17E9A405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MecoXwAxhmck; Tue,  8 Aug 2023 06:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A479401F3;
	Tue,  8 Aug 2023 06:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A479401F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 272B81BF309
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 06:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D622740941
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 06:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D622740941
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tn-TyeuQ_rxA for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 06:54:53 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 644294093D
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 06:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 644294093D
Received: by helium.openadk.org (Postfix, from userid 1000)
 id AA2EA352BD59; Tue,  8 Aug 2023 08:54:49 +0200 (CEST)
Date: Tue, 8 Aug 2023 08:54:49 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNHmuZ6+nRwp71r/@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691477689; bh=BD00jLKM0QYCK/1f82pcwziNjUj2KTj0NdIkW3rmGPk=;
 h=Date:From:To:Subject:From;
 b=wRDYYG7MxG9rwsYhYdttjsWZt0qiioGPjmPi0oZ3LBfTSHZxMm7ISUtQsAbmtS+ku
 kWKY4PwTEizhi4WKhTr1LQ+it3NOn7EzzeOXRMt9HYfVdqsLToCxRthK6nB/BLHw4z
 ypikdR0THEWTRxEOddt2HKwYXSzDKlpm8pvmEhTpTrbyC7kwKP2p+3euJTTvqSxUeC
 nSX8bJpAw2tVZnMQaayZz+EslfduxP1cM3Ay3T+0mYr2+zGaMuHWauukFifadInaqu
 tbaKSETPwmoWyelhrDS8xzqkGlOdYfsMODB9zuNnNsSoSdNeW4MlW4uIQ5LRMEIRfE
 20hkuBYXgDG1A==
Subject: [Buildroot] [PATCH v2] package/mpg123: fix linking error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

This was introduced since commit f8af24707b196eb64121d29a829fc31b5506409c.

Patch was provided by upstream:
https://sourceforge.net/p/mpg123/bugs/353/

Fixes:
 - http://autobuild.buildroot.net/results/74e/74e1522cc9328c98186ca730eeb7ce0cb5fbbcb5
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
 - add a specific autobuild failure
 - use Fixes: for link to autobuilder
 - add a reference to a buildroot commit, when the problem was
   introduced
---
 package/mpg123/0001-mpg123-buildfix.patch | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/mpg123/0001-mpg123-buildfix.patch

diff --git a/package/mpg123/0001-mpg123-buildfix.patch b/package/mpg123/0001-mpg123-buildfix.patch
new file mode 100644
index 0000000000..cc731ea967
--- /dev/null
+++ b/package/mpg123/0001-mpg123-buildfix.patch
@@ -0,0 +1,24 @@
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://sourceforge.net/p/mpg123/bugs/353/
+
+diff -Nur mpg123-1.31.3.orig/src/libmpg123/getcpuflags.h mpg123-1.31.3/src/libmpg123/getcpuflags.h
+--- mpg123-1.31.3.orig/src/libmpg123/getcpuflags.h	2023-03-15 09:02:58.000000000 +0100
++++ mpg123-1.31.3/src/libmpg123/getcpuflags.h	2023-08-07 15:57:19.444106173 +0200
+@@ -44,6 +44,8 @@
+ 
+ unsigned int getcpuflags(struct cpuflags* cf);
+ 
++#if ((defined OPT_X86) || (defined OPT_X86_64) || (defined OPT_NEON) || (defined OPT_NEON64)) && (defined OPT_MULTI)
++
+ #ifdef WANT_GETCPUFLAGS
+ #include <string.h>
+ // Wrapper needed for ignorant clang memory sanitizer that chokes
+@@ -55,8 +57,6 @@
+ }
+ #endif
+ 
+-#if ((defined OPT_X86) || (defined OPT_X86_64) || (defined OPT_NEON) || (defined OPT_NEON64)) && (defined OPT_MULTI)
+-
+ // We really evaluate the CPU flags.
+ #define OPT_CPU_FLAGS
+ 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
