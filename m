Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802CCC64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 14:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A8F61064;
	Mon, 27 Feb 2023 14:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38A8F61064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUygPZiCud1W; Mon, 27 Feb 2023 14:59:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5244261037;
	Mon, 27 Feb 2023 14:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5244261037
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96DC41BF2A2
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFB5540A20
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB5540A20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMYb8xToIO8o for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 14:58:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F19F440420
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F19F440420
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED1EE86BF1; Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 15:47:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7ae47f0c68607a90e6a65cbfff5bfb3007b019d
X-Git-Newrev: 441b859a1e3a5b2a6bbbc8990f67c33913aa2385
X-Patchwork-Hint: ignore
Message-Id: <20230227145800.ED1EE86BF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proxychains-ng: set -fPIC
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

commit: https://git.buildroot.net/buildroot/commit/?id=441b859a1e3a5b2a6bbbc8990f67c33913aa2385
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set -fPIC to avoid the following build failure with some architectures
such as mips or aarch64 raised since bump to version 4.14 in commit
35953d1e61aa8581be09c9dca39365955b10590e and
https://github.com/rofl0r/proxychains-ng/commit/35a674bdbc294730429a1007c9e7ce01e65b49b5:

checking what's the option to use in linker to set library name ...
cannot find an option to set library name

Fixes:
 - http://autobuild.buildroot.org/results/8ed1481e29321ed3da40251f700cb3bd66f62c94
 - http://autobuild.buildroot.org/results/fd01df6eb9a37257894740d44a33eece9123355a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proxychains-ng/proxychains-ng.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index c4d487c7db..beb8909088 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -13,7 +13,8 @@ PROXYCHAINS_NG_CPE_ID_VENDOR = proxychains-ng_project
 
 define PROXYCHAINS_NG_CONFIGURE_CMDS
 	cd $(@D) && \
-	$(TARGET_CONFIGURE_OPTS) ./configure --prefix=/usr --sysconfdir=/etc
+	$(TARGET_CONFIGURE_OPTS) CPPFLAGS="$(TARGET_CPPFLAGS) -fPIC" \
+		./configure --prefix=/usr --sysconfdir=/etc
 endef
 
 define PROXYCHAINS_NG_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
