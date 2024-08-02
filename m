Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B40C3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 18:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5D8084591;
	Fri,  2 Aug 2024 18:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgOt13Wb8-TA; Fri,  2 Aug 2024 18:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE8F284597
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE8F284597;
	Fri,  2 Aug 2024 18:08:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A34E81BF5A6
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 18:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DC24605D4
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 18:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsIqb2LS2L99 for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 18:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 268B3605CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 268B3605CA
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 18:08:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C372183BA1; Fri,  2 Aug 2024 18:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 20:07:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79877bbdb165c8eef90b8aecf75d2dd8363e4995
X-Git-Newrev: 4703a7ae9176b3a9d824880ef095b1b80c123df4
X-Patchwork-Hint: ignore
Message-Id: <20240802180832.C372183BA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: fix musl static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=4703a7ae9176b3a9d824880ef095b1b80c123df4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Runnning autoreconf is needed to avoid the following static build
failure on musl which is raised as otherwise LDFLAGS (which contains
-static) is not passed:

/home/autobuild/autobuild/instance-16/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/13.3.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /home/autobuild/autobuild/instance-16/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/13.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_idiv0':
/home/autobuild/autobuild/instance-16/output-1/build/host-gcc-final-13.3.0/build/armeb-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499:(.text+0x8): undefined reference to `raise'

This build failure is raised by autobuilders since bump to version 5.6.2
in commit d1d77eb274761d1f2d24ee4b55a374e917c67a8e but it can also be
reproduced on version 5.4.7 (but not on 5.4.6). There is probably an
issue with these two official autotools tarballs which have been
released the same day (on May 29 2024).

Fixes: 40240ac30afc4c6af765794f38e6815162ca61fa

  http://autobuild.buildroot.org/results/344813b202644a23c166920aa7e861ebf408536b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xz/xz.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 8dfd76f8b9..9fb93ff4d6 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -12,6 +12,8 @@ XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
+# autoreconf needed to fix a musl static build failure
+XZ_AUTORECONF = YES
 
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
