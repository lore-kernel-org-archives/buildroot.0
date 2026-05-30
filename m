Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80A9CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 802F94270D;
	Sat, 30 May 2026 17:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhaHFBtwBm2g; Sat, 30 May 2026 17:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9580B42740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162919;
	bh=q96KiLXukznojCBZaR5ox8gtstgk1cL8i5N2nXAr2O4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IBCY0oucaAFE0QtUQok0TGAzF2q3MAL63w/7JvNYOtLd/DHgu6Z4XpBhiap98WkoH
	 N11P2S+5uOYa11tq2F0D32TxvwWUdYlNr/sqxMqw46s2gr/TVZCT3tbx1DmGlsuV5s
	 P8W2IuwwjBqZJWj8YO5uoIqOxw32CieiisB6wz/kUzEMAFre1IEs8NPT+imKIqkOVH
	 pJ0YkDwC4KyNOzh+GBnTlYO7vc/kkGScb5PEiB/9CGKaalV7ZzYNR5qgVgLWqsZJDA
	 ZDW5hPviR62zsZFqs9lh2BIrBpGG4cb3ZxOrzvPHPy4oxr13Rn0sPfy9iuC4ww7f1B
	 5bg6WDdyzJmjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9580B42740;
	Sat, 30 May 2026 17:41:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65A31D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B05E853FC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jvlcq0sdtl_D for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C866853FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C866853FB
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C866853FB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:41:57 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-36d98b9aa9aso2168a91.3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780162916; x=1780767716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9OvFzHQErX90tzeNOFKo7yPNAK520sDcur2egjEnL4A=;
 b=fq13wCe1qAe3MOyiOXOofcSF08TWD/kk+snjJFa3zZfOwI6ggq+XmYrh/tISVTay6r
 +iteu5JPJ4oWJJy53tiuJhvdV6EpKVC6uj53vMNt2AuBGN4Blwzg+E/mHq4QpwUlHiAB
 SbCwBFYZGMDrB8jVx4OgCzNYUZcfa9agh21jdqVb7qZHllZPXeMWGO+mobDR5olLslJV
 eYy+y+OY6e9zFZCRG6secjbeZ+HYHEi8ouvaAJI0bwnnN0wCdl78ijmme5P6v46mmr6Z
 wh7CDcYbcXEUf57mfqbTKB4+EU5WQ3mZHgAjtCwnG4UsTMH5i7uUbZRAWjGDZ3TkUyZ5
 QjeA==
X-Gm-Message-State: AOJu0YzlEHadlOTC/mqJnuUIGqC6SjtcBP4Ir9Jl08kvsnxKzfsNw4yC
 XO0JXRKMj5/wrpuO8ghHwKHGN7PxrsOYWQ7rjNjK04HVoy9QV6KciSKHx1+fGS8nmeM=
X-Gm-Gg: Acq92OFnQJF/gApiQ9+VrvF9E09398xtdHAzT2HzFelWKvRmWlzmfvmWWKofHsaAlpI
 viuD975DaThiK5c2rGxinaYLUMxNA/7xQyjnaq2GQJ/2RtOcSfsCunM97FgqFBGNL4LTPT+HESO
 k9ZKAwhYAq8boDAML8yx8MypqC9Gv6PRQLF9iyW3zsQZ2NkwObVT9o8rNgTb8WGP7GuTvrh0OfT
 3Wu/txFLIqxGeow1wsJQ836udJvhR3vOUNgLJn0jKZGqHDMk2EE71mLYx22ikVVnLttj/DgAug+
 SLdUv6JNUdHiJy4yylv5MH/Rw8HlNIC4z0KbEw4/4uIi89KObLId/bMnfax5J9HYBN+cDQOQkhO
 M4WH5gT+vDn/Zp7W8cyMtocNkfNODpH70WbYbUWZ2i+kIJDDVjKK6/7kXjzOxlOxSqgDIPgreeH
 t/hVkbUyiWRftNSTfJ7dfIGHekM+noFo+puQIyDloXFQFMenrK4ChpCBYq5NbLt4FjSy8=
X-Received: by 2002:a05:6a20:6f06:b0:3aa:3fbf:d0a3 with SMTP id
 adf61e73a8af0-3b42821615emr4615069637.47.1780162916467; 
 Sat, 30 May 2026 10:41:56 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:11f0:fc06:1f55:1e4:b17b:8dd7])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85771a9299sm5161853a12.7.2026.05.30.10.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 10:41:54 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 30 May 2026 23:11:34 +0530
Message-ID: <20260530174139.28613-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530174139.28613-1-chakrabortyshubham66@gmail.com>
References: <20260404111250.154311-1-chakrabortyshubham66@gmail.com>
 <20260530174139.28613-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780162916; x=1780767716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9OvFzHQErX90tzeNOFKo7yPNAK520sDcur2egjEnL4A=;
 b=l0wKURcJO1tbp1npqGuGHQUAvorZ+UegBHp8w0vrrS2xkHHgFv0AFPn+vmLEKczJ8J
 VqM9lTW0du43oqZVSuhkgnJCx2vAwg6i5I6cp4k3YpOoaVSLv/LlKX3FSVjdkJgCiLjp
 XpXjBrMyQVJ1NKhRmnDRqr33kBJPuNWgEdvZALf4bUWHevxs89Iyl/mr9BGT5Vgi6L5Y
 6MPE3Qju9OKzTxzgqUj97WhtQm+gnujGhzdEteSYXkoGIlYUDp4MLWZ3bUqSTWKQuZr8
 iWNMii0J707ASCBAlbT4JdUEptzKKLwWWwgJm81IpedG49ru27R/HPSqTygLTwukNahf
 GsLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=l0wKURcJ
Subject: [Buildroot] [PATCH v2 1/2] package/font-awesome: bump to version
 7.2.0
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

This release updates the upstream icon set and related assets.
Refresh the source hash for the new release. Also drop the "v" tag
prefix as upstream dropped it starting from v5.0.

Add myself as the maintainer for font-awesome in DEVELOPERS.

License changes:
- Upstream introduced SVG icons as a first-class feature alongside the
  traditional icon fonts starting with v5.0.
- The new icon designs (delivered as SVG and JS assets) are licensed
  under CC-BY-4.0 (attribution is satisfied by the copyright comments
  in the files).
- The webfont files themselves remain under OFL-1.1, and helper styles
  and build code remain under the MIT license.
- Hence, the license is updated to: OFL-1.1 (fonts), MIT (code), CC-BY-4.0 (icons)
- Add LICENSE.txt for hash verification.

Directory changes:
- Drop "less" and "fonts". LESS support has been completely dropped by
  upstream in v7.0, and the old font files directory was renamed.
- Add "webfonts", which contains the newer .woff2 webfonts.
- Add "js", which contains scripts for the SVG + JS rendering method.
- Add "sprites" and "svgs", which contain SVG sprite sheets and raw SVG
  icons (the CC-BY-4.0 assets) respectively.
- Installing all these directories allows users to choose between the
  various rendering methods (CSS+webfonts, SVG+JS, CSS sprite sheets,
  or direct SVG usage) for their target systems.

For detailed Chngelog
- https://fontawesome.com/changelog

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/font-awesome/Config.in         | 4 ++--
 package/font-awesome/font-awesome.hash | 3 ++-
 package/font-awesome/font-awesome.mk   | 9 +++++----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/font-awesome/Config.in b/package/font-awesome/Config.in
index 694d74e5a8..40cadaf433 100644
--- a/package/font-awesome/Config.in
+++ b/package/font-awesome/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_FONT_AWESOME
 	bool "font-awesome"
 	help
-	  Font Awesome is a full suite of 605 pictographic icons for
-	  easy scalable vector graphics on websites.
+	  Font Awesome is a full suite of thousands of pictographic
+	  icons for easy scalable vector graphics on websites.
 
 	  https://github.com/FortAwesome/Font-Awesome
diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
index 89bc411f66..29c64cd40f 100644
--- a/package/font-awesome/font-awesome.hash
+++ b/package/font-awesome/font-awesome.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43  font-awesome-4.7.0.tar.gz
+sha256  8f433b74d3d4bbba2a6374a0a0ddf53be8e127809341e4c2578719229b43903a  font-awesome-7.2.0.tar.gz
+sha256  20c6f40715a567c97b80f6944beb8bb325835cab47ea7dcab89ee3b8e077eced  LICENSE.txt
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 5211ac22a5..2b1de910ce 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-FONT_AWESOME_VERSION = 4.7.0
-FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,v$(FONT_AWESOME_VERSION))
-FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
-FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
+FONT_AWESOME_VERSION = 7.2.0
+FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
+FONT_AWESOME_LICENSE = OFL-1.1 (fonts), MIT (code), CC-BY-4.0 (icons)
+FONT_AWESOME_LICENSE_FILES = LICENSE.txt
+FONT_AWESOME_DIRECTORIES_LIST = css js scss webfonts sprites svgs
 
 define FONT_AWESOME_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
