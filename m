Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807ADC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:24:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4664160E09
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4664160E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CAC04044E;
	Sat, 24 Jul 2021 20:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_iRmXehhca9; Sat, 24 Jul 2021 20:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D2EA403F2;
	Sat, 24 Jul 2021 20:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF991BF95E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A0C9834F7
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsC6iDZEYveo for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:24:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76934834EF
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B69188899D; Sat, 24 Jul 2021 19:49:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:23:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c8641e5a97b89c14aebd730772e9cc037de6ccc
X-Git-Newrev: 7f976ad8caddf34c35d613d3aaf3adc15e135755
X-Patchwork-Hint: ignore
Message-Id: <20210724194941.B69188899D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: fix static build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7f976ad8caddf34c35d613d3aaf3adc15e135755
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.2.5.1 in
commit af19131543926879fb6676a3352c63ac0b2038bc:

/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../src/.libs/libasound.a(control_symbols.o):(.data+0x4): undefined reference to `_snd_module_control_empty'

Fixes:
 - http://autobuild.buildroot.org/results/a8fd791ba4c289cc4fc744a8ff9615bacd9558f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-control-empty-fix-the-static-build.patch  | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/alsa-lib/0003-control-empty-fix-the-static-build.patch b/package/alsa-lib/0003-control-empty-fix-the-static-build.patch
new file mode 100644
index 0000000000..3f5013af3a
--- /dev/null
+++ b/package/alsa-lib/0003-control-empty-fix-the-static-build.patch
@@ -0,0 +1,29 @@
+From 81e7923fbfad45b2f353a4d6e3053af51f5f7d0b Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Tue, 15 Jun 2021 23:21:42 +0200
+Subject: [PATCH] control: empty - fix the static build
+
+Reported-by: Jan Palus <atler@pld-linux.org>
+Fixes: https://github.com/alsa-project/alsa-lib/issues/157
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+[Retrieved from:
+https://github.com/alsa-project/alsa-lib/commit/81e7923fbfad45b2f353a4d6e3053af51f5f7d0b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/control/control_empty.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/control/control_empty.c b/src/control/control_empty.c
+index 49d1026c..c9b048c1 100644
+--- a/src/control/control_empty.c
++++ b/src/control/control_empty.c
+@@ -30,7 +30,7 @@
+ 
+ #ifndef PIC
+ /* entry for static linking */
+-const char *_snd_module_ctl_empty = "";
++const char *_snd_module_control_empty = "";
+ #endif
+ 
+ /*! \page control_plugins
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
