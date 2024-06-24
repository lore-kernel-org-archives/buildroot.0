Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650FAC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 07:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FC21818D7;
	Mon, 24 Jun 2024 07:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JurPcS51EKEb; Mon, 24 Jun 2024 07:43:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D8A681911
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D8A681911;
	Mon, 24 Jun 2024 07:43:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA1E1BF4D5
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8876281911
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CF4w-5KI6EMv for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 07:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4DE4818D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4DE4818D7
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 07:43:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B26DE82A96; Mon, 24 Jun 2024 07:43:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 09:41:18 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: dda4387b2c742562d0418a55b6411322a1929d0b
X-Git-Newrev: 7893c19991d4983577dc3dd407c8446002f8bf8e
X-Patchwork-Hint: ignore
Message-Id: <20240624074336.B26DE82A96@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/octave: add
 optional libcurl support
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

commit: https://git.buildroot.net/buildroot/commit/?id=7893c19991d4983577dc3dd407c8446002f8bf8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 913a6c7788ef2dcc76860e45d2abe70cce812b9d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/octave/octave.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index f3c4294f2d..342fd9b115 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -36,6 +36,13 @@ else
 OCTAVE_CONF_OPTS += --without-magick
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+OCTAVE_CONF_OPTS += --with-curl
+OCTAVE_DEPENDENCIES += libcurl
+else
+OCTAVE_CONF_OPTS += --without-curl
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 OCTAVE_CONF_OPTS += \
 	--enable-readline \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
