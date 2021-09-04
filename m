Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4F6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:04:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1701060EE6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1701060EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF3C240205;
	Sat,  4 Sep 2021 21:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4f2K2icP9qE; Sat,  4 Sep 2021 21:04:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9FA3401D4;
	Sat,  4 Sep 2021 21:04:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B7941BF95A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26B704015B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bACNkB6HBDVe for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:03:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45BE540105
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:03:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BF675884F7; Sat,  4 Sep 2021 21:02:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 23:02:26 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: d65ec878191fe6f21e9266b2e811f1a775c4f6a4
X-Git-Newrev: 06e0f6cc678d85a681328b4b0d5862db756fb6a3
X-Patchwork-Hint: ignore
Message-Id: <20210904210214.BF675884F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x]
 package/busybox/udhcpc.script: ensure action argument is correctly passed
 to hook scripts
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7146239950189732165=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============7146239950189732165==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=06e0f6cc678d85a681328b4b0d5862db756fb6a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

commit f79a420825479c47d (package/busybox/udhcpc.script: support RFC3442
static routes) used 'set --' clobbering the positional arguments, causing
the action argument to not be correctly forwarded to hook scripts for the
renew / bound cases if static routes are provided by the server.

As a workaround, save the action argument at the beginning of the script and
use that when calling hook scripts.

Reported-by: 王琦 <wangwangqi2011@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 94c41eef615bb33ad26fff71d341f66e35286f5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/udhcpc.script | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index c73ad6c2ef..74dc5532b9 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -4,6 +4,7 @@
 
 [ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
 
+ACTION="$1"
 RESOLV_CONF="/etc/resolv.conf"
 [ -e $RESOLV_CONF ] || touch $RESOLV_CONF
 [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
@@ -29,7 +30,7 @@ wait_for_ipv6_default_route() {
 	printf " timeout!\n"
 }
 
-case "$1" in
+case "$ACTION" in
 	deconfig)
 		/sbin/ifconfig $interface up
 		/sbin/ifconfig $interface 0.0.0.0
@@ -115,7 +116,7 @@ esac
 HOOK_DIR="$0.d"
 for hook in "${HOOK_DIR}/"*; do
     [ -f "${hook}" -a -x "${hook}" ] || continue
-    "${hook}" "${@}"
+    "${hook}" "$ACTION"
 done
 
 exit 0

--===============7146239950189732165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7146239950189732165==--
