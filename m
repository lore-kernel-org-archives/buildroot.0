Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2380ACE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2BFC415F4;
	Sun, 24 Sep 2023 21:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2BFC415F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJ1jq5ZSPyz8; Sun, 24 Sep 2023 21:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A38041734;
	Sun, 24 Sep 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A38041734
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C94D1BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 822B54174E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 822B54174E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4uQv_23JuS2y for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:46:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 710104150C
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 710104150C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C7E58765E; Sun, 24 Sep 2023 21:46:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:28:56 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 2f529f1f9c9b190fd59b992d975211cf08e3d865
X-Git-Newrev: 4093b3046b5ed216723b7c72be9c9fe604827f4e
X-Patchwork-Hint: ignore
Message-Id: <20230924214608.5C7E58765E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/fstrcmp: fix musl
 static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=4093b3046b5ed216723b7c72be9c9fe604827f4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following musl static build failure raised because host libtool
is not patched to manage "-static" as "-all-static".

/home/buildroot/autobuild/instance-2/output-1/host/bin/libtool --mode=link --tag=CC /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -Wextra -Wshadow -o bin/test_user \
	test_user/main.lo lib/libfstrcmp.la -static
chmod a+rx bin/test_prelude
libtool: link: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wall -Wextra -Wshadow -o bin/test_user test_user/main.o  lib/.libs/libfstrcmp.a
libtool: link: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wall -Wextra -Wshadow -o bin/fstrcmp fstrcmp/main.o  lib/.libs/libfstrcmp.a
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
/home/buildroot/autobuild/instance-2/output-1/build/host-gcc-final-10.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'

Fixes:
 - http://autobuild.buildroot.org/results/ffbee12f13e3d6c180d8891a428c6c490163083d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 094c76a2bcd301e4aa1e27c9694314079440ce5b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fstrcmp/fstrcmp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/fstrcmp/fstrcmp.mk b/package/fstrcmp/fstrcmp.mk
index 9c42159afb..294104b284 100644
--- a/package/fstrcmp/fstrcmp.mk
+++ b/package/fstrcmp/fstrcmp.mk
@@ -15,6 +15,12 @@ FSTRCMP_CONF_ENV = LIBTOOL="$(HOST_DIR)/bin/libtool"
 
 FSTRCMP_MAKE_OPTS = all-bin libdir/pkgconfig/fstrcmp.pc
 
+# fstrcmp does not carry and use the usual ltmain.sh wrappers, so it does not
+# inherit from our libtool patches to make -static behave like -all-static.
+ifeq ($(BR2_STATIC_LIBS),y)
+FSTRCMP_MAKE_OPTS += LDFLAGS="$(TARGET_LDFLAGS) -all-static"
+endif
+
 # We need to install the package files ourselves due to upstream trying
 # to install a .lai file which is missing because of rpath removal
 define FSTRCMP_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
