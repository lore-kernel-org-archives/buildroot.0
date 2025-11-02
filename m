Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B644CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 11:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E232085297;
	Sun,  2 Nov 2025 11:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0Tvg9t6NgKI; Sun,  2 Nov 2025 11:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE091850E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE091850E5;
	Sun,  2 Nov 2025 11:38:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6093436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A81FF42661
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37IWp36PtVRE for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 11:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D94742647
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D94742647
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:38:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 078E58397B; Sun,  2 Nov 2025 11:38:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Nov 2025 11:51:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e945af24ed9e0f47604323790f627756f7516e99
X-Git-Newrev: c560bb3181a56a174d05b0f8486ce1a27f92b064
X-Patchwork-Hint: ignore
Message-Id: <20251102113848.078E58397B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: link with libatomic if needed
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c560bb3181a56a174d05b0f8486ce1a27f92b064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/f4f/f4fb970f8d4f2f7966fcbd542768a607ea7ababf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/crun/crun.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index b4db276602..02d0b3d62f 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -15,6 +15,10 @@ CRUN_CPE_ID_VALID = YES
 CRUN_AUTORECONF = YES
 CRUN_CONF_OPTS = --disable-embedded-yajl
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CRUN_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 CRUN_DEPENDENCIES += argp-standalone
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
