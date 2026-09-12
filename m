Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7E4C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E59C4063E;
	Sat, 12 Sep 2026 13:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlakX6Hx_fhW; Sat, 12 Sep 2026 13:45:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 31DBF40647
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789220738;
	b=qaSa8czlMA+weR7NeytV33HfW2gok2uCEDNzsoPLkpPkVF7SOGrzxnE8hTQYlw4+Z3ed
	 9nx/QbnHn0lRP0acrPMsQ7yBIE8AzH0posJgeH93id1/AHmmebcyi0zSjDuvOtzhxnJlW
	 HBUBWgXPyU7bwiO4S1mghsK8vxvELqUAyqR9beuhuAg81sqfZ+Wo4ORQyelcPTMG7f72V
	 mKQAFthehgw2qgUUTNZUL8ipDulz27duWFvF44il3pr+xXHzgRu+ZXN0SLaH5/E/OZ0aM
	 YzFTjt4v1lku1ePV7cluGvl0ozs2Oyg8KBGn9DWYmnnvefwWaAx2eXy7ur5d1fLfZxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789220738;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qfmJuyriQuorFlG11x+bCqKnmENMPjiqdcSFQCUbBZ8=;
	b=hFyK6UN+1M2AIB1hXgL+bRixdg9ooIldoSXkRioPtGQc4DQw90Lbmux/dBkWdW4zYsty
	 bYkLf6W5E0bmLVylWwv7rgJfDI4C1LhgXBE+3yLVYkjtdXQn1eR1HxE2CJiAd8U843Hw+
	 ffiHridNcVE5cHh5+sHu2ncTD+g8K92Yfco3gsAxRFdh9/zlWb2AXrLFJxszg3YCd3BR1
	 2zFJ45rLOCu+KhFMwLAui7mdOb9ljhSPbtGgiJX9jFsZaJZJDjE5dEFr3EnWLu+pehiE6
	 gVAmoYgEaIt6USuWUeJUBKNqSbRU66fY7lmU3bSfpCSbQv1BWAVsGNgdQLvUywtCOCQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789220738;
	bh=qfmJuyriQuorFlG11x+bCqKnmENMPjiqdcSFQCUbBZ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ACAHMseV3z40yOjf5pV79YgpnpPpU2pimfHeiy/0BXp6v6lRQ/9EOe8lj3oSlli/K
	 3T6pNIQ/U0zO6nb77iFkZBRTUI0erQE5jVej1FOYWNvMh6IaWY73SUPexIIQRYY087
	 2QEhGJZV2+oppk3ahS30psjvfyLLdP3ekbRHVGytL9KOEf3/hki3ZUNM1Yq7iEKkk4
	 pgdCdnncHo74Oqz9u8wjxHbbk+MEI99aVSiU9Zathq5D65SRja7hoa/GP/TMiCR7GX
	 Jfh0/tr+XC3PT/oCcBOZ9Tunox4otylbxDt/GMPHZg+AA468y5NdK/4fkJGMmW5PtA
	 otRAGa8gy6d3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31DBF40647;
	Sat, 12 Sep 2026 13:45:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E02D23F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8B404063E
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05LLTyXn1sui for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:45:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2B9F7405F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789220736;
 b=UX3BgA0e8qHsy/vSiKo5cCwIPT7tEeDB3CWFSxNs+/godOE6CuaRi21GJp9gDEsGVHGf
 NlhXZFm+WHUSl38k7R+p+ykYQflEM+NvyJV57weeFOwGmqXjnXnMl/O47xteqB+Qau9bc
 oAG67VgRLpbv0co+/xeYFxyDnz3i7JJrdAJxh2RPC4byqbnLQBVIWnr1U6Dbn6yOPVfZo
 6hrsV7i5CcN9lczZt2JZnpKxrnCnxSQjybchFeBaSSeP5WaP26IdN45UAgn2rBXQAP2ub
 LNKxQvur51RX6y5bu1GV3EuFVJ9dG4yHniorbsVRKgc0hfdYyuOj1rS5tCoJbeoes+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789220736;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=taGkhSddHlLTsMqgFxZ3q4tE5DGDMpCcb2M2RSNzv6Q=;
 b=UniNfETw+F0RBB2F1vjTR6c1ak24y30B/Oz2QQ2Nf3zvzYvEVpn7cIkqRNpizL2S6kAb
 NEqYtzifg6QcfngsgZfigm1Mlg7lo7ZG9vgmOlHBp6juK/ovsmHeObwGg1fIVsSsHFS4b
 4g3HiHUfoYs3cpq6c+BOLjAleNyJqITByMQjtAHgjnYL1Pe9mVTYj2h4fbvhjlalAFlVW
 ymFzNG5LPSBWsQ37Gk9orhDBI259EeXkTOYOfAtukjw83MqAgxH+E9J+/vdCClS9hSMTc
 V96k14lafIp9sM1DcUDoEhnlIsmbspqn+Bqz5PCKGinRSfq3Jt5N4nvEuRLiJLCFsAg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B9F7405F4
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:45:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2D3C956DF; Sat, 12 Sep 2026 13:44:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 15:37:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c25fed67e6165269424c2cb7f1f93f720c2a8145
X-Git-Newrev: 0e5019c2e470e1502f1420879f644365c7ea8842
X-Patchwork-Hint: ignore
Message-Id: <20260912134431.A2D3C956DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/thrift: bump version to 0.24.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6893088379905151157=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6893088379905151157==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e5019c2e470e1502f1420879f644365c7ea8842
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============6893088379905151157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6893088379905151157==--
