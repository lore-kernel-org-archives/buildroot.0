Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4422DC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:23:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1B5860F4C
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1B5860F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB9E882F9E;
	Thu, 26 Aug 2021 22:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5dnllL2-39g; Thu, 26 Aug 2021 22:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9208282F87;
	Thu, 26 Aug 2021 22:23:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 075351BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89E8540767
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pxRoBruv6KKN for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2F174079E
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 13E4A8DC50; Thu, 26 Aug 2021 22:01:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:47:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ee2267745a3e6f9e100d919496446ae9466dd521
X-Git-Newrev: c786507f076fdebcf49d150ff72ed95102dc7497
X-Patchwork-Hint: ignore
Message-Id: <20210826220129.13E4A8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sconeserver: fix build
 with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=c786507f076fdebcf49d150ff72ed95102dc7497
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with gcc 11:

In file included from ../sconex/sconex.h:229,
                 from ../sconex/Descriptor.h:63,
                 from Descriptor.cpp:22:
Descriptor.cpp: In member function 'void scx::Descriptor::add_stream(scx::Stream*)':
Descriptor.cpp:150:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
  150 |   DEBUG_ASSERT(stream>=0,"add_stream() Invalid stream");
      |                ~~~~~~^~~
Descriptor.cpp: In member function 'bool scx::Descriptor::remove_stream(scx::Stream*)':
Descriptor.cpp:204:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
  204 |   DEBUG_ASSERT(stream>=0,"remove_stream() Invalid stream");
      |                ~~~~~~^~~

Fixes:
 - http://autobuild.buildroot.org/results/ccc9562e83fd2bd312d21b3124be42dfe4b7e850

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...onex-Descriptor.cpp-fix-build-with-gcc-11.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch b/package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch
new file mode 100644
index 0000000000..335be82f7d
--- /dev/null
+++ b/package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch
@@ -0,0 +1,54 @@
+From 5e4cb613d9bb287e9f54da86f99a51d0338b1faa Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Aug 2021 10:36:53 +0200
+Subject: [PATCH] sconex/Descriptor.cpp: fix build with gcc 11
+
+Fix the following build failure with gcc 11:
+
+In file included from ../sconex/sconex.h:229,
+                 from ../sconex/Descriptor.h:63,
+                 from Descriptor.cpp:22:
+Descriptor.cpp: In member function 'void scx::Descriptor::add_stream(scx::Stream*)':
+Descriptor.cpp:150:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
+  150 |   DEBUG_ASSERT(stream>=0,"add_stream() Invalid stream");
+      |                ~~~~~~^~~
+      |                                 ^~~~
+Descriptor.cpp: In member function 'bool scx::Descriptor::remove_stream(scx::Stream*)':
+Descriptor.cpp:204:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
+  204 |   DEBUG_ASSERT(stream>=0,"remove_stream() Invalid stream");
+      |                ~~~~~~^~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ccc9562e83fd2bd312d21b3124be42dfe4b7e850
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/sconemad/sconeserver/pull/4]
+---
+ sconex/Descriptor.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sconex/Descriptor.cpp b/sconex/Descriptor.cpp
+index 590adba..4adfd86 100644
+--- a/sconex/Descriptor.cpp
++++ b/sconex/Descriptor.cpp
+@@ -147,7 +147,7 @@ bool Descriptor::dup(int d)
+ //=============================================================================
+ void Descriptor::add_stream(Stream* stream)
+ {
+-  DEBUG_ASSERT(stream>=0,"add_stream() Invalid stream");
++  DEBUG_ASSERT(stream!=0,"add_stream() Invalid stream");
+ 
+   m_streams.push_back(stream);
+   stream->set_endpoint(this);
+@@ -201,7 +201,7 @@ void Descriptor::add_stream_after(Stream* stream,const Stream* after)
+ //=============================================================================
+ bool Descriptor::remove_stream(Stream* stream)
+ {
+-  DEBUG_ASSERT(stream>=0,"remove_stream() Invalid stream");
++  DEBUG_ASSERT(stream!=0,"remove_stream() Invalid stream");
+ 
+   std::list<Stream*>::iterator it = m_streams.begin();
+   while (it != m_streams.end()) {
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
