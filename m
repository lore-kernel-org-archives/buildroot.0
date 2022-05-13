Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D77DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6827415E5;
	Fri, 13 May 2022 22:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAvz0OC9tuwl; Fri, 13 May 2022 22:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 643AC410B4;
	Fri, 13 May 2022 22:17:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 244E31C1189
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E44C40930
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhlA2HGMxQmy for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5077240992
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 27C0B85E29; Fri, 13 May 2022 22:00:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd4b55dca0f9fe32e82c412ae6cb9976b864f3d0
X-Git-Newrev: 7fa88b8eb637f5ec4927ac1bd05309dea7d60bc9
X-Patchwork-Hint: ignore
Message-Id: <20220513220046.27C0B85E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: bump version to 1.79.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fa88b8eb637f5ec4927ac1bd05309dea7d60bc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove upstreamed patch
- add patch for boost::json bug in known issues on the boost release page [0]

[0] https://www.boost.org/users/history/version_1_79_0.html

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-sys-stat-h-include-on-musl-based-systems.patch | 31 -----------
 package/boost/0001-json-array-erase-relocate.patch | 65 ++++++++++++++++++++++
 package/boost/boost.hash                           |  4 +-
 package/boost/boost.mk                             |  2 +-
 4 files changed, 68 insertions(+), 34 deletions(-)

diff --git a/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch b/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch
deleted file mode 100644
index 9b86b816bf..0000000000
--- a/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 2001
-From: Leonardo Neumann <leonardo@neumann.dev.br>
-Date: Mon, 13 Dec 2021 01:07:20 -0300
-Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems
-
-Boost 1.78.0 fails to build on musl-based systems because musl does
-not include sys/stat.h by default.
-
-Fixes #161 ("Boost compiler error")
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/boostorg/interprocess/pull/162]
----
- include/boost/interprocess/permissions.hpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/boost/interprocess/permissions.hpp b/boost/interprocess/permissions.hpp
-index ab55411e..0b21a685 100644
---- a/boost/interprocess/permissions.hpp
-+++ b/boost/interprocess/permissions.hpp
-@@ -29,6 +29,10 @@
- 
- #include <boost/interprocess/detail/win32_api.hpp>
- 
-+#else
-+
-+#include <sys/stat.h>
-+
- #endif
- 
- #endif   //#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED
diff --git a/package/boost/0001-json-array-erase-relocate.patch b/package/boost/0001-json-array-erase-relocate.patch
new file mode 100644
index 0000000000..899b202279
--- /dev/null
+++ b/package/boost/0001-json-array-erase-relocate.patch
@@ -0,0 +1,65 @@
+From 07d7c3b2e0f8c6b269ba167117cd3e549df2f342 Mon Sep 17 00:00:00 2001
+From: Vinnie Falco <vinnie.falco@gmail.com>
+Date: Wed, 13 Apr 2022 05:49:05 -0700
+Subject: [PATCH] array::erase relocates correctly
+
+fix #692
+
+Signed-off-by: Michael Nosthoff<buildroot@heine.tech>
+[Upstream status: https://github.com/boostorg/json/issues/692]
+---
+ boost/json/impl/array.ipp |  5 ++++-
+ test/array.cpp                    | 16 ++++++++++++++++
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/boost/json/impl/array.ipp b/boost/json/impl/array.ipp
+index 4d067fb5..a2c7fd6d 100644
+--- a/boost/json/impl/array.ipp
++++ b/boost/json/impl/array.ipp
+@@ -491,8 +491,11 @@ erase(
+     auto const p = &(*t_)[0] +
+         (pos - &(*t_)[0]);
+     destroy(p, p + 1);
+-    relocate(p, p + 1, 1);
+     --t_->size;
++    if(t_->size > 0)
++        relocate(p, p + 1,
++            t_->size - (p -
++                &(*t_)[0]));
+     return p;
+ }
+ 
+diff --git a/libs/json/test/array.cpp b/libs/json/test/array.cpp
+index 1cc87566..4516cc78 100644
+--- a/libs/json/test/array.cpp
++++ b/libs/json/test/array.cpp
+@@ -1269,6 +1269,21 @@ class array_test
+             array{nullptr, "a", "b"}));
+     }
+ 
++    void
++    testIssue692()
++    {
++	    array a;
++	    object obj;
++	    obj["test1"] = "hello";
++	    a.push_back(obj);
++	    a.push_back(obj);
++	    a.push_back(obj);
++	    a.push_back(obj);
++	    a.push_back(obj);
++	    while(a.size())
++		    a.erase(a.begin());
++    }
++
+     void
+     run()
+     {
+@@ -1283,6 +1298,7 @@ class array_test
+         testExceptions();
+         testEquality();
+         testHash();
++        testIssue692();
+     }
+ };
+ 
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index a174e414ee..0f46befc0c 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From https://www.boost.org/users/history/version_1_78_0.html
-sha256  8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc  boost_1_78_0.tar.bz2
+# From https://www.boost.org/users/history/version_1_79_0.html
+sha256  475d589d51a7f8b3ba2ba4eda022b170e562ca3b760ee922c146b6c65856ef39  boost_1_79_0.tar.bz2
 
 # Locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 346d309777..f6e9a03220 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.78.0
+BOOST_VERSION = 1.79.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
