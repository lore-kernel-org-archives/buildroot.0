Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD03C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 19:54:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6979C60FE6
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 19:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6979C60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C58F407E9;
	Fri, 27 Aug 2021 19:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id av3wYPox2JSx; Fri, 27 Aug 2021 19:54:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C104B425AF;
	Fri, 27 Aug 2021 19:54:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41BF31BF5A0
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 19:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22CFC425AF
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 19:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CfyzduKa48g for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 19:54:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50073407E9
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 19:54:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8612D8E8F6; Fri, 27 Aug 2021 19:53:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 21:53:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7038b029d8c8774eca6d7888d6642d7e84ff5165
X-Git-Newrev: 5f9d65fb460b030597df21bbff94d9cbcb36d321
X-Patchwork-Hint: ignore
Message-Id: <20210827195310.8612D8E8F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipmiutil: avoid the need for
 autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f9d65fb460b030597df21bbff94d9cbcb36d321
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
