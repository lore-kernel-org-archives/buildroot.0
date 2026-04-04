Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB141E88D8B
	for <buildroot@archiver.kernel.org>; Sat,  4 Apr 2026 10:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B7356063E;
	Sat,  4 Apr 2026 10:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RrHboqOKBD_j; Sat,  4 Apr 2026 10:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B205A606CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775298878;
	bh=SR66M/3c4Ly4wLCfy/YTRw8XsMt2Swn2oL/CH/vwq4Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZQy7U+45kv7FFcStx65l0f6yhomHWJXtNk/uG11vUS/NNfKVjJDj1hxUeoL9QM0u+
	 52iD3nflAszBjEBkbqqcve567+qCgISbgWMq0/mmBlxBaYwh3RR3Z67kv2iK4++6mD
	 UyRlRpqqhlegalkunxjKwhGjK/xIGqaSr7ED//bNuFeQ5VNEIdZS01F0jXk6VwEaF9
	 Mw6IKbIxMGIuu0ZKqBnwOnnlfLSqO2ZvCzHJKFoMXRQWpdOcXii4kD32jTGMRDox1M
	 tg6x/1TZaDt2LNKHs5EX+7ULo/vRzQoHdd247i8K6eOYIVsedR2QZQe8eOSFuRBP69
	 AH/2dMAyAbbNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B205A606CE;
	Sat,  4 Apr 2026 10:34:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F59C91B
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 10:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 209488135C
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 10:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJj5dyJo1DQS for <buildroot@buildroot.org>;
 Sat,  4 Apr 2026 10:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BA97811E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BA97811E6
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BA97811E6
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 10:34:37 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c76b0cda2aeso957941a12.2
 for <buildroot@buildroot.org>; Sat, 04 Apr 2026 03:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775298876; x=1775903676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGBJEZjIBB7yAwTbRB5KCqfFTDlSw5wvBfj85M5FGd0=;
 b=lM9oo7kOfQM2vVq8HV9c76kcXMkuoO47Q4GnDP4VC8TTmIq28uP5ZWpLmu6Zc5UZ9K
 tb0nlzo7oZ9ug1n472sa/03/Qj6rX/neQE73p613ai4gi3C2bQAolsYIXYp3mQb4jtLj
 La2DRPQ/TkE7F6A63xGNdMyew5uO27rwSMzc3Jm+5DrWHD6jHlhcnQ8aX2QiLSlnBNMR
 oOfmECYgkVEoyxbsC3pWTJF0KzQhw0mLla1eb8o/m7KUJuqXjStf421yGHnbWta8IFbD
 D8CqhYf7c8RVWeamF3kyuASEMt7g2Hi4Z9Ddr+818I4lNV2yUnUeFsGCamyzmf8SFCBZ
 xDew==
X-Gm-Message-State: AOJu0YzP5J75JkxX3IOjCS+96ogIvbuuN/RV7QovrAsgSHulnwqT3vk0
 s28jEYpJ6KpzTaXDBu8yMtfJTiF88drMSB1C+XPt30JZcFKuTnr2csjZjXvMBg==
X-Gm-Gg: AeBDieu777YMmbbHf7G8OWaul3uBZyk4pgu0dD4iyla7CWc2gOeaXnbyoxmL4+cQQrn
 JrZhm8/eOWi5p5I7JILmSRi8HgGBXUfBI2YDFIsspIqGYdgQjuTTNapdCPUZnWS4NDcWo54HtAg
 LBR5gi5weaGi1k6/ISk4+Uc5J2uQstlh5VLltuXcyj0t7TIieJrbhTqS6mIcR32NtElet1FTV5p
 ib8hUteBKMjtDCDqKgThg3Omic+xZ42vPCUUqpdBQVFlseOo5dxRQCy9tR/rYVsypEhpHvmgyIy
 E/hwKZBr6TJdf8+V+RTeKVvzC2eQyQslFBJFzGwZo2XbSFPY9Zu/rmFJF2REdYqYWd672rFOW1s
 IMid0Mdp9O222P6rbsutQTFLTct8S3RYw+diFTt6ydXTbuw99yhTThjIAMpedFnAPgpjUbsKzJx
 gCnPxQ6YeggV1PoUrxd4WQDj152mls5iWQwEM=
X-Received: by 2002:a05:6300:210d:b0:398:6b26:dbfb with SMTP id
 adf61e73a8af0-39f2f09cfc7mr5952883637.49.1775298876175; 
 Sat, 04 Apr 2026 03:34:36 -0700 (PDT)
Received: from fedora ([2409:40e5:1126:477b:379d:30fd:d3e2:3b3c])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c65812f4sm7482169a12.25.2026.04.04.03.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2026 03:34:35 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat,  4 Apr 2026 16:04:13 +0530
Message-ID: <20260404103414.108069-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775298876; x=1775903676; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DGBJEZjIBB7yAwTbRB5KCqfFTDlSw5wvBfj85M5FGd0=;
 b=DoQUHeAn5BWye7Eaa7eEI/f6cjAFP8gO0BJzcrc83qaFqt5FiQwN/Bt3sqXtInhvVC
 fmYe7BB1/iiyY9rixxQ0EIbws78nqx9cRGxOnR5bdP1LZx0C20OhujqAUKyftBV2/OYZ
 9upwR878GUiVNs4knLFUrsXv1T1A95NUZqwEXTndU3HbUddVVDEKWxGr/F5ONpGytt/q
 0Z4xILbjqmtNFvydD+olnsD8MjmppksOGsGpVZohnm3aJvqOKzioqVIgl0vRNQhzaHag
 TRuS2rOMeS1Uthi9EtfhnWb4D7s51YG/GvFgZv2TV0bmnSwBI+OUww8jzuJ8NZ0QsgLl
 NyjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DoQUHeAn
Subject: [Buildroot] [PATCH] package/hyperfine: bump to version 1.20.0"
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

Update hyperfine from 1.19.0 to 1.20.0.
This release adds the --reference-name option, extends
--ignore-failure to accept comma-separated exit codes, adds
improvements to the bundled Python scripts, and fixes command naming
with parameter scans.

Refresh the vendored cargo tarball hash for the new release.

Add myself as the maintainer for hyperfine in DEVELOPERS.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                       | 1 +
 package/hyperfine/hyperfine.hash | 2 +-
 package/hyperfine/hyperfine.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 15de0a3cb6..f1544d6698 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3061,6 +3061,7 @@ F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
+F:	package/hyperfine/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index ca3bb41a89..e0408ee79d 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  9fb27f85472255c40f0ac24a932fae3cb5836cc99558d1f7a36a66e937be45a6  hyperfine-1.19.0-cargo4.tar.gz
+sha256  64644b26342ebd44ad455ee7750809e424aff084bad403d04d713d729b020934  hyperfine-1.20.0-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.mk b/package/hyperfine/hyperfine.mk
index 7ab25fd4f1..8af6e0298a 100644
--- a/package/hyperfine/hyperfine.mk
+++ b/package/hyperfine/hyperfine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HYPERFINE_VERSION = 1.19.0
+HYPERFINE_VERSION = 1.20.0
 HYPERFINE_SITE = $(call github,sharkdp,hyperfine,v$(HYPERFINE_VERSION))
 HYPERFINE_LICENSE = Apache-2.0 or MIT
 HYPERFINE_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
