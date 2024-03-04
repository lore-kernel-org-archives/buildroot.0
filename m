Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E372C54E41
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 21:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0FB760D51;
	Mon,  4 Mar 2024 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-PIB1CSotV0; Mon,  4 Mar 2024 21:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB5B60E32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB5B60E32;
	Mon,  4 Mar 2024 21:52:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8848F1BF94D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42A0D40158
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0d8IvEZToQVM for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92BDE40169
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92BDE40169
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D558880E4; Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 22:49:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9ccdc11704de3ac7aac892080e2cd8561dc3482
X-Git-Newrev: d4fdd78a7207935c24427bbe736c443f0ad2a745
X-Patchwork-Hint: ignore
Message-Id: <20240304215231.8D558880E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libva: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4fdd78a7207935c24427bbe736c443f0ad2a745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 2.20.0 in commit e926c83928e08c0ecd6cd4383e1cca151a8a4d2c and
https://github.com/intel/libva/commit/4f5a4345fc9f92565763ca22026891475e3cf835:

../va/va.c: In function 'va_new_opendriver':
../va/va.c:695:9: error: 'for' loop initial declarations are only allowed in C99 mode
         for (unsigned int i = 0; i < num_drivers; i++)
         ^
../va/va.c:695:9: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes: e926c83928e08c0ecd6cd4383e1cca151a8a4d2c
 - http://autobuild.buildroot.org/results/b9dbd104fa05c59883d87f74e6522c55620a4252

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva/libva.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 9e9d5d698c..4481be9e7b 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -10,6 +10,7 @@ LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
 LIBVA_INSTALL_STAGING = YES
 LIBVA_DEPENDENCIES = host-pkgconf libdrm
+LIBVA_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 # libdrm is a hard-dependency
 LIBVA_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
