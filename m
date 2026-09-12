Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80E8C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9361080E79;
	Sat, 12 Sep 2026 21:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMIuKU7RXDTS; Sat, 12 Sep 2026 21:23:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4350680E7F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789248209;
	b=EqpU0kB5JKcl8qKDN0pBOWzyhrRk04RPwrvGVtk3Iv00FEWNDC9jyNm/GGddVj+WvFQA
	 TQl6gPtsPGZutttPo0SEJOfiGpkxeaBck6sU4VnpL5LuVfMrRmYPO5W/Zm3RvZxYvlkAs
	 ewV2d3btHWDPvxoc7uQbO3WLrV41jw0AuA4buFzTggDmg8t6pB+pyFEF1b/SQJCwB5NOC
	 yG0QWi4785nXGCfL4prd0cMetjB4yIsLkfdopLWTjlTWpDPNII5kv5ZFQolsxYqdagOwv
	 yauvW311H1ccpFxqsO2urm9s7UDwKXhBayPqy49MHVQ5D2e98QkOlWXQJ9cNOR5/hRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789248209;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4ny49Gwirx54o6wCPVEq36s6pfbYiRJ6t0n0ameyh4E=;
	b=PWUjcNYNAasBcR3vkAJJu8ngyiDx9l/nw6YWdXIvSER93uIztukn+lUeRjUPB74NmVr0
	 R0S9lom8q2bxKe2u/NB2smPyOkMh6Wru0tSwLsOhJdiKPbE2WRBGyJhcQvoqRh1Q3rznF
	 RC4vRIPLvyi2M5ub3g7S7vVk3n6VQfX70vYl30G8La9eHvc6GJ/uIOOspcjMJPA3JLdXu
	 yA6wXNGfTHA5izhNcYEFuNv+ok5GSs/XJ9UIk0u+IZaR/NqruqEfIHElBkdc6si3GnlOE
	 TvAcJrhUkclM2vxXdiRN2neNXUylG4RGyJjDkST9+5CpJ3oIuApxpEodYPgwcRI+afQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789248209;
	bh=4ny49Gwirx54o6wCPVEq36s6pfbYiRJ6t0n0ameyh4E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lD3PPlsBnbJAm0mBo86WzytJQQdj+llLcATKjr2JYAI7YEJ/VJCJiYu28hpw5vUat
	 QrZqVK+QIGm6EuKBr0xdnbZv9EaTORcrEQb3NbOmPYzy/yEz0ZD1JmavKBJ/Cs4HSk
	 XdlusZQ8TJ5gY/stMg07wY4eyLcIbao7Md+xiUSd1isTGDhDYrITID8lqi6oNRsY4p
	 FIUqJppNq811wH/Hl88jeU2gLCaxn3CHpAIPHouyp6x8bv7lRC9Fug4tGfUkBnVPL9
	 9TfZNfdaGdo88dAKfucQM+cKmOIrKxURoQoxtW7hkg1RDRF7zpUPr/5Mr1UDiv2iYD
	 XPilNez/+qf3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4350680E7F;
	Sat, 12 Sep 2026 21:23:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C02872D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1DAF60607
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYXtuWXaKRwm for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:23:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 19431605FF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789248206;
 b=CBpp1C08q8+b1xakHmZpG2YdFmlDr/HvYaQRmUyLfrFDziKEshGQyzY19MMz6MQackV/
 BnCd+2fcAVow5Dp/6SFEWB3SZ2wb0J9gEfSfb1bzivcXiq6WmzWrM3ob+eRNuTUgBdTrW
 c2bEi63efQl6A+3CrNs9GG5xos3SVqO/N42etzVacsYbu1Lva/JySssX5tO8ErSd65BMs
 sUOTsc5FX3Hoza29Toybx38xFEFE6E+PXBFr9Cmq5f/JAl/nVfuqIT044G6jNOaf8gtvj
 rverW2WSRh4NBRw+hw+yiGSKGu02KAt0yGO84LMfaXdpsPsLBnnA4bidGwZnY04wQtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789248206;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=AQmTzptrk5hO02udeVcil1Lc00OGjjHQpm382EnBtdg=;
 b=XEmr2IhlxouNXntN7PX88JKkKjTeMr+uwa6Mmw+1NsMcmS/Jw5waZ74J4GHa4H64muO4
 6VlKNzon1lLU5lHej1KYXE6Emz8UhoEDjI+0wex4yIDwf2X4SPfA7o80ZIqnkl4weYOno
 3cBLLNK1UsLC6ysdqKA2U25zpGbbUQL/6f7mJ+B9eZgZQ5oL1Y80QMXcPqEQj5FL7Y00x
 b+w/3u0SkK/nuwI+iKlZKwTGxu929dn9J5xAlNIRIAjuMfLWvaYSdfUFVECEGs8KfQVxA
 HFO0IZBruaOFCGGEhMZqsIUsJWrSPtNV+SB2nKvKKDHveDGcyDX2w/gHqnycW0jxbWg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MN90fY8d; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MN90fY8d
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19431605FF
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789248203;
 bh=AQmTzptrk5hO02udeVcil1Lc00OGjjHQpm382EnBtdg=;
 h=From:To:Subject:Date:From;
 b=MN90fY8dLxhWMBov0Bpy9JuMqri3dWRtXZ4vs6TuX+tdbcsIBC5xMr5QvRWwUwRsd
 p4J6By0p9h1aU+pQcB6DV2yi0hHd5y8rgKN1kp8Vew81Di+kBAOe6aos8yZrNrd6kA
 +ob5dMQu3q+cp3gYmS/Zh/Vguo/knQSFhWz0Zkb9jQKlW6mi4H7gNAnZbaOxmKzyrD
 utfYyBCSgycdes1GBmhaMS5Q5im/q2DEwZbD7je4s1ZFIRKBj/mwsxNKTPhEBrn1y2
 TuMeWYNUN7ce9gshUGBrq6/OLy6CmsF2XcK6xD+YXoMDWubUkZ2NKz8UvsQ1C7tZCx
 v0SxZkJiSWeVA==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A0F8A4C3B01
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 23:23:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56064)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5VBy-000000003nr-24mw
 for buildroot@buildroot.org; Sat, 12 Sep 2026 21:23:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 23:23:22 +0200
Message-ID: <20260912212322.1797785-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/ibrcommon: update patches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replaced patch 0001 with an upstream commit.

Added Upstream: tags to patches 0002 & 0003.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b12efa3c390012e4cbc6516fb26f09cfec720ee0

 .checkpackageignore                           |  3 -
 ...mplyfied-POSIX-method-to-get-the-bas.patch | 46 ++++++++++++++++
 ...File.cpp-support-POSIX-basename-call.patch | 55 -------------------
 ...-added-openssl-1.1-compatibility-264.patch |  3 +-
 ...sl-gcm-fix-static-build-with-openssl.patch |  3 +-
 5 files changed, 49 insertions(+), 61 deletions(-)
 create mode 100644 package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
 delete mode 100644 package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 2fc8349f1e..e3d66ca99f 100644
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
