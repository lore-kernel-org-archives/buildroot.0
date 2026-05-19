Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BCDCD4F57
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 11:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D40240B7F;
	Tue, 19 May 2026 11:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Js2fWD3dNN5p; Tue, 19 May 2026 11:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70DB540B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779189779;
	bh=aFcuujUpdfH+oV/mYXAkxoJMNy4hhQ4mT4MC51NlKMY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fVg9gl4yiI4V3R5csP41mbt9vzcMJ03zgnUjvbOyR4MuP5Ki/SN0TZBkjKkwe+IZC
	 r3JfMw3rvxW/qt1ekeZJ03wBearekUJxuL7uOSXwZG9FGir+9UY/M0P8ZZvS9KwJAf
	 yh8J0Ty/j4U5DdTxTq1n9kIMYn3T9Skryy6QwWp0ZhtHG9uEPW5ybjtRGtt/Pg0h2o
	 VLvdz3JAp/KmqjnIqCAfrup0IlhBqRIvNjYjIu361Sd5gEkApnBXjXFj7yjzXJ0Qdx
	 Qe78UsIZCNZiobHfTVS6RQpwzCnOweIhiZ+wC1LSBrMMldFIgWvAIkInyYItA+U3uk
	 5zU1lHr88m09w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70DB540B89;
	Tue, 19 May 2026 11:22:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCCEB1B2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 11:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2581403AF
 for <buildroot@buildroot.org>; Tue, 19 May 2026 11:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdTT78RAYS_l for <buildroot@buildroot.org>;
 Tue, 19 May 2026 11:22:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DD15400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DD15400DC
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DD15400DC
 for <buildroot@buildroot.org>; Tue, 19 May 2026 11:22:56 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3665b67ed66so2073393a91.1
 for <buildroot@buildroot.org>; Tue, 19 May 2026 04:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779189776; x=1779794576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PDjpRDuxtIQQRgR/QOv+KUlO+q41J3XC4BCJ2jiVbYI=;
 b=I1Q63v7tOS7mqi0AYE0qpgw8gyLPIK5sDbLzT0HTFdw6chwiAJjVOQ/qFkh7+c4/1Y
 n5fD2GvPgUtd3Zxp5GFJGyp2kSkAlH2oX/3woZ7MIvD84gXL51tMEX/h+p3w7tN5dbll
 wzy3GIGzUV5GaQwfILxbfJSqpMINiOz7xRaObpsRg7FzbQBtInSI+JEUoWSB8UEw0beY
 OXiiW54/wIVnhQIr3euKicEODa/9A5citRIoYwSlGRoJi9aYAqCvJft3NuWCy0HfURLv
 54oOkmnFKxEFjcw1OFzmzdBL2LA6i81YEXyQgjfuf9D7vxx/AIjYcTi1+srmd6nZ+GtW
 jdMw==
X-Gm-Message-State: AOJu0YzG+nLZYB0vOrY2T8e63J0U1EZnaiKZswZOXBolOe3XdvsxPs+Z
 l8qk/7/DvP7UNqd9xY4CAnvjlgfE+3xfrz/pmhc6VDA7tioYsJnv4fNqyGXEYg7x
X-Gm-Gg: Acq92OH/1K8nTyrhbE5DqWIgGC2L9WvkMeGGmrZvY8jYE0wD7FD+N3DAYsDp1IjLgOX
 XjBMID6L9tATmyP0qTzeRejFeBiP0E6Nn+/0M47ncjGuuDOLcguq1vFZzVJuXCL6tEwZQn6uoTG
 NDbxhlaoVVIJDscg2XojGgSijVQaCZ/O3VrNHuauJLigCNCqeo6iFq6dTh3sm9HqL2tjqkigoRo
 BXxIH8HeUvwIvWLoPxgJUmvn7Cp2RJODnG6eUkxYN17GhqSym4JhEeAl2GrfxBb7vgbDGdikHAm
 PwzGfwbHFVCmPGVrGVDPEGcH+UYeirPiyB5qWPRXHSRli61kJUiKEqDkNMwCsdcISjCVKZv/TF6
 ilPPHK8jq71tSnR/pbG/zAYDs5WA6+L0GYR9Itx651TawXzAWD5Hf635IE44ilv6bQZliQ1Y1GX
 sJOfOA29Xv0mHqiJZeFdZBUzbSZKQkgIz4pMgr9jQGT3cBdutjwqxw0SWwXZzkzLckLpL5
X-Received: by 2002:a17:90b:2742:b0:368:cefe:ddd0 with SMTP id
 98e67ed59e1d1-36951b82f8fmr19732322a91.15.1779189775767; 
 Tue, 19 May 2026 04:22:55 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:4064:eb8:db2e:21ee:85e:2f41:2938])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-369517a8612sm14229703a91.12.2026.05.19.04.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 04:22:55 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Francois Perrad <francois.perrad@gadz.org>
Date: Tue, 19 May 2026 16:52:41 +0530
Message-ID: <20260519112243.1793562-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519112243.1793562-1-chakrabortyshubham66@gmail.com>
References: <20260403082641.491778-1-chakrabortyshubham66@gmail.com>
 <20260519112243.1793562-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779189776; x=1779794576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDjpRDuxtIQQRgR/QOv+KUlO+q41J3XC4BCJ2jiVbYI=;
 b=DazkdVHGTluXLykpSWfm2omSQOAt5HxnqqKo9fZELntWWthTGYZLA5r2oRslfeXIW3
 V2i+ukxnejCrIe/kZPJc6ob/i5rEybUI/4bO6G1lUQp70pYjWG5H3fVyqOt+mV1VJycZ
 Hm27Et0iM5054qkFCdvlbDnJ0ZRd6S7nkifW0ttZhl4hXo7EMRecUwdufB2GFpudfxdd
 WR4w4PmuzdAN4PLhwLRAHtduWj1CXzQbjG16nxTdRxWMYntjIFF6Yx1spNYEmJq9mNEA
 DC3+20n9wyQXkhd4cmowRwPHhwhxUP7EAp4PYhszpUCVPucOhc15uDfPOpIvL0PR9c0N
 l6pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DazkdVHG
Subject: [Buildroot] [PATCH v2 1/1] package/perl: fix build with musl and
 static linking
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

The perl build fails in two specific scenarios: when building with the
musl C library, and when linking statically. This commit addresses both.

The failures were caught using ./utils/test-pkg:
- bootlin-x86-64-musl: FAILED
- br-arm-full-static: FAILED

1. musl build fix:
perl-cross detects memrchr() with _GNU_SOURCE enabled, but the actual
perl build does not inherit that on musl unless we add it explicitly.
Without that, perl enables HAS_MEMRCHR during configure but later
compiles op.c without a visible prototype, failing on an implicit
declaration of memrchr() because it is only declared in string.h when
_GNU_SOURCE is defined. To fix this, we add _GNU_SOURCE to perl's
target CFLAGS on musl.

2. static build fix:
During static builds, duplicate symbol errors occur because both
libperl.a and lib/auto/re/re.a export the same Perl_* regex helpers
while linking the final static perl binary. We add a patch for
ext/re/re_top.h to rename additional regex helper symbols in static
builds to avoid this conflict. This follows the existing pattern in
that file for other regex symbols.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...name-additional-static-regex-symbols.patch | 41 +++++++++++++++++++
 package/perl/perl.mk                          | 10 ++++-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 package/perl/0001-ext-re-rename-additional-static-regex-symbols.patch

diff --git a/package/perl/0001-ext-re-rename-additional-static-regex-symbols.patch b/package/perl/0001-ext-re-rename-additional-static-regex-symbols.patch
new file mode 100644
index 0000000000..722fdc5f76
--- /dev/null
+++ b/package/perl/0001-ext-re-rename-additional-static-regex-symbols.patch
@@ -0,0 +1,41 @@
+From f38471fb81d8db1a5f3f9d4d15b1986e86003f38 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 19 May 2026 15:24:12 +0530
+Subject: [PATCH] ext/re: rename additional static regex symbols
+
+Under static builds, duplicate symbol errors occur because both
+libperl.a and lib/auto/re/re.a export the same Perl_* regex helpers.
+Rename these symbols to avoid the conflict.
+
+Upstream: N/A (Buildroot-specific fix for static linking)
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ ext/re/re_top.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/ext/re/re_top.h b/ext/re/re_top.h
+index 4766b10..8c6d755 100644
+--- a/ext/re/re_top.h
++++ b/ext/re/re_top.h
+@@ -30,6 +30,18 @@
+ #define Perl_reg_named_buff_scalar   my_reg_named_buff_scalar  
+ #define Perl_reg_named_buff_all      my_reg_named_buff_all     
+ #define Perl_reg_qr_package        my_reg_qr_package
++#define Perl_reg_add_data            my_reg_add_data
++#define Perl_release_RExC_state      my_release_RExC_state
++#define Perl_populate_anyof_bitmap_from_invlist \
++    my_populate_anyof_bitmap_from_invlist
++#define Perl_populate_bitmap_from_invlist \
++    my_populate_bitmap_from_invlist
++#define Perl_populate_invlist_from_bitmap \
++    my_populate_invlist_from_bitmap
++#define Perl_add_above_Latin1_folds  my_add_above_Latin1_folds
++#define Perl_set_ANYOF_arg           my_set_ANYOF_arg
++#define Perl_get_ANYOFM_contents     my_get_ANYOFM_contents
++#define Perl_get_ANYOFHbbm_contents  my_get_ANYOFHbbm_contents
+ 
+ /* We override these names because currently under static builds
+  * we end up with confusion between the normal regex engine and
+-- 
+2.54.0
+
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index c96eb44135..8bfc829d9a 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -45,6 +45,14 @@ ifeq ($(BR2_PACKAGE_GDBM),y)
 PERL_DEPENDENCIES += gdbm
 endif
 
+PERL_CFLAGS = $(TARGET_CFLAGS)
+
+# perl-cross detects memrchr() with _GNU_SOURCE enabled, but the actual perl
+# build does not inherit that on musl unless we add it explicitly.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+PERL_CFLAGS += -D_GNU_SOURCE
+endif
+
 # We have to override LD, because an external multilib toolchain ld is not
 # wrapped to provide the required sysroot options.
 PERL_CONF_OPTS = \
@@ -52,7 +60,7 @@ PERL_CONF_OPTS = \
 	--target-tools-prefix=$(TARGET_CROSS) \
 	--prefix=/usr \
 	-Dld="$(TARGET_CC)" \
-	-Dccflags="$(TARGET_CFLAGS)" \
+	-Dccflags="$(PERL_CFLAGS)" \
 	-Dldflags="$(TARGET_LDFLAGS) -lm $(TARGET_NLS_LIBS)" \
 	-Dmydomain="" \
 	-Dmyhostname="noname" \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
