Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F435C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E62B4EED9;
	Wed,  1 Nov 2023 22:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E62B4EED9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIOGARb_9wYQ; Wed,  1 Nov 2023 22:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB53C4EEDB;
	Wed,  1 Nov 2023 22:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB53C4EEDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F08DC1BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A24432BE
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7A24432BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqOLjWf9sCor for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:44:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED73E432A2
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED73E432A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4C6B864FE; Wed,  1 Nov 2023 22:44:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 23:39:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0d4bf1df5838c3aba678ca21d6ce2214f0466e0
X-Git-Newrev: 278f4f43a34b40c6713d55fb8237d95b4fb2755f
X-Patchwork-Hint: ignore
Message-Id: <20231101224409.D4C6B864FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/monit: fix build without SSP
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=278f4f43a34b40c6713d55fb8237d95b4fb2755f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build without SSP raised since bump to version 5.33.0 in commit
8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:

configure:10524: checking for pthread_create in -lpthread
configure:10547: /home/thomas/autobuild/instance-1/output-1/host/bin/arceb-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0  -static -Wextra -fstack-protector-all -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lpthread   >&5
/home/thomas/autobuild/instance-1/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/10.2.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared

[...]

checking for pthread_create in -lpthread... no
configure: error: POSIX thread library is required

Fixes:
 - http://autobuild.buildroot.org/results/ce0f9f62d60f801b03a079135941424ad147cf45

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/monit/monit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index ce0f5f0e92..aa068302e3 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -18,6 +18,7 @@ MONIT_AUTORECONF = YES
 MONIT_CONF_ENV = \
 	libmonit_cv_setjmp_available=yes \
 	libmonit_cv_vsnprintf_c99_conformant=yes \
+	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
 	ac_cv_ipv6=yes
 
 MONIT_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
