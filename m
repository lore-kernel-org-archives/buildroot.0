Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9363CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95BB881010;
	Sat, 10 Oct 2026 16:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4iooHp1tGkh; Sat, 10 Oct 2026 16:20:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5675C80FB2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649243;
	b=KnvtDxhS2alxhhx85MDj+lCVA0fvDFa9x+Uc0A4BNEvbfsxnhf5SAFs2f/NnMDJmzvAB
	 k8lIokFeWuMUCRpUTIUQO6Y1CArCsuwrg3AU6tH3R7+y31HT5ifbyRkHMdyvd7IP/rdp6
	 JqJWJh0VRdcroypwqt3QTfyNu0KVbyDyPRhnR6NVzvzDbeoO54/X9VgSKjy2Q7TNk42Gj
	 +QBBCyYEYnwDQb3LY7SF6KTwFGKn3/ZAzNb9L3cz1u38BbR/HT7h7+SVET2O3KytNOHxB
	 KG7k5wVd2eN55p2CGsSy2jb78nvP1PVjlQtAfqIqEcCZXcVBrB61RfGDhoi2TUxL/Yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=EWCubGhkl3+dLXKDQ8DDvb5F42qAH+yxbFXVZb1//D4=;
	b=KBfSa/Q9eAs5eUJZwl4rRXZXb7NKE7joBviI5VSoZ4VuMHI8F6bi+RMavbOn9ooklbUk
	 zXISyzFacTYTR7brIuGMfdGZzvDmtFtdOSexxKTOy2X3drCVrjXGaBw1VBxFfpGV2LDka
	 d8Kp6B3u8jQf7V9tIPhm8MbxOlvTo8cChhK/MaqG6yR4N127ZNo4Mo4Esgarh7qeMgja9
	 LUYKVyW4QoV9Q4SNggQKAkDt5SDA2pENOBvFDTBe3qzWWe8eI+LRZNQDOWFi1aSV+0Qx4
	 lB8wujzhN1Itr/XN0/8R6jn0JxhgeO+947qYXtTpoHUSgNoTd2yGKJs6vYSrRx1PZMg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649243;
	bh=EWCubGhkl3+dLXKDQ8DDvb5F42qAH+yxbFXVZb1//D4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aFW9OgPaIeoeyymBmepx3NjDvquil2ElE6NPtpFpvjzx1JmfKaIZVfy2lq+B4URAR
	 ByHKWBNQra5yln8BwUELVxwU9yjqJMD2YE6+F/1Z07V7CeUGGk3jZ1J3lRl/j4IpYZ
	 hN4a+DBvl30kX9zZL+SsLniiSKfNC+IqQFyXukAxEIxhKSs0Ad4X5Ji6ylOWtmuufV
	 e3aGdu3xii9ObdhGby3YMcukGaNcem7shzVbEarlS+fZi1nTvAtZb8NgcWrolq+A3U
	 C5nW6mA6N+zM6etD9odZryG99PLsk4ntlgXN0hoUgGwOspUFl3eJpj96rZM3t2iwhB
	 6KUpQHxq/aGxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5675C80FB2;
	Sat, 10 Oct 2026 16:20:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B95E3156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AACDC4080F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYqh8oMV-2v3 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:20:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C6D3E40759
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649240;
 b=NSMkPr13JFAaTuf/CBQK+odGPubRd5yNihVj2hUrDWqFLzYXgo0+5WPbqsT/yw2MISD8
 QYyfSc5ZitXRrEIjkufQHBPnYGrawKr1DCISxbZJkm8Xf1px1lCnQu7gJLcEIjgps9MmH
 xslQAG+dbfMGm9exNKi7EwdyZKRxTJQU3uFJsyc8XX+vkxgTkT/vchMKxKEz+H0qnOyWr
 ICfgELgY9kGVV4e1J/z7KX8Var4UCIXnDEykN2QgScnRVGEE5LNxBNNiFAGt3TPXAP908
 B+fC/36Ctg19Og2uwVVUGXhjOWgror7CePLXQPbn9kyjo09ZASN+cRX0qq/j357sjlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649240;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=o2nd6sZkcxBFay7V/Z3qhQgKQQQwQdctytH5kHEVfAY=;
 b=fvMm9M880fVYo5DDRxy1r68wYYLCxgxNd694NEspbRbdySbyucg+ZYQ4K/EmrPRC1yI2
 nyJI3HHu3+KryUJaPkmSBD5dMENp2987A6kDkJD9zvi3xp9MiNEj5BvXMkjCJgsKDWkw4
 ovgJFymsFCa/7TLWG/xsa5VnASgVxpECQt2PBpbKcfsZfnNlhvQw4vLs+mCBLNj+12WRb
 KIKNgBRoZ5zBE6vcdQhTptM3xkkchjnTPRbUJIrflP+6d9Hc0ClxWJVFZm1cklAs/SHrK
 o0rmANKJafX9bttM1x0Ai8SHfC+YvpTP1f/Ew42wMkjBLvpLrbyV9PNcDSDJYRd0GMw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6D3E40759
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:20:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CF34923A2; Sat, 10 Oct 2026 16:19:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:19:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c66fe59ddc32d5d1543fc3936d3ef36e23861b55
X-Git-Newrev: d7fa5c2d0183ba400d18bceb28a7aec49468d8cd
X-Patchwork-Hint: ignore
Message-Id: <20261010161922.8CF34923A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libplatform: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7fa5c2d0183ba400d18bceb28a7aec49468d8cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The last package depending on libplatform, libcec, removed its
dependency:
https://github.com/Pulse-Eight/libcec/commit/332bca975a71d8e876b66dc6a7fca938b49b1831

The maintainer of both libcec and libplatform has put libplatform into
maintenance mode: "Don't use this library in new projects."

https://github.com/Pulse-Eight/platform/commit/97332651ddfb3df9240dfd4227ac35484f8c4341

so we can safely remove the package from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: move the COnfig.in.legacy entry under 2026.11]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     |  7 +++++++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/libplatform/Config.in        |  7 -------
 package/libplatform/libplatform.hash |  3 ---
 package/libplatform/libplatform.mk   | 13 -------------
 6 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9ba6ab243e..25eb19468a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -227,6 +227,13 @@ config BR2_PACKAGE_WESTON_SHELL_FULLSCREEN
 	help
 	  Weston fullscreen shell option was removed in v16.0.0.
 
+config BR2_PACKAGE_LIBPLATFORM
+	bool "libplatform removed"
+	select BR2_LEGACY
+	help
+	  libplatform was no longer maintained upstream, so it has
+	  been dropped.
+
 comment "Legacy options removed in 2026.08"
 
 config BR2_PACKAGE_FLUIDSYNTH_SDL2
diff --git a/DEVELOPERS b/DEVELOPERS
index e7e5af92ae..c6ac972854 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -450,7 +450,6 @@ F:	package/libogg/
 F:	package/libopenh264/
 F:	package/libpciaccess/
 F:	package/libplacebo/
-F:	package/libplatform/
 F:	package/libpng/
 F:	package/libsidplay2/
 F:	package/libsilk/
diff --git a/package/Config.in b/package/Config.in
index 25bf81ec52..fb84adf4ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2236,7 +2236,6 @@ menu "Other"
 	source "package/libosmium/Config.in"
 	source "package/libpeas/Config.in"
 	source "package/libpfm4/Config.in"
-	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
diff --git a/package/libplatform/Config.in b/package/libplatform/Config.in
deleted file mode 100644
index ade6baf2c2..0000000000
--- a/package/libplatform/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LIBPLATFORM
-	bool
-	help
-	  Platform support library used by libCEC and binary add-ons for
-	  Kodi
-
-	  https://github.com/Pulse-Eight/platform
diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
deleted file mode 100644
index 5fead5eb95..0000000000
--- a/package/libplatform/libplatform.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  2ab98ba486b28dd9c31e9f0f8a04eddad12c09ad1951c359fdef475baafba296  libplatform-2748be52ae27e6007ef548b697d4a03ff7de4291.tar.gz
-sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
deleted file mode 100644
index aeded5e9a7..0000000000
--- a/package/libplatform/libplatform.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# libplatform
-#
-################################################################################
-
-LIBPLATFORM_VERSION = 2748be52ae27e6007ef548b697d4a03ff7de4291
-LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
-LIBPLATFORM_LICENSE = GPL-2.0+
-LIBPLATFORM_LICENSE_FILES = LICENSE.md
-LIBPLATFORM_INSTALL_STAGING = YES
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
