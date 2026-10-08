Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965B1CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38C29608D1;
	Sat, 10 Oct 2026 09:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_79UWjeC078; Sat, 10 Oct 2026 09:22:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD09360A73
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624150;
	b=jZXfbMcY//zDZEaPqL57qoKFfnrlic9fco8mrH1DvYp2x22TdzqgxjVRDUWhV2YMq51z
	 vETr6QlwxWbGX7UcMduYYtfYgG7GwQo620k2ncc9M672ENNIwTdzZOqTqt9LnOWlBozMI
	 oUqajIzqlxaSv5eYf4dCO/XFa5itd05yp8ze2dzZ7C4Q3Fq7te2m3GWYoaT4KAvPDrcUc
	 bli9CEGkHlTSJwSv70ZTP6mOl0Rz3vUu2n+t2LbQaj2z8SsiX7EMapCP4gVULD/tfSZqc
	 xSR1jxX0TAt7NhZx6xpwq5JODYaZHJ+fuCNLaYooih/VTUNqbLfLSzDOlSS7sV9CEWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624150;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zTyGV/VOItIuj6D0LK4aDP+L7IiXsjex90d12+Wmazc=;
	b=lgXpUH/Gcgnr1/GEY9CWrjJ3BQA2ly7OtqWJ9XRk1YYIFon4nYMojlw0sKiaf3O0Gi3g
	 dwdDtdAaLSCiTalhFNBctRDGJytegzpdzVyrJoh4RYA6kcNu7M4sjOHcBtFOCOMx/RU0Z
	 s1QXeuHd3ueJFqcYsMcaGvkr+zYE8zPeNNntADZcs1Rmd389PsaoCXjcw5h3lAA//1BBL
	 c8p18bLhxqezdeK9WU15QH4IqnHuQkhH587y/Cl8TpZpOj0luNvyFbvnJcu4JxuGkDPrq
	 itiEAGoCsV5J/U4hnetlO5VzD+Z/oId2KJWc5Ou27DVZeh7nbKSbOlX72YvMsN/qnMw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624150;
	bh=zTyGV/VOItIuj6D0LK4aDP+L7IiXsjex90d12+Wmazc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d3R48c3GmaQy1QnkuQ+qOlp83kM5S7vzcDwC24kjjhNY8TJFyaX3WWbu58bZ4viku
	 gaDwsaTE1Li+m//ChC8StjRsJNhxkNwb+waF8Q/3xpzaMTWgRSFgfV0ZLZl6k+AEll
	 vdoUUSOyBy0EMiF+IhSL2yM9VDYyCMlSW/aMzEUIxaa9nzrkl+V6331SaJ63+Ed27C
	 1Yy9oVXZnJ1uUqOwP8vPPeKiFREyWogDSzMmc1rm07qpw5FhRLnBakztwa0BeqQWft
	 /qudjT8Y4e8xWCboZqVD6Q5d2vY2IE2YRWCMLFH1ciWqjaUzg4jHv7I2sC4Isk0BAc
	 eP1vL5B2WQNpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD09360A73;
	Sat, 10 Oct 2026 09:22:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10829A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E646D60623
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KS4IkGOV7I5c for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 09E73608C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624088;
 b=IHlPEbzJccUUEYcdsSNP8k8W3hucyfxIJg5PzArp2klrZn2wmOp0+hDjwD7uW1PpRrce
 CUtsypiNMCfO6Kypsq1/dZW6S+MFLP0fyWo7ax/UaGKHkcbetypO7bDcWJiVNYqMj8Vjd
 5x47JgrAtKRDYM39GFKTWUSahlNLWXKEXosR2ascP7igdZpJi7EuVPGNHmCaB3Nwc31bL
 fNvwAPOWNvqvELyko2JtwG4XNAihbEvrItr6/ReUYZhkDnxK8YouVgb+Eh4FCmLm+Dqma
 zsgenUS9DFVYgK19gboR7iOGlyt9f+cICiNR8nHTgoPZf28JG3gbsyz3PDVX+UPr32w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624088;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/NUNI/VMj1A/8NWHgzS8cobaWYmnVM3qxK5UFxADqaY=;
 b=hyk+RpSMVDugTTSFtAISN+MckO8GkCzER/TWOnWHzVWlW45gPOMHjyOTvYQre1fLaI9j
 98emidf7f2BhHrRf8ApLWqPnH+MvMoNLS8y+vzR7Oc+YcqNCEoMgU4wLfoRCxxHS/IZx2
 ASndUh5JA8mWX9yd4rAw1vSgPTMmGOF8rc2FxLmcT/pUW/6wj7Kau4vR5ATXaFU4pLyat
 a6JQK0QIWWnaw2xuOfDAJ3RmI05wyq3ZDn696xlsgBjrxTjKRDOchLWtQEIOCFfVMAeid
 Xonpl7JF7W6nPQWoE+ntb6IUEvpBFmf6kU1HJl6b1IUvdOket0dR/2MCnafW1gEzHJg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09E73608C3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E78B28F0B1; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:31:33 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 789bf2f21fb281bc946775c5d8ab51407f49809b
X-Git-Newrev: cf9d383ade1714fc418601574fcd960d0b37c6e6
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.E78B28F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/thrift: bump
 version to 0.24.0
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
Content-Type: multipart/mixed; boundary="===============7148726495917377822=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7148726495917377822==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf9d383ade1714fc418601574fcd960d0b37c6e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/apache/thrift/blob/v0.24.0/CHANGES.md

Please note that this bump includes CVE-2026-41608:
https://lists.apache.org/thread/vwsbcwqdpwdtp8qkjo11ol6rodbfm21f
which fixes a security bug in the python bindings that are not used by
buildroot.

Building this defconfig

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_THRIFT=y

without this bump does not cause build errors.

The Gitlab pipelines detected a build error for this bump with the
defconfig bootlin-aarch64-glibc-old:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/thrift-0.24.0/lib/cpp/src/thrift/transport/TBufferTransports.h:110:32:
 error: ‘ptrdiff_t’ does not name a type

To fix the problem we add a patch to include cstddef.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0e5019c2e470e1502f1420879f644365c7ea8842)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...def-include-to-fix-build-error-with-6.3.0.patch | 33 ++++++++++++++++++++++
 package/thrift/thrift.hash                         |  4 +--
 package/thrift/thrift.mk                           |  2 +-
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/package/thrift/0001-Add-cstddef-include-to-fix-build-error-with-6.3.0.patch b/package/thrift/0001-Add-cstddef-include-to-fix-build-error-with-6.3.0.patch
new file mode 100644
index 0000000000..f59454c3d1
--- /dev/null
+++ b/package/thrift/0001-Add-cstddef-include-to-fix-build-error-with-6.3.0.patch
@@ -0,0 +1,33 @@
+From ca2c2467c78d9140a7e260727cd3305bf3decd09 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 4 Sep 2026 19:49:59 +0200
+Subject: [PATCH] Add cstddef include to fix build error with 6.3.0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+thrift-0.24.0/lib/cpp/src/thrift/transport/TBufferTransports.h:110:32:
+ error: ‘ptrdiff_t’ does not name a type
+
+Upstream: https://github.com/apache/thrift/pull/3801
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/cpp/src/thrift/transport/TBufferTransports.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TBufferTransports.h b/lib/cpp/src/thrift/transport/TBufferTransports.h
+index b78e457b3..b0447b0bc 100644
+--- a/lib/cpp/src/thrift/transport/TBufferTransports.h
++++ b/lib/cpp/src/thrift/transport/TBufferTransports.h
+@@ -20,6 +20,7 @@
+ #ifndef _THRIFT_TRANSPORT_TBUFFERTRANSPORTS_H_
+ #define _THRIFT_TRANSPORT_TBUFFERTRANSPORTS_H_ 1
+ 
++#include <cstddef>
+ #include <cstdlib>
+ #include <cstring>
+ #include <limits>
+-- 
+2.47.3
+
diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index 406c65fd25..187fd15c50 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/thrift/0.23.0/thrift-0.23.0.tar.gz.sha256
-sha256  1859d932d2ae1f13d16c5a196931208c116310a5ff50f2bfd11d3db03be8f46f  thrift-0.23.0.tar.gz
+# From https://downloads.apache.org/thrift/0.24.0/thrift-0.24.0.tar.gz.sha256
+sha256  e0fa5839a4c5c1d631b0931cf2c554ebbfa4e2fee3a9fb3ffd4f82ce4396c6e4  thrift-0.24.0.tar.gz
 # License files, locally calculated
 sha256  89aa7b27868669299bd8a6c53b72ec4beadce42dad6c8336797cc26e1e8df98d  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 34f4671239..a517dd5035 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.23.0
+THRIFT_VERSION = 0.24.0
 THRIFT_SITE = https://downloads.apache.org/thrift/$(THRIFT_VERSION)
 THRIFT_LICENSE = Apache-2.0, Public Domain (sha256.h)
 THRIFT_LICENSE_FILES = LICENSE

--===============7148726495917377822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7148726495917377822==--
