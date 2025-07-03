Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4D7C77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 08:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C2040520;
	Thu,  3 Jul 2025 08:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oeA3ovzWFuK; Thu,  3 Jul 2025 08:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A3F40CEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A3F40CEF;
	Thu,  3 Jul 2025 08:07:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E96D193
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 08:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34C9840137
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 08:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AXAwQGIJOK0 for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 08:07:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39DBA400B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39DBA400B0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39DBA400B0
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 08:07:18 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-453749af004so43087695e9.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 01:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751530036; x=1752134836;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQcA+sKDvJlNVo03x121D3rcmDNti2JlGuVG1A3pqzg=;
 b=hFpoaQdYAvd1Wac9Wy+KZM4Kb7i70gboIgUFS2/frw498y9IqrtjBUgNV7rO26m6Kf
 Mm7kXPSK+eT4Z5mk90TI9Jb5Xdmo52Nx/okEyUsQugnq3IdCABwxQ6B6WDmzvndU8IgB
 oDbkNAlFeiAqvuCg0eVPDgzVcC4RBs0wO6PwBHXH+/bmrmTbvlqAjlrAojS9wctrBzaB
 V6VmvU+COEI+XHWtIjUQqyLxOSjCkVB1K0gzZtqie6wWDEIJwv6jgbe8zucX2hi8P/Bs
 X+hSVz4kMaCWzVIBjX7YF6v+hEN8s3za8ddHM+NKcGkiCI+Z7C9s9fyJJ4/68Xmt+Ppn
 rQpw==
X-Gm-Message-State: AOJu0YzhLOx4v5av46+aJvUVCDu/0fh0jg8WlxDB+yIJKdT8DFS7NueN
 rPamC+lRKVLYI8cmeZOD/f0nOmD+OiAS5RdcCH1KEUletSTQ0IWBjWYzFcbrt7XeI6K5u/yA8tM
 XvIox
X-Gm-Gg: ASbGncunH3yZmAZ+vtBMr6W4uiSQNqkRvcr2o0dN6DF0Jj54oeSfx+rtuxJyjjuky6H
 yJ0+U5PJ0pqNDzBaKnJoffqkRd5dkadwXAiuLviR1S4zuE6ZW5Lmg1ygNsj67NJahuivrKZyxr+
 StTj9rrLkQJbXsDZFNFjYicyZUAQFm3NDzSvFVfMwZqPjcd8no9Q/wKJQ3/yRcLzjfw59PRtnu9
 5qFdFs0nTTYEUA4jj+w6Nz7WCES0H3lcYuKiLT+2Au2NMW9w8GbVK+i2E7bQKvC+75dDDk/amSk
 0oACDttcFZq1UUIf0+QFgUxPEJzTMJwQnJsUsLWmiPFv+snNH6kFqW11xgAt1ZZd73/3FAuMpZA
 LhybRhiHeGx/OOvKocQ==
X-Google-Smtp-Source: AGHT+IEFSdToCoDKsLlqYXNn9n60gj5xHU4fx8M2czZOeMyaCgBbYGTUA7KyuIZrKZNV65fTXl5XsA==
X-Received: by 2002:a05:600c:871a:b0:43c:fa24:873e with SMTP id
 5b1f17b1804b1-454ab5213e6mr17336315e9.13.1751530036409; 
 Thu, 03 Jul 2025 01:07:16 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a999d399sm19498055e9.25.2025.07.03.01.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 01:07:16 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be
Date: Thu,  3 Jul 2025 10:07:04 +0200
Message-ID: <20250703080704.1704843-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751530036; x=1752134836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OQcA+sKDvJlNVo03x121D3rcmDNti2JlGuVG1A3pqzg=;
 b=HVa4Bt+iUVzxZHuU54DHSn9yFyrXietCRKXGbghnw2Ct7vfLDdwZBTdABpkc3xRvWC
 LSWG8eNh2U99bBSsv415YfOseODw0r+ZApnZYgwrE5SvCF6hHUaKdZAz0GPO9zgwm7bD
 SglCN0KeVp5DrsSyIztSC0YBcGVre6uT6r/MEovnB0p66ivAj8RcjjvLlJqQRwdBDPVU
 DIdJjixv4e0v+Y0QDzQNmlowM1oTZpjdNfSMAyMSXVpyxcIBC2up8Asb1OFelkmLCOPK
 y3txKhn+UsWZkSnVtF/VksPkKeVziLFuCOwv4wx45jdogvFmhx3tiNh9tZJWX2muCTFy
 7Tqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HVa4Bt+i
Subject: [Buildroot] [PATCH] package/tcpreplay: security bump to v4.5.1
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

This fixes the following vulnerabilities:

- CVE-2023-4256:
    Within tcpreplay's tcprewrite, a double free vulnerability has been
    identified in the tcpedit_dlt_cleanup() function within
    plugins/dlt_plugins.c. This vulnerability can be exploited by
    supplying a specifically crafted file to the tcprewrite binary. This
    flaw enables a local attacker to initiate a Denial of Service (DoS)
    attack.
    https://www.cve.org/CVERecord?id=CVE-2023-4256

- CVE-2023-43279:
    Null Pointer Dereference in mask_cidr6 component at cidr.c in
    Tcpreplay 4.4.4 allows attackers to crash the application via crafted
    tcprewrite command.
    https://www.cve.org/CVERecord?id=CVE-2023-43279

- CVE-2024-22654:
    tcpreplay v4.4.4 was discovered to contain an infinite loop via the
    tcprewrite function at get.c.
    https://www.cve.org/CVERecord?id=CVE-2024-22654

See the release notes:
https://github.com/appneta/tcpreplay/releases/tag/v4.5.1

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/tcpreplay/tcpreplay.hash | 4 ++--
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index e73e2d2c57..6dc6e48f9a 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.4.4/tcpreplay-4.4.4.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.5.1/tcpreplay-4.5.1.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  3ff9753cc43bb15e77832cee657e3030dbcdd957fa247e6abacc605689e24051  tcpreplay-4.4.4.tar.xz
+sha256  5126613f783062b43f514b05ad981376050a8fee35b03c8de4445ddeefd95049  tcpreplay-4.5.1.tar.xz
 sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index c5b3f9baa4..17766707e6 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.4.4
+TCPREPLAY_VERSION = 4.5.1
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
