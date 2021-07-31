Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98419C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:06:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F4A060EBC
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F4A060EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37A21607C3;
	Sat, 31 Jul 2021 22:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMWII2_c54nF; Sat, 31 Jul 2021 22:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A21D607A6;
	Sat, 31 Jul 2021 22:06:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8D701BF2C1
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEDF3605F2
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXvk2XfqhrS1 for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2044E6079A
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 572768A3F6; Sat, 31 Jul 2021 22:04:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7c8da37fe70e10b5ca19267331e0f820445952a
X-Git-Newrev: f0baab0d51661038ffd102d933bee392fad9c55e
X-Patchwork-Hint: ignore
Message-Id: <20210731220453.572768A3F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/duma: fix build with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0baab0d51661038ffd102d933bee392fad9c55e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 11:

In file included from dumapp.cpp:39:
dumapp.h:88:49: error: ISO C++17 does not allow dynamic exception specifications
   88 |     void * DUMA_CDECL operator new(DUMA_SIZE_T) throw(std::bad_alloc);
      |                                                 ^~~~~

While at it, also drop DUMA_CPP which does not seem to be set since the
addition of the package back in 2013 in commit
bda69bf4e4b642ab199ffa13c7356709885f129d

Fixes:
 - http://autobuild.buildroot.org/results/ed838a55f09841a643b05e5a7a7ca0a9d2882acd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/duma/duma.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 0e8a623bde..906db872d5 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -21,7 +21,7 @@ define DUMA_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		OS=linux \
 		DUMA_OPTIONS="$(DUMA_OPTIONS)" \
-		$(DUMA_CPP) -C $(@D)
+		CPPFLAGS="$(TARGET_CXXFLAGS) -std=c++11" -C $(@D)
 endef
 
 define DUMA_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
