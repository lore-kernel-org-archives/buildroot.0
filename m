Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D8FC4167B
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 09:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5526400DE;
	Fri, 30 Dec 2022 09:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5526400DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7H70ZBaoyITP; Fri, 30 Dec 2022 09:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEE15400E8;
	Fri, 30 Dec 2022 09:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEE15400E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1620F1BF271
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 09:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E61A360669
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 09:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E61A360669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ND-N2jB146RJ for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 09:34:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDA4160655
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDA4160655
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 09:34:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bs20so17329561wrb.3
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 01:34:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SAOyYd2yRZBAa5Qpn3jAcl8GGkb6ZJdyxblnadtSKh4=;
 b=PYyKoG6U3gORrppi+KlCj67ndy0fjtpWI155swV3llM8Yno2qkuiT8seEe3rB4z7Gj
 KDZNkpNYifBd3mVl3h6sQx3pK9u3c5DSpNEKwPzOyViQhRYWnWP6zUoaKrVkbfB+Ss8S
 Kn7i/XJQmvukuI6xi6Xr1nlbv+KVuuHwXwanH2+fDqaYfnCbftt7bWpfVAaap0XVVZka
 Ogi5gQOwRlBTb6Jj6/hObn3SOaUEuWOJ7wSosToEpMyR2uBOfXuaWNAJEvZeR4HJiw3a
 VfgCFrg+6JuP4CU3n1Zl0vTqFsKEAyyuBIjPBn3qePlxZJgVvuhsfrVyDQxazn6HWlOM
 j8QQ==
X-Gm-Message-State: AFqh2kq493rN1xkfUoC4CjBj/q7vs8tJ7n4GFmt1njoTH8nLp+qj+mlT
 UYfRwCEQWwdDovR+U6cQSWpi6Za+mMI=
X-Google-Smtp-Source: AMrXdXslLTbAk1Io1B+MS4EGOGt06udzSOM/CbB81e7B2uqilLxkwB9ePKkxZVkUsc/LvqoxB0VAIw==
X-Received: by 2002:a05:6000:14a:b0:278:25c7:e844 with SMTP id
 r10-20020a056000014a00b0027825c7e844mr12462660wrx.45.1672392879548; 
 Fri, 30 Dec 2022 01:34:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 b2-20020adff242000000b0023662245d3csm20323605wrp.95.2022.12.30.01.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 01:34:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 10:34:35 +0100
Message-Id: <20221230093435.118865-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SAOyYd2yRZBAa5Qpn3jAcl8GGkb6ZJdyxblnadtSKh4=;
 b=eL5TfFhdvC6Eq82YSqF2BaXnTxE0Dn1E81qHDndKA7fOYM6Fmpl9BGwBSUMmYzXvGG
 zOCI4lWIYlCZAx/FfD1Ucjr+JvHyHpNc5EYA2EZ0WxYEn0z0my2YYr9BPmHDwKSL1Nju
 vSTZFv3gOOLn/pAE2T6a1PTt3JuYpM7niuak5JLQeV6ZM5ekbyviadGa3emYlFb3xKqr
 AgSA6idJCXfatJH2ms0HO82XFSvApolt/J3hdVLGbsgR7Co4eTUcPYXGUu6sjaA1kP1H
 7QQfPsUgpO/fBu2TveZt7t+11/tYVTw6S+awH8hDZMoTIqOWEan8wiM+7Mi/uuAbnyo2
 7eYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eL5TfFhd
Subject: [Buildroot] [PATCH 1/1] package/tiff: fix host package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable webp and zstd on host package to avoid the following build
failure with host-gdk-pixbuf raised since bump to version 4.5.0 in
commit 5b62ea01369b11f5a4320bb2c909168b21c2642c:

Run-time dependency libtiff-4 found: NO (tried cmake)

../output-1/build/host-gdk-pixbuf-2.42.10/meson.build:330:2: ERROR: Dependency lookup for libtiff-4 with method 'pkgconfig' failed: Could not generate cargs for libtiff-4:
Package libwebp was not found in the pkg-config search path.
Perhaps you should add the directory containing `libwebp.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libwebp', required by 'libtiff-4', not found

[...]

Run-time dependency libtiff-4 found: NO (tried cmake)

../output-1/build/host-gdk-pixbuf-2.42.10/meson.build:330:2: ERROR: Dependency lookup for libtiff-4 with method 'pkgconfig' failed: Could not generate cargs for libtiff-4:
Package libzstd was not found in the pkg-config search path.
Perhaps you should add the directory containing `libzstd.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libzstd', required by 'libtiff-4', not found

While at it, also disable libdeflate even if no build failures are
raised by autobuilders

Fixes:
 - http://autobuild.buildroot.org/results/320083dfec4d126043b036cbaec7c7b85069a50a
 - http://autobuild.buildroot.org/results/8ff1cfa254920749a43e235c4084b8524d0edf6f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tiff/tiff.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index d3ab50b79e..e7de51ea1e 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -26,9 +26,12 @@ HOST_TIFF_CONF_OPTS = \
 	--disable-cxx \
 	--without-x \
 	--disable-zlib \
+	--disable-libdeflate \
 	--disable-lzma \
 	--disable-jpeg \
-	--disable-tests
+	--disable-tests \
+	--disable-webp \
+	--disable-zstd
 HOST_TIFF_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
