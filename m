Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6FAC77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 20:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC2AB82154;
	Mon,  1 May 2023 20:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC2AB82154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6keA7bsLBIhc; Mon,  1 May 2023 20:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 307DE8214F;
	Mon,  1 May 2023 20:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 307DE8214F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43B181BF419
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 20:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D7758214F
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D7758214F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xq8yL0_9VnJp for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 20:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56A528214E
 for <buildroot@buildroot.org>; Mon,  1 May 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56A528214E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 434F7852D8; Mon,  1 May 2023 20:52:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 22:52:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66d3e74d94f8ac2f8f20302275ee944d24cbc074
X-Git-Newrev: 9a0857d734c5fca74915b1cd85b92555fe15fb93
X-Patchwork-Hint: ignore
Message-Id: <20230501205228.434F7852D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk3: fix cups backend
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a0857d734c5fca74915b1cd85b92555fe15fb93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When explicitly specifying printing backends libgtk3 requires file
to be one of them on linux.

Fixes:
- output/build/libgtk3-3.24.37/modules/printbackends/meson.build:39:4: ERROR: Problem encountered: 'file' print backed needs to be enabled

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgtk3/libgtk3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 18a8a9fa42..b41049b0ee 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -68,7 +68,7 @@ LIBGTK3_DEPENDENCIES += xlib_libXdamage
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
-LIBGTK3_CONF_OPTS += -Dprint_backends=cups
+LIBGTK3_CONF_OPTS += -Dprint_backends=file,cups
 LIBGTK3_DEPENDENCIES += cups
 else
 LIBGTK3_CONF_OPTS += -Dprint_backends=auto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
