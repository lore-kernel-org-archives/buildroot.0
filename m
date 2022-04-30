Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED252C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B34DE82660;
	Sat, 30 Apr 2022 18:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MfmoDCb9W1jW; Sat, 30 Apr 2022 18:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7AA781B3E;
	Sat, 30 Apr 2022 18:54:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABFC71BF94D
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5AC8404F4
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUhhNoKBWr8Y for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 072F54032A
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 95024847F3; Sat, 30 Apr 2022 18:44:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29a38e7941ada87c344e2edad49a904e1084110b
X-Git-Newrev: 8622331e17545cb5badd226ec8727439f7e7a451
X-Patchwork-Hint: ignore
Message-Id: <20220430184417.95024847F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libv4l: fix build with
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

commit: https://git.buildroot.net/buildroot/commit/?id=8622331e17545cb5badd226ec8727439f7e7a451
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

configure:19923: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/i686-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp  -largp >&5
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
/home/giuliobenetti/autobuild/run/instance-2/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'

[...]

checking for library containing argp_parse... no
configure: error: unable to find the argp_parse() function

Fixes:
 - http://autobuild.buildroot.org/results/b7b2253ac902b441cc6ff12500b56bd15c413d71

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libv4l/libv4l.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a781ffcd5d..fd69b7ac7a 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -27,7 +27,8 @@ LIBV4L_DEPENDENCIES += alsa-lib
 endif
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-LIBV4L_DEPENDENCIES += argp-standalone
+LIBV4L_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
+LIBV4L_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
 endif
 
 LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
