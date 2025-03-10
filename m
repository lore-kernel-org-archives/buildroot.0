Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B26C28B28
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 00:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 319516069B;
	Mon, 10 Mar 2025 00:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53ICBXzoSYsk; Mon, 10 Mar 2025 00:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54484606F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54484606F8;
	Mon, 10 Mar 2025 00:38:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37BB01C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 00:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 240A8400D3
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 00:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVWHZ3Zi4f2g for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 00:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=kamath.ben@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 146BE400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 146BE400BA
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 146BE400BA
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 00:38:11 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2fee4d9c2efso5987035a91.3
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 17:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741567091; x=1742171891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OngGQMjlwh7NHc22USTIDMg/VGBM82q0YCw+wRa/X04=;
 b=G0kJZI1KVPq/wLyOpRAYYIMYfC67IUye0JtXHdFhptirq5a1ix128i/LdT9qmmAvkB
 /UQusQv40vY07GHxkL3x7r9PvX0HunXNkAwVSFnu58xP3+flHyO+7A9dQhFl3glOC2KE
 Ojkksx58X4hYJU0GA83R9uX6fNnLh0vszsLJpwC5wZ7ADPZfLaS3w1Rc+t8LcHyUKEVw
 ZMBI2qRlmLGV7XTOwTvCMgMilq0xkobLya+djAcBWoR64RYjgFjeRTO5+PlIg96Czmz0
 AHAx2xOltMfMfBNgQou/1d9AvIjpeTw6IQwQkK9jin1gYiGehXP+kgA0LhsFEPT94gbf
 Yxwg==
X-Gm-Message-State: AOJu0YyJpJyUosQUXvfmHNaC7QrJOr1kcihFiQplJtpx6WrrFeJ/HNNt
 2acizvBdK4yu6hbHf0afheZw3RX8Ok8O8AhaQJGNuWKbsYjXYkgm37Xf8Q==
X-Gm-Gg: ASbGnctsI/ifFTENxbeQyLB02DdTIy4sYoWtyX1GUDEQKnqIMIM9up1kyc/thQtsZN4
 2K78wqhQTbbng0pmNxZ7MGiphtydk7mUwoJo09XSZUKv9EG47Gz6zkydgMdeOW5ty5wu2m+luSB
 xmeOANWEOJUwnyIuQd9lKPVmXFE6vcKJfffPE+eNJV0ellVDnRzag7NyKYuvPqQZaXrLi85tXSQ
 wmsi9DeFxUrMuoc9mYuHoe4FkRqWv3TADYAyahHtnslggK7BM9fy3STY3w2bPbe7zfnmmcTmSuo
 YNr6nJ44T/uenDwb1kHUzzTBa+UUBdD0+px+EYv4WM0CYB0snQexaednbM8G120rbXFNsm4sMXF
 k61xm8vPUZxeWrObeoX2t
X-Google-Smtp-Source: AGHT+IEOuB49pn+R/w+EuEkRf/vAcXk7VeABZdYbyAMbP0dPglBW+/BxghzgyQfVrBu4/iPyihwiKA==
X-Received: by 2002:a17:90b:2782:b0:2f4:4500:bb4d with SMTP id
 98e67ed59e1d1-2ff7ce8b5f4mr18834740a91.20.1741567091093; 
 Sun, 09 Mar 2025 17:38:11 -0700 (PDT)
Received: from localhost.localdomain (c-71-197-228-50.hsd1.wa.comcast.net.
 [71.197.228.50]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410aa8a86sm65231005ad.240.2025.03.09.17.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 17:38:10 -0700 (PDT)
From: Benjamin Kamath <kamath.ben@gmail.com>
To: buildroot@buildroot.org
Cc: Benjamin Kamath <kamath.ben@gmail.com>
Date: Sun,  9 Mar 2025 17:37:19 -0700
Message-ID: <20250310003721.1642270-1-kamath.ben@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741567091; x=1742171891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OngGQMjlwh7NHc22USTIDMg/VGBM82q0YCw+wRa/X04=;
 b=ErX97U/jdOWRzYWbTrfBiJ+2U6atDWnPN7L4ojMEicLY+Dd3fMrtglR3eaj8R6kD+P
 iqhtqHNkeDOBfW1rbha+KMYx3TjVNg5DgmtwClGmmL5w/ndbUIFsML11tJq3j00MbgbX
 KC00cReR4QeNnheQ0AZUQFdGERxwR/6vVSsEqrWM3cQO9muY3K3WAZ6gB60EF9MIlneX
 +AOwwDiHkFkoZN2tHZTW2JX83ew3FCrkvb7e+yWLkIxZWmZbjzM+FjRC/kxXveUac7/e
 nI714IPD5kmQ+VXIj0ZJLIl1FIm6R90elu5fZ895mLPu4X0sIAsimVncb8i2uDQWdskl
 YG/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ErX97U/j
Subject: [Buildroot] [PATCH] package/lapack: bump to version 3.12.1
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

Released in January 2025

- Updated LICENSE sha for changed year

https://www.netlib.org/lapack/lapack-3.12.1.html

Signed-off-by: Benjamin Kamath <kamath.ben@gmail.com>
---
 package/lapack/lapack.hash | 4 ++--
 package/lapack/lapack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
index 4d4d2c0596..243f6998ef 100644
--- a/package/lapack/lapack.hash
+++ b/package/lapack/lapack.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cd005cd021f144d7d5f7f33c943942db9f03a28d110d6a3b80d718a295f7f714  lapack-3.10.1.tar.gz
-sha256  44f7c08ab11e40b21d8bf8220712929ba8d0204645d2174869acf915562d0969  LICENSE
+sha256  2ca6407a001a474d4d4d35f3a61550156050c48016d949f0da0529c0aa052422  lapack-3.12.1.tar.gz
+sha256  978539245c405775bf347b1256c36df4daf8b69a64b099e94b1d53742201621e  LICENSE
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 3c1ab1fc67..e3b914a94f 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LAPACK_VERSION = 3.10.1
+LAPACK_VERSION = 3.12.1
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
