Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD8AD6AAFC
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 08:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CDBE40DAF;
	Fri,  3 Apr 2026 08:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBgowSqOM_bd; Fri,  3 Apr 2026 08:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6796940DA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775204819;
	bh=+US0ynJiDuKRPHhMJc3p6lgKZzVutQuAvfSNRsUhnw0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PXT5P0ane6i14BcyLKqP5rWaBY/6GdVJo3fSilZZo4RqaVnKtMjlq+pnTnzSUTyO0
	 6/6OydQg0gnWhtTOW6PYWhXBAqom2aPwgsD1x3XJ3GxF76B/AfeFvq4kld9RFeMIG2
	 s2syLTu3AVNJ3TQwWrj0aEz5dg8xGbXas6aKOOPyaapTkE6FSrZWBFr3mh8FveJFdi
	 mLgqhRfvongYD6MidleoEQVQ08XMAr6EM6nRGVP3yt5yLgXMoaSfUxHYMkwQP6MbHn
	 07uQ+sh35KiRVcgn7ke8s5cELu0arUNChedoKypZgZnHTJ4YgdumcK0QKC7yEXKzcx
	 K3Nsp2payGj4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6796940DA6;
	Fri,  3 Apr 2026 08:26:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ADD492CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9392C8148B
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJMOhpbQmsKG for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 08:26:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E998981467
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E998981467
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E998981467
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:26:56 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-c742824e1d3so590319a12.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 01:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775204815; x=1775809615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mRGoJPZiWI6zeqZnmHRKZQHio3t99b8GNZA5UEo+kh0=;
 b=NMyzVfRy+JFXyePe4i4yPPlq+VhyOTW94HEllnqyKOVqNjkU/hn4Q/xKe3G51MIRs0
 TL9IBAulyzaBU20skWcL1x8TQJSxSDv3AB/UgFlAUIPTeEOQPQb89Uy3vAuKbocbSwyu
 ynLglVOhc39RiC/P689DfhTUxuxIOGyihf0v5UJzjC5m3mVeMvuGPfSEr6Mu8A+R2HaP
 5hpxJbM40RJoyc9DkGDUtZxOyw0ZSlEjN5BoBAXUlJjTpgXk8Opy9OJ9S4KzFTp9z1m9
 IarmNrHVSjappD4hzZx+TnGUuqaAEkD3p1uG+CwmMf9fD/CxW+VcfLqZ7R32qzxOQiw6
 bjew==
X-Gm-Message-State: AOJu0YykhA8p7JciGYou0l+lCOBOuOUsv8gDEr+ueUa/uVLMg0b9Hv7X
 Nuwrpbjsg9N0/zL1VME5krQQdc65Rag/60W1lzX/ggydCFGrCm82n2lPt9By8Q==
X-Gm-Gg: AeBDiev+RzZYTPJtOUVW5DOi3zzA+x9UD8neKUcu42FjBOaI1E7pKrRxqChhTVfhNW4
 HQJkxCfx46/teNsRWx/R2E47+DmUrS9qKjVCoEQvCCjillmNfU1IRRkYHab1IXM5X/XwewHneNL
 voB0eyb3wOdlQLivg395PaRmKuvhF4xC+7L3YJi0YKE+5z4oyE3wASXwqE+HG6sH8r/ZUAQWpZr
 1TkPXSUa2NErSORJmLZvEG1ZPnw9fY97Q3XiMeTAm/OxGQdoPyakdZS8RQzHvGT3Zesno31IDzQ
 nO/y1G4bSeT80f/h/Xnud4w6/So0BkDoSQPL7Q62PZ4K4HPvC9a6DGWwUTMS1GsFKw8CfOH+7t0
 anKCFgM223Z1CEmz3YPHgjaWNdqwsGP9uUNvkKeNZt05hFpmQRoXG7Dz40OyXvYhoe32CqEvZB5
 vuGEueB2CUeAiBr6rfp4x6o5SJohvhIUyREap5MFXakJC4/Q==
X-Received: by 2002:a17:903:4b47:b0:2ae:803e:6c0d with SMTP id
 d9443c01a7336-2b2816c291amr24662865ad.19.1775204815391; 
 Fri, 03 Apr 2026 01:26:55 -0700 (PDT)
Received: from fedora ([2409:4064:2d9c:554:d9db:ca4d:ea7f:ffa9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b27472d233sm53129755ad.2.2026.04.03.01.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 01:26:54 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Apr 2026 13:56:40 +0530
Message-ID: <20260403082641.491778-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775204815; x=1775809615; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mRGoJPZiWI6zeqZnmHRKZQHio3t99b8GNZA5UEo+kh0=;
 b=BIACwxvmNZeQOwb2nksqPDkH39Z6dKT2J0CxCQWjTm5P9msc4bzzb455u8MUK/2OMb
 707ls1ROrawsqF935/2l7iBOthn9qJDMuhPPcaIA2cx9a6hKU8D3LZrxQKlbzm00rXXE
 OhbT3LdyTocaeQkWPMNnXWG70iEJLOI7z6S/aaMDFTLlG0ovf57IufhHy9PYpnbYiO90
 S1RpideNfSqM2r/EmSxGi2bIpchfzWaWXngGZrbTUk79RRI4Uv7UKa8u19COu+1t6BTq
 cY0sjGBBT8ZTYrlFjKmH2E0hD7dcU3nrtvcUqXTyGv6TAnR9IgAFfUUREevki2Tqba44
 pTxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=BIACwxvm
Subject: [Buildroot] [PATCH] package/perl: fix musl build issues
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
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add _GNU_SOURCE to perl's target CFLAGS on musl so the build matches perl-cross feature detection for memrchr(). Without that, perl enables HAS_MEMRCHR during configure but later compiles op.c without a visible prototype and fails on an implicit declaration of memrchr.

Also add a Buildroot patch for ext/re/re_top.h to rename additional regex helper symbols in static builds. This avoids duplicate symbol errors when both libperl.a and lib/auto/re/re.a export the same Perl_* regex helpers while linking the final static perl binary.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...name-additional-static-regex-symbols.patch | 35 +++++++++++++++++++
 package/perl/perl.mk                          | 10 +++++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 package/perl/0001-ext-re-rename-additional-static-regex-symbols.patch

diff --git a/package/perl/0001-ext-re-rename-additional-static-regex-symbols.patch b/package/perl/0001-ext-re-rename-additional-static-regex-symbols.patch
new file mode 100644
index 0000000000..1dc4c708e6
--- /dev/null
+++ b/package/perl/0001-ext-re-rename-additional-static-regex-symbols.patch
@@ -0,0 +1,35 @@
+From 45895a24147d1fd8d07abfe83f5b0013138f018a Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Fri, 3 Apr 2026 13:41:15 +0530
+Subject: [PATCH] ext/re: rename additional static regex symbols
+
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
+2.53.0
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
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
