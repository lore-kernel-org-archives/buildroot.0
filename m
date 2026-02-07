Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30389EE6B7F
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 08:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B07CC40576;
	Sat,  7 Feb 2026 08:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLzNhRgXmuPk; Sat,  7 Feb 2026 08:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A79E440B18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770451851;
	bh=3Mn2oLotc+9nEKmwfd3Mq3dz4y12/LjTHLWJ4xE+ZqE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Hq/LqxbiGXOWyeSaZj5DKujOOMFY5WYy5km6xX1/AlxNQQwGwJR/6JS//1bX06mpk
	 5sOA1s7wQTMZYY8Z+TEVKME146FK/XyTKj7s50hErvfstFsJ6ah+ZkdhIN1cyrjGhJ
	 1Awksq50Jhlm1LOHVavMWHFLmXaJc3YchyxvPSxjWADGYW6AaZ1t6Wa0wgO4D6Ly4k
	 HWAnO9jVc+nm6JjjRXP/wc7u7odhjROw/wdOTeRMw+bgXrtSXjGnNkQ5MpVspymaUK
	 D5q3i43gySZtIL0pgepVkjAUel+ww9xRVstYoIAF8eC6lORm3ugHCNgwhwWm55xYTJ
	 OCG962MjkhmPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A79E440B18;
	Sat,  7 Feb 2026 08:10:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF488173
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 08:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCA8D82730
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 08:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzPD6NJVABjr for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 08:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 291BE8271D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 291BE8271D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 291BE8271D
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 08:10:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso12340795e9.1
 for <buildroot@buildroot.org>; Sat, 07 Feb 2026 00:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770451846; x=1771056646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8yVZ4YF7Kyr9SF/m6ilHnqjHlw1bjASlk22JpBBUJkw=;
 b=lD8O70zZVyG0f5I1edP6imvctleKi/bIRYKEKzeSCIMnjh6UpgtkzIYqKIyUqduVX7
 aH54sM0bCqeB8oCVB8zwBPhGMthQl1kB4FALQcgF4Vlh1Fd5n6QJNUi5GRQ5ALT9jPlP
 RZBjODG0n4ePSIAdHNex2yczkzKuhY3DEmsgnr2E+ZAUhcAYQIXbT2nPZ4DwpzS7Lhgf
 OAiEKiHFlo6lWFRw2H9KC7IY5ETRbfBM/SThQhHh9Yuy2KnTGAebxqIrsp3MC7UO+XTE
 wXGAYF2k6uXu67+MOvZ1IquROwLGr5j5MBjqMpxez3Mr54S/sYerBHFMfSNU6j0A+9B1
 wnHA==
X-Gm-Message-State: AOJu0YyioouwR1+QgYoW+mYEFwlscdNGBJeW2TlZt92fxzvRNmh9Q0AZ
 k9IevDBZN3E/P9TyiNFVbxZHpk2cKpyuNZK89XIrSYFGobUpvkGLQ4LYIvsxcBOUmB2f0chU3/c
 gAQe4
X-Gm-Gg: AZuq6aKF7CrTds+pZwYH1eqjPn7heafftYNU4bGCydeD2h1lJ1r1355r6nC8T6FoAUk
 NeBV0mlBHpG6MW5s4DKzNS3R+vPgVL8FMMd3FUO0xztlGQ+X8jUP551vxYVNUpzcx0ohbmV/CqW
 kza/bMXD5dFxVvjOAUmKH+ZBznq/GEVKDtzV7i1hwEbjhYF3EDsWJ2s2YbUo34RU0tZCdXxZ2SU
 JBqHZpDcUDm84yLvBh+H2JmPxk1Fasu4fMXM+R4aUn1nhkhSjTrzKkJFOg+cY/fCrSn66IrcaYE
 ABisGKslVH6+NFvBZwyhf/I9B4eYrTrwXx/7CxbLJ5dkeDCQR+E+LJLm8Y28DdYqbWcqDI3q42A
 wFikZDj9RlngiqGMLEkxcHpeL0v4ZAkoyJsN1gw8jjYDiX8t3xyaTcs1jV0c6ms93DbO5lNjFas
 V8WaY=
X-Received: by 2002:a05:600c:314a:b0:475:dd8d:2f52 with SMTP id
 5b1f17b1804b1-48320226715mr63340245e9.32.1770451845626; 
 Sat, 07 Feb 2026 00:10:45 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483206b8ebbsm152099375e9.1.2026.02.07.00.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 00:10:45 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat,  7 Feb 2026 09:10:44 +0100
Message-ID: <20260207081044.18004-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770451846; x=1771056646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8yVZ4YF7Kyr9SF/m6ilHnqjHlw1bjASlk22JpBBUJkw=;
 b=e6lfAkc6XioygMxIuRzrF3zMqJ+JlTvXki5QKnp1Q37+CGu1JZX/nx3fXVHk7DGwOr
 i7yxU2GF54aU6baNG3I4r636GjfDUaoZ3BHRqG43MzVa4+P6VQvNGEyi+1x3ZOmFvaoz
 uSKFhKIlDvtfEvsdfDLkIvbPa/DS+0YNqvDqIc0gMynY9Y0AyLvRtS9IdoNNsJr9Gcjj
 VUf0NbdAp2JfLRbPzbhk7Gb3ceYZnsXqoTMubaNEiWHY18qx/bzUTvOTEiTZrP4Ls7za
 jpB96D5cVE/3uUpgF87Tt6C9Sf4KVVYVP3bt/KRZH9XyxdXLBOOcqxCZEUKG/7MC0fAg
 pH2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=e6lfAkc6
Subject: [Buildroot] [2025.02.x,
 PATCH] package/libselinux: revert "allow pip to use system-provided
 packages"
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit [1] which fails on the autobuilder because the patch
don't apply. This was incorrectly applied as it is specific for a
libselinux not part of 2025.02.x and fixes an error introduced by a pip
version not present in 2025.02.x [2].

[1] 32d1d7c367 package/libselinux: allow pip to use system-provided packages
[2] 285097051d package/python-pip: bumpp version to 25.3

Fixes: https://autobuild.buildroot.org/results/068/06854beaf880378da1b9ef75123de76465e5950f
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...akefile-build-python-module-without-.patch | 51 -------------------
 package/libselinux/libselinux.mk              |  4 --
 2 files changed, 55 deletions(-)
 delete mode 100644 package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch

diff --git a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch b/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
deleted file mode 100644
index 7f4a76515b..0000000000
--- a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8cfe4535f23a7768ee5efa615d11563a8404777c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
-Date: Mon, 27 Oct 2025 22:40:59 +0100
-Subject: [PATCH] libselinux/src/Makefile: build python module without
- isolation
-
-The "pip install" logic in libselinux/src/Makefile tries to get
-setuptools from the network, which is not correct as during the
-build/installation, there shouldn't be any network access, or
-downloading of arbitrary resources from the network.
-
-This causes build issues in Debian:
-
-  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121121
-
-And in Buildroot:
-
-  https://autobuild.buildroot.net/results/0e9/0e9de0c0d8b6ec57eea9f8834f02076b296ba4f1/build-end.log
-
-To fix this, we use the --no-build-isolation pip install argument so
-that pip install is allowed to use the system-provided setuptools,
-instead of wanting to download this one.
-
-This patch is derived from
-https://sources.debian.org/src/libselinux/3.9-4/debian/patches/Build-python-module-without-isolation-Closes-1119155.patch,
-with the change that --no-build-isolation is passed unconditionally,
-regardless of whether $(DESTDIR) is empty or not.
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://lore.kernel.org/selinux/20251227143911.1630813-1-thomas.petazzoni@bootlin.com/
----
- libselinux/src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
-index e9141bb9..9bc10606 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -197,7 +197,7 @@ ifneq ($(DISABLE_SHARED),y)
- endif
- 
- install-pywrap: pywrap
--	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
-+	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --no-build-isolation --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
- 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
- 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
- 
--- 
-2.52.0
-
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 7bc33392d5..360ab063ca 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -35,12 +35,8 @@ LIBSELINUX_DEPENDENCIES += \
 	python3 \
 	python-setuptools \
 	host-python-pip \
-	host-python-setuptools \
 	host-swig
 
-LIBSELINUX_MAKE_ENV += \
-	$(PKG_PYTHON_SETUPTOOLS_ENV)
-
 LIBSELINUX_MAKE_OPTS += \
 	$(PKG_PYTHON_SETUPTOOLS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
