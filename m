Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34830C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:32:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D94C60EC0
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D94C60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FDCE60777;
	Sat, 13 Nov 2021 09:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vl2gBcfjIW50; Sat, 13 Nov 2021 09:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D26860723;
	Sat, 13 Nov 2021 09:32:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBB2C1BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9E1D4015C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_rkrJJB2uj1 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:32:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AE664013B
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:32:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E18AB88259; Sat, 13 Nov 2021 09:28:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 10:31:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bff1c6ada55f7a6ce0f2f399f9cb7123832f0727
X-Git-Newrev: 82f5b765779af0f530ccff6667b3c64e42b009dc
X-Patchwork-Hint: ignore
Message-Id: <20211113092820.E18AB88259@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongodb: fix build with glibc >=
 2.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=82f5b765779af0f530ccff6667b3c64e42b009dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with glibc >= 2.34:

In file included from /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/signal.h:328,
                 from /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/include/c++/11.2.0/csignal:42,
                 from src/mongo/stdx/thread.h:33,
                 from src/mongo/db/client.h:46,
                 from src/mongo/db/operation_context.h:36,
                 from src/mongo/db/pipeline/variables.h:32,
                 from src/mongo/db/pipeline/dependencies.h:37,
                 from src/mongo/db/matcher/expression.h:38,
                 from src/mongo/db/matcher/expression_parser.h:34,
                 from src/mongo/db/pipeline/document_source_list_sessions.cpp:34:
src/mongo/stdx/thread.h:107:56: error: call to non-'constexpr' function 'long int sysconf(int)'
  107 |         std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
      |

Fixes:
 - http://autobuild.buildroot.org/results/6be8efb96547f8ec6e9b776abae8c1b51501e9ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch b/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
new file mode 100644
index 0000000000..02b35c6e4f
--- /dev/null
+++ b/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
@@ -0,0 +1,49 @@
+From ef08d0dbc99db8c4620512e92bfb3154282eb5d3 Mon Sep 17 00:00:00 2001
+From: Andrew Morrow <acm@mongodb.com>
+Date: Wed, 15 Sep 2021 15:23:42 -0400
+Subject: [PATCH] SERVER-59459 With glibc-2.34, MINSIGSTKSZ is no longer a
+ constant
+
+[Retrieved (and backported) from:
+https://github.com/mongodb/mongo/commit/ef08d0dbc99db8c4620512e92bfb3154282eb5d3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/mongo/stdx/thread.h | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/src/mongo/stdx/thread.h b/src/mongo/stdx/thread.h
+index 7b15bb561bd9..6f1e16cdeb36 100644
+--- a/src/mongo/stdx/thread.h
++++ b/src/mongo/stdx/thread.h
+@@ -76,11 +76,19 @@ class SigAltStackController {
+     }
+ 
+ private:
++    static size_t _getStackSize() {
++        // It would be nice for this to be a constexpr, but
++        // MINSIGSTKSZ became a macro that invoked `sysconf` in glibc
++        // 2.34.
++        static const std::size_t kMinSigStkSz = MINSIGSTKSZ;
++        return std::max(kMongoMinSignalStackSize, kMinSigStkSz);
++    }
++
+     void _install() const {
+         stack_t ss;
+         ss.ss_sp = _stackStorage.get();
+         ss.ss_flags = 0;
+-        ss.ss_size = kStackSize;
++        ss.ss_size = _getStackSize();
+         if (sigaltstack(&ss, nullptr)) {
+             abort();
+         }
+@@ -107,9 +115,7 @@ class SigAltStackController {
+     //   ( https://jira.mongodb.org/secure/attachment/233569/233569_stacktrace-writeup.txt )
+     static constexpr std::size_t kMongoMinSignalStackSize = std::size_t{64} << 10;
+ 
+-    static constexpr std::size_t kStackSize =
+-        std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
+-    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(kStackSize);
++    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(_getStackSize());
+ 
+ #else   // !MONGO_HAS_SIGALTSTACK
+     auto makeInstallGuard() const {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
