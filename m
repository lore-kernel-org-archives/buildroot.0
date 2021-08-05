Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29D1C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:55:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C8D960F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C8D960F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 004754054A;
	Thu,  5 Aug 2021 19:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0rWbQCEb9Qam; Thu,  5 Aug 2021 19:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA00F40531;
	Thu,  5 Aug 2021 19:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E18AC1BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A2F540529
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id js2rDTofrgC6 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D85440526
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 589D583738; Thu,  5 Aug 2021 19:49:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:05:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 64b33c22a765f07510b089c8f9fe12df1bfb8cc9
X-Git-Newrev: 38f9f5bb303acdaedb96c9ecaa5324a9674073c5
X-Patchwork-Hint: ignore
Message-Id: <20210805194940.589D583738@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uhd: fix build with
 gcc 11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=38f9f5bb303acdaedb96c9ecaa5324a9674073c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with gcc 11:

In file included from /tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/usrp/dboard/e3xx/e3xx_ad9361_iface.hpp:14,
                 from /tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/usrp/dboard/e3xx/e3xx_ad9361_iface.cpp:7:
/tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/include/uhdlib/utils/rpc.hpp: In function 'bool {anonymous}::await_rpc_connected_state(std::shared_ptr<rpc::client>, std::chrono::milliseconds)':
/tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/include/uhdlib/utils/rpc.hpp:28:27: error: 'sleep_for' is not a member of 'std::this_thread'
   28 |         std::this_thread::sleep_for(std::chrono::milliseconds(1));
      |                           ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1591ff7fabb09e4eb79f3aa293fbb228c255c45b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0004-lib-Fix-missing-includes-in-rpc-hpp.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch b/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch
new file mode 100644
index 0000000000..b287beec71
--- /dev/null
+++ b/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch
@@ -0,0 +1,28 @@
+From 9c4d9d826a6f40f199c526afd5ec168d5d088591 Mon Sep 17 00:00:00 2001
+From: Martin Braun <martin.braun@ettus.com>
+Date: Fri, 29 Jan 2021 12:23:50 +0100
+Subject: [PATCH] lib: Fix missing includes in rpc.hpp
+
+[Retrieved from:
+https://github.com/EttusResearch/uhd/commit/9c4d9d826a6f40f199c526afd5ec168d5d088591]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ host/lib/include/uhdlib/utils/rpc.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/host/lib/include/uhdlib/utils/rpc.hpp b/host/lib/include/uhdlib/utils/rpc.hpp
+index e87a2ee324..ca89c10547 100644
+--- a/host/lib/include/uhdlib/utils/rpc.hpp
++++ b/host/lib/include/uhdlib/utils/rpc.hpp
+@@ -12,7 +12,11 @@
+ #include <rpc/client.h>
+ #include <rpc/rpc_error.h>
+ #include <boost/format.hpp>
++#include <chrono>
+ #include <memory>
++#include <mutex>
++#include <string>
++#include <thread>
+ 
+ namespace {
+ 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
