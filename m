Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E0BC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 17:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ABE6404B3;
	Sat, 15 Jun 2024 17:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjF7DAviKNzk; Sat, 15 Jun 2024 17:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25E64405CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25E64405CC;
	Sat, 15 Jun 2024 17:04:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05C9E1BF2FE
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 17:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7EE8606C2
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 17:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEcRzh-4D1n2 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 17:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2CD6070B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E2CD6070B
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 17:04:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 092E187E6E; Sat, 15 Jun 2024 17:04:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 19:02:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ced9cf5b9bb267750b10e464e216da939e667d7
X-Git-Newrev: 913a6c7788ef2dcc76860e45d2abe70cce812b9d
X-Patchwork-Hint: ignore
Message-Id: <20240615170448.092E187E6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: add optional libcurl
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=913a6c7788ef2dcc76860e45d2abe70cce812b9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/octave/octave.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 69b292bb6b..d879fd6730 100644
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
