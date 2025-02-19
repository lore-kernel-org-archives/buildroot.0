Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2D8C021B1
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B5F24F395;
	Wed, 19 Feb 2025 08:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jzlyyib_QvMZ; Wed, 19 Feb 2025 08:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C85CF4F3B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C85CF4F3B2;
	Wed, 19 Feb 2025 08:51:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91E83968
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 739C381203
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyETv4DFzVUs for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8633F8128E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8633F8128E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8633F8128E
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f2cb1ba55so3936290f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955055; x=1740559855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sC/eMMmVWFmEai8dQsgovNw4Ya0at9dXZaQdlUk5MeQ=;
 b=s9P5OtzRcw4D1a2Q1RjCdqtcN5m9J5v/ixk2ClQ3Y9xYQcywyxGJQ2HMI3XXPyeOEy
 eEsF9r8M0DL4tWQUTzLnkLNuZzduc87r9Ns/oEGKuhSI3ilj/RGE/rYciEBJE35fE9bG
 WI4OGfPiRlkVwmrQ7fxVoMIIafHD4mB4r+tk5KrVZixhA+NDQqYF3Cuai0e2flWPB5jd
 CrZ8u6goNQpPlHh/BdATM7qaG5wqTseQcHYpTdfgjqr2fhk3pU2o2WpK1i5zbzwxtmwm
 Nuarc7g9zdgaXdSNpCKVKUvcWaP4jJkr8Lkl5IBD3jyiIqJ/yf1/r+zdrZWiLlHwjlME
 obFQ==
X-Gm-Message-State: AOJu0YyLd4lWwa0qllPjwVB321Cw0J61VdLy1XWJdHpjB52YED7svKsw
 ZGVNVEXya1Xf96xhRPMf91b68yD1pcGhbA3A1adyRiJkKIIsUiRaKta0vw==
X-Gm-Gg: ASbGnct4HHDPDYVuR+qh/1s7qkd1CcIo/Peu3JlaPibCi8e2+R0lB+z64acUirQFI5Z
 yzXBFc0RsV4c3HV6K0NrMawc6qKXilXMTPtug/0ttougyVl/gML9ZCPkjAs/dwmeE6P0RfPBIMR
 Xsm85bG2rv4lW+DqAVb0yiaqhVAfEZi+7C9BWf2TZdA88QEH/vrh9u8BNgT1DAlYECDEu+zdjLb
 N2VMc5l+WbgpSbh3F8PUULAF1ANDBhsjK/TUEyu13ycvTMQmdU5+k3qIqLKrikqKNM5M8t2zIe4
 8HcHWDubjsBRwbwTlwo2kbpMpA==
X-Google-Smtp-Source: AGHT+IE94JrgEBDiJjtTfltLwSHdv2SkZnaCo7opWpSVL3pzd9EsmqwooCif1fJjYZCXvPXMDyZjGQ==
X-Received: by 2002:a05:6000:2c6:b0:38f:276a:1662 with SMTP id
 ffacd0b85a97d-38f5878be87mr2160201f8f.13.1739955055417; 
 Wed, 19 Feb 2025 00:50:55 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:55 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:34 +0100
Message-ID: <cf2ae39d3fec453dc573b2028cddbbcfbb8e0d05.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955055; x=1740559855; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sC/eMMmVWFmEai8dQsgovNw4Ya0at9dXZaQdlUk5MeQ=;
 b=d4V47ef6a81NyaPDRavaA06ra48PFrHp1dUZwQPoe22+nHA/Oo5uH17MBZyToraqSR
 R3m89Bw3fOH4psxUushCjkrbhCTG7VxaZM1nuvW5VHxPtfQPhkeOTdnVEuM8tl3Bq0E/
 KIOrgqYmJ6j6V0DhQM83uW3t1yZGekBC8OmrL9eBEILN+yVG0qUCOTb35OQC80p+Evdf
 YloRqu2axR6ZyXlgGU1YqWr81u6OSOhkEseMTe5c0PBiMz8Hv7XMzo9k2YHh1/TR7tVv
 4Vsxn153PKqYB2bix8xppUwjcS/Rv0UkUFyIAPbWH5CvPptRN0Ivg4j0cIq9ldOyOr6S
 k9UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d4V47ef6
Subject: [Buildroot] [PATCH 19/27] package/boost: headers-only libs are
 always installed
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The headers-only libraries are an entry like the others for the boos
build system, and are reported in the list of libraries when it is
queried:

    $ ./bootstrap.sh --show-libraries
    [--SNIP--]
    The Boost libraries requiring separate building and installation are:
        [...]
        - headers
        [...]

However, they are always "built" and installed, and can't be disabled,
even using the --without-headers flag.

In a followup change, we'll make sure that the sets of libs provided by
Boost on one hand, and known to Buildroot on the other, are identical,
so we'll want to have 'headers' be present in the list known to
Buildroot.

Add an Kconfig symbol to represent that library. To inform the user that
the headers library is installed, we expose it with a prompt; we however
make sure the symbol can't be disabled when Boost is enabled. Since it
is a "special' library, we list if first, not in alphabetical order.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 7 +++++++
 package/boost/boost.mk  | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f37efd129b..784c40278b 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_BOOST
 	# let's depend on threads.
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_BOOST_HEADERS
 	help
 	  A general purpose C++ library
 
@@ -16,6 +17,12 @@ config BR2_PACKAGE_BOOST
 
 if BR2_PACKAGE_BOOST
 
+# Headers-only libraries are always installed by Boost's buildsystem
+config BR2_PACKAGE_BOOST_HEADERS
+	bool "boost-headers"
+	help
+	  Headers-only libraries; those are always installed.
+
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 2b952baaac..e849f902f2 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -25,6 +25,7 @@ BOOST_ALL_LIBS = \
 	filesystem \
 	graph \
 	graph_parallel \
+	headers \
 	iostreams \
 	json \
 	locale \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
