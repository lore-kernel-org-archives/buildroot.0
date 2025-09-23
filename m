Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E495CAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 06:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECAF640581;
	Tue, 23 Sep 2025 06:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFSmi1Ua36OR; Tue, 23 Sep 2025 06:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA99340AC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA99340AC1;
	Tue, 23 Sep 2025 06:40:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56EC5498
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 06:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53FBC80ACF
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 06:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQF6qEWjjtz8 for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 06:40:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12CE580ACC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12CE580ACC
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12CE580ACC
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 06:40:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so1893600f8f.3
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 23:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758609635; x=1759214435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P0o++tbJQzm/1k4sP/Dvgq5ki8qNCcLa/Qfv64wnwMU=;
 b=ga/4t3TrgwQQKSgLxH/k3zurWwOL05Y1vb6kWxw8u8jWu1fR0ubQnGslewhKvjK1Jy
 1KvbrhRgy9URKVTty9PZeF8jGSuqa6dABeann/IrfhiBVlHF1x7w4rxmfCdpwqq7qQpm
 yCHvJ93xrxq0pfV97jlu7VBJuH+7MwVlTPivz+42SHaPHQxjsLzzHVrulyUjkCw0FYAY
 /mBFczqsJLw9stf8euvRY0NhV+wVmW7H++HHSv/IGf0qz9sJ1gyX7uO8QthOXNSw/urN
 D7uH6sC2uDPgaWQLRkuKZ2oshj9OIjvrItouoWZSe1mA/+y9hJpJxCn2G6jaEgeEVBGU
 ba+g==
X-Gm-Message-State: AOJu0Yw+kvJymmacgj7zJiRstE6pA+tjyKY4hY1vcjSpNATx/PcBz6Pv
 2CMcg9a1vDY0ABvbRbawcF9jtaAAJ+NOotcjxYUZ3MEJIdq1Qn4fMssT+D7/koydbmm3FcTd0RC
 foUa8
X-Gm-Gg: ASbGncu6Q/eijgi/IOPvTFt2DGF1kfSZ2xiSUk9T/VhRTpjCgr2isDoCG4+LXyH7K17
 0KIaOTXZZxlxr/GruBD+BcZVKtxJnFa5rJi3xIRJxvamoC24Ubk9afjMtQSvg8msIgs1KMbkNPx
 hODgVaju1iajL9h0S1xUQtExT/BIfsSwyEQ/yaGsTaHNto1KmQpbIK+rtc6OV5fLbeJyhQBB7D0
 7IxzU55BLW3UuDfHX0Vt7qzRJqdIEwt+y/CTrYSgU2DteTMwG9ESzFz7loVZCQGpecOyFSB3RxU
 keRLsYtVoSdC1WyYCI8oEcnYb6JFq3KVElc/t2QGMdq4lKeIvFPT6MoDZUe1fmkfnnNDDvgK9vO
 CePXeIAYDBQFcIWPbl7RfuSfSdKRAnctcIAYaXOyvlJuHQX+BgKs2fvbc9m6llA==
X-Google-Smtp-Source: AGHT+IG+omPuBSP0laoMnKsLDuOEkm8d/7apGwM3RV95yh1HuCNpOUHZnZGQ9PquuKoGDTFn81mBYA==
X-Received: by 2002:a05:6000:2304:b0:3fe:4fa2:8cd5 with SMTP id
 ffacd0b85a97d-405c47b8235mr945665f8f.9.1758609634811; 
 Mon, 22 Sep 2025 23:40:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.198])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee07412111sm22359966f8f.28.2025.09.22.23.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 23:40:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 23 Sep 2025 08:40:31 +0200
Message-ID: <20250923064031.864373-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758609635; x=1759214435;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P0o++tbJQzm/1k4sP/Dvgq5ki8qNCcLa/Qfv64wnwMU=;
 b=peNL93s0vg/Sslv6Ri/i5wOmPJfGicUDhl+cNxEUa2mSeIDP/z2IPAGuwWMZgwLIaH
 TTu5MBAg81hYd6GHPDLyoNAgPg4wYCvTRq3+kP1LRfqXsBkPbOZvJWRHnRb0u8DFpEGt
 TERX3aQpl3hvdQwT/ZO+PIN69HXibWyfiRpzU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=peNL93s0
Subject: [Buildroot] [PATCH 1/1] package/connman: security bump to version
 1.45
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

This bump includes the security fixes for CVE-2025-32366 and
CVE-2025-32743.

Release notes:
- Fix issue with setting MFP optional for PSK.
- Fix issue with comparison in timezone checking.
- Fix issue with dnsproxy and empty lookup.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-32366
https://www.cve.org/CVERecord?id=CVE-2025-32743

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...L-empty-lookup-causing-potential-cra.patch | 46 -------------------
 ...Address-CVE-2025-32366-vulnerability.patch | 41 -----------------
 package/connman/connman.hash                  |  2 +-
 package/connman/connman.mk                    |  2 +-
 4 files changed, 2 insertions(+), 89 deletions(-)
 delete mode 100644 package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
 delete mode 100644 package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch

diff --git a/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch b/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
deleted file mode 100644
index 9c1274e43ce5..000000000000
--- a/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d90b911f6760959bdf1393c39fe8d1118315490f Mon Sep 17 00:00:00 2001
-From: Praveen Kumar <praveen.kumar@windriver.com>
-Date: Thu, 24 Apr 2025 11:39:29 +0000
-Subject: [PATCH] dnsproxy: Fix NULL/empty lookup causing potential crash
-
-In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
-can be NULL or an empty string when the TC (Truncated) bit is set in
-a DNS response. This allows attackers to cause a denial of service
-(application crash) or possibly execute arbitrary code, because those
-lookup values lead to incorrect length calculations and incorrect
-memcpy operations.
-
-This patch includes a check to make sure loookup value is valid before
-using it. This helps avoid unexpected value when the input is empty or
-incorrect.
-
-Fixes: CVE-2025-32743
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f
----
- src/dnsproxy.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/dnsproxy.c b/src/dnsproxy.c
-index f28a5d7551a4..7ee26d9ff886 100644
---- a/src/dnsproxy.c
-+++ b/src/dnsproxy.c
-@@ -1685,8 +1685,13 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
- 				gpointer request, gpointer name)
- {
- 	int sk = -1;
-+	int err;
- 	const char *lookup = (const char *)name;
--	int err = ns_try_resolv_from_cache(req, request, lookup);
-+
-+	if (!lookup || strlen(lookup) == 0)
-+		return -EINVAL;
-+
-+	err = ns_try_resolv_from_cache(req, request, lookup);
- 
- 	if (err > 0)
- 		/* cache hit */
--- 
-2.43.0
-
diff --git a/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch b/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
deleted file mode 100644
index 9651b2dfe473..000000000000
--- a/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=EC=8B=A0=EC=9C=A4=EC=A0=9C=28=ED=95=99=EB=B6=80=EC=83=9D-?=
- =?UTF-8?q?=EC=86=8C=ED=94=84=ED=8A=B8=EC=9B=A8=EC=96=B4=EC=A0=84=EA=B3=B5?=
- =?UTF-8?q?=29?= <ioerts@kookmin.ac.kr>
-Date: Mon, 12 May 2025 10:48:18 +0200
-Subject: [PATCH] dnsproxy: Address CVE-2025-32366 vulnerability
-
-In Connman parse_rr in dnsproxy.c has a memcpy length
-that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
-and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
-than the amount of remaining packet data in the current state of
-parsing. As a result, values of stack memory locations may be sent
-over the network in a response.
-
-This patch adds a check to ensure that (*end + *rdlen) does not exceed
-the valid range. If the condition is violated, the function returns
--EINVAL.
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4
----
- src/dnsproxy.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/dnsproxy.c b/src/dnsproxy.c
-index 7ee26d9ff886..1dd2f7f5d47e 100644
---- a/src/dnsproxy.c
-+++ b/src/dnsproxy.c
-@@ -998,6 +998,9 @@ static int parse_rr(const unsigned char *buf, const unsigned char *start,
- 	if ((offset + *rdlen) > *response_size)
- 		return -ENOBUFS;
- 
-+	if ((*end + *rdlen) > max)
-+		return -EINVAL;
-+
- 	memcpy(response + offset, *end, *rdlen);
- 
- 	*end += *rdlen;
--- 
-2.43.0
-
diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 38af1847aef6..807f7144b1a2 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256  2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff  connman-1.44.tar.xz
+sha256  77128cce80865455c4f106b5901a575e2dfdb35a7d2e2e2996f16e85cba10913  connman-1.45.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index c9637eadf5aa..bc15932220de 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.44
+CONNMAN_VERSION = 1.45
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
