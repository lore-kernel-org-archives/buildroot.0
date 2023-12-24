Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C1CC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 21:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E15F181799;
	Sun, 24 Dec 2023 21:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E15F181799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5f8M6qqBknFg; Sun, 24 Dec 2023 21:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4030A81656;
	Sun, 24 Dec 2023 21:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4030A81656
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 229DA1BF86B
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 21:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC676408A3
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 21:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC676408A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uonL8Dudcj3x for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 21:48:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F7A94089A
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 21:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F7A94089A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BC25828BE; Sun, 24 Dec 2023 21:48:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 22:48:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d62dda206539ef2eeaf767772a00cdd52a55ab1d
X-Git-Newrev: 453b993ac19227391c577329e7327bb435bb77e6
X-Patchwork-Hint: ignore
Message-Id: <20231224214856.1BC25828BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncurses: install foot terminfo if
 foot is selected
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
Content-Type: multipart/mixed; boundary="===============3093855668275058183=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3093855668275058183==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=453b993ac19227391c577329e7327bb435bb77e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From foot/INSTALL.md:
```
As of ncurses 2021-07-31, ncurses includes a version of foot’s
terminfo. **The recommendation is to use those**, and only install the
terminfo definitions from this git repo if the system’s ncurses
predates 2021-07-31.
```

So it is best to follow the instructions and install the foot terminfo
provided by ncurses.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ncurses/ncurses.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 3b805cb1fd..00e1c0d424 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -73,6 +73,13 @@ NCURSES_TERMINFO_FILES = \
 	x/xterm-xfree86 \
 	$(call qstrip,$(BR2_PACKAGE_NCURSES_ADDITIONAL_TERMINFO))
 
+ifeq ($(BR2_PACKAGE_FOOT),y)
+NCURSES_TERMINFO_FILES += \
+	f/foot \
+	f/foot+base \
+	f/foot-direct
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
 NCURSES_LIB_SUFFIX = w

--===============3093855668275058183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3093855668275058183==--
