Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C87BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 16:46:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F49161262
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 16:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F49161262
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44EBF4079B;
	Tue, 28 Sep 2021 16:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3kTUmq9M66H; Tue, 28 Sep 2021 16:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9347D4073E;
	Tue, 28 Sep 2021 16:46:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11D821BF386
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 16:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3A8160A58
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 16:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DkzNXd7YJUvl for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 16:46:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 334DF6078D
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 16:46:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 61D7C8D449; Tue, 28 Sep 2021 16:43:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 17:21:41 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: b1c3ba5d8bf3e4e552af041d3f7a48fbb3c71fd7
X-Git-Newrev: 725eefe47c2bba5b0c435c7bb10be6f7f6bdcc6d
X-Patchwork-Hint: ignore
Message-Id: <20210928164354.61D7C8D449@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/qt5location: fix
 musl compile (pthread_getname_np)
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
Content-Type: multipart/mixed; boundary="===============6018527054208961664=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6018527054208961664==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=725eefe47c2bba5b0c435c7bb10be6f7f6bdcc6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- pthread_getname_np not available with musl libc, add patch to disable
  usage for musl (patch inspired/ported from [1])

Fixes:

  - http://autobuild.buildroot.net/results/ed372a4a8e50d9e20be589eeda40c92888d709bc

  platform/default/thread.cpp: In function ‘std::string mbgl::platform::getCurrentThreadName()’:
  platform/default/thread.cpp:14:5: error: ‘pthread_getname_np’ was not declared in this scope; did you mean ‘pthread_setname_np’?
     14 |     pthread_getname_np(pthread_self(), name, sizeof(name));
        |     ^~~~~~~~~~~~~~~~~~
        |     pthread_setname_np

    [1] https://github.com/void-linux/void-packages/blob/e64dd67f43c409d2b2db08214084e842d92ad620/srcpkgs/qt5/patches/0014-musl-set_thread_name_np.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: add uClibc]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4c8ec585045365ed6be57e1f7114ef36fa607baa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pbox-gl-native-fix-musl-compile-pthread_g.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/qt5/qt5location/0001-3rdparty-mapbox-gl-native-fix-musl-compile-pthread_g.patch b/package/qt5/qt5location/0001-3rdparty-mapbox-gl-native-fix-musl-compile-pthread_g.patch
new file mode 100644
index 0000000000..0894af9ce5
--- /dev/null
+++ b/package/qt5/qt5location/0001-3rdparty-mapbox-gl-native-fix-musl-compile-pthread_g.patch
@@ -0,0 +1,47 @@
+From acf752757ee4bf2913289ee1142f4968fdb22a4a Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 15 Sep 2021 23:05:52 +0200
+Subject: [PATCH] 3rdparty: mapbox-gl-native: fix musl compile
+ (pthread_getname_np)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- pthread_getname_np not available with musl libc (patch inspired/ported
+  from [1])
+
+Fixes:
+
+  platform/default/thread.cpp: In function ‘std::string mbgl::platform::getCurrentThreadName()’:
+  platform/default/thread.cpp:14:5: error: ‘pthread_getname_np’ was not declared in this scope; did you mean ‘pthread_setname_np’?
+     14 |     pthread_getname_np(pthread_self(), name, sizeof(name));
+        |     ^~~~~~~~~~~~~~~~~~
+        |     pthread_setname_np
+
+[1] https://github.com/void-linux/void-packages/blob/e64dd67f43c409d2b2db08214084e842d92ad620/srcpkgs/qt5/patches/0014-musl-set_thread_name_np.patch
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[yann.morin.1998@free.fr: add uClibc]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ src/3rdparty/mapbox-gl-native/platform/default/thread.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/mapbox-gl-native/platform/default/thread.cpp b/src/3rdparty/mapbox-gl-native/platform/default/thread.cpp
+index c7c79b4..3f135eb 100644
+--- a/src/3rdparty/mapbox-gl-native/platform/default/thread.cpp
++++ b/src/3rdparty/mapbox-gl-native/platform/default/thread.cpp
+@@ -11,8 +11,9 @@ namespace platform {
+ 
+ std::string getCurrentThreadName() {
+     char name[32] = "unknown";
++#if defined(__GLIBC__) || defined(__UCLIBC__)
+     pthread_getname_np(pthread_self(), name, sizeof(name));
+-
++#endif
+     return name;
+ }
+ 
+-- 
+2.33.0
+

--===============6018527054208961664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6018527054208961664==--
