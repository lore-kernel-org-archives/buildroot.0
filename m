Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8527C04A68
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8315140116;
	Tue, 26 Jul 2022 20:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8315140116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4V2kAizRPbzk; Tue, 26 Jul 2022 20:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A25254011B;
	Tue, 26 Jul 2022 20:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A25254011B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CE7D1BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 248DB400E4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 248DB400E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zrw5P-fHbqx for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:00:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62949400D8
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62949400D8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id ED43385FAA; Tue, 26 Jul 2022 19:46:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:00:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10990c576b2ddd7636f094f510a2ad1a5a80e50d
X-Git-Newrev: 042399b93c6a7a71542922be1f131899af34d98c
X-Patchwork-Hint: ignore
Message-Id: <20220726194646.ED43385FAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fscryptctl: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=042399b93c6a7a71542922be1f131899af34d98c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 1.0.0 in commit ib832f6eb9d86920907c50901a99f13b44dd94647 and
https://github.com/google/fscryptctl/commit/9dba7224cbde07df25ba01146a2f6fb897bb9e56:

fscryptctl.c: In function 'string_to_mode':
fscryptctl.c:214:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (size_t i = 0; i < ARRAY_SIZE(mode_strings); i++) {
   ^

Fixes:
 - http://autobuild.buildroot.org/results/58e8facd9105dcdfbc21ed245de03f3162c98cc9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fscryptctl/fscryptctl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
index 154af4d29f..0546f67a1f 100644
--- a/package/fscryptctl/fscryptctl.mk
+++ b/package/fscryptctl/fscryptctl.mk
@@ -10,7 +10,8 @@ FSCRYPTCTL_LICENSE = Apache-2.0
 FSCRYPTCTL_LICENSE_FILES = LICENSE
 
 define FSCRYPTCTL_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) fscryptctl
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99" fscryptctl
 endef
 
 define FSCRYPTCTL_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
