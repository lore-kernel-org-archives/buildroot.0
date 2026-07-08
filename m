Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9327AC43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 20:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B54C6083E;
	Wed,  8 Jul 2026 20:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALWDSSHblorp; Wed,  8 Jul 2026 20:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EAF26084E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783542871;
	bh=n4gAFB+g+jaMSnf75svlP2Cl9FgvGuf0G7DIpRqgegY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HVrcZ7mNeQwEi7u7qaLVCdZnEqV6ZOiWZi8X4yLiaCYp31c8e+n6yFPQV6Fz1KTNf
	 ZAhQB/CnC2FPu3xiPPh74He/q+LWbFxFmRKe17Fr73aQxerxHoYzrrQnez8htaFYqK
	 zofKYVezNy7fDObtxapKpE6TgMU9YWWsrrxgACoz+rfRMkpVlnO+SoDv2jIbOD/wgy
	 gh5cd1Bg+iQD51cSYkqMWxrlr7BG0B2VvcVBQCseax6N5ZCsMK3tUB8lL1H8KSxIyS
	 A88R6NPL4ueAfyERI4M3aeTmmoq2+YYThPnKAw5lwLbsuL8qVHDDjKbACHsxMS23Z+
	 /aw5F6k73ACHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EAF26084E;
	Wed,  8 Jul 2026 20:34:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 067E62D1
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 20:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0D9C81B23
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 20:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btk0CNUjANj3 for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 20:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 084BF81AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 084BF81AA7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 084BF81AA7
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 20:34:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a01.dip0.t-ipconnect.de [91.58.10.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59E95A4C0F25;
 Wed,  8 Jul 2026 22:34:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43482)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1whYyP-0000000021m-42Iv;
 Wed, 08 Jul 2026 20:34:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed,  8 Jul 2026 22:34:25 +0200
Message-ID: <20260708203425.2073196-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783542866;
 bh=DH0zd04M7NVJI6YQcA7CUZqxsoH6yDZuMw9XvICTccA=;
 h=From:To:Cc:Subject:Date:From;
 b=TM3EctFVBhA1aVnask7s5l3TuWjXZAr3sGqmdhuraG6uGEQJa3V9YaAeCQ/Yy8g4S
 bwFrR2C8upQNETpc/+4U9Jw5ZqLHy78H08rXfMAWW5qgZ8V9d7VR1nrHWYSLVW1TRu
 U3Ysj2HW80scjU2oJLF54zfoRWy1Yj77cXYdpffEAinB2px18/hhQZqJ/m355+xCvT
 djjSAw72QCfX1WCwXP0gn9uuoMLl870qWKz3gLCoI6E5lNOyzERm1lbeFencv/wB1u
 Sr9knA/FYDynaPHhMxUvC26Y1oPuhAdLe0bmKim54DtlMQDbVES6boI0KZwin+Lexy
 fmC9rwKHcImSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TM3EctFV
Subject: [Buildroot] [PATCH 1/1] package/binutils: add build fixes for host
 gcc 16.x
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

Backport upstream patch already included in binutils 2.46 to older
supported versions to fix build errors in gprofng with host gcc 16.x.

Fixes:
2.45.1: https://autobuild.buildroot.net/results/235/235c8a176dada9f9cb5541fcdd188e8f01f4cd22/
2.44: https://autobuild.buildroot.net/results/a53/a53c06dd61083451f9092ed1544619ca4a62211d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7581a30975b8b5f5abfcb966ac920c3506c2e545

 ...tect-against-standard-library-macros.patch | 35 +++++++++++++++++++
 ...tect-against-standard-library-macros.patch | 35 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 package/binutils/2.44/0005-gprofng-protect-against-standard-library-macros.patch
 create mode 100644 package/binutils/2.45.1/0004-gprofng-protect-against-standard-library-macros.patch

diff --git a/package/binutils/2.44/0005-gprofng-protect-against-standard-library-macros.patch b/package/binutils/2.44/0005-gprofng-protect-against-standard-library-macros.patch
new file mode 100644
index 0000000000..b344d7e2f6
--- /dev/null
+++ b/package/binutils/2.44/0005-gprofng-protect-against-standard-library-macros.patch
@@ -0,0 +1,35 @@
+From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Sat, 22 Nov 2025 11:29:43 +0100
+Subject: [PATCH] gprofng: protect against standard library macros
+
+The CALL_UTIL macro can expand to an unparsable expression of the argument
+is a macro, like with the new const-preserving standard library macros in
+C23.
+
+	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
+	expand its argument if it is a function-like macro.
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5f66aee7f4bec7a2d8378034116f5e5c3dc50f41
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gprofng/src/collector_module.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index b64d69c45ab..859a6dd1f7d 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
+ extern CollectorUtilFuncs __collector_util_funcs;
+ extern int __collector_dlsym_guard;
+ 
+-#define CALL_UTIL(x) __collector_util_funcs.x
++#define CALL_UTIL(x) (__collector_util_funcs.x)
+ 
+ /* The following constants define the meaning of the "void *arg"
+  * argument of getFrameInfo().
+-- 
+2.43.7
+
diff --git a/package/binutils/2.45.1/0004-gprofng-protect-against-standard-library-macros.patch b/package/binutils/2.45.1/0004-gprofng-protect-against-standard-library-macros.patch
new file mode 100644
index 0000000000..b344d7e2f6
--- /dev/null
+++ b/package/binutils/2.45.1/0004-gprofng-protect-against-standard-library-macros.patch
@@ -0,0 +1,35 @@
+From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Sat, 22 Nov 2025 11:29:43 +0100
+Subject: [PATCH] gprofng: protect against standard library macros
+
+The CALL_UTIL macro can expand to an unparsable expression of the argument
+is a macro, like with the new const-preserving standard library macros in
+C23.
+
+	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
+	expand its argument if it is a function-like macro.
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5f66aee7f4bec7a2d8378034116f5e5c3dc50f41
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gprofng/src/collector_module.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index b64d69c45ab..859a6dd1f7d 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
+ extern CollectorUtilFuncs __collector_util_funcs;
+ extern int __collector_dlsym_guard;
+ 
+-#define CALL_UTIL(x) __collector_util_funcs.x
++#define CALL_UTIL(x) (__collector_util_funcs.x)
+ 
+ /* The following constants define the meaning of the "void *arg"
+  * argument of getFrameInfo().
+-- 
+2.43.7
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
