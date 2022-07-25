Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8C2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 991D9610C1;
	Mon, 25 Jul 2022 22:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 991D9610C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHrRwczlCd8h; Mon, 25 Jul 2022 22:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC5560E57;
	Mon, 25 Jul 2022 22:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC5560E57
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0098D1BF9AC
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDB1B833D3
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB1B833D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNALiEDt78Tw for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE7CA81CC3
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE7CA81CC3
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 95E8685E6D; Mon, 25 Jul 2022 22:15:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 23:52:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfa8494f4b1962e34b5febe13fa394914d03398d
X-Git-Newrev: eaa1a43ab7281f70754405441501712a4e2b9981
X-Patchwork-Hint: ignore
Message-Id: <20220725221520.95E8685E6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: improve shellcheck
 reproducibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=eaa1a43ab7281f70754405441501712a4e2b9981
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 .shellcheckrc | 0
 DEVELOPERS    | 1 +
 2 files changed, 1 insertion(+)

diff --git a/.shellcheckrc b/.shellcheckrc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/DEVELOPERS b/DEVELOPERS
index 19f383aef6..504a6bb018 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2474,6 +2474,7 @@ F:	package/libhttpparser/
 
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
