Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DE7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:03:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2890360EE6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2890360EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 020FA402A5;
	Sat,  4 Sep 2021 21:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_o9ENBvwuCT; Sat,  4 Sep 2021 21:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D2E140282;
	Sat,  4 Sep 2021 21:03:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE15B1BF95A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B96EB80EE7
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXH5OXPMoiks for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:03:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0967C80EE1
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:03:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 95AEA884DB; Sat,  4 Sep 2021 21:02:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 23:02:35 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 14e07eb7b23cef1ad411b32296163dbe2ee88902
X-Git-Newrev: 6bb11a77212084de359c665b0b4bb7c9bcc8da24
X-Patchwork-Hint: ignore
Message-Id: <20210904210204.95AEA884DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
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
Content-Type: multipart/mixed; boundary="===============2952908869467746105=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============2952908869467746105==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6bb11a77212084de359c665b0b4bb7c9bcc8da24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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

--===============2952908869467746105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2952908869467746105==--
