Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC40DC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:14:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D2C61058
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79D2C61058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3405D4038C;
	Sat,  7 Aug 2021 18:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H88X0eHa71bT; Sat,  7 Aug 2021 18:14:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 429CB4029C;
	Sat,  7 Aug 2021 18:14:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B24311BF96B
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FD67401DE
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VS659XgzEN_z for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:11:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B83F740019
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 18:11:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E7C0E8CA76; Sat,  7 Aug 2021 18:11:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:55:18 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5a6b4564f6a808f76b0134d83119b7e41cb9315a
X-Git-Newrev: c3a88fd434b45a906e4429bbbf2040a430ce0484
X-Patchwork-Hint: ignore
Message-Id: <20210807181138.E7C0E8CA76@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ibrdtn: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3a88fd434b45a906e4429bbbf2040a430ce0484
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
