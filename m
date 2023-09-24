Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F871CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20FC440346;
	Sun, 24 Sep 2023 21:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20FC440346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jO8s7EyftWrK; Sun, 24 Sep 2023 21:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C58B340319;
	Sun, 24 Sep 2023 21:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C58B340319
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7A551BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77FA5600C7
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77FA5600C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mbitQR0ELGQz for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:47:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30977600BB
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30977600BB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20B4287641; Sun, 24 Sep 2023 21:47:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:29:07 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 46a015194d6826f28851578145aae98e68f31b7b
X-Git-Newrev: d3020ad78c9e49d21559b7a5a41a542a88523cba
X-Patchwork-Hint: ignore
Message-Id: <20230924214720.20B4287641@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/fstrcmp: fix musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3020ad78c9e49d21559b7a5a41a542a88523cba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
