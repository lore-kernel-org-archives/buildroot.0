Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6929FC25B0E
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF0066113B;
	Thu, 18 Aug 2022 06:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF0066113B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id In6pJhDZTfP3; Thu, 18 Aug 2022 06:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1081260D6A;
	Thu, 18 Aug 2022 06:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1081260D6A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CEE91BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E8DC61141
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E8DC61141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugcP4xo8IPHB for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF8FA610EB
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF8FA610EB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 61BEC876FD; Thu, 18 Aug 2022 06:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 07:59:11 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 8840f12aa1adbdc5f0e9558b122a92a5381c51a7
X-Git-Newrev: 6ebd1890ca6f94a2971cdf1ab90e1d30123aa490
X-Patchwork-Hint: ignore
Message-Id: <20220818060241.61BEC876FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] utils/check-package:
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ebd1890ca6f94a2971cdf1ab90e1d30123aa490
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
index 792c74ee4d..9f71ea89db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2433,6 +2433,7 @@ F:	package/libhttpparser/
 
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
