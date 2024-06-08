Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E4EC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 15:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68E3F843FC;
	Sat,  8 Jun 2024 15:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skOVc_mPRoi2; Sat,  8 Jun 2024 15:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20FAC843B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20FAC843B6;
	Sat,  8 Jun 2024 15:30:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAE2B1BF417
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 15:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D680C60621
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 15:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EuC0qZnGJAZ for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 15:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 304916062B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 304916062B
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA3558249B; Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 17:29:14 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f5a4cc44ac1b45cdad3d88cce6836d4bbfd0fe93
X-Git-Newrev: 82dec87ecc69923449f21d932947769e887b996f
X-Patchwork-Hint: ignore
Message-Id: <20240608152958.CA3558249B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/octave: add
 optional zlib support
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

commit: https://git.buildroot.net/buildroot/commit/?id=82dec87ecc69923449f21d932947769e887b996f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fa54abf730ea11bfadd432b645a0735a7b4fe852)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/octave/octave.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index f240a5057c..d3aec697d5 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -28,4 +28,11 @@ else
 OCTAVE_CONF_OPTS += --disable-readline
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+OCTAVE_CONF_OPTS += --with-z
+OCTAVE_DEPENDENCIES += zlib
+else
+OCTAVE_CONF_OPTS += --without-z
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
