Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4A5CA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 11:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE4FF41F6A;
	Wed,  3 Sep 2025 11:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsDrrUkFdjmv; Wed,  3 Sep 2025 11:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7641B4182B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7641B4182B;
	Wed,  3 Sep 2025 11:01:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2F6D10E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F078261507
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pd8vzbP2yWZt for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 11:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8C7A61497
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8C7A61497
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8C7A61497
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:01:02 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ae1e8so6966827a12.0
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 04:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756897261; x=1757502061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4JuRwVI0Uxodaor6ViIbHKdW0GVn5FNOVt52rL44E0c=;
 b=gciRtYeknZ//EAdHDZKfH8VD2ZMWPA2qb97yzBLNWS2BkI+3GevepQ2Ulp5T5zQffi
 2CCVm8RpQwA1He7WglOgUiNpGwRvCJp5E7EMOV+sKFqts9JjN2Yr0dmvE8QcqC7/IMf8
 cXp0YxQzieF179l2xSDNab36tPS/PYnkeT5vpYk5DZbPai71GUbV3G2bZw5ZmxNYNSTu
 3lDcFWqUMpvJumM4itrGoxPk+90ZJRe+lxN54WhwLifmX6wAfj6hFszuRxPeYASJLlYk
 KPs5cRnfO6DUcs57QQnni4T0KbbZFI374u+V8GYJdXVoQ0YyL64Qkb7dL7JS71bdSY48
 DsIg==
X-Gm-Message-State: AOJu0Yy5GO94f1dSRayCcFhC7rPOfi1jlnVaCBIEPEuAw2N9PkKLiFCu
 HVlEJa0MARsRVwH2Quw/75jBndqBuIOfCa1QNb/U6dgbJB7mxwsKZaKR0qMvFPnJ7Le+rZk3Qar
 1bWiQUwDgDp9v
X-Gm-Gg: ASbGncuakn+H9ZmwBDDFRxg29kZRT0OFUHTK+5sgEeKX4LN5m60Nq2SwmkR2hkdBXxQ
 KlpPJiiLQm58tsWE3WvUxzFhRrJBz9PRRzx38xKaD+AP9/ZiJb/l6z5Dmb0hdXuyM8ePuOjdJHv
 sLGm7R5UEKTWcLAAftRrHTSvf+crAGffWkJltqMCnlmZyc6+hvNhYIccOZikYXKtZ0YmhSOvxWF
 /LepCl/QHn1zj6pScdW0B8d20r3AlkeUQ6DRamMZs9q+RdQpVT06b8IA4gx8aL1Xkhgh3ojaoRD
 JkZcR+iaLpC7N+6+A5jwYyiXejF85FQr4L0Md2JKhUjzl8/J7HpLppeovVcozlVNYEdRJTZ7KsB
 P0Zi7BgJC4CV4oHop38a6KLDG9RRXkLDNlAAg
X-Google-Smtp-Source: AGHT+IFaWPsyD0EsNvCNC3AxIsLtq06C4XnXclSN4qjrVpKVPd9FZU3SiXRJL9UXD+Ako6VLg6ncTA==
X-Received: by 2002:a05:6402:350e:b0:61e:cacc:76db with SMTP id
 4fb4d7f45d1cf-61ecacc79f6mr3660101a12.8.1756897260607; 
 Wed, 03 Sep 2025 04:01:00 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbc9asm11863399a12.25.2025.09.03.04.01.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:01:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Sep 2025 13:00:48 +0200
Message-ID: <20250903110048.441164-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903110048.441164-1-titouan.christophe@mind.be>
References: <20250903110048.441164-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756897261; x=1757502061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4JuRwVI0Uxodaor6ViIbHKdW0GVn5FNOVt52rL44E0c=;
 b=hh0HGx5zrL0cQCD3XrMYJ/sCo/sD1kTZRoRqkgmEmYsM6dsCnnaQ65QlhfJ9WYhUCH
 dZ5NtBoRouB4cmAAmvHL1h1gTGTo8W9tVlh8c+rIamgldkLYuaTLt3ZTs8ReqnByC0M1
 zx+3dvDfSBxBP0v5954tfUHVi0e3r3+/sfLGIVZ3Y9Q14yIgt5Ih67XDXuQ9x5U4Gncs
 aPeX+nwAGj3Bl6xd5ym96RL9Nci2Ox7DDMWmOA0TrxR0GUwEvtaKHktoKhCz8Z4o0844
 nlNiG9jqK1ElhU6OIcG2hDAythF7M8g6PYlaroR8dCXl4DLKGW1TZHXVkhz5LWjkiA5O
 YF0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hh0HGx5z
Subject: [Buildroot] [PATCH 2/2] package/wireshark: bump to latest upstream
 stable v4.4.9
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

See the release notes:
- https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html
- https://www.wireshark.org/docs/relnotes/wireshark-4.4.9.html
- (and all patch versions inbetween)

Also update the README hash, as it has been updated in Wireshark commit
1832f2bc3948248bf21acab5dd16fca8d5477a1a

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/wireshark/wireshark.hash | 8 ++++----
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index f1f2f58442..88eb7ef494 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,7 +1,7 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.13.txt
-sha1  e5a08396a98d5dfba4078c66677aacd50d47ec90  wireshark-4.2.13.tar.xz
-sha256  2454aa650276264d23aca28e1b62eb5d4bd12b64aa261d38c06b33f97b8fa3dd  wireshark-4.2.13.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.9.txt
+sha1  dc91c68b03b389645fa6dade92960863d74bca1d  wireshark-4.4.9.tar.xz
+sha256  60551dc787f41e87aeaa1e9c33304f9008037e3baf9fa11aef9c2d584cc0b54b  wireshark-4.4.9.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
-sha256  fce67c1558e448fac784ce9a30cb47956488bc3ef6ec16316c38b0668b3cad2e  README.md
+sha256  39887d884b6473f5897c915ae8e9497e5bc2c1f6decec2ce820d5fd716d763cc  README.md
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index bd81224ae7..9ccd8f9a9e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.2.13
+WIRESHARK_VERSION = 4.4.9
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
