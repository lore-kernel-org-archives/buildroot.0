Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5023E7737A
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C69D42279;
	Sat, 30 Sep 2023 16:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C69D42279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0mwdfT0ez23; Sat, 30 Sep 2023 16:49:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9306642409;
	Sat, 30 Sep 2023 16:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9306642409
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 409DA1BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BFBB82111
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BFBB82111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72h8cEq4g6wX for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:48:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08CC182110
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08CC182110
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E53B683C1A; Sat, 30 Sep 2023 16:48:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:48:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 164801997e526bf7f7ba8006cd1702e013536ca7
X-Git-Newrev: adb3f5a3e0d5bd6df60c91c46a03a2ff9c867dbb
X-Patchwork-Hint: ignore
Message-Id: <20230930164848.E53B683C1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mako: add optional runtime
 dependency on python-pygments
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

commit: https://git.buildroot.net/buildroot/commit/?id=adb3f5a3e0d5bd6df60c91c46a03a2ff9c867dbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some extensions of python-mako use python-pygments, if they are used,
python-pygments must be added as a runtime dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mako/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
index e6a10c9c2e..2e1094189f 100644
--- a/package/python-mako/Config.in
+++ b/package/python-mako/Config.in
@@ -7,3 +7,14 @@ config BR2_PACKAGE_PYTHON_MAKO
 	  for maximum performance.
 
 	  https://pypi.python.org/pypi/Mako
+
+if BR2_PACKAGE_PYTHON_MAKO
+
+config BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN
+	bool "mako extension pygmentplugin"
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	help
+	  Provide python-pygments support for
+	  mako.ext.pygmentplugin
+
+endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
