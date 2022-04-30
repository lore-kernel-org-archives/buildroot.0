Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B90C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C908404C5;
	Sat, 30 Apr 2022 18:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOeT1HEm6FB8; Sat, 30 Apr 2022 18:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81B654034B;
	Sat, 30 Apr 2022 18:55:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03F3B1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0061841626
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u33l3Ri7eme8 for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E78F54161E
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7EF7F847F3; Sat, 30 Apr 2022 18:44:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:20:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebf745b6768689a088a1e51bdb4e7b941dfd15c5
X-Git-Newrev: 7280c202f8a29310fa801e5322dad00308c9c4c7
X-Patchwork-Hint: ignore
Message-Id: <20220430184417.7EF7F847F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeipmi: fix build with
 argp-standalone and NLS
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

commit: https://git.buildroot.net/buildroot/commit/?id=7280c202f8a29310fa801e5322dad00308c9c4c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

configure:14644: checking for argp_parse in -largp
configure:14669: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp  -lm -lm -lm  >&5
/home/giuliobenetti/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
/home/giuliobenetti/autobuild/run/instance-1/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'

[...]

In file included from freeipmi-argp-fmtstream.c:35:
freeipmi-argp-namefrob.h:62:32: error: redefinition of 'argp_fmtstream_write'
   62 | #define __argp_fmtstream_write argp_fmtstream_write
      |                                ^~~~~~~~~~~~~~~~~~~~
freeipmi-argp-fmtstream.c:395:1: note: in expansion of macro '__argp_fmtstream_write'
  395 | __argp_fmtstream_write (argp_fmtstream_t __fs,
      | ^~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/26090162396b1b8cedfc58e1790ced528fcc35c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freeipmi/freeipmi.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index 9fb59245b9..b26ed0c0bf 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -20,7 +20,8 @@ FREEIPMI_CONF_OPTS = --without-random-device
 # Work around for uClibc or musl toolchains which lack argp_*()
 # functions.
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-FREEIPMI_DEPENDENCIES += argp-standalone
+FREEIPMI_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
+FREEIPMI_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
