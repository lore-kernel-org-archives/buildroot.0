Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D00C27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 19:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF701811C9;
	Sun,  9 Jun 2024 19:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3dF-s6X5JRa; Sun,  9 Jun 2024 19:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B0581005
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B0581005;
	Sun,  9 Jun 2024 19:14:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5F871BF3E0
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 19:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A02EC403B6
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 19:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9gBsrO1E6uv for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 19:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD25403AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CD25403AC
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 19:14:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE49487D03; Sun,  9 Jun 2024 19:14:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jun 2024 21:13:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 139e47861724cfdd82f4e77396e34c43f7f4825f
X-Git-Newrev: a1efb5427b51bc4b39e3e33be080f1898cfea15e
X-Patchwork-Hint: ignore
Message-Id: <20240609191414.EE49487D03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: fix config directory
 pattern
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1efb5427b51bc4b39e3e33be080f1898cfea15e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, when running `PYTHON3_REMOVE_USELESS_FILES`, the hook to
clean up files from the python config directory assumed a pattern of
"config-$(VERSION)m-$(PLATFORM_TRIPLET)".

However, the "m" ABI suffix was dropped in python 3.8, so the hook would
never actually find files to delete. No error was raised due to the use
of a subshell to invoke find.

Also, if a platform triplet is not detected during the configure stage,
the config directory (LIBPL) defaults to `config-$VERSION`, and has no
trailing `-$PLATFORM_TRIPLET`.

Now, we glob anything after the version to ensure files get deleted.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python3/python3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 5d9d77af50..950006698b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -204,7 +204,7 @@ define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
 	rm -f $(TARGET_DIR)/usr/bin/smtpd.py.3
 	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/distutils/command/wininst*.exe
-	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)m-*/ \
+	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)*/ \
 		-type f -not -name Makefile` ; do \
 		rm -f $$i ; \
 	done
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
