Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BBCC48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 19:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3812981361;
	Tue, 20 Feb 2024 19:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfIarTXLk4hm; Tue, 20 Feb 2024 19:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C918813FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C918813FE;
	Tue, 20 Feb 2024 19:50:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9919C1BF3A7
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 19:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85964403F8
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 19:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5dd7NNURK3B for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 19:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC06940292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC06940292
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC06940292
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 19:50:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33d6cc6d2fcso565298f8f.2
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 11:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708458611; x=1709063411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mCwbhBOTidxnBOMFCx15ec6JCnV2nBQz4uv9cFx4wvQ=;
 b=VDTFyC4scBENZuvESDuQQDAqNxsdJb3ht0egQc5vNUGOoj9YBdj6taC1QB3HMitAcp
 7q1TLrp3kuGtS90Tt66cNa3OrawKSCG2n45qBPsYJsbUGjvAtfzTacIOjQiBsShDGqj4
 vnlWyDtmiS3wWj1V3MHNSQwcdCaQvTL8AImrTQux8pWQreq8otAH7sDw8KA4pV8Qeytl
 QguP/Z/oIxw0QET1OgEgsDMpVDB7P+CS8tkf/gm8hNgAvTpasQQaPPX4BednU2cqywCo
 8WtuF6155TacmI9h/ikJqH7o/Y9ZrXpWqOJ7ZYfN2bftnbBPnbdhpbgpQYkDn5JfVVhM
 v44w==
X-Gm-Message-State: AOJu0YzaI+yOHcdQtFLgiALT1gwIQtr95DgY4P+Bly+51EdQMk3cuVnr
 u8zgylw1kz4o27IpwxD8yqB75NoeMhisBIjJi6dze095PWNy1z/fICznHdLF6yM=
X-Google-Smtp-Source: AGHT+IGj+HgbfBEG/3lHgVdcJqH1mY5wgwgja/gGUVWkDGliGCbiD6TlH+MbiOsoguoWc4hh3Wf1SQ==
X-Received: by 2002:a5d:4608:0:b0:33d:20ca:8415 with SMTP id
 t8-20020a5d4608000000b0033d20ca8415mr7947382wrq.63.1708458610757; 
 Tue, 20 Feb 2024 11:50:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay3-20020a5d6f03000000b0033d1b760125sm14971321wrb.92.2024.02.20.11.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 11:50:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 20:50:07 +0100
Message-ID: <20240220195007.380433-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708458611; x=1709063411; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mCwbhBOTidxnBOMFCx15ec6JCnV2nBQz4uv9cFx4wvQ=;
 b=GhnobmC4ECtNfRlipEF9xyEBTANHHmPwaX0iQOK2E6t0LQ0//TK+bg8ehZTNdbfkvO
 if/Xjijm2szH8QV5mI8RbC591uFR9LGioGVuKxb0FQ+eEU+OTolIjyQO+5Sy8Bnbdq8h
 n3nmk+iShRmghjUjJ//c9cxID+rXe1MhT9Xc3CYnv38IkoeCZPDBmb8/+jMQYKZrsMCX
 DudltQRnWVfURkqwnfeAPXIBvkBL5sDku7dBZhQocHerf/kCZfgnGE+w4ShTw3ExobBs
 oommVGIry/SCsgYsOrLDzkevCYSD7czQlIZeJn7toSZSkqJSGYdWeC3BX+yU54DZ/lAf
 95FA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GhnobmC4
Subject: [Buildroot] [PATCH 1/1] package/uacme: fix build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.7.5 in
commit b7ee5f3b0e3ef703bafd007cc99da10312d99b9e and
https://github.com/ndilieto/uacme/commit/fe826f4b1931ae508047d8b2693b5b6ac2cb21fd:

checking if mmap(MAP_ANON|MAP_SHARED) works... configure: error: in `/home/autobuild/autobuild/instance-9/output-1/build/uacme-1.7.5':
configure: error: cannot run test program while cross compiling

Fixes: b7ee5f3b0e3ef703bafd007cc99da10312d99b9e
 - http://autobuild.buildroot.org/results/9715ade98f4894c07b640d151daa41813d2bec3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../uacme/0001-Fix-cross-compilation.patch    | 29 +++++++++++++++++++
 package/uacme/uacme.mk                        |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 package/uacme/0001-Fix-cross-compilation.patch

diff --git a/package/uacme/0001-Fix-cross-compilation.patch b/package/uacme/0001-Fix-cross-compilation.patch
new file mode 100644
index 0000000000..cc384f2c36
--- /dev/null
+++ b/package/uacme/0001-Fix-cross-compilation.patch
@@ -0,0 +1,29 @@
+From cdf63e24dc475a558400c68714e32d32904e4c57 Mon Sep 17 00:00:00 2001
+From: Nicola Di Lieto <nicola.dilieto@gmail.com>
+Date: Tue, 20 Feb 2024 01:05:00 +0100
+Subject: [PATCH] Fix cross compilation
+
+Commit fe826f4b1931ae508047d8b2693b5b6ac2cb21fd broke cross compilation
+
+Closes https://github.com/ndilieto/uacme/issues/79
+
+Upstream: https://github.com/ndilieto/uacme/commit/cdf63e24dc475a558400c68714e32d32904e4c57
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 77d1230..3bec75b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -355,7 +355,8 @@ if test "x$OPT_UALPN" != "xno"; then
+                 AC_DEFINE(HAVE_MAP_DEVZERO, 1, [if mmap("/dev/zero", MAP_SHARED) works])
+                 AC_MSG_RESULT([yes]),
+                 AC_MSG_RESULT([no])
+-                AC_MSG_ERROR([ualpn requires MAP_ANON or mmap("/dev/zero", MAP_SHARED)])),
++                AC_MSG_ERROR([ualpn requires MAP_ANON or mmap("/dev/zero", MAP_SHARED)]))
++        ], [
+             AC_COMPILE_IFELSE([AC_LANG_SOURCE([#include <sys/mman.h>
+                              int main() {return mmap(0, 4096, PROT_READ|PROT_WRITE,
+                                 MAP_ANON|MAP_SHARED, -1, 0) == MAP_FAILED;}])],
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index f02e522761..cd670ee951 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -12,6 +12,8 @@ UACME_SITE = $(call github,ndilieto,uacme,upstream/$(UACME_VERSION))
 UACME_LICENSE = GPL-3.0+
 UACME_LICENSE_FILES = COPYING
 UACME_DEPENDENCIES = libcurl
+# We're patching configure.ac
+UACME_AUTORECONF = YES
 
 UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' LIBS="$(UACME_LIBS)"
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
