Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABB2C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 15:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ADFB82695;
	Wed, 10 Aug 2022 15:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ADFB82695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sbbGvJGoMkCf; Wed, 10 Aug 2022 15:32:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E7982437;
	Wed, 10 Aug 2022 15:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E7982437
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40E9A1BF344
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 279604091F
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279604091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3a9GwWFRkdct for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 15:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2076C4049A
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 15:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2076C4049A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D1B078708A; Wed, 10 Aug 2022 15:17:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 17:31:37 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: c6701cf5438e7afd8b0672df9eb8673d5a1edfcb
X-Git-Newrev: 74c890a556780b16b17d4d6b137156931d9a12de
X-Patchwork-Hint: ignore
Message-Id: <20220810151725.D1B078708A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libcurl: link
 with -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=74c890a556780b16b17d4d6b137156931d9a12de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fixes build error:

/nvmedata/autobuild/instance-1/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld:
 ../lib/.libs/libcurl.a(libcurl_la-easy.o): in function `curl_simple_lock_lock':
(.text+0x46c): undefined reference to `__atomic_exchange_1'

Fixes:
http://autobuild.buildroot.net/results/1ed/1eddc48f24ab766cfc880c493ed9b230fc57bc09/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4351da28a4c0de53bf6e4fece48afcb9566590cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
