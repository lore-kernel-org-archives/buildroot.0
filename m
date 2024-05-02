Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82222C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5062141D78;
	Thu,  2 May 2024 16:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGWWxV2421KM; Thu,  2 May 2024 16:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24EDD4025E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24EDD4025E;
	Thu,  2 May 2024 16:34:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 745231BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 855D34021D
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MS9smOnrP1xH for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A605402D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A605402D6
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:33:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6243186637; Thu,  2 May 2024 16:33:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 18:33:18 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e5c204820dcfec70e15ae904f7c629eecc732127
X-Git-Newrev: 3710b671cad96d81c85d91f2384b6c6f6280a507
X-Patchwork-Hint: ignore
Message-Id: <20240502163355.6243186637@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/dmraid: fix musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=3710b671cad96d81c85d91f2384b6c6f6280a507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

dmraid is a very old package from 2010 with an awkward configure script
which doesn't honor CFLAGS:

 ac_cv_env_CFLAGS_set=set
 ac_cv_env_CFLAGS_value='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 '

[...]

 ## ----------------- ##
 ## Output variables. ##
 ## ----------------- ##

 AWK='gawk'
 CC='/home/autobuild/autobuild/instance-3/output-1/host/bin/sh4a-buildroot-linux-musl-gcc'
 CFLAGS='-O2'

resulting in the following build failure with musl >= 1.2.4 and
https://github.com/bminor/musl/commit/25e6fee27f4a293728dd15b659170e7b9c7db9bc
because _LARGEFILE64_SOURCE is not set:

/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/12.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld: misc/file.o: in function `rw_file':
file.c:(.text+0x150): undefined reference to `lseek64'

To fix this issue, pass TARGET_CONFIGURE_OPTS through DMRAID_MAKE_OPTS

Fixes:
 - http://autobuild.buildroot.org/results/5c7c82959ce92db908d3ca20e2c1137509c2f981

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit de6415ad9c35b2013af1f1821bcac12ba3959674)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmraid/dmraid.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 0382cd4d99..9a78c2ae07 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -13,6 +13,7 @@ DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
 DMRAID_LICENSE = GPL-2.0
 DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
+DMRAID_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
 DMRAID_DEPENDENCIES = lvm2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
