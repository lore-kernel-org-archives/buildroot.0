Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A7CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:20:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC0261B95
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CC0261B95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53B4D81016;
	Wed, 17 Nov 2021 22:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Hvhg82OYMbJ; Wed, 17 Nov 2021 22:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BCD581B6D;
	Wed, 17 Nov 2021 22:20:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1064A1BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73DC360B73
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKZjuDsm4RTm for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:19:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A618860BC2
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:19:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 878B48D665; Wed, 17 Nov 2021 22:15:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:12:59 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fb21e06dc253b5d0efe7a7cee30006b9e58e0705
X-Git-Newrev: 90ccff9ad8ff438328ee88ae4305ab5a42f20268
X-Patchwork-Hint: ignore
Message-Id: <20211117221518.878B48D665@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] utils/genrandconfig:
 reduce the maximum "size" of random configurations
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

commit: https://git.buildroot.net/buildroot/commit/?id=90ccff9ad8ff438328ee88ae4305ab5a42f20268
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 0e64537917a5b27565b8c479fda83508a6da7b86)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 93dc6d898b..90420596ff 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -422,7 +422,7 @@ def gen_config(args):
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
