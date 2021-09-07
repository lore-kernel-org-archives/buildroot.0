Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78969C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:32:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 406386103E
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 406386103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15FD760C06;
	Tue,  7 Sep 2021 12:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5KmwM2FOeOD; Tue,  7 Sep 2021 12:32:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 696FF60C1A;
	Tue,  7 Sep 2021 12:32:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B2071BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A5D3404DF
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRacQ83c0Z7l for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:32:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C3C140270
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:32:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E31EB887E7; Tue,  7 Sep 2021 12:30:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 14:29:56 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: f5ed3ed24616d69ae94e3556e6bfde4e033cb89a
X-Git-Newrev: e2883e25729aae21024a38a3acfbe9f510ef04c3
X-Patchwork-Hint: ignore
Message-Id: <20210907123047.E31EB887E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ipmiutil: avoid
 the need for autoreconf
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2883e25729aae21024a38a3acfbe9f510ef04c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Build fails since bump to version 3.1.7 in commit
011f31ee244b7fe4621b3f69ca3d7e7b1cfdb5bb because config.h.in is older
than aclocal.m4:

make[1]: Entering directory '/tmp/instance-4/output-1/build/ipmiutil-3.1.7'
(CDPATH="${ZSH_VERSION+.}:" && cd . && autoheader)
/bin/bash: autoheader: command not found

Fixes:
 - http://autobuild.buildroot.org/results/2005af881726473f2cda176e90c1e41e4baea67c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5f9d65fb460b030597df21bbff94d9cbcb36d321)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipmiutil/ipmiutil.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index d85b9643f0..4c9de26583 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -11,6 +11,12 @@ IPMIUTIL_LICENSE_FILES = COPYING
 
 IPMIUTIL_MAKE = $(MAKE1)
 
+# aclocal.m4 is newer than config.h.in. Touch the latter to avoid autoreconf
+define IPMIUTIL_TOUCH_CONFIG_H_IN
+	touch $(@D)/config.h.in
+endef
+IPMIUTIL_PRE_CONFIGURE_HOOKS += IPMIUTIL_TOUCH_CONFIG_H_IN
+
 # forgets to link against libcrypto dependencies breaking static link
 ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
 # tests against distro libcrypto so it might get a false positive when
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
