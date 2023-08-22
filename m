Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE41AEE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CD15605BE;
	Tue, 22 Aug 2023 19:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD15605BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMAYFzCVtWHr; Tue, 22 Aug 2023 19:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D52D56121B;
	Tue, 22 Aug 2023 19:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D52D56121B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 733661BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59C5C401D8
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59C5C401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrKlWGZqwRHT for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:23:28 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0199D400D2
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0199D400D2
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F0B3513F85F;
 Tue, 22 Aug 2023 21:23:23 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 21:23:14 +0200
Message-ID: <20230822192315.8180-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692732205;
 bh=bxHH6vGc5D63zgKt3qqayjYiqleSQ4R6DgjCOsy7Z4A=;
 h=From:To:Cc:Subject:Date:From;
 b=L9F5ctJt3cn1y4npI0DCVoYBeHAh293o77Adij+/nROQ6H+06PXGUdxDjRNZUlHFo
 dxES3WDxPXGhm1AlODy6rmI/E4WqwAUemHOQLtv7SjiJl2QUeapuPHeWv34g+szsW+
 TivZAszKtp3vVgztCo19EZPPoYQG0OUEfRtQN+rvQfSdwm7QPlNOuGtCaNbSfs/F76
 +a+Yya1gDw/kltRhrsSKXyb//7WO71pKdjbHgg+gfXaIVb+fLvC4UQ43sWnDbxkVKW
 7zAVRQLkKJIwSPigd+ZS5x44K0LkiE8fWHtQ/oFoU/uBItgtMWULNJ+f1V+p8Am8Lw
 J9WI9nENeadCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L9F5ctJt
Subject: [Buildroot] [PATCH next 1/1] package/kexec: fix link error when
 BR2_OPTIMIZE_0=y
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_OPTIMIZE_0, -O0 is passed in compiler CFLAGS. This means no
code optimization will be performed.

kexec code uses a trick to detect unaligned accesses at link time
which needs at least dead-code-removal to work. See
put/get_unaligned() macros in kexec/kexec.h. This code was re-enabled
in upstream commit [1].

This commit sets at least -O1 (which include the sufficient
dead-code-removal) when BR2_OPTIMIZE_0=y, to fix those issues.

Fixes:
- http://autobuild.buildroot.org/results/8f8/8f8532f1dfbd71e52c51c00118934af9fa45e7cb
- http://autobuild.buildroot.org/results/528/528fd7baf9b0ad5549d22ec8e0623c5fa1f2d117
- http://autobuild.buildroot.org/results/499/499115439680adfb4b40042468e5bbb65d91ce6c
- ...and many others

[1] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=0723defb5308ac7fce296f8b596bff4df6803f01

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit bfa4a7c with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_kexec
    ...
    OK
---
 package/kexec/kexec.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 562b09012b..6c7a6778ae 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -16,6 +16,14 @@ KEXEC_SELINUX_MODULES = kdump
 # Makefile expects $STRIP -o to work, so needed for !BR2_STRIP_strip
 KEXEC_MAKE_OPTS = STRIP="$(TARGET_CROSS)strip"
 
+# kexec requires at least -O1 optimization level. Its code uses a
+# trick to detect unaligned accesses at link time which needs at least
+# dead-code-removal to work. See put/get_unaligned() macros in
+# kexec/kexec.h
+ifeq ($(BR2_OPTIMIZE_0),y)
+KEXEC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
+endif
+
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPTS += --with-zlib
 KEXEC_DEPENDENCIES += zlib
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
