Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E72C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 12:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A5B260F89;
	Tue, 10 May 2022 12:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wE2m3b1RnlTf; Tue, 10 May 2022 12:09:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13B3E60F84;
	Tue, 10 May 2022 12:09:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7430E1BF255
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 12:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7153260F84
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 12:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ic9q76sILFl7 for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 12:09:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA88460F80
 for <buildroot@buildroot.org>; Tue, 10 May 2022 12:09:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1D1C1815F4; Tue, 10 May 2022 14:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1652184585; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=kQn2DrlK5oJH+jXxpfAshBWdiXrtzI5nxFYzhBjMIjA=;
 b=iv+lFNBPnZDko7QmVAn1ptQM/RPEucss/O/qFrCEvoi7SJLqbtsWoqjAlMGTZ2t9jFL0Us
 KR7Dob+Ds9wT8F0P/HUv8WHL2kqFL42bGHscMeAWKIyjWs1tFdewDFUg3xuF7mTbin5I2A
 CQ4bfHtTtM1naN9FBeH+MbguA/y16kM=
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 14:08:51 +0200
Message-Id: <20220510120858.3350640-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/boost: bump version to 1.79.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- remove upstreamed patch
- add patch for boost::json bug in known issues on the boost release page [0]

[0] https://www.boost.org/users/history/version_1_79_0.html

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...stat-h-include-on-musl-based-systems.patch | 31 ---------
 .../0001-json-array-erase-relocate.patch      | 65 +++++++++++++++++++
 package/boost/boost.hash                      |  4 +-
 package/boost/boost.mk                        |  2 +-
 4 files changed, 68 insertions(+), 34 deletions(-)
 delete mode 100644 package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch
 create mode 100644 package/boost/0001-json-array-erase-relocate.patch

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
index 032ba5c820..fe86344f6a 100644
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
