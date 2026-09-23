Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18EBC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 859FA8164A;
	Thu, 24 Sep 2026 19:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BR9u532OzOud; Thu, 24 Sep 2026 19:00:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6EFD68164B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276414;
	b=eJX586YBMMyI8+glLDDa7s2szj6q0qH2bzmBq3g2Agszw20C2m7cKdDalXvx7QICIBsA
	 5pl3w71+04hiPiTNkTsn44gmlv476A1t2HzGifiWqh/YfnbhPTL85GYNQywfu2rDfAWI0
	 2O/q96kisGpc+Oengbw8w+/uuyRk1KY2RiaPz5ar34HciBcIvNslm47lU0xU3Jx9rvRnv
	 FUJWeX7vfHRhDP2ahF90nmM39XWXfiv+cPANH0+M+295mB+QHot9p01KXMu0fZxkKdfGv
	 C8z+DCH2Od41VDNS+JJG53rYUrlG3ypDpsOA2RazYq4f+pnyGWdF4yRmgaHYbwR5JSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276414;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=JaclRKKt5rFsE0+1W5bZIunSPkME8L5Dj6cgJnznwMw=;
	b=V4Xz2t1agP66j8wpQ0CvEAIRN9sXPKWwmUetf9tsroshckJwuXKqE9QsbVmNvTvyl3bn
	 LgsmKKZjKAZiwsNHr+s1MCDOZHexwABAoAZc6ng9J336+hozP5VfoAnNLdBtLwyJXMWXd
	 WD31s+bY3Kqxhz34aWpF3EvdvfnXtjL4zWU79ILFLuQdxUtgJRAJTU2+ax8XSFXaxAFJM
	 Bz4KmbquVb5znugFlPhnYvhEBf7Vl63jFHn3i3CK250K8OeASAW1ruLqRt1FnMtJFCgFo
	 2ccdfwP/dJIqGN4x8HsKXh2DraaxOYRftairmAQWyICp1qmyDr0/7M8+sClmHjTKQBg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276414;
	bh=JaclRKKt5rFsE0+1W5bZIunSPkME8L5Dj6cgJnznwMw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aexlxGImnaJfVu1OlW0eQxt+Cgu3vF2OY7MLsTMYyWXhBCZYVZXdSJ5lH/pauPABl
	 YgsbxmOHDRy3cBWZCk84kN5V5Fvt3mxqY8Rkr2ZSHg2EBsBCLvUDpjRi2H29+/tFfT
	 u+tOYTLo8lKD/p55WO/paDYPJxX2GO4FmfqAS0yhw7a9t6iEkTwKSmdldCVFsdMZZk
	 DQHENdYLf5v8O/5G5zdj0WMCi7DaAfPnfFhdwspoyKjm6bUowDzmyIT2Sw3900IsV+
	 X6BQ7c51T4p2pXc/w5OxPzZZ+3ReHC/NL7yxwxmsN/Mj20KhwgelLVFmD+Z6NZ+09P
	 RryFZkYKEiaZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EFD68164B;
	Thu, 24 Sep 2026 19:00:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1D86392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 901DB404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAKFAbLtRy3V for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 77856404D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=FHebW4760u7AhHVnawvtikgk23he4yJSXerj+QqkhGnio7hHQhcrSYJra1WnTSU9NMVH
 clrXf3HDQuV3ZvaUD3y3x7wpABc+uY8ijqR4+gUFoefdtbA6RRBTvNe7RqlxRZX9sxhRb
 UU9rol+A8e1Z37TYGz2I9qpaUScOFVTcfSfUeCYBkWyChXx3PGt77H3vmYt/SrFfUiamP
 yuRchIBqKa0k20UvP3yb5LvbCxmz6pOkDUBNLq0t+KH/PFkMn+DmkEselVGWaCn+QInmH
 R+4tcjM21QO4sYuGPzQbYpVGnT4aI3lUD/OZQij3eQyipmGFYkXWdqiXi42lBwUSIEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LHd8NVkUpynorvziAyKY+1hXKNq8v4kptZ6EruZESPo=;
 b=dZwhhi3DaIeWCDbdoEhjLOVfAkdYO2HtB3X8WeFwDhY8A+kPe366IDnTjFtHTTuz0/sD
 fYPlIk+nX6J3vqSJ/R5IXIGOqQgq7cGsnP3QQRgleT18TwMwM8bJ8ojyahYubk2VFI/su
 nDOKk5BiA/HVhaTQEqQumOiGD15UcH9w9z4Ezs6ogI476s1P0jNNi4Vdpi1CysPxFxUOK
 6F3Ql/iUMM9W0SnSCPbpwGrouwBfpvehz3a/Y0kmQgLJABMykpogC4x89wdbI95h+s0FT
 10TBC92iRKwShuP9DqWfvpvhJr3hG7l/oYz+Z1k74iszQG1bLRuGMlvTO+eZeTX/lYw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77856404D2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B718982D9; Thu, 24 Sep 2026 18:55:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:38:05 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0d1e5de8f9355df320bc918f70b33dd6de7307f7
X-Git-Newrev: 791b2d0794204d895ecd70e362ab1824527a0f67
X-Patchwork-Hint: ignore
Message-Id: <20260924185544.1B718982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ibrcommon: update
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
Content-Type: multipart/mixed; boundary="===============4341060556924337136=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4341060556924337136==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/791b2d0794204d895ecd70e362ab1824527a0f67
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index 7c66dd52df..84349b537c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -404,9 +404,6 @@ package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch lib_patch.Upstre
 package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch lib_patch.Upstream
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

--===============4341060556924337136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4341060556924337136==--
