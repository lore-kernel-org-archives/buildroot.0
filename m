Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F89C54E71
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 16:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8BC181EC8;
	Tue, 19 Mar 2024 16:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQl8H0xSG4rf; Tue, 19 Mar 2024 16:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD7C81EBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD7C81EBF;
	Tue, 19 Mar 2024 16:37:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4EC1BF836
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3876D40C28
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Om67ZrYgiyd for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 16:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61548403E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61548403E5
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 16:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BF6482DE1; Tue, 19 Mar 2024 16:37:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 17:35:32 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c635c4cb983c8517a93f1f3c83bafa977965cde6
X-Git-Newrev: b4b2b8c970621178b6b9f9cd3c0e78c8fa22a22e
X-Patchwork-Hint: ignore
Message-Id: <20240319163728.5BF6482DE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/poco: fix
 BR2_SHARED_STATIC_LIBS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4b2b8c970621178b6b9f9cd3c0e78c8fa22a22e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

poco can't be built statically since commit
073a89196a22f995c142cd11640d3cfb7cef691d. However, commit
add7c433d250e153d9e58fe7da3bd52171ba2652 enabled static (and shared)
build with BR2_SHARED_STATIC_LIBS resulting in the following build
failure since at least version 1.11.1:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips-buildroot-linux-gnu/11.2.0/../../../../mips-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-1/output-1/build/poco-1.11.1/lib/Linux/mips/libPocoXML.a(ParserEngine.o): in function `Poco::XML::ParserEngine::handleStartElement(void*, char const*, char const**)':
ParserEngine.cpp:(.text+0x2f8): undefined reference to `XML_GetSpecifiedAttributeCount'

Fixes: add7c433d250e153d9e58fe7da3bd52171ba2652
 - http://autobuild.buildroot.org/results/afc434a13d5e7a8affa4abb4058d7bebc81aca29
 - http://autobuild.buildroot.org/results/860b70a8c9c4a6a53247ac4bdb4fd0851b28c61a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fd484c1f57781aed6e99a61cbfae21e0edbe7dd8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poco/poco.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index f8c2a658de..96ab28fb01 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -57,13 +57,7 @@ ifeq ($(BR2_SOFT_FLOAT),y)
 POCO_CONF_OPTS += --no-fpenvironment
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-POCO_MAKE_TARGET = static_release
-else ifeq ($(BR2_SHARED_LIBS),y)
 POCO_MAKE_TARGET = shared_release
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-POCO_MAKE_TARGET = all_release
-endif
 
 POCO_LDFLAGS=$(TARGET_LDFLAGS)
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
