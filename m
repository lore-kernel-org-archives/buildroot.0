Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA23C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4A3C40C69;
	Fri, 29 Jul 2022 19:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A3C40C69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2EZK_fMuY3n; Fri, 29 Jul 2022 19:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03D6640C4F;
	Fri, 29 Jul 2022 19:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03D6640C4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9D31BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E870C60EDB
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E870C60EDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uvDpbZePHpwL for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:56:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33AF260DE5
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33AF260DE5
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D089186945; Fri, 29 Jul 2022 19:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 21:56:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e1d45a9bcb38e37d1b27388b267a790b56eb642
X-Git-Newrev: c28b27032b926c2e5ce70a6feefbad34fb753772
X-Patchwork-Hint: ignore
Message-Id: <20220729194235.D089186945@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools.mk: fix runtime path
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

commit: https://git.buildroot.net/buildroot/commit/?id=c28b27032b926c2e5ce70a6feefbad34fb753772
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 505b5a6cdd337c2fd5965aa875a1a53419d62ed1 wrongly stated that "a
configure script bundled with a package may be generated with an older
version of Autotools, that may not yet support the --runstatedir option.
This will give an "Unsupported arguments" warning and the option will be
ignored.". Indeed, this will raise the following build failure with
attr, libtirpc, readline, etc.:

configure: error: unrecognized option: `--runstatedir=/run'

So to support configure scripts using older version, the variable is set
directly instead of using the --runstatedir argument.

Fixes:
 - http://autobuild.buildroot.org/results/c853f14773d875be30e32ae24daf80e181fef34e
 - http://autobuild.buildroot.org/results/045211cd66cf78c3d89d2d8ac41ec4edf0b0ee58
 - http://autobuild.buildroot.org/results/8c5160eef99de2f1f72f33d5e5ea94d417855b2c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 548f69cbb8..b6224b349d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -187,7 +187,7 @@ define $(2)_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
-		--runstatedir=/run \
+		runstatedir=/run \
 		--program-prefix="" \
 		--disable-gtk-doc \
 		--disable-gtk-doc-html \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
