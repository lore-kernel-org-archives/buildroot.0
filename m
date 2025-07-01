Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7583FC83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 15:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2609B80CB9;
	Tue,  1 Jul 2025 15:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pYgejEPTuUT; Tue,  1 Jul 2025 15:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C5A284752
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C5A284752;
	Tue,  1 Jul 2025 15:03:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52FFEDF
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44EE984752
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zw1_3uKWStcs for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 15:03:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E37AB8476D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E37AB8476D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E37AB8476D
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:03:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso57669565e9.3
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 08:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751382215; x=1751987015;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xf9IE3zbUcWZZx1R7LhpJY62YZwMn4FwAMfNGCpYPs0=;
 b=CXMLHd8MvibaVRLYzs4+laR86JiNYW9O/mwvv5/5xjiebn2M28MRZV2YBFw+JEDrGR
 c5M0JgSQE57VoEs3+jmbGlspqhUBuAd3yA4IwikJdu5d6hHhHSQIJFV1q0r+ETNrU28v
 RcUloM03s1vtVl329hNbgwgt7eq2SlfrAggt2TvpiyjyOYq6QNtO5lvVuG3I5Ly2enH5
 s3SFXdA5Heyz1GI4Nx3jpYfhRbS359iK3Gt5+Ijka81GHNH3jQOqOOY1layX5bilggng
 64C2TPOXKmklYyY+UoPCgDBMMMJf29d/WoO9ic2quXWxymYpGKN3wLTGhwNlI6KiKb8t
 +LAw==
X-Gm-Message-State: AOJu0YyqC4bAfUqLSYTW5YLAZunF/N+MEFbcZDJQKHPhnaMVI9AihrpK
 Kq1nBu3mcFbsLMAOQvYZIiaCzLRy+584DHpYotG+77Irkc6JMyQrlwMEv2kjPkxmYY/kvWv3ZqX
 jhqJm
X-Gm-Gg: ASbGncuWI7JHvOxP/1hvqEN1dNqXi8zkEJ2wnTca/cHGME4VM2WZgqt63ZYR4DcVvMI
 cqWDmODd7sx9dMEwnurGbKSGl87PCJAIAQ50QWGEVXu/R2L2ZZAdKS2ZnufBRGXWs8KYiulwfkx
 pgB6Ubu/7IAeeuUUZz1ICpEA8BDWXzMSXcOPBze8VqP47h/DMBe4+tPU9014XqZufivKMl0HOJ+
 uvCFgLt2qFQrUZDPLYG0GJJKZhqpEIwp/yWk62RPSvOcCdAde9gc2gy2OXDST85SphzwxkJNau/
 buaqvUuysoBhzCpme4+PGPcrkIP/DxsjwciINKL2TKTu0/7i8OHAwjoOQE58iI7s3yowT78Qw/r
 /DL/tUcnwoA==
X-Google-Smtp-Source: AGHT+IEeAZj3zYXHB0fvHWAh6ecntyPPFm5YfTc0x0zuMEFCLvICiHwWAClGhp33wggbjQaEKViJpw==
X-Received: by 2002:a05:600c:4586:b0:43d:4686:5cfb with SMTP id
 5b1f17b1804b1-4538ee5cf6bmr186322065e9.27.1751382214490; 
 Tue, 01 Jul 2025 08:03:34 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e59884sm13207836f8f.80.2025.07.01.08.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 08:03:33 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Tue,  1 Jul 2025 17:03:30 +0200
Message-ID: <20250701150331.530854-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751382215; x=1751987015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xf9IE3zbUcWZZx1R7LhpJY62YZwMn4FwAMfNGCpYPs0=;
 b=cRNjrW5bt8eT5U07cA/51KtaECoXs6DR3109Z47F8Y7SuOKQT4aNtIVSCCypZUp+3J
 GSol7bJ/0CE3v47ddGUXaGD/E+auTqSeEAr1UC65wFpG7t78H+0F29D5QEDv+rcgQ5BO
 tZOvtuYG/CSZQ8tJy0PllJ2/9Dgv2X+VZ5OCj7N+ZK2jgxhKiVN3Ajy1Xlp/c4hoIwch
 YG6imB1on4KJ5fYa1Pnlp6IDoMXRhvUfX8IjFe2TVQ3yXy3ueeqXDaAWf5hYrWYY10vc
 5eIAuA6KhqVYWFdCn17LGD7Vm6SsjWWkLLfvXwN7KMzJrsdHhyGoqhZohMGCrYl5VTIk
 DOIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cRNjrW5b
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: security
 bump to version 21.1.18
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2025-49175: A flaw was found in the X Rendering extension's
  handling of animated cursors. If a client provides no cursors, the
  server assumes at least one is present, leading to an out-of-bounds
  read and potential crash.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49175
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/0885e0b2

- CVE-2025-49176: A flaw was found in the Big Requests extension. The
  request length is multiplied by 4 before checking against the maximum
  allowed size, potentially causing an integer overflow and bypassing
  the size check.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49176
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/03731b32

- CVE-2025-49177: A flaw was found in the XFIXES extension. The
  XFixesSetClientDisconnectMode handler does not validate the request
  length, allowing a client to read unintended memory from previous
  requests.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49177
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96

- CVE-2025-49178: A flaw was found in the X server's request handling.
  Non-zero 'bytes to ignore' in a client's request can cause the server
  to skip processing another client's request, potentially leading to a
  denial of service.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49178
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54ce

- CVE-2025-49179: A flaw was found in the X Record extension. The
  RecordSanityCheckRegisterClients function does not check for an
  integer overflow when computing request length, which allows a client
  to bypass length checks.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49179
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/2bde9ca4

- CVE-2025-49180: A flaw was found in the RandR extension, where the
  RRChangeProviderProperty function does not properly validate input.
  This issue leads to an integer overflow when computing the total size
  to allocate.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49180
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b76
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c

For more details on the version bump, see:
  - Security Advisory https://lists.x.org/archives/xorg/2025-June/062055.html
  - 21.1.17 https://lists.x.org/archives/xorg/2025-June/062056.html
  - 21.1.18 https://lists.x.org/archives/xorg/2025-June/062066.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index abf1c83c75..7d373850d0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2025-February/003585.html
-sha256  59fa52b63f6f8747ee2c4716decb29ced249c4c574e2a18c96b7d3b1420f7fd9  xorg-server-21.1.16.tar.gz
+# From https://lists.x.org/archives/xorg/2025-June/062065.html
+sha256  c8591ceb70b177440062406542fe52ba60212f217f27f8f802dd20373ca9e74b  xorg-server-21.1.18.tar.gz
 sha512  d0cd176e4c7273b6870999a3d008ed282fd5609acb2e0919c16447af3a5b2228d8592424388a8ace67acf216cdfae3a2d52f7a7ba81f6071467c61d57f32f314  xorg-server-21.1.16.tar.gz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index afb79b223e..f480c1c0ac 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.16
+XSERVER_XORG_SERVER_VERSION = 21.1.18
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
