Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FB4CCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 09:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12B6780F4F;
	Sat, 11 Oct 2025 09:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuRkS4uQD7WT; Sat, 11 Oct 2025 09:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A11BA80F52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A11BA80F52;
	Sat, 11 Oct 2025 09:40:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28E4FBC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A5B46069F
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArM13sxW-5jS for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 09:39:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 539E86068C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539E86068C
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 539E86068C
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:39:58 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-3322e6360bbso2709724a91.0
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 02:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760175597; x=1760780397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EKeb/iGzDOWsByC12AQOiNclgkGRQFxlgv+9B6hX97I=;
 b=sgOSig3N+PmoukSkEXZNxVb2tT1E4eNBF1qjkeVRHiR8iwkPAVzxFahnpM8HI/reiq
 jxQKDdcTE0SUEtipQ1aPb/kYl4xbyT8TYzljrj9YgszvKv77zYnmpumMVgqw8FjOA0TC
 aURgdBqZQh2Jtm4zv3wucFoDPwFk3+x45plD63rBY+olf54gwBWt411J/xUjLPjI6Qse
 EAID5m/eZ4VA/9Os/l1vBwbvzdl6WUhZDaBWiM+c897ci4wdhVWuQvww9PiS8i88fHmV
 q44rTTEjhB2hyLAawtgC8COmIXc10pyYngIJEUU1MTDuo+5BIaNhMdoSnatJH5tRhyW5
 qRgg==
X-Gm-Message-State: AOJu0YxS/IhGTGB0QmtH2fjx8beyL/k8eKCanSc9twqAhfEOg4LuNQTY
 W6k6gDAaTJpb5zm0fmU5T1JfDVSHcjOjwzkuA1vSoJynXLPe2ccCztDd/UCTka3s
X-Gm-Gg: ASbGnct1eoFEaU/h7sAYYqTQnlDU+N00mlNNJxFxKks0jRnO+P8tHj5DbeUMmVhJcRr
 zM4aUll9bD6NoftnyoP2cUZuR3vqlim8YlmzhOE+oRjpK3Fh+kRi4LQVUvfdupv48iP0yvi8sup
 eFfC7ujXFiA8T7EALP6NEUnOMFOQV7PTtlOunIbzGcMFwxjOwwr8cmVOYu2JAzhSUnyMPvUuh0p
 3gwU9XfAS75NkN7W2/k34geQGjjUbRKUOCJCkUMMiIaFwjw5ZQCZGLGzn+OcFrMacPe1IJqfbIF
 Wr1yCP4JLRY7w/onfXi2flV+xO/XP6jQxvHddeov5IWud4y4QxZySHhSmmpms3x70aMbru0xJbT
 aRsJpes2J1EiabM+WMNHTj8lzM+n4yrI6hdNfnG/bzk8yIQuSsORg4w1pZTi/Sre9JzFBAHYDlb
 KYLoyi8wZggKK7sTP/975pXpuCXWKvWkA9rB+84oauKGn47RXwwUReiVldIHQ/W/Q3RSw=
X-Google-Smtp-Source: AGHT+IEowp7KBd8DLiUujn0ky+sFd64Abtrp0ZxyjS0x7D53WVfZHGWKul/wrnIOhexR/PyjJAbplA==
X-Received: by 2002:a17:90b:38cb:b0:32e:f1c:e796 with SMTP id
 98e67ed59e1d1-33b5138404dmr21397190a91.25.1760175597172; 
 Sat, 11 Oct 2025 02:39:57 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61a1d386sm5903867a91.5.2025.10.11.02.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 02:39:56 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 11 Oct 2025 02:39:54 -0700
Message-Id: <20251011093954.537713-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760175597; x=1760780397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EKeb/iGzDOWsByC12AQOiNclgkGRQFxlgv+9B6hX97I=;
 b=BBsrDTOUryHYb6DrzHMUhLLV7akLUaqboWtuxnnZzFjE0hdMMaS2E0YYRbBaPQ6gkl
 eiu22YaMy7vHgGdM/szbGmFjEkwbWbpzqAqOOLmwYZm2pd1VTLNhcdLjBcwy2RQsi0QP
 +F0C8q/Rq7t6kky6/YEO1PLLk5FwTJ7qJgAJxwBFe//zxyd1wc4Ge+Odk6E81RM9vlEC
 h3RKEFYRwhN9NbNdWf0svg8Hggo/DBW1Ckfo16vMIwdt8WMYufnTF2XYfVBHYLnhzjFh
 dcm3TlrkbIh8WHu95lSNnSPbIqvLeMmpv9N6BciXBQbjzfQr63gfNMeoiRbt3bD8Mzb3
 2bVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BBsrDTOU
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.400
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

Release notes:
https://github.com/vcrhonek/hwdata/releases/tag/v0.400

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index db9a789dec..20760d53d5 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  74872355e14d5ddc48a0f63036227ffb5f7796a3012c6377ac1fc7432ffe2b41  hwdata-0.399.tar.gz
+sha256  05d96821aaae04be4e684eaf9ac22e08efe646321bc64be323b91b66e7e2095c  hwdata-0.400.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index ace30889f0..2fef94a595 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.399
+HWDATA_VERSION = 0.400
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
