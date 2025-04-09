Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0A4C369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9942E83F70;
	Wed,  9 Apr 2025 20:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y146RWKSpe-a; Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D60483F6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D60483F6A;
	Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F207D6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B33A83F62
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDG2shYkHLfg for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D1A882375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D1A882375
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D1A882375
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso928975e9.0
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229027; x=1744833827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dco7Pvzaw8aMsbOjlFp/I8SIbuYc1hCUkoinJ37n60k=;
 b=rHP0XrvQmHOaOig0w/AZ3Ft9UQa3Mxl0YPYyZ023pnTFaGCyAXsPIxFJsqi5i9+45F
 c73bgdiPS5hRRmkCP++9FiPIRtnnGcRzhZ4JqeHkba0zFZH7Y/DAsDc+peSVT8+2KMpM
 SVG4JJjkFkBndKRBNV7qtBaykW6BUSzUb+dNGh8CF/1KwQ/lDqxOMRnEwxMGpZ5WiqBE
 9RI5UijCJ8SWGu4HVVXSTWqi2n0F9bNLP2QasjetJutBZm/hlH2WUETP2aM/Z0BjTPYo
 gu+9+dPs6Z58iLOalTF343ejzz2uF5zneEGZfGBf7z9N48/8wxN0hClc3TO+Sbrge3Ix
 789Q==
X-Gm-Message-State: AOJu0YyIjA2TQekl/Q8xKVFiTcnC8XvcXmbOAucGOC1Qn5SVcEv3EAGT
 fmJTv4cbI8NWgzXfIAYY4oTeQDb3lw+2I3Q1ZAEHqvunFTl2W/yS243A5w==
X-Gm-Gg: ASbGncunOkyXeqaQZe+SfI/C5iDli4z7iQlJ+PBqKUx4F6hVjv8BKjODs6J+dJqPnrH
 zTRVt+v3Inmhv3X907Q0rwnu9VwzrlsbpbNa+yj7S1pcRWowJjh3TeIMYl4YTN21Vm5vG2V0CHF
 BFGXHaYlb3n/xSohDKCrXCUktawkduhmD+cOQGauPUI2N74Sgv9UnjLRGKD6rjkulRS8f1csOhj
 QjCO5tRpr+g4MD2mA2HIlrO46TOCLO9yh5pAC/3lVQHkZUWmFt99lu/K8Cjvk5ZQfmMTyjQYE1L
 EwGA/2LYIc6FKKUdsO8RG9PDD8/+1kCmEJHXZ+RRnGHCS3HUzr5I8Ro1nztgfQ==
X-Google-Smtp-Source: AGHT+IFetYIusDByXdw1tX/Ev4CWvFFZAQCjurHD5HTtrzWNO5rZzEgBy5aSzPnb3LDdG25JYU7T/A==
X-Received: by 2002:a05:600c:1f08:b0:43d:1c3:cb2e with SMTP id
 5b1f17b1804b1-43f2d7f1c47mr3577745e9.17.1744229027011; 
 Wed, 09 Apr 2025 13:03:47 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:46 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Date: Wed,  9 Apr 2025 22:03:20 +0200
Message-ID: <a3ca11ad3e18a764e8bb4f4df7bd488f07ba88a1.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229027; x=1744833827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dco7Pvzaw8aMsbOjlFp/I8SIbuYc1hCUkoinJ37n60k=;
 b=PRG1nQpW838gJcmjwqCs/5TVpdX+IC2QF+xUIsSSxK8bLmiDWTschPxpQ7XownEFze
 CA9X6ikTLG0i2IIEnzQ5clKMz6lEVgm8BbcZ2sfCf4EcejbjZAxUdZie3N0mJiD5/nQQ
 Y09wud8EPMaKhQOyIGLILUgYNSjAPaeJp8MhiZx8vUupDqCI6n+DCrozYM8uhkjchJ48
 aW0sOCkVFrbAbiT1hi5G1xzFmupipElOgsoOjn2/kQcZwFBWhIvyy4KZe/j9lbOp/yWk
 3GB/BEwE2Krpancnlb6PejVs4Mus/f7SGvUEbBp1tqFf9topc09FUCGs8fXkUUuX0wkI
 TGtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PRG1nQpW
Subject: [Buildroot] [PATCH 05/29 v2] package/some-font: new pseudo-package
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

Packages that will be rendering text, will need that some font be
installed; most of the time, any font will fit the bill. However, we
currently have no way for such a package to just require "some font"; it
needs to actually select one package providing fonts. If the user
selects another font package, then the one forcibly selected by the
package would be superfluous.

Fonts are a runtime dependency, not a build-time one, so we don't need
to handle it like the virtual packages. Furthemore, multiple font
packages can be installed at once, this is perfectly valid, so we can't
use a virtual package.

This commit adds a pseudo package (in fact, just a Kconfig symbol), that
packages can select when they just require some font, but are not picky
on which font that would be. We currently decide that the liberation
fonts would be the default ones.

Conversely, also add a Kconfig symbol that font-providing packages can
select to indicate that some font is available, in which case liberation
is not forcefully selected (of course, liberation can't, mustn't, and
doesn't select that symbol).

This also allows packages from br2-external trees to advertise they
provide fonts, too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 package/Config.in                   |  2 ++
 package/bitstream-vera/Config.in    |  1 +
 package/cantarell/Config.in         |  1 +
 package/dejavu/Config.in            |  1 +
 package/font-awesome/Config.in      |  1 +
 package/ghostscript-fonts/Config.in |  1 +
 package/inconsolata/Config.in       |  1 +
 package/some-font/Config.in         | 17 +++++++++++++++++
 package/wqy-zenhei/Config.in        |  1 +
 9 files changed, 26 insertions(+)
 create mode 100644 package/some-font/Config.in

diff --git a/package/Config.in b/package/Config.in
index 291e784f26..28bdae9c1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -262,6 +262,8 @@ comment "Cursors"
 	source "package/comix-cursors/Config.in"
 
 comment "Fonts"
+	# check-package disable lib_config.CommentsMenusPackagesOrder
+	source "package/some-font/Config.in"
 	source "package/bitstream-vera/Config.in"
 	source "package/cantarell/Config.in"
 	source "package/dejavu/Config.in"
diff --git a/package/bitstream-vera/Config.in b/package/bitstream-vera/Config.in
index 034f115b4b..ea448894af 100644
--- a/package/bitstream-vera/Config.in
+++ b/package/bitstream-vera/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BITSTREAM_VERA
 	bool "Bitstream Vera"
+	select BR2_PACKAGE_SOME_FONT_AVAILABLE
 	help
 	  Bitstream Vera font family.
 
diff --git a/package/cantarell/Config.in b/package/cantarell/Config.in
index 78af96d595..6d9c7f9641 100644
--- a/package/cantarell/Config.in
+++ b/package/cantarell/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CANTARELL
 	bool "cantarell"
+	select BR2_PACKAGE_SOME_FONT_AVAILABLE
 	help
 	  The Cantarell font family is a contemporary Humanist
 	  sans serif designed for on-screen reading.
diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
index 771ec38514..ed92cfb3ad 100644
--- a/package/dejavu/Config.in
+++ b/package/dejavu/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DEJAVU
 	bool "DejaVu fonts"
 	select BR2_PACKAGE_DEJAVU_MONO if !BR2_PACKAGE_DEJAVU_HAS_FONT
+	select BR2_PACKAGE_SOME_FONT_AVAILABLE
 	help
 	  The DejaVu fonts are a font family based on the Vera Fonts.
 	  Its purpose is to provide a wider range of characters while
diff --git a/package/font-awesome/Config.in b/package/font-awesome/Config.in
index 694d74e5a8..22826ee5ee 100644
--- a/package/font-awesome/Config.in
+++ b/package/font-awesome/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FONT_AWESOME
 	bool "font-awesome"
+	select BR2_PACKAGE_SOME_FONT_AVAILABLE
 	help
 	  Font Awesome is a full suite of 605 pictographic icons for
 	  easy scalable vector graphics on websites.
diff --git a/package/ghostscript-fonts/Config.in b/package/ghostscript-fonts/Config.in
index 9b9b8d0cd2..cc4e28263a 100644
--- a/package/ghostscript-fonts/Config.in
+++ b/package/ghostscript-fonts/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GHOSTSCRIPT_FONTS
 	bool "ghostscript-fonts"
+	select BR2_PACKAGE_SOME_FONT_AVAILABLE
 	help
 	  Fonts and font metrics customarily distributed with
 	  Ghostscript. Currently includes the 35 standard PostScript
diff --git a/package/inconsolata/Config.in b/package/inconsolata/Config.in
index de6b388574..eb7eb1328a 100644
--- a/package/inconsolata/Config.in
+++ b/package/inconsolata/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_INCONSOLATA
 	bool "inconsolata"
+	select BR2_PACKAGE_SOME_FONT_AVAILABLE
 	help
 	  Inconsolata is a monospace font, designed for code listings
 	  and the like.
diff --git a/package/some-font/Config.in b/package/some-font/Config.in
new file mode 100644
index 0000000000..d4d1296a20
--- /dev/null
+++ b/package/some-font/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_SOME_FONT
+	bool
+	select BR2_PACKAGE_LIBERATION if !BR2_PACKAGE_SOME_FONT_AVAILABLE
+	help
+	  This package does not provide any font of its own;
+	  instead, it ensure that at least one font package is
+	  enabled, and thus that at least one font is installed
+	  in the target.
+
+	  Select this if your package just requires some font,
+	  whatever that may be.
+
+config BR2_PACKAGE_SOME_FONT_AVAILABLE
+	bool
+	help
+	  This blind symbol should be selected by any package that
+	  installs fonts.
diff --git a/package/wqy-zenhei/Config.in b/package/wqy-zenhei/Config.in
index f9135e01a1..77be22dd4d 100644
--- a/package/wqy-zenhei/Config.in
+++ b/package/wqy-zenhei/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WQY_ZENHEI
 	bool "wqy-zenhei"
+	select BR2_PACKAGE_SOME_FONT_AVAILABLE
 	help
 	  "WenQuanYi Zen Hei" is a Hei-Ti Style (sans-serif) Chinese
 	  font capable of text formatting and on-screen display of
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
