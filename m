Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D44CC25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 13:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 174524031C;
	Mon, 27 May 2024 13:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdBJ-cg7JD74; Mon, 27 May 2024 13:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17F8B40456
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17F8B40456;
	Mon, 27 May 2024 13:07:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 948C31D1CA9
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43AE2401DF
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbjIJGB6BX3l for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 13:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8595F401C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8595F401C2
 for <buildroot@buildroot.org>; Mon, 27 May 2024 13:07:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7970587691; Mon, 27 May 2024 13:07:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 14:57:19 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 944a5d556af613792a2edd3491a9a4747f6dbc5d
X-Git-Newrev: 3dd6a82e3a571a68cedf558c9755ae8b1da9c07e
X-Patchwork-Hint: ignore
Message-Id: <20240527130749.7970587691@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libutempter: do
 not hardcode PIE
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

commit: https://git.buildroot.net/buildroot/commit/?id=3dd6a82e3a571a68cedf558c9755ae8b1da9c07e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

PIE will be set by buildroot if the user wants it so set
{COMPILE,LINK}_PIE to an empty value to fix the following build failure
raised since the addition of the package in commit
02c818bc5c7a6967a212f12e4caa8ccdfa0b452b:

/home/buildroot/autobuild/run/instance-3/output-1/host/bin/m68k-linux-gcc -W -Wall -Waggregate-return -Wcast-align -Wconversion -Wdisabled-optimization -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wwrite-strings -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0   -std=gnu99  -DLIBEXECDIR=\"/usr/lib\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wl,-z,relro -Wl,-stats   -fPIE -pie -Wl,-z,now  utempter.c -o utempter

[...]

/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/12.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
(.text+0x4): undefined reference to `__shared_flat_add_library'

Fixes: 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b
 - http://autobuild.buildroot.org/results/3a5581fd4edf56bbdc48ab111a2351fc70f1c703

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 36b06928c8d63ef82cc785aaa72c5818c8dec0bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libutempter/libutempter.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libutempter/libutempter.mk b/package/libutempter/libutempter.mk
index d51f70049c..aad98126f7 100644
--- a/package/libutempter/libutempter.mk
+++ b/package/libutempter/libutempter.mk
@@ -11,7 +11,8 @@ LIBUTEMPTER_LICENSE = LGPL-2.1+
 LIBUTEMPTER_LICENSE_FILES = COPYING
 
 define LIBUTEMPTER_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		COMPILE_PIE= LINK_PIE=
 endef
 
 define LIBUTEMPTER_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
