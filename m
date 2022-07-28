Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBF9C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 116C94168D;
	Thu, 28 Jul 2022 19:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 116C94168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRfDOMS3UBag; Thu, 28 Jul 2022 19:04:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33292409A4;
	Thu, 28 Jul 2022 19:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33292409A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04CBA1C1190
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E15ED60A6A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E15ED60A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucrj8_G5o4Rw for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28DBB607EC
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28DBB607EC
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 31A1E864E7; Thu, 28 Jul 2022 18:50:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 21:03:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 372ecbff2d16e8c13585b0918d36ed5e04bccf37
X-Git-Newrev: 505b5a6cdd337c2fd5965aa875a1a53419d62ed1
X-Patchwork-Hint: ignore
Message-Id: <20220728185030.31A1E864E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools: use /run as runtime
 path
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

commit: https://git.buildroot.net/buildroot/commit/?id=505b5a6cdd337c2fd5965aa875a1a53419d62ed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since many years now, /run is the standard runstate directory for Linux
systems, and Buildroot follows this standard. Encode this as the default
for autotools packages.

Note that the configure script bundled with a package may be generated
with an older version of Autotools, that may not yet support the
--runstatedir option. This will give an "Unsupported arguments" warning
and the option will be ignored. We may have better luck with passing
runstatedir as a variable instead of an option, but chances are that
the configure script doesn't know that variant either (it wouldn't print
a warning in that case). Since the warning is actually preferrable, pass
it as an option after all.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[Arnout: pass as an option instead of an argument after all]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-autotools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 717ff81593..548f69cbb8 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -187,6 +187,7 @@ define $(2)_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
+		--runstatedir=/run \
 		--program-prefix="" \
 		--disable-gtk-doc \
 		--disable-gtk-doc-html \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
