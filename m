Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E8DE7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A52F42238;
	Sat, 30 Sep 2023 16:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A52F42238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TMFJiylzvV6B; Sat, 30 Sep 2023 16:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A3F42241;
	Sat, 30 Sep 2023 16:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9A3F42241
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 377741BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 123C340327
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 123C340327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rbno7ogY0soM for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:48:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DD534017A
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD534017A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A38783C18; Sat, 30 Sep 2023 16:48:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:48:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adb3f5a3e0d5bd6df60c91c46a03a2ff9c867dbb
X-Git-Newrev: 411a3deb1a4850f4eeff3faebdb87b8ef544d650
X-Patchwork-Hint: ignore
Message-Id: <20230930164849.0A38783C18@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mako: add optional runtime
 dependency on python-babel
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

commit: https://git.buildroot.net/buildroot/commit/?id=411a3deb1a4850f4eeff3faebdb87b8ef544d650
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some extensions of python-mako use python-babel, if they are used,
python-babel must be added as a runtime dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mako/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
index 2e1094189f..7bba31943e 100644
--- a/package/python-mako/Config.in
+++ b/package/python-mako/Config.in
@@ -17,4 +17,11 @@ config BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN
 	  Provide python-pygments support for
 	  mako.ext.pygmentplugin
 
+config BR2_PACKAGE_PYTHON_MAKO_EXT_BABELPLUGIN
+	bool "mako extension babelplugin"
+	select BR2_PACKAGE_PYTHON_BABEL # runtime
+	help
+	  Provide python-babel support for
+	  mako.ext.babelplugin
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
