Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98737C624D6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DE9240A34;
	Wed,  2 Sep 2026 13:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoRJ-3nDSjNg; Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355031;
	bh=M48H/+7xr1qURKmAXz4ypH8TvHDh3H4L+ySHzw0z/yw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jVmmhd+v1G+6QVljp0zomlVTrUE+5yqrU1BCfZLvrO3ZfZMoz09jwLhNLiQGw+lQC
	 liFHBlbJ90OG61kkOHzatlIH4ZAH8m1TlC7r1XtiEdv/6dAF0Ri/8q1avOVXgjlGoB
	 Bm6nSjfd46G9OaVE3o8cGygI1a7JOw8ppyQLavrMmnRRXh5xtS5feVI7fGab06YxXd
	 OtYcwWasump2Drf/UF6txNFxE6C6XreNSFsrWrZDKKqBoo2B65nvf6uCFWuixDHXE7
	 /Ck0GmpULJsLM556/r+W/oYwYAIFoocxhDt5OGPG6YEntfn49QSwAUhfko2N9rGdIA
	 vpMVlAeEVeIrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6039240A3A;
	Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B62E230
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D78B405AC
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNuGX3_bxOBi for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE46C40577
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:03 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48444ec4fe2so554182f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355022; x=1788959822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EuEaqjvvLztgOzta42Fu+i1UnSnkNsFjRrMJlgZF3ls=;
 b=Np+HiEnKA5A3yDDPpOLaBGHEDgcR5AU/yLzVkcGO/tBY3jHGPuTbfqWUEiTHotP4MF
 eeYzJtEjfytGMVpLaHlN9GtVyvHYvixMaoUlPnGG2qLTOv23W2ybjNGBPeUG+h7hJBQ0
 nyNa3O0+epINnDTxB0GS240YpQk84ZiBIovz4g3WwC6EG4ZxRQ7cvha2MzhIvx7kltP8
 czQKdG0op8/EmFUUA6VG4sQkFmqjes7VtmFItOp59w7wUi+E1mMNMPO8/CK6Eg3KDvYT
 Gf1ZVhgX4CpT6kkGW0GvhfpEXY12znI9A7Qe9WfZUR5MujtvUEFdFIaY0q6srFAzCAml
 RsTg==
X-Gm-Message-State: AFuF++nToTMgYzax289kMEoC5NMIEMovv8JGVW+XGA8i0d9BAL2gBI1E
 bE3F5S5dcCWxJ5K3tNhIlBlh4eAkQtl+s9WlB+oaFEXauHe/mJjhmLkID9EMow3TuyQ6AIgx8aC
 jG/CeWdQ=
X-Gm-Gg: AYBFou3HBC4Q5E1R+lAJnu5bn/vFXvezmWo7Reycb9h14IIRQN4ZZtcZK/rYdMr3xd4
 nbxe9dchP9hSfcCGBrAVo7vk2vbEugqVbaE7T5cXo+IU1BmRTw96iwYY9T5t3q/W9nk/DTdw98C
 xtf5CW1IDKnbZK0V42Bn47bWa6YZ7llWD5D00AWQ8elYPklFpRIalQ1OAKpic6UViMCHqUiisv0
 V9pOUoDvgskPrEVeitMk8elJAg9o43pOyPQGp+EifEjArnm69eOyIgM1AXTjUvJI0cwrfTsSX4m
 EbqsiWwk6R+5Vl19/wCZMudS+Mg487NDDsV+/ksnmtuFwVn96vujblwXpmjd2/xON/q97/CDNM7
 EjYugSuiO4ZHpF8CyUIlJei/Gsbvi+r/HqJQsAOuavfrQ1hDMYJ0uNraWjMP3W/Qm1M8pJG+Q5x
 wplQ8M24xg/qnJrq5/1uhlsNdhfF0Rk7DcClZZiTnfP4rX3wyxSZhwqciGJzgWfO++NvoEM7EIj
 h32
X-Received: by 2002:a05:6000:2481:b0:484:3310:710b with SMTP id
 ffacd0b85a97d-484913bf064mr7660619f8f.23.1788355021454; 
 Wed, 02 Sep 2026 06:17:01 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:27 +0200
Message-ID: <20260902131640.379588-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 02/15] package/clamav: add
 patch for CVE-2026-20031
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...-panic-when-scanning-some-html-files.patch | 240 ++++++++++++++++++
 package/clamav/clamav.mk                      |   4 +
 2 files changed, 244 insertions(+)
 create mode 100644 package/clamav/0001-fix-possible-panic-when-scanning-some-html-files.patch

diff --git a/package/clamav/0001-fix-possible-panic-when-scanning-some-html-files.patch b/package/clamav/0001-fix-possible-panic-when-scanning-some-html-files.patch
new file mode 100644
index 0000000000..8ed631a379
--- /dev/null
+++ b/package/clamav/0001-fix-possible-panic-when-scanning-some-html-files.patch
@@ -0,0 +1,240 @@
+From: "Val S." <mx.val@icloud.com>
+Date: Fri, 5 Sep 2025 15:53:23 -0400
+Subject: Fix possible panic when scanning some HTML files
+
+It is possible that invalid UTF-8 characters may trigger a Rust panic
+(crash) when parsing CSS style blocks to extract images.
+
+The issue is using `split_at()` instead of `split_at_checked()`.
+
+I also found a few places where I could use string trim methods rather
+than doing that logic manually.
+
+Thank you to Krishnap7p for reporting this issue.
+
+CLAM-2819
+CLAM-2828
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/1818981219beeecf94ee91e0fa68972f1f239ac0
+CVE: CVE-2026-20031
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav_rust/src/css_image_extract.rs | 141 +++++++++++-------------
+ 1 file changed, 62 insertions(+), 79 deletions(-)
+
+diff --git a/libclamav_rust/src/css_image_extract.rs b/libclamav_rust/src/css_image_extract.rs
+index 394c86816f..bf637c78dc 100644
+--- a/libclamav_rust/src/css_image_extract.rs
++++ b/libclamav_rust/src/css_image_extract.rs
+@@ -66,10 +66,15 @@ impl<'a> CssImageExtractor<'a> {
+         'outer: loop {
+             // Find occurrence of "url" with
+             if let Some(pos) = self.remaining.find("url") {
+-                (_, self.remaining) = self.remaining.split_at(pos + "url".len());
+-                // Found 'url'.
++                // Found 'url'. Get the stuff after it.
++                if let Some((_, rest)) = self.remaining.split_at_checked(pos + "url".len()) {
++                    self.remaining = rest;
++                } else {
++                    // Split failed.
++                    self.remaining = "";
++                    return None;
++                }
+             } else {
+-                // No occurrence of "url"
+                 // No more 'url's.
+                 self.remaining = "";
+                 return None;
+@@ -78,8 +83,14 @@ impl<'a> CssImageExtractor<'a> {
+             // Skip whitespace until we find '('
+             for (pos, c) in self.remaining.grapheme_indices(true) {
+                 if c == "(" {
+-                    // Found left-paren.
+-                    (_, self.remaining) = self.remaining.split_at(pos + 1);
++                    // Found left-paren. Get the stuff after it.
++                    self.remaining =
++                        if let Some((_, rest)) = self.remaining.split_at_checked(pos + 1) {
++                            rest
++                        } else {
++                            // Split failed. Was not whitespace or '(', and maybe not a legal char.
++                            continue 'outer;
++                        };
+                     break;
+                 } else if c.contains(char::is_whitespace) {
+                     // Skipping whitespace.
+@@ -103,7 +114,13 @@ impl<'a> CssImageExtractor<'a> {
+                         depth -= 1;
+                     } else {
+                         // Found right-paren.
+-                        let (contents, remaining) = self.remaining.split_at(pos);
++                        let (contents, remaining) =
++                            if let Some((c, r)) = self.remaining.split_at_checked(pos) {
++                                (c, r)
++                            } else {
++                                // Split failed.
++                                continue;
++                            };
+                         url_parameter = Some(contents);
+ 
+                         // Set the remaining bytes so we can look for more later.
+@@ -123,65 +140,14 @@ impl<'a> CssImageExtractor<'a> {
+ 
+             // Strip optional whitespace and quotes from front and back.
+ 
+-            // Trim off whitespace at beginning
+-            for (pos, c) in url_parameter.grapheme_indices(true) {
+-                if c.contains(char::is_whitespace) {
+-                    // Skipping whitespace before url contents.
+-                    continue;
+-                } else {
+-                    (_, url_parameter) = url_parameter.split_at(pos);
+-                    break;
+-                }
+-            }
++            // Trim off whitespace at beginning and end.
++            url_parameter = url_parameter.trim();
+ 
+-            // Trim off whitespace at end
+-            for (pos, c) in url_parameter.graphemes(true).rev().enumerate() {
+-                if c.contains(char::is_whitespace) {
+-                    // Skipping whitespace after url contents.
+-                    continue;
+-                } else {
+-                    (url_parameter, _) = url_parameter.split_at(url_parameter.len() - pos);
+-                    break;
+-                }
+-            }
+-
+-            // Trim off " at beginning.
+-            let c = url_parameter.graphemes(true).next();
+-            if let Some(c) = c {
+-                if c == "\"" {
+-                    (_, url_parameter) = url_parameter.split_at(1);
+-                }
+-            };
+-
+-            // Trim off " at end.
+-            let c = url_parameter.graphemes(true).next_back();
+-            if let Some(c) = c {
+-                if c == "\"" {
+-                    (url_parameter, _) = url_parameter.split_at(url_parameter.len() - 1);
+-                }
+-            };
+-
+-            // Trim off whitespace at beginning.
+-            for (pos, c) in url_parameter.grapheme_indices(true) {
+-                if c.contains(char::is_whitespace) {
+-                    // Skipping whitespace before url contents.
+-                    continue;
+-                } else {
+-                    (_, url_parameter) = url_parameter.split_at(pos);
+-                    break;
+-                }
+-            }
++            // Trim off " at beginning and end.
++            url_parameter = url_parameter.trim_matches('"');
+ 
+-            // Trim off whitespace at end.
+-            for (pos, c) in url_parameter.graphemes(true).rev().enumerate() {
+-                if c.contains(char::is_whitespace) {
+-                    // Skipping whitespace after url contents.
+-                    continue;
+-                } else {
+-                    (url_parameter, _) = url_parameter.split_at(url_parameter.len() - pos);
+-                    break;
+-                }
+-            }
++            // Trim off more whitespace at beginning and end which had been inside the quotes.
++            url_parameter = url_parameter.trim();
+ 
+             // Check for embedded image data for the "url"
+             if !url_parameter.starts_with("data:") {
+@@ -190,7 +156,12 @@ impl<'a> CssImageExtractor<'a> {
+             }
+ 
+             // Found "data:"
+-            (_, url_parameter) = url_parameter.split_at("data:".len());
++            if let Some((_, rest)) = url_parameter.split_at_checked("data:".len()) {
++                url_parameter = rest;
++            } else {
++                // Split failed. Let's move along.
++                continue;
++            }
+ 
+             // The exact image type doesn't matter at all to a browser.
+             // They really don't care if it's "image/gif" or "blah blah blah".
+@@ -198,8 +169,13 @@ impl<'a> CssImageExtractor<'a> {
+ 
+             // Find contents after ";"
+             if let Some(pos) = url_parameter.find(';') {
+-                (_, url_parameter) = url_parameter.split_at(pos + ";".len());
+-                // Found ";"
++                // Found ";". Get the stuff after it.
++                if let Some((_, rest)) = url_parameter.split_at_checked(pos + ";".len()) {
++                    url_parameter = rest;
++                } else {
++                    // Split failed. Something in this data appears to be malformed. Let's move along.
++                    continue 'outer;
++                }
+             } else {
+                 // No occurrence of ";" in the url() parameter.
+                 continue 'outer;
+@@ -209,7 +185,12 @@ impl<'a> CssImageExtractor<'a> {
+             for (pos, c) in url_parameter.grapheme_indices(true) {
+                 if c == "b" {
+                     // Found 'b'.
+-                    (_, url_parameter) = url_parameter.split_at(pos + 1);
++                    if let Some((_, rest)) = url_parameter.split_at_checked(pos + 1) {
++                        url_parameter = rest;
++                    } else {
++                        // Split failed. Was not whitespace or 'b', and maybe not a legal char.
++                        continue 'outer;
++                    }
+                     break;
+                 } else if c.contains(char::is_whitespace) {
+                     // Skipping whitespace.
+@@ -227,13 +208,23 @@ impl<'a> CssImageExtractor<'a> {
+             }
+ 
+             // Found "base64"
+-            (_, url_parameter) = url_parameter.split_at("ase64".len());
++            if let Some((_, rest)) = url_parameter.split_at_checked("ase64".len()) {
++                url_parameter = rest;
++            } else {
++                // Split failed. Something in this data appears to be malformed. Let's move along.
++                continue 'outer;
++            }
+ 
+             // Skip whitespace until we find ','
+             for (pos, c) in url_parameter.grapheme_indices(true) {
+                 if c == "," {
+-                    // Found ','.
+-                    (_, url_parameter) = url_parameter.split_at(pos + 1);
++                    // Found ','. Get the stuff after it.
++                    if let Some((_, rest)) = url_parameter.split_at_checked(pos + 1) {
++                        url_parameter = rest;
++                    } else {
++                        // Split failed. Was not whitespace or ',', and maybe not a legal char.
++                        continue 'outer;
++                    }
+                     break;
+                 } else if c.contains(char::is_whitespace) {
+                     // Skipping whitespace.
+@@ -245,15 +236,7 @@ impl<'a> CssImageExtractor<'a> {
+             }
+ 
+             // Trim off whitespace at beginning.
+-            for (pos, c) in url_parameter.grapheme_indices(true) {
+-                if c.contains(char::is_whitespace) {
+-                    // Skipping whitespace before url contents.
+-                    continue;
+-                } else {
+-                    (_, url_parameter) = url_parameter.split_at(pos);
+-                    break;
+-                }
+-            }
++            url_parameter = url_parameter.trim_start();
+ 
+             debug!("Found base64'd image data CSS url() function args.");
+             return Some(url_parameter);
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 93ddfaae5b..56e4217f3f 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -23,6 +23,10 @@ CLAMAV_CPE_ID_VENDOR = clamav
 CLAMAV_SELINUX_MODULES = clamav
 # affects only Cisco devices
 CLAMAV_IGNORE_CVES += CVE-2016-1405
+
+# 0001-fix-possible-panic-when-scanning-some-html-files.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20031
+
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
