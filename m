Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A22C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:26:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5267600D4
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5267600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B64F61485;
	Thu, 26 Aug 2021 22:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLMfSGVXdNLi; Thu, 26 Aug 2021 22:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69CCD614B7;
	Thu, 26 Aug 2021 22:26:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8131BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3AB04079E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYt107Cqe3Wm for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28AEC407AE
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7D5A28DC52; Thu, 26 Aug 2021 22:01:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 12:19:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6454eacf1018ec9be9d4f833e7a8f0a21a47f167
X-Git-Newrev: 94c41eef615bb33ad26fff71d341f66e35286f5d
X-Patchwork-Hint: ignore
Message-Id: <20210826220130.7D5A28DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/busybox/udhcpc.script:
 ensure action argument is correctly passed to hook scripts
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0228219656131910574=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0228219656131910574==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=94c41eef615bb33ad26fff71d341f66e35286f5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

commit f79a420825479c47d (package/busybox/udhcpc.script: support RFC3442
static routes) used 'set --' clobbering the positional arguments, causing
the action argument to not be correctly forwarded to hook scripts for the
renew / bound cases if static routes are provided by the server.

As a workaround, save the action argument at the beginning of the script and
use that when calling hook scripts.

Reported-by: 王琦 <wangwangqi2011@gmail.com>
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

--===============0228219656131910574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0228219656131910574==--
