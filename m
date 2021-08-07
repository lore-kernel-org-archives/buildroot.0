Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584BCC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:12:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1304961057
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1304961057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E1A60652;
	Sat,  7 Aug 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sOlwXswLcORH; Sat,  7 Aug 2021 18:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3651F605C8;
	Sat,  7 Aug 2021 18:12:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20DB31BF403
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 107D0403BF
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dqrI6WN65vx for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:11:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF237403E0
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 18:11:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 27A1E8CA60; Sat,  7 Aug 2021 18:11:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:55:05 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 070e3070b039083f39024e809be44794d8fcc6cd
X-Git-Newrev: 58682a273927b785f4b6e15eacdbdd216cb38cfe
X-Patchwork-Hint: ignore
Message-Id: <20210807181131.27A1E8CA60@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/ibrdtn: fix build
 with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=58682a273927b785f4b6e15eacdbdd216cb38cfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failure with gcc 11:

In file included from ../../ibrdtn/data/PrimaryBlock.h:30,
                 from ../../ibrdtn/data/Serializer.h:27,
                 from ../../ibrdtn/data/Block.h:29,
                 from ../../ibrdtn/data/Bundle.h:27,
                 from ../../ibrdtn/api/Client.h:26,
                 from Client.cpp:22:
/tmp/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/ibrcommon-1.0/ibrcommon/thread/Mutex.h:43:40: error: ISO C++17 does not allow dynamic exception specifications
   43 |                 virtual void trylock() throw (MutexException) = 0;
      |                                        ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c2d9033c68b5c1407d2cf87b98dff61958b8e7b6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 581687e34b067c8dac06335dbae640a23b9e505c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ibrdtn/ibrdtn.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ibrdtn/ibrdtn.mk b/package/ibrdtn/ibrdtn.mk
index 3f805c4024..99ff92d442 100644
--- a/package/ibrdtn/ibrdtn.mk
+++ b/package/ibrdtn/ibrdtn.mk
@@ -10,6 +10,7 @@ IBRDTN_INSTALL_STAGING = YES
 IBRDTN_LICENSE = Apache-2.0
 IBRDTN_LICENSE_FILES = COPYING
 IBRDTN_DEPENDENCIES = ibrcommon host-pkgconf
+IBRDTN_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 IBRDTN_CONF_OPTS += --with-compression
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
