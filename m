Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BAAC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 10:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E4783DFD;
	Wed,  2 Feb 2022 10:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWPAntnZmd5m; Wed,  2 Feb 2022 10:23:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6BB883DF2;
	Wed,  2 Feb 2022 10:23:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43CA71BF588
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE59B83365
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiIPGMlcJhfs for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 10:21:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0FDB833C9
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DA398829FC; Wed,  2 Feb 2022 10:14:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Feb 2022 11:21:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43c8afef8ddd5ce590076c0932c78c4953279c68
X-Git-Newrev: 3558a98df611ec7c9b4735326e97e17bfde2b9b9
X-Patchwork-Hint: ignore
Message-Id: <20220202101446.DA398829FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jasper: disable programs
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

commit: https://git.buildroot.net/buildroot/commit/?id=3558a98df611ec7c9b4735326e97e17bfde2b9b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable demo programs through JAS_ENABLE_PROGRAMS option which is
available and enabled by default since version 2.0.14 and
https://github.com/jasper-software/jasper/commit/e02518ce7161cd37ded64af78ac520e0424a9b12

As a side-effect, this will avoid the following build failure raised
since bump to version 2.0.33 in commit
f791221c8616bfa6d338ce6c287353395cc2c61a:

[ 96%] Linking C executable imginfo
/home/buildroot/autobuild/instance-3/output-1/per-package/jasper/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/buildroot/autobuild/instance-3/output-1/per-package/jasper/host/x86_64-buildroot-linux-uclibc/sysroot/lib/libc.so.1'

Fixes:
 - http://autobuild.buildroot.org/results/b106fdf32ffa9e0ef1254e0a29fdcdc821020e08

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 05168db763..6b6bbcd6e6 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -11,7 +11,9 @@ JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
 JASPER_CPE_ID_VENDOR = jasper_project
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
-JASPER_CONF_OPTS = -DJAS_ENABLE_DOC=OFF
+JASPER_CONF_OPTS = \
+	-DJAS_ENABLE_DOC=OFF \
+	-DJAS_ENABLE_PROGRAMS=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
