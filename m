Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE90C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 10:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 157A54064C;
	Sun, 16 Jun 2024 10:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ox44feoYq00j; Sun, 16 Jun 2024 10:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD5D740672
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD5D740672;
	Sun, 16 Jun 2024 10:25:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 169D11BF31B
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FCCE4064C
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWs0Ldzdmiq9 for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1152F40297
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1152F40297
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0694287FAC; Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 23:00:43 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f3a29033a7202ddf90c1cc70cc90f00c3ac63685
X-Git-Newrev: 6a543bd03f1cdb4271a8be6c874949d138f8e5e2
X-Patchwork-Hint: ignore
Message-Id: <20240616102528.0694287FAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python3: fix
 config directory pattern
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a543bd03f1cdb4271a8be6c874949d138f8e5e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit a1efb5427b51bc4b39e3e33be080f1898cfea15e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
