Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FF2CAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 13:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7330860E7A;
	Tue, 23 Sep 2025 13:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bct6PNuJGz0C; Tue, 23 Sep 2025 13:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87F9A60E76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87F9A60E76;
	Tue, 23 Sep 2025 13:18:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA1AB498
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0DAF40768
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id As6fCWCWslc1 for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 13:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 93B5540062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B5540062
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93B5540062
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:18:15 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-62fc89cd68bso8598530a12.0
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 06:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758633493; x=1759238293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQNeM4aEdDqRKUvL+qi1umerXEK35D5Q3mCrBwSGg4Y=;
 b=ATsc1cNUGbnzAIWcYLmSB5o/clv8L6rDpvaSXo4upv8WGLaowTjPzusOrN+E8WPWp1
 2j5i1dW+oVAn5FUz+IjJcxLbzlr5LjAAaw8kG1o0pDfSzaOKpMGyZ8/rLhlgM59uad19
 Rhf2k8pMRK/BOaTLDqnexMFhtzci9ychxLLM1qjf8EBNnhQgaEWBrrB30QElTb+RvpTy
 wqXgs1F1eNcB/FNMdUHF4UmKkMFzfG7XahW4HfkHz+HvzeJVaJauUZ+XTgYeGhQm+fRZ
 lBXB8pygp1cpjzOLlXst6XpriQxpgByXAUR3sAi4edkNbUqGDVFzLi61EEz1s5z1bm8f
 wtBA==
X-Gm-Message-State: AOJu0Yw1FNFHAK3KGMgOLQqLDf3GZDXJUCsjAmHgpH5eG2WBU9zDS6VN
 Z6m5lrLpIuBlog/ZW2NUESflhtGL6oqcpnlAjqoBUl/gQcmI4/yJbF8Shrd33XC5pM6HFONX1dg
 19qriSmyvFQ==
X-Gm-Gg: ASbGnctngTpVHnZ2PqRMz8YN4vhHq983+6SyEDzFDD2Wpxy57IvZS6icVk+P4/Qit6b
 Oea+iF7Z7J8CLsS5Mk3GYHjqp9U7hXNl1bz5yFLE3CsIYje10V+C5pePKpF0UVgNyrNS73QUeoB
 jykdyrksq9FkN5ub6IABdkaEpf8rHR2sP+tqKxi58bNlxuhdmVQlRP92ujXdfwQG4awTEtKZ7Ze
 KVWNAeZq1M3aJautv5BT4Rvy5i0syMVzz8BGBaWsaVoEB3HWcQRFEU0po5QhcepHX91lpgtXKlV
 xSYnoPlZxiGp5rqZB4cb2gMUPMV1WTZMdrKLsWuruAlcH0q2aaDaCP98oADYR/g3b71hGD6RE99
 tV/iuSNLOLniVH08MsuR/XLy2548UD11y
X-Google-Smtp-Source: AGHT+IHwFSQfouzR9xIATbIhqwykTZsz4ErfXCTPMewIQ/y6JoV/otn9FUY6Da/8nSo+jyZkI+gGHQ==
X-Received: by 2002:a05:6402:1ecd:b0:634:66c8:9e7d with SMTP id
 4fb4d7f45d1cf-63467a209bbmr2297951a12.36.1758633493170; 
 Tue, 23 Sep 2025 06:18:13 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5d0f397sm10641057a12.12.2025.09.23.06.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 06:18:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>
Date: Tue, 23 Sep 2025 15:18:05 +0200
Message-ID: <20250923131805.161368-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758633493; x=1759238293; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jQNeM4aEdDqRKUvL+qi1umerXEK35D5Q3mCrBwSGg4Y=;
 b=VL3AgcctvP6qOeXFe2p6SVm9n73uCHGSAyrJfCf7IhMeEowqCzHYYIe3mSd2H0E1S1
 OCG4VLbQ7LrM3ZumO/TRQpiUz3KaGmTa5RxaQuWnkCS+Sjfxf3MI9+BuWnV5HeRNkYZW
 l5a6Q0mBD+F3oWvO0lE1xIVM5uaOVltfCCMRKGQRro+/a5Mc/K07CBlZszTC2JBU0FF+
 Crl2dkyaWrSAvo/RrwOlSLEfKF1jN3Gq7Vh+7DyY/9x8OtwkMkAAiagG9cZLGQOolN9x
 OFlCLbQ5UdZshSri9uGkbHrPny0guEMXERYyUNMrb7Wh38E46UdEsQTq7LNAmlbKUSFm
 DBdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VL3Agcct
Subject: [Buildroot] [PATCH] package/syslog-ng: security bump to v4.8.3
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
- https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.2
- https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.3

This fixes the following vulnerability:
- CVE-2024-47619:
    syslog-ng is an enhanced log daemo. Prior to version 4.8.2,
    `tls_wildcard_match()` matches on certificates such as `foo.*.bar`
    although that is not allowed. It is also possible to pass partial
    wildcards such as `foo.a*c.bar` which glib matches but should be
    avoided / invalidated. This issue could have an impact on TLS
    connections, such as in man-in-the-middle situations. Version 4.8.2
    contains a fix for the issue.
    https://www.cve.org/CVERecord?id=CVE-2024-47619

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 4ca6a3e33e..04f33926d5 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e8b8b98c60a5b68b25e3462c4104c35d05b975e6778d38d8a81b8ff7c0e64c5b  syslog-ng-4.8.1.tar.gz
+sha256  f82732a8e639373037d2b69c0e6d5d6594290f0350350f7a146af4cd8ab9e2c7  syslog-ng-4.8.3.tar.gz
 sha256  d7d51f8d0f6ee9757a371080e7f5fa19ac73afbef14db6e981705cf1ec813d6b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 6f608eed0d..fa405ca5cb 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.8.1
+SYSLOG_NG_VERSION = 4.8.3
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
