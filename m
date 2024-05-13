Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CE1C25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4732A605DA;
	Mon, 13 May 2024 19:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLJMXqXdYaUG; Mon, 13 May 2024 19:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53505605EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53505605EE;
	Mon, 13 May 2024 19:49:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F6021BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BD76605EE
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0cpJY9SHG3w for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 906A9605DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 906A9605DA
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:48:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ADC687121; Mon, 13 May 2024 19:48:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 21:48:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f11ce4aeaba99917778c384b236d267e78a7b29
X-Git-Newrev: b8c70f67017ebe08459992ac575ae4989243c232
X-Patchwork-Hint: ignore
Message-Id: <20240513194859.7ADC687121@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/duma: set HOST_CFLAGS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b8c70f67017ebe08459992ac575ae4989243c232
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set HOST_CFLAGS to avoid the following build failure raised since bump
to version 2.5.21 in commit af2cd694e3903131d6e2f00646adfa83a89a23e2:

/usr/bin/gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O2 -g0   -c createconf.c -o createconf.o
gcc: error: unrecognized command-line option '-mlongcalls'
gcc: error: unrecognized command-line option '-mauto-litpools'

Fixes: af2cd694e3903131d6e2f00646adfa83a89a23e2
 - http://autobuild.buildroot.org/results/28be2acc6d58754c7431df81d0b63b30e6af8554

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/duma/duma.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 6bbdf41f4a..80fe8a5d64 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -20,6 +20,7 @@ define DUMA_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		OS=linux \
 		DUMA_OPTIONS="$(DUMA_OPTIONS)" \
+		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		CPPFLAGS="$(TARGET_CXXFLAGS) -std=c++11" -C $(@D)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
