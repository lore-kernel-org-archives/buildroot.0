Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A8EC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 756DC700F6;
	Tue, 21 Feb 2023 01:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 756DC700F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OACn_aiDOhQt; Tue, 21 Feb 2023 01:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD2C8700BB;
	Tue, 21 Feb 2023 01:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2C8700BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C26F61BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 352706FFF1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 352706FFF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fuCIOhCubafq for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5073F6FC27
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5073F6FC27
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4665581979; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 17:48:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6cffe45f91bc5aed2a2a56f84e3a34b6385f70ac
X-Git-Newrev: 09ac5a9e18e96ba6d3cd13e5e8d34aeccfcb603d
X-Patchwork-Hint: ignore
Message-Id: <20230220205253.4665581979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/test-pkg: proper output
 on host without jq installed
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
Content-Type: multipart/mixed; boundary="===============8194883853856156168=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8194883853856156168==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=09ac5a9e18e96ba6d3cd13e5e8d34aeccfcb603d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

On host without jq installed, test-pkg's output is as following:

$ ./utils/test-pkg -p mmc-utils
                    bootlin-armv5-uclibc [1/6]: which: no jq in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/14/bin:/usr/lib/llvm/13/bin:/usr/lib64/opencascade/bin)
JQ IS
OK
                     bootlin-armv7-glibc [2/6]: which: no jq in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/14/bin:/usr/lib/llvm/13/bin:/usr/lib64/opencascade/bin)
JQ IS
OK
                   bootlin-armv7m-uclibc [3/6]: which: no jq in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/14/bin:/usr/lib/llvm/13/bin:/usr/lib64/opencascade/bin)
...

Since test-pkg handles this case we can hide this error message and have
proper output:

$ ./utils/test-pkg -p mmc-utils
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/test-pkg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 4ebfd9af66..e7f5464817 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -201,7 +201,7 @@ build_one() {
 
     # Validate that we generate proper json as show-info
     { tput smso; printf '>>> Running show-info\n'; tput rmso; } >> "${dir}/logfile" 2> /dev/null;
-    JQ="$(which jq)"
+    JQ="$(which jq 2> /dev/null)"
     if [ -z "${JQ}" ]; then
         make O="${dir}" host-jq >> "${dir}/logfile" 2>&1
         JQ="${dir}/host/bin/jq"

--===============8194883853856156168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8194883853856156168==--
