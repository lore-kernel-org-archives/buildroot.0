Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B304C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 07:59:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF2C66112E
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 07:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF2C66112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F71740201;
	Sat, 18 Sep 2021 07:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SX5h9FVLmLrq; Sat, 18 Sep 2021 07:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 724A3401BC;
	Sat, 18 Sep 2021 07:59:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48E161BF23F
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 07:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B00483AEF
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 07:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JK80d81shPFM for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 07:59:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B43282861
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 07:59:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id ABC0A88023; Sat, 18 Sep 2021 07:57:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 09:58:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8591dd3e15e4c55ab189cbc1e968a76c4a52424
X-Git-Newrev: 4c8ec585045365ed6be57e1f7114ef36fa607baa
X-Patchwork-Hint: ignore
Message-Id: <20210918075733.ABC0A88023@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5location: fix musl compile
 (pthread_getname_np)
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
Content-Type: multipart/mixed; boundary="===============6774691826295289983=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============6774691826295289983==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4c8ec585045365ed6be57e1f7114ef36fa607baa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============6774691826295289983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6774691826295289983==--
