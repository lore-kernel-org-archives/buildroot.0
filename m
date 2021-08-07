Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76E8C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:20:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8473161078
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8473161078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5768782A29;
	Sat,  7 Aug 2021 17:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CCjLZo3lj4vD; Sat,  7 Aug 2021 17:20:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A19F58299D;
	Sat,  7 Aug 2021 17:20:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38EDB1BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAB26401BE
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHQGJlMJLYqc for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89968400F3
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CAC668CA15; Sat,  7 Aug 2021 17:19:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:08:20 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 673fa600ac3951fd488be069a14d28795bb33b4c
X-Git-Newrev: ee8b84a72f8523d9e8ea484d4180818124293993
X-Patchwork-Hint: ignore
Message-Id: <20210807171910.CAC668CA15@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ibrcommon: fix
 build with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee8b84a72f8523d9e8ea484d4180818124293993
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix the following build failure with gcc 11:

In file included from ../../ibrcommon/data/BLOB.h:25,
                 from BLOB.cpp:22:
../../ibrcommon/thread/Mutex.h:43:40: error: ISO C++17 does not allow dynamic exception specifications
   43 |                 virtual void trylock() throw (MutexException) = 0;
      |                                        ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7a9a4319916efe8cd7e04b8686a9ae0b233b017a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 867e7a040ce1907cdc74d2040845ef155ede57d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ibrcommon/ibrcommon.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ibrcommon/ibrcommon.mk b/package/ibrcommon/ibrcommon.mk
index 4d2d351c88..d9e843ebc2 100644
--- a/package/ibrcommon/ibrcommon.mk
+++ b/package/ibrcommon/ibrcommon.mk
@@ -10,6 +10,7 @@ IBRCOMMON_INSTALL_STAGING = YES
 IBRCOMMON_LICENSE = Apache-2.0
 IBRCOMMON_LICENSE_FILES = COPYING README
 IBRCOMMON_DEPENDENCIES = host-pkgconf
+IBRCOMMON_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 IBRCOMMON_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
