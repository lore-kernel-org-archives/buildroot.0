Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBFEC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ACEF40ACD;
	Thu, 24 Sep 2026 18:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBqV3Bo-JS_5; Thu, 24 Sep 2026 18:58:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6E7F640CCA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276301;
	b=rX7bnA5U5nGS0v1+s6BDe0/7rBV1rSV05RlRKMCbxUyueLp8aU8E8zg966t0CABHe9V8
	 UwLdVpELusx6XN3+CdMk0ERDm9ST9ItLmq5U8AA++M2DUfStX6DkcLkcp2QCqAFF8SpZ/
	 cKoRzJmzGIq+OIgRcZKtgjq+xA68gLXbjV0gigJO0nQkyWVo8svKmQzTvL8F6scIu6oho
	 wIAOsAHupMlxR3f2b/uhhdvwqREv1ZcM7fh+clbKK/HpKxWPN7mGY4KzlHG/FGrfQYLVG
	 fxR01+MIBIKc8QyBjS4pEZRn0Ysz4UL8xFz1eHy/i1MegEZ/YZRsMKuELDuxm7Bfvjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276301;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5sITE7sZbuAt/lfCd467rApRafwxXpXt4+xl5Iv+lrg=;
	b=CeH2jeNgO1kYfUlQmFeePw9wsfqAwF1yvqTecLYSio50k0L28/fun6OHoW/+1Z5mkKxY
	 HJ8wDoBcadqc0EyYYpFMGZTQbqG6Pdh00ooaXij3Y8eQhne5O820ut5UxXg5NiPRuV2UX
	 6Gwvry96Aa4aNt34RHBp91n96x13SDYhBW2nzApRwtSw1rv1SyNQWpQN27tQdAJpi7WtQ
	 Vkm7/uFxR1CxlBdNnhy0Y0sp1YmP7p+yPmMJq5AutQxn/q8RCNgmlyne+vXB/Dm3jgumb
	 6rdEPaTaKldeb2vq3OfE0Hdk7x7hu18902rFzYb0LpxPBEnoFixZnYkrLybnTplgoBg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276301;
	bh=5sITE7sZbuAt/lfCd467rApRafwxXpXt4+xl5Iv+lrg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XZrpou1V4M1mH3hX1swQnbdz8ShB+KZls82GdoomvI3GWIxPm+Vczz4C52H4MXP7P
	 LN4TpR8MO3Q6Um1NXutQ32ivZEz95XvLnxpzgN3QrU5fHVSYZNbTci+v3ZPl5bd/Wk
	 pcIdu14tswJATfsSBIlv0jZPa7lQW5lPP3n32ns3lVCOV+tFoX6gQmCCOTkSvzrHLM
	 OL/uxW/zfY/zkVpB7SVQFMzLSgh+mkYnjMfrDymynpH1aO5Z28ko2IiC6CBMOfJRS+
	 Vnb/oZaNjzvfJuFAz2oU6A5KtB2zyNCWDI3sc0lkqYTQ77znFZHhINOcrjaeDMOgB9
	 92rtt3UhDqupA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E7F640CCA;
	Thu, 24 Sep 2026 18:58:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7918E328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A07F40AA7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Er7IqROTOCbN for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8FB5940AB3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=kIueNRwT4RxjHgrEx1WMjzKAbIAmhgaVatKVpNBWQXF7GtUTJ3Z/5ipDV4wMUVcNbTt9
 clTMhEygQhggmfkpL/I4idCKSwJwE7v2LQbiAV2mX7BNz4pqgzve8UWCIFTlpff93LgJ2
 hhguh9l5M1L4n0xVQ6OsZKuE/WcbA/iuNdr8NIrH0AcW/jy42/VYn2LZSGk4fU2ouB6uy
 iDQrrPpcGgBAmWAiFHm0hSulorKBgcuqOdShc3GhqbKfrnUthViJQyKOI3bCKNtGIdQop
 j9fpDJU3oVQjW98sSAv+SFPiy4g8qa6iu2Drh/x5+dNRyMpUhcw837LYda333jVFONQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iFR9VnN+yIrMYlVH3Txxjsd2kqYx1dX1uggYVne565I=;
 b=cAtVcyBZBBHmEBMziBzxXkY52kRDQHJXup+1DSju1xIrndk2L+i+5iS6Tl8mrSRB0PNz
 O5VmO2OBqVcZqohDBkAK75R5gIJLyT29I2t4RBIyxvSAd0N9nmwWNBpGadF7enNU3l0od
 7zSz5ktAWy4Z2XoPoB+fipL8H1zreM1mcsWjEJFUw1dIA5+Ga5puG5vhyNqXMjUD6ZjjS
 Bn4goZA2tfuv8wPrP7p6FNU2uSs2xi9W126Z2Q6EcPqf1s3A42uDfWzcaRihOGT/DMVJ+
 I4npguUdvSdxVuWjfWJ9Jhl8vX6QqfIDbHQ36Y+N0Wtfch03lwtksj5vKk6FFUTGEdw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FB5940AB3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FEEE982D9; Thu, 24 Sep 2026 18:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:37:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e1435d6b632b600d297773e5aabcc2ccd40ce902
X-Git-Newrev: c11eafa2564731a3f2c1ce7f977a72dfc284bde4
X-Patchwork-Hint: ignore
Message-Id: <20260924185535.2FEEE982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ibrcommon: update
 patches
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5837458519592178256=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5837458519592178256==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c11eafa2564731a3f2c1ce7f977a72dfc284bde4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Replaced patch 0001 with an upstream commit.

Added Upstream: tags to patches 0002 & 0003.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e4d9ab154ed28ff9748d0005fc664d10fc5202d4)
[raphael: resolve conflicts in .checkpackageignore]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore                                |  3 --
 ...se-simplyfied-POSIX-method-to-get-the-bas.patch | 46 ++++++++++++++++++
 ...data-File.cpp-support-POSIX-basename-call.patch | 55 ----------------------
 ...ommon-added-openssl-1.1-compatibility-264.patch |  3 +-
 ...mon-ssl-gcm-fix-static-build-with-openssl.patch |  3 +-
 5 files changed, 49 insertions(+), 61 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5bc397bcf1..4632d9e8e6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -480,9 +480,6 @@ package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch lib_patch.Upstre
 package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch lib_patch.Upstream
-package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch lib_patch.Upstream
-package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch lib_patch.Upstream
-package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch lib_patch.Upstream
 package/icu/0001-dont-build-static-dynamic-twice.patch lib_patch.Upstream
 package/icu/0002-workaround-toolchain-bugs.patch lib_patch.Upstream
 package/icu/0003-link-icudata-as-data-only.patch lib_patch.Upstream
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

--===============5837458519592178256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5837458519592178256==--
