Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FFCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:20:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EBA861BCF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EBA861BCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 751C94016F;
	Wed, 17 Nov 2021 22:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yyjpdgw4jt60; Wed, 17 Nov 2021 22:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38886418B9;
	Wed, 17 Nov 2021 22:20:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6355D1BF9B2
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 526EA405CB
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yk6liMLO6noa for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:19:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4116D40600
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:19:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 24DCE8D64F; Wed, 17 Nov 2021 22:15:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:13:04 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 8d41edbf29c84c71cf6bf39bfaa9a7c584266e84
X-Git-Newrev: 53730fa828751b5d2cd67b783da7b33488f1d7fa
X-Patchwork-Hint: ignore
Message-Id: <20211117221505.24DCE8D64F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] utils/genrandconfig:
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

commit: https://git.buildroot.net/buildroot/commit/?id=53730fa828751b5d2cd67b783da7b33488f1d7fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
index 3db5da442b..57fbaa1b61 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -412,7 +412,7 @@ def gen_config(args):
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
