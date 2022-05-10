Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED1BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E5A341780;
	Tue, 10 May 2022 19:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YGsMSFib_QJW; Tue, 10 May 2022 19:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F634177C;
	Tue, 10 May 2022 19:23:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8531BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECF4D4177C
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xvuHZaYn6m6a for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:23:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1987B416F5
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:23:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E4FFE85C92; Tue, 10 May 2022 19:12:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 21:23:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60a8db376ee34fc0959ba3441b47e57e294b1abf
X-Git-Newrev: e15ce8b04d5fa36c51690fbbf8a015e5fee026a1
X-Patchwork-Hint: ignore
Message-Id: <20220510191248.E4FFE85C92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcusdk: fix build with
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

commit: https://git.buildroot.net/buildroot/commit/?id=e15ce8b04d5fa36c51690fbbf8a015e5fee026a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

configure:16428: /home/buildroot/autobuild/instance-3/output-1/host/bin/sh4-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp   >&5
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/10.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
/home/buildroot/autobuild/instance-3/output-1/build/argp-standalone-1.4.1/argp-parse.c:190: undefined reference to `libintl_dgettext'

[...]

checking for library containing argp_parse... no
configure: error: argp_parse not found

Fixes:
 - http://autobuild.buildroot.org/results/9277a064b61f24ad35334b318fe4d899a4c39aa1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bcusdk/bcusdk.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index ff5becd84b..8006b265b9 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -21,9 +21,12 @@ BCUSDK_CONF_OPTS = \
 	--without-pth-test \
 	--with-pth=$(STAGING_DIR)/usr
 
-BCUSDK_DEPENDENCIES = \
-	libpthsem \
-	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
+BCUSDK_DEPENDENCIES = libpthsem \
+
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+BCUSDK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
+BCUSDK_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
+endif
 
 define BCUSDK_REMOVE_EXAMPLES
 	$(RM) -rf $(TARGET_DIR)/usr/share/bcusdk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
