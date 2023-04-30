Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B923C77B73
	for <buildroot@archiver.kernel.org>; Sun, 30 Apr 2023 21:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCFE48209B;
	Sun, 30 Apr 2023 21:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCFE48209B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeaXDa8lCryr; Sun, 30 Apr 2023 21:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC85282072;
	Sun, 30 Apr 2023 21:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC85282072
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 916261BF471
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 21:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B13840153
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 21:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B13840153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmfKKZ3qa2SO for <buildroot@lists.busybox.net>;
 Sun, 30 Apr 2023 21:21:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F3DF400D8
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F3DF400D8
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 21:21:20 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1aae5c2423dso10809765ad.3
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 14:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682889679; x=1685481679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0GXwvpgTZGBMPGqd9EgO8pDMz5t9yZFmqqrnpyJ9RKM=;
 b=P30G/nM9SfPtvDsdpuV76grtsv0NkqyORQZt8QCxwZBezIzfiVq/VHe/PCty5CiThh
 9SxVy4dV8A0a9g8fKzeCToRgPL+DdGUkdtQlL5GYCfhfdK3xLtowvGxQsqHO0HAsyi1X
 gQWk4tBh5RTX1YQzJmIVOp16FeD7pMd3sS/46KdVqtYu+jmMLyk+/tNJKRsCdkFz4cRw
 R/XX0/Rz1JR0ORpn0W4tYo+QPX5wZg1aNn4XuKV3xkkq3NTZuWNSmq8eLQUe2d2lZkAD
 1M42D2Aal1Zm3WShitl/rHIkZ9v/LNbIJ1bzzw3QoEQjif6PNXlI4yYwQ4xqvqTrKOxp
 4pGg==
X-Gm-Message-State: AC+VfDzqCFxecsFl/C2PEOmj61mtcA3nj6w/3CQTmdCcMmTW8H7W8pll
 5VItxYzm0DjuT55RR5OKa5RYYCXd5Bvbxw==
X-Google-Smtp-Source: ACHHUZ7TOxiSyr4UI+0oOIhqkQw/XiKGZp0phmLd7ZkBMRB62G+5lQ9XMj2A6Obnw8FKUHtMDeNWww==
X-Received: by 2002:a17:903:2282:b0:1a6:84be:a08f with SMTP id
 b2-20020a170903228200b001a684bea08fmr14810601plh.64.1682889679161; 
 Sun, 30 Apr 2023 14:21:19 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:be6f:af3d:6282:7132])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902c11100b001a6801fd9easm16589230pli.176.2023.04.30.14.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 14:21:18 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 May 2023 09:21:10 +1200
Message-Id: <20230430212110.2360240-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682889679; x=1685481679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0GXwvpgTZGBMPGqd9EgO8pDMz5t9yZFmqqrnpyJ9RKM=;
 b=LVWx2X2tUJGl1kgNir6Oac4F0MV5vwXOYJI3h8MPrds8Fg/BLLtdePp01LBn80Xogy
 omER3+1LZlh8nSaaGVd/edVirhw1Skzga9s11StOKUnBMtrvWmWGbdL7r1M0/8rw2KhG
 GG2S1OXCcp8Z5dL3k8UNVtuVcEvyposP+caviyEZEvSkOhKSAKCvG8TPLVtaEU6SNhfy
 QmSxMhQ4HJk36OeinlSbPY5u7Tm8I/D0h6URGTQJrnvvG92Uhi0zILZt7rS/owktZWjk
 c/JgeInxXsUgV2eviX6N3690dUYRvrw7RzTf/qLcxFqKPT0Vx/gAM5F1BjtlyOLqcQbm
 QyBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LVWx2X2t
Subject: [Buildroot] [PATCH] package/syslog-ng: Bump version to 4.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump version to 4.1.1 and update sample config.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 69db9b4b78..f4b74dc8c1 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 3.38
+@version: 4.1
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 6fce7be996..8ab4d5ac3b 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5491f686d0b829b69b2e0fc0d66a62f51991aafaee005475bfa38fab399441f7  syslog-ng-3.38.1.tar.gz
+sha256  d7df3cfa32d1a750818d94b8ea582dea54c37226e7b55a88c3d2f3a543d8f20e  syslog-ng-4.1.1.tar.gz
 sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index a7176ad129..1c4cec6adb 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.38.1
+SYSLOG_NG_VERSION = 4.1.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
