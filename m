Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558DEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 155E04028A;
	Mon, 21 Mar 2022 21:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUZzEhAT4PyI; Mon, 21 Mar 2022 21:18:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30FD2415F0;
	Mon, 21 Mar 2022 21:18:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 959091BF9AA
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92E5360FAF
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwnR8D8Zti1A for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:18:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF12C600B6
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:18:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 62A7D84E82; Mon, 21 Mar 2022 21:09:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 22:13:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 585cf07e905dc61118bcdc15b49762f6aa0230a9
X-Git-Newrev: 52686b220d0c3c081f8259fc0ff6a307c519ec2f
X-Patchwork-Hint: ignore
Message-Id: <20220321210932.62A7D84E82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetfilter_conntrack: fix musl
 build with headers >= 5.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=52686b220d0c3c081f8259fc0ff6a307c519ec2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with musl and headers >= 5.15 raised
since bump to version 1.0.9 in commit
9af9dfa543907c46091c706b0f3a0eb89445ae74:

In file included from /home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/arpa/inet.h:9,
                 from ../../include/internal/internal.h:14,
                 from proto.c:2:
/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
   23 | struct in6_addr {
      |        ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/19931aba8bee8867a53130ca4a53cfadbc4c5bfd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...track-fix-build-with-kernel-5-15-and-musl.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch b/package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch
new file mode 100644
index 0000000000..9e96594120
--- /dev/null
+++ b/package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch
@@ -0,0 +1,60 @@
+From 21ee35dde73aec5eba35290587d479218c6dd824 Mon Sep 17 00:00:00 2001
+From: Robert Marko <robimarko@gmail.com>
+Date: Thu, 24 Feb 2022 15:01:11 +0100
+Subject: conntrack: fix build with kernel 5.15 and musl
+
+Currently, with kernel 5.15 headers and musl building is failing with
+redefinition errors due to a conflict between the kernel and musl headers.
+
+Musl is able to suppres the conflicting kernel header definitions if they
+are included after the standard libc ones, however since ICMP definitions
+were moved into a separate internal header to avoid duplication this has
+stopped working and is breaking the builds.
+
+It seems that the issue is that <netinet/in.h> which contains the UAPI
+suppression defines is included in the internal.h header and not in the
+proto.h which actually includes the kernel ICMP headers and thus UAPI
+supression defines are not present.
+
+Solve this by moving the <netinet/in.h> include before the ICMP kernel
+includes in the proto.h
+
+Fixes: bc1cb4b11403 ("conntrack: Move icmp request>reply type mapping to common file")
+Signed-off-by: Robert Marko <robimarko@gmail.com>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+
+[Retrieved from:
+https://git.netfilter.org/libnetfilter_conntrack/commit/?id=21ee35dde73aec5eba35290587d479218c6dd824]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/internal/internal.h | 1 -
+ include/internal/proto.h    | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/internal/internal.h b/include/internal/internal.h
+index 2ef8a90..7cd7c44 100644
+--- a/include/internal/internal.h
++++ b/include/internal/internal.h
+@@ -14,7 +14,6 @@
+ #include <arpa/inet.h>
+ #include <time.h>
+ #include <errno.h>
+-#include <netinet/in.h>
+ 
+ #include <libnfnetlink/libnfnetlink.h>
+ #include <libnetfilter_conntrack/libnetfilter_conntrack.h>
+diff --git a/include/internal/proto.h b/include/internal/proto.h
+index 40e7bfe..60a5f4e 100644
+--- a/include/internal/proto.h
++++ b/include/internal/proto.h
+@@ -2,6 +2,7 @@
+ #define _NFCT_PROTO_H_
+ 
+ #include <stdint.h>
++#include <netinet/in.h>
+ #include <linux/icmp.h>
+ #include <linux/icmpv6.h>
+ 
+-- 
+cgit v1.2.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
