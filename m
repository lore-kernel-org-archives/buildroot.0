Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C584C021A0
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 10:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8092403A7;
	Mon, 17 Feb 2025 10:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sr9Oa58vuNO0; Mon, 17 Feb 2025 10:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A516840838
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A516840838;
	Mon, 17 Feb 2025 10:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A88B772
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 10:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D2B081E7F
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 10:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkjRj1HeWPyK for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 10:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FBA681E74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FBA681E74
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FBA681E74
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 10:09:00 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6f9625c0fccso34488507b3.1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 02:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786939; x=1740391739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r5+x64Fh0tOpdk9r4BTdot6R1C9pIrqx7ZliA12KK0o=;
 b=fxHlDC8R9JJuMOwILc4JQmMfDr95K1mKe4Ae0yowpAPtgPeKfMdtDWTzYPKG6TyRL2
 wcGkASi8CXyiKzCkanZeekoXGRZNZE6WKmylclt8+O8ml8O4V6tZZaFgWiuEZFONafSs
 WnBX4hQFHKOMHqPuIuYwrSU6yU9BfrhvOYtrwJiRFn3k2Wo+6hGw7DKH3kTdLSv1UAxi
 zs9zLn1XVAZC0jbdkdWBTMyHqJKtKcgvjT0lNgWuEEV2cwgzwAWDvhJqwBY1VKvNo1tx
 GiUS2lYVaC+OfGfZvB+VkGeZNiEQCX7xa171JIdz3+H5HCAmkTT/c2DOOZMQpCQFeYNC
 q0+A==
X-Gm-Message-State: AOJu0YySbLg0fuXhK+tW0yDgyQUaCa4uV5rsU3KVIxFtj7EFar90TR+O
 qoNUFkI6wH1vseAwuOqoYd66Kp717oNiDPQYaYPV6YoFwIl+oz19mTsu3w==
X-Gm-Gg: ASbGnct23e2sDU5ibr8SYMpnNeUxEtMBc7pxnJTi+EnBBOpNMewX6IETfKMnmjX53Sc
 Kq18PcM10ZY1V/URZ12BKV2D+HjPklKR35hCk4KdTIW1q5VUen0RPfZ9AfsBVH4UTpzfMw36a4J
 0x7YJEF+sWqqMEivkVUBV1E+T7fKz/pvHCACvxCYm2LdXYF2wRrNzJzypqHejBa50lUZ1tZC/sV
 158qoyJ9IVh3RE6ABpDOv4xGfdl9oeBgcbPoENR6CY5GduJMo57qd+5RnujSKc9rag3N1rNNUn+
 hNDmK4rSDok8
X-Google-Smtp-Source: AGHT+IGvFPM0vUQ2FkR0Mmx3JSJ3nr9DpKKCwtpzAn9fuJHodxpT3yNg1gRMW5TqF+d55fvRXL7oPQ==
X-Received: by 2002:a05:690c:600f:b0:6f9:a3c6:b2e4 with SMTP id
 00721157ae682-6fb5838214amr74347927b3.37.1739786939059; 
 Mon, 17 Feb 2025 02:08:59 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6fb65bc5cfcsm8653787b3.89.2025.02.17.02.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:08:58 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 17 Feb 2025 18:08:16 +0800
Message-ID: <20250217100836.13604-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786939; x=1740391739; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r5+x64Fh0tOpdk9r4BTdot6R1C9pIrqx7ZliA12KK0o=;
 b=AM08vtkcoib4Xg2FN3bWTAu0CRDvCR7JaewMskQ5Ph0COsbkG9PXfFa79MzkNCjJ93
 czs8N/LbZVlvoDqUHxTchWbE24aThVDvIAE3p36n9IefmWO8ddppBGqOx58pnkLG6Tl4
 oW4U7yYi57mzZ7z1Phr7D/VKBc9vxZrfp5fOTQ1AnptW0cqbHlnbmYbh/bsBycIOVIBE
 PTyLp/LtX5Uex9jPM5Ygax/Myd+H2J7lTyBzLMcS7SLI2u3psVcd4x8vRaGRcH6NdB8V
 GJA+SlvYbOQDTIU0fxQodov+q+F+ZD7opkPuChOMLtvON5bFQWq6LIj9zv0t4eFEUst2
 n4vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AM08vtkc
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.18.1
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

Release notes: https://github.com/timescale/timescaledb/blob/2.18.1/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index f799b0c7f8..7c770618b2 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  86248970971ad075e0b5ed64dbba5b190eb8794d6e36b508427a5cc42b20a420  timescaledb-2.18.0.tar.gz
+sha256  f293fc54bc76d06c5955ae68e2e8124331bee80aee8b499047afae01b10513ce  timescaledb-2.18.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 99756cb0b8..c1f65d5f3a 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.18.0
+TIMESCALEDB_VERSION = 2.18.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
