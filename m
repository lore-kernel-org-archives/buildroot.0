Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2C8C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BFF741841;
	Thu, 18 Aug 2022 06:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BFF741841
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4KQCd8RYox7; Thu, 18 Aug 2022 06:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0BA4175E;
	Thu, 18 Aug 2022 06:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE0BA4175E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D92791BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3321A82F99
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3321A82F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pL8tMBRGJcxP for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:22:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7606683118
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7606683118
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E994C87901; Thu, 18 Aug 2022 06:07:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 07:59:26 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c70106eaec9754530a4d3a8e27bc1b7171893919
X-Git-Newrev: 8564f1bcca502819f8cc26bbfd3e115fd84e8420
X-Patchwork-Hint: ignore
Message-Id: <20220818060740.E994C87901@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] utils/check-package:
 improve shellcheck reproducibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=8564f1bcca502819f8cc26bbfd3e115fd84e8420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

shellcheck is already in use to check SysV init scripts.
Currently its results can be affected by the existence of a
.shellcheckrc file in any parent directory.

For instance, in this example:
(1) /path/.shellcheckrc
(2) /path/to/.shellcheckrc
(3) /path/to/buildroot
the configs from file (1) are ignored and the configs from file (2)
override the default values from the shellcheck binary.
So the config file affects the check-package result for SysV scripts.

Avoid this reproducibility issue by adding an empty config file to the
buildroot topdir.

It can also eventually contain configs (different from default values
from sheelcheck) that we want as a standard to all shell scripts tested
by check-package.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit eaa1a43ab7281f70754405441501712a4e2b9981)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .shellcheckrc | 0
 DEVELOPERS    | 1 +
 2 files changed, 1 insertion(+)

diff --git a/.shellcheckrc b/.shellcheckrc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/DEVELOPERS b/DEVELOPERS
index 938782b1fd..4682005fb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2408,6 +2408,7 @@ F:	package/libhttpparser/
 
 N:	Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
 F:	.flake8
+F:	.shellcheckrc
 F:	package/atop/
 F:	package/thermald/
 F:	support/testing/infra/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
