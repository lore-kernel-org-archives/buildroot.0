Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF59C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1DDE404BF;
	Fri,  7 Jan 2022 18:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6Cjv_A2Q3VY; Fri,  7 Jan 2022 18:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1C9E400E5;
	Fri,  7 Jan 2022 18:34:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BA761BF291
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79BE960AAE
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvfdkqqI5axm for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:34:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA944607A4
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:34:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 46EBD814EE; Fri,  7 Jan 2022 18:28:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:30:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 981e7b245aba835919300bb089013d3efe7e65d4
X-Git-Newrev: 93aa9db953f127509ed64b3a8caceca878963b6c
X-Patchwork-Hint: ignore
Message-Id: <20220107182804.46EBD814EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcm-tools: fix static build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=93aa9db953f127509ed64b3a8caceca878963b6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't build c_example which needs a dynamic library and so will raise
the following static build failure since bump to version 2021.10 in
commit d1d93d488c76d4bc2551270007096693d8194435 and
https://github.com/opcm/pcm/commit/12647a6ee579c29bd306fd034470eb62dcb3156e:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: cannot find -lpcm

Fixes:
 - http://autobuild.buildroot.org/results/1276a3d49c8848039f034e7f03632df365097e94

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcm-tools/pcm-tools.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index 8a58034232..d676df57f9 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -17,7 +17,8 @@ define PCM_TOOLS_BUILD_CMDS
 	touch $(@D)/daemon-binaries
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC" \
-		UNAME=Linux HOST=_LINUX
+		UNAME=Linux HOST=_LINUX \
+		$(foreach f,$(PCM_TOOLS_EXE_FILES),$(f).x)
 endef
 
 ifeq ($(BR2_PACKAGE_PCM_TOOLS_PMU_QUERY),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
