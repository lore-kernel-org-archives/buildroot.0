Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB6AC61DC2
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC62C405A1;
	Wed, 26 Aug 2026 12:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFsAEwpMPwko; Wed, 26 Aug 2026 12:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747817;
	bh=M48H/+7xr1qURKmAXz4ypH8TvHDh3H4L+ySHzw0z/yw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JhYAQb0vOi32Htj8AUsgBIdyfcg1kI7YCz3yg0/IDT9rP81CTPHzmtAB7A1Mkt7uB
	 ZoLTw6E+E/ZuA0kAyobXxE1p0kIK1S4/drPhu0GwJzruJwR20wvRDZvBprQJugB2xV
	 xO53ZI/c49Xx2AepHglCHI8UfGeUVI+x7UE5HyFDbYWfcu2DaweGED/dlfXzGjXmdO
	 KVSpvvG25fzPKpKb4J30MWcxVg19pAksw7gXCAnm3tWp1Y15LOm5+JFDmDPk45AQYC
	 ps3xtdcbdek68ZHt+L/CDRbWfsjULzirAwpvvr/fUXVmjXnOqilAEZVoOGtMILmQKG
	 XmC+FJdLNwIAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3ABE40562;
	Wed, 26 Aug 2026 12:36:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 928D1472
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 847E640115
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nH3CnS_k55xx for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3681E4005F
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:52 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-69f7fa1c548so1668201a12.2
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747810; x=1788352610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EuEaqjvvLztgOzta42Fu+i1UnSnkNsFjRrMJlgZF3ls=;
 b=hbnh3cUiSFRpW1HtBAzBoeIPyCJuj3nJm2daYddMdSQG2JJN8MT+EYapuhdMKnuByJ
 wK3x7rHobEBzMHNq6TZ/b+4iR0hqOkeXUnnPYDDhYvcWQ1lj0kVpFe2HNVyj4ss3lv/C
 9CQ2J/BWhlZ/5k9NKW69SQt2rgovW8fbvp7fk2BgX0Ww80zLesSdrr89EZfZUg28Rvhx
 X3R5jwFrtUMBLE0woQVq6Lv3C6xWQCC1D2musukiFKuQcETdELCsbjoF6Lv0HNGtG0uL
 RK0QrKjxPfCUeSacr5XAIFWQ1qW8v38CJm2voSq94jtAnnRtElxaPHD9A5HGBFCZwatn
 Bg1w==
X-Gm-Message-State: AFuF++m3iPWQkEphpdJ344rSdyNoea50VE0JDNfeWB+PdjRD6yqXYxqd
 oraNZRWXpR7k4eom2Gukm5mXDL502EAqlgza0KhzPEhju4h2OrOutk3Ou/tDpd/YjmGJndC5qTf
 FQ+mTIhk=
X-Gm-Gg: AR+sD12EsAoeiIZGkQHewYVt45/D7xE/qVTkXCLgV4m3ugxPXrK/N+2kJWRlMssLwRv
 DkVsd5Am/RNZFAbZCtLUg6e1HOAv9sgB4Ajz2eq6ZcDDazMBtFT9EmA3LN8rTjgSLA75LimiDuT
 2w68BJv0j9XdgQwWHDgZVM+W+UzepyRkMLK2OAWI5Vm3G7zOhTYfZbdiDKfjaN/grDmvwTDfaLa
 UZwSZIUApdh4peRQ/unk3FdfidSDoXp5gbOik63zHKUMGlU3Z2xGo9jOEe5qEjxsdpsNo0Dabhc
 JXdx914JEK6Tf9aX+2CNq1PX/YyaNxNvi92UIPlMKJ/kLOTX9ocf9cYb4pSNeJUidWKVLjIKcOB
 sEXhASSQIUKB886GsJDJEzd/9BtTNhdc8lRcpu+15OO+DsiXnEYbBjrqC0QB2sV6Qzfc3YN+W0S
 jL/2Az73mExxvi11Ni98VCjB4bkkUdJaF1nm5NJhcjWrJ89+mr9XftifrGP088hrrIGu9oJy3m5
 hAY5CEk2pKkiv8=
X-Received: by 2002:a05:6402:24d1:b0:6a3:f74d:6a47 with SMTP id
 4fb4d7f45d1cf-6a5df32a614mr7366164a12.0.1787747810441; 
 Wed, 26 Aug 2026 05:36:50 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:23 +0200
Message-ID: <20260826123637.410258-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 02/16] package/clamav: add patch
 for CVE-2026-20031
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
