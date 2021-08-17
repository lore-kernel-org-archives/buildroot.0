Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F15CC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 10:28:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7200360F35
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 10:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7200360F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A65B40D8E;
	Tue, 17 Aug 2021 10:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkk6ENgFD38a; Tue, 17 Aug 2021 10:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AB0040D8C;
	Tue, 17 Aug 2021 10:28:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECA231BF271
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 10:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB2484051F
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 10:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bKiBV3ct0nin for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 10:28:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B74A40370
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 10:28:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7B0EA8D367; Tue, 17 Aug 2021 10:27:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 12:19:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6454eacf1018ec9be9d4f833e7a8f0a21a47f167
X-Git-Newrev: 94c41eef615bb33ad26fff71d341f66e35286f5d
X-Patchwork-Hint: ignore
Message-Id: <20210817102754.7B0EA8D367@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox/udhcpc.script: ensure
 action argument is correctly passed to hook scripts
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
Content-Type: multipart/mixed; boundary="===============3900898612207142525=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3900898612207142525==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=94c41eef615bb33ad26fff71d341f66e35286f5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============3900898612207142525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3900898612207142525==--
