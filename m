Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA7CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8CF740ACD;
	Mon, 25 Apr 2022 20:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFLXx_hi7beC; Mon, 25 Apr 2022 20:26:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5B1040A8B;
	Mon, 25 Apr 2022 20:26:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18F261BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1487240AF4
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-79ckANiZav for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C71740A8B
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 325908448E; Mon, 25 Apr 2022 20:15:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 22:19:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: deb2f747a6e54e47fed00f1deab5efa0e5d2aede
X-Git-Newrev: 5430c8fedd0392e79e0c011825b056fea129980a
X-Patchwork-Hint: ignore
Message-Id: <20220425201532.325908448E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/argp-standalone: fix NLS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=5430c8fedd0392e79e0c011825b056fea129980a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.4.1 in
commit 0fe85041bc9e0b4ade4d71dd10b61c3b9ec8945d and
https://github.com/ericonr/argp-standalone/commit/e5fe9ad9e83e6765cf8fa787f903d4c6792338b5:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: libargp.a(argp-parse.o): in function `argp_version_parser':
/home/buildroot/autobuild/instance-2/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'

Fixes:
 - http://autobuild.buildroot.org/results/adb9c4b747352497adbc9df866709b17fe0f9755

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/argp-standalone/argp-standalone.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index 80ca04046d..269239fa5b 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -12,9 +12,11 @@ ARGP_STANDALONE_LICENSE = LGPL-2.1+
 ARGP_STANDALONE_LICENSE_FILES = README.md
 # From git
 ARGP_STANDALONE_AUTORECONF = YES
+ARGP_STANDALONE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 ARGP_STANDALONE_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline"
+	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline" \
+	LIBS=$(TARGET_NLS_LIBS)
 
 define ARGP_STANDALONE_INSTALL_STAGING_CMDS
 	$(INSTALL) -D $(@D)/libargp.a $(STAGING_DIR)/usr/lib/libargp.a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
