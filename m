Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9E4C021AB
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1DF500E8;
	Wed, 19 Feb 2025 08:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPEL_exVmj9M; Wed, 19 Feb 2025 08:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2714E503B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2714E503B8;
	Wed, 19 Feb 2025 08:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5390FC8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4406281263
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8nJEEnRRImR for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 403F78128E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 403F78128E
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 403F78128E
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38f2f783e4dso3749403f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955046; x=1740559846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S/31xwqh6dKYS7kMMiwZg/XyQ9FtMJZEelCfGaU6wxg=;
 b=AVhc6c0pHgc77zMQWwYhtY2ZqeGzNT5Gpyc2m6cy1Np71SDO+HPZgmhyVzSNNAWrNu
 /RcLId7PnmoMPys/6jiFG4w2vfE/S/wQ/CuLSTvTWN2Rp32I8rGbqilXtqmcyqPlQYaY
 bbuGRXYLErxTWmdK71ky7gTnktx5w0u6jFCJXexDXxbHDM1TTo9gqaMXi+lMCJ69+Kfy
 1G6B2rKlsxE/gfhBd+MwDsqCr5kkvYhPF3LzOY2t0GTeoj8zrO58PfQ45aHZUuiw/gv8
 8/7UuGbov5NfIEqRnHwynZbKAcuzPH1wT1ChTPGk6E4QyxQRdmTDilQfF96VTHLO9Ga/
 NoAA==
X-Gm-Message-State: AOJu0YynsFk/tBk9bPGmxweFa82xdbtpvv8bcTRa6um7kYs7HW0vJyJe
 v4B5OdJvIAVRVRydU8O3hyCUC4jFZ+QzchEBqmKbOIRmmejxnqjVH8JsnQ==
X-Gm-Gg: ASbGncubjy7Idn57JOtOQ0oWizo8B2IBRfpFEKKeuyNMnUlrkq54rYsVK2Wf4XZ7BzZ
 o87EgX9UbvNrE/uuyBWKCxwHC2WYF0pw78Yzz9Iw52/2WVdSgMfI+by3lXikJodcgNclEWxNWbX
 aXWbdEStvhgE7VlDx678zHMbUFlBnMjx3ERDQC/ZZd/LrPfBpywIUy3SU5Wg7Yf4RxcdWTEm+0t
 do/j26GENTGkcWtAQ+4TM06bIJwc6XZqG+rIrV9QD1V46xCpEbcw9ThbDBPlEbnoaJU4Y+t8Vch
 TMfrAgzdE2WYa8bZ/Pt08xndRw==
X-Google-Smtp-Source: AGHT+IHhgsliSDrhiHL7/E3RTsiUpPrqIeHjEfcpMQoD6b8CtNXMqFsbf+pOuK04X2ZYayQFeGrlmg==
X-Received: by 2002:a5d:47cb:0:b0:38f:2bd4:4f83 with SMTP id
 ffacd0b85a97d-38f5878d63bmr2563282f8f.16.1739955046044; 
 Wed, 19 Feb 2025 00:50:46 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:45 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Date: Wed, 19 Feb 2025 09:50:20 +0100
Message-ID: <0cbb0ff66b7c0ed1b22412d3af6de95b79efa96b.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955046; x=1740559846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/31xwqh6dKYS7kMMiwZg/XyQ9FtMJZEelCfGaU6wxg=;
 b=fAm1eZtpt6p6wcxuQg2otDmH0TutKARSpSbih+9LY9PH+RQa6Hst1g8tgS5GoAqzw0
 AX34i743yJHWnvhd7B7ixTzEJZi4FbpoBKtp7D9ISurdJrt6HjjnLo7Ntv79ujezM4Mo
 cWkf6ABVnKIHb0MJJa3iRpXdKSmQJpq1TJbkaZlACBakZCnlOXh90HQfKvu+6op8p8ii
 QjS2jpxDe/EHDbGdyJGpHwKx2KgF36RD4+6wYIgMKlKu11IeI5WalWeF3DidRPOHOLl5
 uRUyDR8/SA5rGKi30DDyrNQQ3Y6vn2vA1kZ6HIeOm5CVdFFVSJ0fHW4/qpqP0cLe2Mlr
 bHzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fAm1eZtp
Subject: [Buildroot] [PATCH 05/27] package/some-font: new pseudo-package
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
installed; most of the time, any font will fit the bill. However,
we currently have no way for such a package to just require "some
font"; it needs to actually select one package providing fonts.
If the user selects another font package, then the one forcibly
selected by the package would be superfluous.

This commit adds a pseudo package (in fact, just a Kconfig symbol), that
packages can select when they just require some font, but are not picky
on which font that would be. We currently decide that the liberation
fonts would be the default ones.

Conversely, also add a Kconfig symbol that font-providing packages can
select to indicate that some font is available, in which case liberation
is not forcefully selected (of course, liberation can't, mustn't, and
doesn't select that symbol).

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
index bd3a00abc3..cb84e3caad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -261,6 +261,8 @@ comment "Cursors"
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
