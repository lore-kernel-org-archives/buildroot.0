Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6A5C4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:42:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73CCF60EE2
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73CCF60EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4221F80E03;
	Thu, 12 Aug 2021 21:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yVANzzjPbq72; Thu, 12 Aug 2021 21:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA15680E58;
	Thu, 12 Aug 2021 21:42:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12E4E1BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01807401DA
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dMt-YzJPw82K for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:41:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFE5F401D3
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:41:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C306E8D464; Thu, 12 Aug 2021 21:41:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:41:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c4aee714f5bf5d40365d2677b5a9cd35b66b849
X-Git-Newrev: 5ec34a1a0595dd676e2da3e85bfcb2a921388fec
X-Patchwork-Hint: ignore
Message-Id: <20210812214126.C306E8D464@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flatbuffers: fix locale
 independent on musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ec34a1a0595dd676e2da3e85bfcb2a921388fec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix locale indepdendent which is enabled on musl since version 1.11.0
and
https://github.com/google/flatbuffers/commit/5f32f948102e65eaeea461b44f3b43f96c7a7a5a
resulting in the following build failure on snort3 since bump to version
3.1.6 in commit	e66f2fd310374779d415fa683813cc5f5ccf6be9:

In file included from /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/flexbuffers.h:24,
                 from /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/idl.h:26,
                 from /tmp/instance-0/output-1/build/snort3-3.1.6.0/src/network_inspectors/perf_monitor/fbs_formatter.cc:29:
/tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/util.h: In function 'void flatbuffers::strtoval_impl(int64_t*, const char*, char**, int)':
/tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/util.h:258:12: error: 'strtoll_l' was not declared in this scope; did you mean 'strcoll_l'?
  258 |     *val = __strtoll_impl(str, endptr, base);
      |            ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/68045b83e94f8caa337b1af7ed5f493ac1a55c47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...lude-flatbuffers-base.h-fix-build-on-musl.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
new file mode 100644
index 0000000000..b4bc0e12de
--- /dev/null
+++ b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
@@ -0,0 +1,51 @@
+From 0315cef04a5a8a953072691faa48af9acb6009bd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Aug 2021 13:39:58 +0200
+Subject: [PATCH] include/flatbuffers/base.h: fix build on musl
+
+Build of applications using flatbuffers such as snort3 are broken on
+musl since version 1.11.0 and
+https://github.com/google/flatbuffers/commit/5f32f948102e65eaeea461b44f3b43f96c7a7a5a
+because strtoll_l (and strtoull_l) are not available on musl.
+flatbuffers checks for the availability of strtoull_l in CMakeLists.txt
+so flatbuffers builds successfully but for applications using
+flatbuffers, the result of this check is not available and
+FLATBUFFERS_LOCALE_INDEPENDENT is set to 1 resulting in the following
+build failure:
+
+In file included from /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/flexbuffers.h:24,
+                 from /tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/idl.h:26,
+                 from /tmp/instance-0/output-1/build/snort3-3.1.6.0/src/network_inspectors/perf_monitor/fbs_formatter.cc:29:
+/tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/util.h: In function 'void flatbuffers::strtoval_impl(int64_t*, const char*, char**, int)':
+/tmp/instance-0/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/flatbuffers/util.h:258:12: error: 'strtoll_l' was not declared in this scope; did you mean 'strcoll_l'?
+  258 |     *val = __strtoll_impl(str, endptr, base);
+      |            ^~~~~~~~~~~~~~
+
+Fix this failure by checking if __GNUC__ is defined before setting
+FLATBUFFERS_LOCALE_INDEPENDENT to 1.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/68045b83e94f8caa337b1af7ed5f493ac1a55c47
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/google/flatbuffers/pull/6773]
+---
+ include/flatbuffers/base.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/flatbuffers/base.h b/include/flatbuffers/base.h
+index de7898dc..101c7598 100644
+--- a/include/flatbuffers/base.h
++++ b/include/flatbuffers/base.h
+@@ -266,7 +266,7 @@ namespace flatbuffers {
+ #ifndef FLATBUFFERS_LOCALE_INDEPENDENT
+   // Enable locale independent functions {strtof_l, strtod_l,strtoll_l, strtoull_l}.
+   #if ((defined(_MSC_VER) && _MSC_VER >= 1800)            || \
+-       (defined(_XOPEN_VERSION) && (_XOPEN_VERSION>=700)) && (!defined(__ANDROID_API__) || (defined(__ANDROID_API__) && (__ANDROID_API__>=21))))
++       (defined(__GLIBC__) && defined(_XOPEN_VERSION) && (_XOPEN_VERSION>=700)) && (!defined(__ANDROID_API__) || (defined(__ANDROID_API__) && (__ANDROID_API__>=21))))
+     #define FLATBUFFERS_LOCALE_INDEPENDENT 1
+   #else
+     #define FLATBUFFERS_LOCALE_INDEPENDENT 0
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
