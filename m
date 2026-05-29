Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D053BCD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7821C8068F;
	Fri, 29 May 2026 16:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qTFIqXWPvQu; Fri, 29 May 2026 16:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7F7780693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071261;
	bh=5o3F/sHb0fefsOBh53sF4PXuJsNzHIeQgz0pyYDuRW4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Br5m+Fq/Vlb6Amff+1SUgNwYL0vdjWhZWwyaA4i5DmBuUX4d4v+prWrS+Lj55kt+/
	 cOWfeavCnSNBFfiIW1be6nB8oxqjK2/gLO/6UN6zv3pgteVmNqn2fQoy14iTjTgTW7
	 vRMKlVzUHY6jPVM1rBfVFk9zKVFEInTpJgH2SZrNgSlesS4xlc0ym15Xv3d76HVfp7
	 g3Wwr0X+v6LCpeL2k3kUQ+TccKXlxzufb7iR5QdPwjMD3XMbmD7lN2drKmxXbBy5eu
	 h/o6bFPNH9VNGy7hrvm/7ooQ+vhrpe9ryzL0rTDGlIRY0IREIiEQr9s+SR56Kn0P8M
	 eyhRpAulc10Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7F7780693;
	Fri, 29 May 2026 16:14:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 337B8F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22A6E408AB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gs63oA5eo-0Y for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4317D403DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4317D403DF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:14:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42BA0873EF; Fri, 29 May 2026 16:14:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:13:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a5817137bfc57317adfdbd11e540c3a0dcd1c98
X-Git-Newrev: 06377680ae681de5b223cf1eeaae511449def0a7
X-Patchwork-Hint: ignore
Message-Id: <20260529161403.42BA0873EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: fix musl build
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
Content-Type: multipart/mixed; boundary="===============1651499696843330351=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1651499696843330351==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06377680ae681de5b223cf1eeaae511449def0a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/b14/b14481674ef0e292c7caf5c7db462bbbb997fc34/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/freeswitch/0008-apr-fix-musl-build.patch | 65 ++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/freeswitch/0008-apr-fix-musl-build.patch b/package/freeswitch/0008-apr-fix-musl-build.patch
new file mode 100644
index 0000000000..126c539983
--- /dev/null
+++ b/package/freeswitch/0008-apr-fix-musl-build.patch
@@ -0,0 +1,65 @@
+From 81bbf05838fc24b221debfdf75ab8a4c7e7b260c Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 29 May 2026 08:14:32 +0200
+Subject: [PATCH] apr: fix musl build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+strerror_r on musl always returns an int since its addition back in 2011
+with
+https://git.musl-libc.org/cgit/musl/commit/src/string/strerror_r.c?id=0b44a0315b47dd8eced9f3b7f31580cf14bbfc01
+
+Add defines created by freeswitch configure to apr subproject to fix the
+build error:
+
+misc/unix/errorcodes.c: In function ‘native_strerror’:
+misc/unix/errorcodes.c:358:9: error: assignment to ‘const char *’ from
+ ‘int’ makes pointer from integer without a cast [-Wint-conversion]
+  358 |     msg = strerror_r(statcode, buf, bufsize);
+
+Upstream: https://github.com/signalwire/freeswitch/pull/3046
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libs/apr/misc/unix/errorcodes.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libs/apr/misc/unix/errorcodes.c b/libs/apr/misc/unix/errorcodes.c
+index 3be0b25b93..93c428df62 100644
+--- a/libs/apr/misc/unix/errorcodes.c
++++ b/libs/apr/misc/unix/errorcodes.c
+@@ -25,6 +25,9 @@
+ #ifdef HAVE_DLFCN_H
+ #include <dlfcn.h>
+ #endif
++#ifndef WIN32
++#include "../../../src/include/switch_private.h"
++#endif
+ 
+ /*
+  * stuffbuffer - like fspr_cpystrn() but returns the address of the
+@@ -352,12 +355,20 @@ const char *strerror_r(fspr_status_t, char *, fspr_size_t);
+ static char *native_strerror(fspr_status_t statcode, char *buf,
+                              fspr_size_t bufsize)
+ {
++#if defined(STRERROR_R_CHAR_P)
+     const char *msg;
++#else
++    int msg;
++#endif
+ 
+     buf[0] = '\0';
+     msg = strerror_r(statcode, buf, bufsize);
+     if (buf[0] == '\0') { /* libc didn't use our buffer */
++#if defined(STRERROR_R_CHAR_P)
+         return stuffbuffer(buf, bufsize, msg);
++#else
++        return stuffbuffer(buf, bufsize, (const char*)msg);
++#endif
+     }
+     else {
+         return buf;
+-- 
+2.47.3
+

--===============1651499696843330351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1651499696843330351==--
