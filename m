Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF40C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:51:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67A7561027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67A7561027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D18360688;
	Sun, 14 Nov 2021 12:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8sYvnZNbRmq; Sun, 14 Nov 2021 12:51:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7943860667;
	Sun, 14 Nov 2021 12:50:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93D7B1BF34C
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EC9A80DFE
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2gSi6UdV-yuY for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 12:50:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D028480DFB
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 12:50:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8D3478CA3D; Sun, 14 Nov 2021 12:46:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 13:50:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6c9d495bec4be53b405f117ed2ddabb0de09d37
X-Git-Newrev: 0e64537917a5b27565b8c479fda83508a6da7b86
X-Patchwork-Hint: ignore
Message-Id: <20211114124650.8D3478CA3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: reduce the maximum
 "size" of random configurations
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e64537917a5b27565b8c479fda83508a6da7b86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

genrandconfig is used by the Buildroot autobuilders to generate
semi-random configurations that we build test. As part of this, we use
"make randpackageconfig" to randomize the selection of packages,
together with a KCONFIG_PROBABILITY value, which indicates the
probabibility for each option to be enabled. This probability is
itself randomized, between 1% and 30% for every build.

However, with our increasing number of packages (over 2900), when we
use a 30% probability for options to be enabled, it means a *lot* of
options are enabled, causing very large configurations to be
tested. These configurations are not very realistic, and they take
ages to build on our autobuilders: we have builds that take 4, 5 or
even 7 hours to build.

In order to test a larger number of configurations and therefore a
larger variety of configurations, this commit reduces the maximum
probability to 20%.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 4fffcbad11..77c7e585f5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -410,7 +410,7 @@ def gen_config(args):
             return 1
         bounded_loop -= 1
         subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                               "KCONFIG_PROBABILITY=%d" % randint(1, 30),
+                               "KCONFIG_PROBABILITY=%d" % randint(1, 20),
                                "randpackageconfig"])
 
         if fixup_config(sysinfo, configfile):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
