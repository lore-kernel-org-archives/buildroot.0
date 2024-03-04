Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1237FC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 21:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE41260D72;
	Mon,  4 Mar 2024 21:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKHUkyCqT-rF; Mon,  4 Mar 2024 21:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D13D60DF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D13D60DF4;
	Mon,  4 Mar 2024 21:52:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D1DB1BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2841440198
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0LRbP84Q-Ee for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 21:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 391D440175
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 391D440175
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2973880E2; Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 22:51:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11a577c19e23d0b774f357b2d62ac3c41b7f201f
X-Git-Newrev: fd484c1f57781aed6e99a61cbfae21e0edbe7dd8
X-Patchwork-Hint: ignore
Message-Id: <20240304215231.A2973880E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: fix BR2_SHARED_STATIC_LIBS
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd484c1f57781aed6e99a61cbfae21e0edbe7dd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/poco/poco.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index b1d5a653c4..cc8a22fc2a 100644
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
