Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BFCC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:17:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 111F660184
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 111F660184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C77C54037A;
	Thu, 26 Aug 2021 22:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23qeSbgCsMJU; Thu, 26 Aug 2021 22:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C28426F8;
	Thu, 26 Aug 2021 22:17:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FE111C1135
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41E0D40787
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iMCbbe6cRLo for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D49040789
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9F9EA8DC50; Thu, 26 Aug 2021 22:01:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:54:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5f432df7e2d26d6d57d750cbee1a573c1f886e26
X-Git-Newrev: c90de229584c294d9a40d95acc9ce8905231fcd4
X-Patchwork-Hint: ignore
Message-Id: <20210826220127.9F9EA8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pulseview: fix build
 with libglib >= 2.68
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

commit: https://git.buildroot.net/buildroot/commit/?id=c90de229584c294d9a40d95acc9ce8905231fcd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with libglib >= 2.68 raised since commit
c72524fb1b1c6b7dd1b1f511eea0fdf5a39dd3a0:

In file included from /tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib/gatomic.h:31,
                 from /tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib/gthread.h:32,
                 from /tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib/gasyncqueue.h:32,
                 from /tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:32,
                 from /tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/libsigrokdecode/libsigrokdecode.h:25,
                 from /tmp/instance-0/output-1/build/pulseview-0.4.2/pv/data/decode/annotation.cpp:21:
/tmp/instance-0/output-1/host/opt/ext-toolchain/mips64el-buildroot-linux-uclibc/include/c++/8.4.0/type_traits:56:3: error: template with C linkage
   template<typename _Tp, _Tp __v>
   ^~~~~~~~
/tmp/instance-0/output-1/build/pulseview-0.4.2/pv/data/decode/annotation.cpp:20:1: note: 'extern "C"' linkage started here
 extern "C" {
 ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/33cbaaeefd8637bac4ad0fbbfae7c369de4875d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-build-due-to-C-template-behind-C-linkage.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch b/package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch
new file mode 100644
index 0000000000..16d4cfdb00
--- /dev/null
+++ b/package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch
@@ -0,0 +1,58 @@
+From ed643f0b4ac587204a5243451cda181ee1405d62 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
+Date: Wed, 28 Apr 2021 02:14:47 +0200
+Subject: [PATCH] Fix broken build due to C++ template behind C linkage
+
+glib/gatomic.h since 2.68 includes type_traits, which causes a compilation
+error:
+In file included from /usr/include/glib-2.0/glib/gatomic.h:31,
+                 from /usr/include/glib-2.0/glib/gthread.h:32,
+                 from /usr/include/glib-2.0/glib/gasyncqueue.h:32,
+                 from /usr/include/glib-2.0/glib.h:32,
+                 from /usr/include/libsigrokdecode/libsigrokdecode.h:25,
+                 from /home/abuild/rpmbuild/BUILD/pulseview-0.4.2/pv/data/decode/annotation.cpp:21:
+/usr/include/c++/10/type_traits:2308:3: error: template with C linkage
+2308 |   template<typename _CTp, typename _Rp>
+
+As libsigrokdecode.h declares extern C linkage itself where necessary,
+remove it from pulseviews include statements from the last two occasions.
+
+[Retrieved from:
+https://sigrok.org/gitweb/?p=pulseview.git;a=commit;h=ed643f0b4ac587204a5243451cda181ee1405d62]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ pv/data/decode/annotation.cpp  | 2 --
+ pv/views/trace/decodetrace.cpp | 2 --
+ 2 files changed, 4 deletions(-)
+
+diff --git a/pv/data/decode/annotation.cpp b/pv/data/decode/annotation.cpp
+index 7f233478..f8a5c47b 100644
+--- a/pv/data/decode/annotation.cpp
++++ b/pv/data/decode/annotation.cpp
+@@ -17,9 +17,7 @@
+  * along with this program; if not, see <http://www.gnu.org/licenses/>.
+  */
+ 
+-extern "C" {
+ #include <libsigrokdecode/libsigrokdecode.h>
+-}
+ 
+ #include <cassert>
+ #include <vector>
+diff --git a/pv/views/trace/decodetrace.cpp b/pv/views/trace/decodetrace.cpp
+index 409f1d28..888064d0 100644
+--- a/pv/views/trace/decodetrace.cpp
++++ b/pv/views/trace/decodetrace.cpp
+@@ -17,9 +17,7 @@
+  * along with this program; if not, see <http://www.gnu.org/licenses/>.
+  */
+ 
+-extern "C" {
+ #include <libsigrokdecode/libsigrokdecode.h>
+-}
+ 
+ #include <limits>
+ #include <mutex>
+-- 
+2.24.0.rc2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
