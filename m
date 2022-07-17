Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C764CC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6529F408AD;
	Sun, 17 Jul 2022 13:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6529F408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iu_eYl900Xm8; Sun, 17 Jul 2022 13:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 344CD403C5;
	Sun, 17 Jul 2022 13:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 344CD403C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 323FB1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B4EE606EC
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B4EE606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kagc0aXu8eJr for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:27:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 498E6606A9
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 498E6606A9
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1016B83BD9; Sun, 17 Jul 2022 13:14:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:27:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e63d13d19e79a0a2b2d9507b568ca86700fe11a6
X-Git-Newrev: 8d8b03359672e195dae31b49c07623ece7308dbe
X-Patchwork-Hint: ignore
Message-Id: <20220717131431.1016B83BD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libstrophe: disable examples
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d8b03359672e195dae31b49c07623ece7308dbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable examples to avoid the following build failure on sparc:

examples/perf.c: In function 'rdtsc':
examples/perf.c:110:5: warning: 'x' is used uninitialized in this function [-Wuninitialized]
  110 |     __asm__ __volatile__("rd %%tick, %0; clruw %0, %1; srlx %0, 32, %0"
      |     ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5881246c4e9f7560181d2e60185d3bb5cf4f5a5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libstrophe/libstrophe.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index ce99c9fe48..7a349a19d4 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -11,6 +11,7 @@ LIBSTROPHE_DEPENDENCIES = host-pkgconf
 LIBSTROPHE_LICENSE = MIT or GPL-3.0
 LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
 LIBSTROPHE_INSTALL_STAGING = YES
+LIBSTROPHE_CONF_OPTS = --disable-examples
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 LIBSTROPHE_CONF_OPTS += --without-libxml2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
