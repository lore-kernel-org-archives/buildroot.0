Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B91C636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 14:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 849D9419B9;
	Fri, 10 Feb 2023 14:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 849D9419B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAosOCk3ZjVT; Fri, 10 Feb 2023 14:15:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD72C419A5;
	Fri, 10 Feb 2023 14:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD72C419A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A89291BF976
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 901194113D
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 901194113D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5ePSiHRKDG1 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA8E541138
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA8E541138
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8C7284EA5; Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 15:10:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4543911494b2a485f159eae21bb703b676ec2c9
X-Git-Newrev: e331da62fb7612b7a52a40e37312753cc1c1eef5
X-Patchwork-Hint: ignore
Message-Id: <20230210141450.A8C7284EA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glmark2: use external waf
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

commit: https://git.buildroot.net/buildroot/commit/?id=e331da62fb7612b7a52a40e37312753cc1c1eef5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/bbd/bbd90f11975b691f694412a6fc3446f37dd7c0aa/

The bundled waf script is too old (1.9.3) for python >= 3.11 as it uses the
'U' modifier to open (universal newlines), which have been deprecated since
python 3.3 and finally removed in 3.11.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glmark2/glmark2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index e8d6f71dad..bac9d9ff6f 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -10,6 +10,9 @@ GLMARK2_LICENSE = GPL-3.0+, SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
 GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
 
+# The bundled waf script is too old for >= python3.11
+GLMARK2_NEEDS_EXTERNAL_WAF = YES
+
 ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
 GLMARK2_DEPENDENCIES += libdrm libgbm libgles udev
 GLMARK2_FLAVORS += drm-glesv2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
