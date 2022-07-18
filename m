Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06116C43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FB0160FD8;
	Mon, 18 Jul 2022 10:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FB0160FD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hunwfw-VZ8XX; Mon, 18 Jul 2022 10:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADF2F60FBE;
	Mon, 18 Jul 2022 10:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF2F60FBE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 594A21BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3427581B6D
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3427581B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwA-6VH8qh1M for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:21:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78C2981A46
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C2981A46
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4705883C97; Mon, 18 Jul 2022 10:07:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 12:21:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09874785c06747470915fc12befd45307ccd2bbd
X-Git-Newrev: 4351da28a4c0de53bf6e4fece48afcb9566590cb
X-Patchwork-Hint: ignore
Message-Id: <20220718100757.4705883C97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: link with -latomic if
 needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=4351da28a4c0de53bf6e4fece48afcb9566590cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build error:

/nvmedata/autobuild/instance-1/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld:
 ../lib/.libs/libcurl.a(libcurl_la-easy.o): in function `curl_simple_lock_lock':
(.text+0x46c): undefined reference to `__atomic_exchange_1'

Fixes:
http://autobuild.buildroot.net/results/1ed/1eddc48f24ab766cfc880c493ed9b230fc57bc09/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcurl/libcurl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e241bd1c88..5dc4eebefa 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -32,6 +32,10 @@ else
 LIBCURL_CONF_OPTS += --disable-threaded-resolver
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBCURL_CONF_OPTS += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_VERBOSE),y)
 LIBCURL_CONF_OPTS += --enable-verbose
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
