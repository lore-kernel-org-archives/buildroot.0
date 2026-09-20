Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2090C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB1F640560;
	Sun, 20 Sep 2026 13:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlcUlHuZIu9W; Sun, 20 Sep 2026 13:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B37054080A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789910328;
	b=CgXkeESzvTqmb9iQTwZ1a0GJFgzd8DC1CCt98zTLrA4UuiEsgCHZZaqTlFihDJsvwKVc
	 bVL5Ec202zFTqYPNn+PaflLMrKegd1lTVAsLA+tBdwxLjtEcPr6HirAfmnCvojueyUBFn
	 5Jh1B9o9v4BxkiHQAYou/Rm+++1sMNYsm/KUq7yKi4TZ7cXpTFFfE7m7cDa3XDkb3j8ei
	 ttu02F1s3iYPGbTqamokdLR0dZENtM6cDAllOEK9qf/R8vnxXITGvkHt/Wv2eXGftb0XU
	 KirfSvnVTezQv8M3GEwYj5Glqxvvy2jLouM3nTGwKHXYQQfpTQKLPyITyh4n0rASW5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789910328;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VWuMj7c5X8JgCIkf3UzUqbX9oDel939vEPTgJLMH4NA=;
	b=F6nckMf6Rg3nIbibHMEEkyRYJOpQbUUnvjVrz0oDAnUBN6qnLRLf7v3baj5qu5UKcpkv
	 IxDdZAPn8m+hvIbH2Url/awYfn+VIXNAlAPNDrKBqjMGTR58P69SGIquOHGEQWHPN3fC4
	 gSQu4+1mvm478rnJdB/anZH3pRoBa3oMVHwZlbJoyitrE57EUhxEdg4SR+6PU9BobZUxi
	 eW1oxhUwWBfIC8Sj68s4cxX+rY+sJ0TLR9yc2lTndc/w0dloUSmhqctlHY2T0LDoOxwX9
	 hofKibbMycE/FXpz5F/qObkNvdKLLpG69EvwrkQcFyi/dsXqAbaXyf8WULiCCaoQFpQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789910328;
	bh=VWuMj7c5X8JgCIkf3UzUqbX9oDel939vEPTgJLMH4NA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jc107YofB/FtAV42i1Pk9JCjq11ipW2zgDxZgLtMZMkJAzsdegtGJNF3G63J59e4S
	 zX+SKcyCMsJxuts26Y03F10FMl1Z2latLnDetfgMa+Wc/hkPvH01gsmqkrIvZ4stKk
	 L8HFQb84XcWe7POXoawOyqLqLZYqh6RP7mTU6BiIV55Zlu2l92xRE/i5uCQy+RTZ21
	 OQZZE7MmWDgbJAwU1D7QAtWAm6KLxXkgznCXuaPmAr4ZWaPOasT65JxT5Yw1npP5Xt
	 thFFxDpifRi5LhWvi4eMjFgjnonfE14NwkRLXItrgVSSloCpvJQo+oZZUyw1MFiCHf
	 Be0mUCtc9pXpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B37054080A;
	Sun, 20 Sep 2026 13:18:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F0C0371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60E504080A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MMOMiRYY5_p for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8F37040560
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789910326;
 b=ZqMG+SKC0m7/RxF/3dBBDGNUEbFDOl5qXg+dtbWJFvj76m8HbJbkM7h9o5NFlTLM6R09
 T7w7NJOIed6Zb3md0nHyk095Fod6m9CFJxEGTK7x0FlRs5zF/BUGD/Xkmi/pfTq+XGLmQ
 FTJ+JFbud6kxseGwVzu9NhP3kj40Ov4329gcbTvxm+msyqBAPIxP4jFvsKQ1RU966XVrP
 MBgrJsSSJUCl4H3/V9FHx2K6479FSAdv5ahQX+fepK4VRhITEvcoefnqIPvz0f7NRfxr1
 B0x7GU32O/Amx48VvuL7Q2z/wkixLJT+3tWVgkKo0rtx2FHiNNUv68P6nXybfNmLEFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789910326;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=N+lXXerZKtAYQgK+tEHOoxlh+NS9poHO0UD7hAcb4XQ=;
 b=VzxcYhcnWLhDZ12i3BlRs2WagRwR60oog41H2wrE3ugJayVovAYul3MNCkSESk0I3gi3
 nDsdgF9nB1Uko+opA1wPDjYh5y0waHdcHp2rVGyVVQe1jlti3iMNBy1zo8FaFJ2v+Q2q/
 yHwT/VbdD10ALMFDXL5f+T+qpPCvVxTt6rOod3LRDtt4rXvtN3XcZyx2CtVI3FbDAvpLF
 P6O2Tt/dK/PATM6ujPrQOwkRgSeRLyfalxEPGD0kVIyMKEiJrku8q/KgYN/6Nu7/fWyR0
 /mJiVCaGnq3KMMXGZu9PrAohG8xuXyaPBMhAn9nYaXY9Qk7+10BB4Dr0s/jrwl49TvQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F37040560
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:18:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36BEC8CA36; Sun, 20 Sep 2026 13:17:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 15:17:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03776c154e63864b6617688d668a7bdd31215f8c
X-Git-Newrev: e4d9ab154ed28ff9748d0005fc664d10fc5202d4
X-Patchwork-Hint: ignore
Message-Id: <20260920131738.36BEC8CA36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ibrcommon: update patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4d9ab154ed28ff9748d0005fc664d10fc5202d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Replaced patch 0001 with an upstream commit.

Added Upstream: tags to patches 0002 & 0003.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  3 --
 ...se-simplyfied-POSIX-method-to-get-the-bas.patch | 46 ++++++++++++++++++
 ...data-File.cpp-support-POSIX-basename-call.patch | 55 ----------------------
 ...ommon-added-openssl-1.1-compatibility-264.patch |  3 +-
 ...mon-ssl-gcm-fix-static-build-with-openssl.patch |  3 +-
 5 files changed, 49 insertions(+), 61 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4868126fc7..47e8dedb72 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -402,9 +402,6 @@ package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch lib_patch.Upstr
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch lib_patch.Upstream
 package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch lib_patch.Upstream
-package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch lib_patch.Upstream
-package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch lib_patch.Upstream
 package/icu/0001-dont-build-static-dynamic-twice.patch lib_patch.Upstream
 package/icu/0002-link-icudata-as-data-only.patch lib_patch.Upstream
 package/icu/0003-fix-static-linking-with-icu-uc.patch lib_patch.Upstream
diff --git a/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch b/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
new file mode 100644
index 0000000000..e52981b38b
--- /dev/null
+++ b/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
@@ -0,0 +1,46 @@
+From fcea9d27f5153c8da77ebab956f75eaa1fd48836 Mon Sep 17 00:00:00 2001
+From: Johannes Morgenroth <jm@m-network.de>
+Date: Sun, 20 Dec 2015 12:51:53 +0100
+Subject: [PATCH] ibrcommon: Use simplyfied POSIX method to get the basename
+
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/fcea9d27f5153c8da77ebab956f75eaa1fd48836
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ibrcommon/data/File.cpp | 12 +-----------
+ 1 file changed, 1 insertion(+), 11 deletions(-)
+
+diff --git a/ibrcommon/data/File.cpp b/ibrcommon/data/File.cpp
+index 31af4ae7..5f8e24e3 100644
+--- a/ibrcommon/data/File.cpp
++++ b/ibrcommon/data/File.cpp
+@@ -34,10 +34,7 @@
+ #include <cstring>
+ #include <cerrno>
+ #include <fstream>
+-
+-#if !defined(HAVE_FEATURES_H) || defined(ANDROID)
+ #include <libgen.h>
+-#endif
+ 
+ #ifdef __WIN32__
+ #include <io.h>
+@@ -225,14 +222,7 @@ namespace ibrcommon
+ 
+ 	std::string File::getBasename() const
+ 	{
+-#if !defined(ANDROID) && defined(HAVE_FEATURES_H)
+-		return std::string(basename(_path.c_str()));
+-#else
+-		char path[_path.length()+1];
+-		::memcpy(&path, _path.c_str(), _path.length()+1);
+-
+-		return std::string(basename(path));
+-#endif
++		return std::string(basename((char*)_path.c_str()));
+ 	}
+ 
+ 	File File::get(const std::string &filename) const
+-- 
+2.47.3
+
diff --git a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch b/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
deleted file mode 100644
index 5cd302c979..0000000000
--- a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From d667b13a87cf3207599a19eb981a893a1d7a67ee Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Mon, 14 Sep 2015 23:25:52 +0100
-Subject: [PATCH] ibrcommon/data/File.cpp: support POSIX basename call
-
-Firstly, and somewhat strangely, musl chooses not to provide a basename(3)
-prototype within <string.h> whenever __cplusplus is defined. This can be
-solved by including the <libgen.h> header defined by POSIX 1003.1 whenever
-__GLIBC__ is not defined.
-
-However, this leads to a second problem. POSIX defines the function as
-char* basename(char*) and this is the only version supported by musl.
-However, the std::string.cstr() method returns a const char*.
-
-POSIX says that the string parameter can be modified. However the GNU
-implementation never modifies it. glibc therefore supports an extension
-when compiling under C++ by also supplying
-const char* basename(const char*). This extension is not present on musl
-which is the cause of the failure.
-
-The solution is reasonably straightforward; test if __GLIBC__ is defined
-before calling basename. If not, use the fallback already provided for
-other platforms whereby basename() is called on a temporary copy.
-
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-Upstream-status: pending
----
- ibrcommon/data/File.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ibrcommon/data/File.cpp b/ibrcommon/data/File.cpp
-index 31af4ae..68e9b4f 100644
---- a/ibrcommon/data/File.cpp
-+++ b/ibrcommon/data/File.cpp
-@@ -35,7 +35,7 @@
- #include <cerrno>
- #include <fstream>
- 
--#if !defined(HAVE_FEATURES_H) || defined(ANDROID)
-+#if !defined(HAVE_FEATURES_H) || !defined(__GLIBC__) || defined(ANDROID)
- #include <libgen.h>
- #endif
- 
-@@ -225,7 +225,7 @@ namespace ibrcommon
- 
- 	std::string File::getBasename() const
- 	{
--#if !defined(ANDROID) && defined(HAVE_FEATURES_H)
-+#if !defined(ANDROID) && defined(HAVE_FEATURES_H) && defined(__GLIBC__)
- 		return std::string(basename(_path.c_str()));
- #else
- 		char path[_path.length()+1];
--- 
-2.4.3
-
diff --git a/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch b/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
index 90e5147f54..8e890de965 100644
--- a/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
+++ b/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
@@ -5,8 +5,7 @@ Subject: [PATCH] ibrcommon: added openssl 1.1 compatibility (#264)
 
 This patch adds compatibility to openssl 1.1.0.
 
-Backported from master branch:
-https://github.com/ibrdtn/ibrdtn/commit/a801d10a081e3130e24042256a43190c9eb6c112
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/a801d10a081e3130e24042256a43190c9eb6c112
 
 Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
diff --git a/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch b/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
index c55b227c0c..2045b8cbab 100644
--- a/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
+++ b/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
@@ -15,8 +15,9 @@ Makefile:560: recipe for target 'dtnd' failed
 Fixes:
  - http://autobuild.buildroot.org/results/1d3b4b6cf043a3e185ce758b617a0a18c3d36cdb
 
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/103bab3d4759e56b7e46cb9848e64037cd666911
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ibrdtn/ibrdtn/pull/269]
 ---
  ibrcommon/ibrcommon/ssl/gcm/gcm.cpp      | 10 +++++-----
  ibrcommon/ibrcommon/ssl/gcm/gf128mul.cpp |  2 +-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
