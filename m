Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5949EC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F10F6400D8;
	Mon, 15 Jul 2024 14:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3wpoigWCE_x; Mon, 15 Jul 2024 14:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 958F140734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 958F140734;
	Mon, 15 Jul 2024 14:38:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 372DE1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F0EB60744
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5mIQHh3-ENZ for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4439860747
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4439860747
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:38:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 366BC86C73; Mon, 15 Jul 2024 14:38:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 16:37:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 664f02a60c98536e516ba8a802bceba40418a34c
X-Git-Newrev: 69cbb563a124002fcb3e2725c3516b502587f9cc
X-Patchwork-Hint: ignore
Message-Id: <20240715143806.366BC86C73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tar: properly handle autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=69cbb563a124002fcb3e2725c3516b502587f9cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9a66711be1786b90f94cbb1648fa470def3486f8 ("package/tar: fix
linking with libiconv") added two patches that patch Makefile.am
files, but it forgot to add TAR_AUTORECONF = YES.

However, a gotcha is that TAR_AUTORECONF = YES would apply to both the
target tar, but also the host tar. But for host-tar, we can't accept
to do an autoreconf, because this would cause host-tar to have a
dependency on host-{autoconf,automake,libtool}, which in turn would
have a dependency on host-tar.

Since anyway the patches 0002/0003 that modify Makefile.am are only
useful to fix a libiconv problem that occurs when building target tar,
we disable autoreconf for host-tar, and we prevent automatic
autoreconf by touching the right Makefile.in files. This mess can be
dropped next time we update tar, as 0002/0003 will be part of the next
tar release.

Fixes:

  http://autobuild.buildroot.net/results/efdf7cf9ede810ed7f766cc4138b16054bc0c18a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tar/tar.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index b9de082603..ab8d0fc683 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -12,6 +12,9 @@ TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
 TAR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 TAR_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+# 0002-Fix-savannah-bug-#64441.patch
+# 0003-tests-fix-LDADD.patch
+TAR_AUTORECONF = YES
 
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_TAR_ADD_CCACHE_DEPENDENCY = NO
@@ -61,4 +64,19 @@ HOST_TAR_CONF_ENV = \
 	CC="$(HOSTCC_NOCCACHE)" \
 	CXX="$(HOSTCXX_NOCCACHE)"
 
+# Patches 0002-Fix-savannah-bug-#64441.patch and
+# 0003-tests-fix-LDADD.patch are patching Makefile.am, so they do
+# require TAR_AUTORECONF = YES above. However, for the host-tar
+# package we can't do this: we can't have host-tar depend on
+# host-{autoconf,automake,libtool} as those in turn might depend on
+# host-tar. Since the patches 0002 and 0003 are only related to
+# linking against libiconv, which is only an issue for the target tar,
+# we do not autoreconf, and touch the corresponding Makefile.in to
+# prevent them from being re-generated.
+HOST_TAR_AUTORECONF = NO
+define HOST_TAR_NO_AUTORECONF
+	touch $(@D)/src/Makefile.in $(@D)/tests/Makefile.in
+endef
+HOST_TAR_POST_PATCH_HOOKS += HOST_TAR_NO_AUTORECONF
+
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
