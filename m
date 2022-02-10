Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613DFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 18:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DA14090B;
	Thu, 10 Feb 2022 18:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4CuJKM3KZWA; Thu, 10 Feb 2022 18:57:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33798408F9;
	Thu, 10 Feb 2022 18:57:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B58361C1135
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 18:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B13F94017C
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 18:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lCA1EJGPGs16 for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 18:57:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4D5E400C8
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 18:57:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D424281319; Thu, 10 Feb 2022 18:50:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 19:56:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54ee9dc4f88c021f5501a0ae90a5b219736b56f5
X-Git-Newrev: f32a2b04c89b6fbcd2cccf22b34fcfebfbcc1f2d
X-Patchwork-Hint: ignore
Message-Id: <20220210185001.D424281319@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/omniorb: switch to host-python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f32a2b04c89b6fbcd2cccf22b34fcfebfbcc1f2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to host-python3 which is supported since version 4.2.1 and
https://sourceforge.net/p/omniorb/svn/HEAD/tree/tags/4_2_1/omniORBpy/update.log
to avoid the following build failure since removal of host-python in
commit 2743ce00ca61fde1537b64a165a69d497052be58:

make: *** No rule to make target 'host-python', needed by '/home/buildroot/autobuild/instance-1/output-1/build/host-omniorb-4.3.0/.stamp_configured'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/d415c2501b27cacf2356f0f6924ee7706d7a4070

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/omniorb/omniorb.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index a1943968f1..b44ec53fd5 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -11,11 +11,7 @@ OMNIORB_INSTALL_STAGING = YES
 OMNIORB_LICENSE = GPL2+, LGPL-2.1+
 OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
 OMNIORB_DEPENDENCIES = host-omniorb
-HOST_OMNIORB_DEPENDENCIES = host-python
-
-# omniorb is not python3 friendly, so force the python interpreter
-OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
-HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
+HOST_OMNIORB_DEPENDENCIES = host-python3
 
 # Defaulting long double support to a safe option for the
 # mix of embedded targets, this could later be automated
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
