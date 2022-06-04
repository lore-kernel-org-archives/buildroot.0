Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693B5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 17:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBE9C41A13;
	Sat,  4 Jun 2022 17:05:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDSFRrJ16sxT; Sat,  4 Jun 2022 17:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89045419C7;
	Sat,  4 Jun 2022 17:05:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB57C1BF364
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 17:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA8258405E
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 17:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYB7JKbtSEDH for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 17:05:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 168C483F9D
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 17:05:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 11C9986B24; Sat,  4 Jun 2022 16:53:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jun 2022 19:04:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51b4a43e562e8551614528e88c05db9bf2fd1003
X-Git-Newrev: cb91d2e60fd1a38d257b731e8d4b7bf067f141de
X-Patchwork-Hint: ignore
Message-Id: <20220604165315.11C9986B24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iucode-tool: fix build with
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb91d2e60fd1a38d257b731e8d4b7bf067f141de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

configure:6091: /home/autobuild/autobuild/instance-3/output-1/host/bin/x86_64-buildroot-linux-musl-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp   >&5
/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libargp.a(argp-parse.o): in function `argp_version_parser':
/home/autobuild/autobuild/instance-3/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'

[...]

checking for library containing argp_parse... no
configure: error: An implementation of GNU Argp was not found, please install libargp

Fixes:
 - http://autobuild.buildroot.org/results/3d2d9e27aabcd6763510238087fe25d5273d3535

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iucode-tool/iucode-tool.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 596ad268b7..b123973a90 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -7,11 +7,15 @@
 IUCODE_TOOL_VERSION = 2.3.1
 IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
 IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/master
-IUCODE_TOOL_DEPENDENCIES = $(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 IUCODE_TOOL_LICENSE = GPL-2.0+
 IUCODE_TOOL_LICENSE_FILES = COPYING
 IUCODE_TOOL_CPE_ID_VENDOR = iucode-tool_project
 
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+IUCODE_TOOL_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
+IUCODE_TOOL_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
+endif
+
 define IUCODE_TOOL_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/iucode-tool/S00iucode-tool \
 		$(TARGET_DIR)/etc/init.d/S00iucode-tool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
