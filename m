Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AE7CD37B5
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E5D8607EE;
	Tue,  3 Sep 2024 22:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUDSPLehl7IR; Tue,  3 Sep 2024 22:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B380607C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B380607C3;
	Tue,  3 Sep 2024 22:03:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2999C1BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23D0A40245
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0cKgVyVPJcv for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AAC640175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AAC640175
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AAC640175
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:03:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso739345e9.0
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 15:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725401024; x=1726005824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QhNKKq2HJadIILy65OoemhQg19eGKykd6yXA02bwwfY=;
 b=VfiM5Baa48ZfcTWjaA7xqY7NqDp9slYuQBbRzOte6sDW8LdS850CXNsGKgCjD1iVPm
 6SCMuFqMCBqX3s0jVt36eIlcHrLfJZfmomdhLoczf6DLmc/VrNetGmj3hbE1Gu/i51Ll
 K/BP6AMCLPrnPdmw9zX7GTE4Y3NVRHlX3umj3kn6j2zBw0MTJVLl2Us/TjBWvlx25dyz
 wIpal4zmNIdnbNnFzpwFIyvRrPhFtWhi6yf2wvIiEHQOltOTQyGW/abyRtu9bdBaNFDi
 al1mHuLo9Hg9jQB71Bodd1A18JKXpAwxE54MT/t2d1sBOzoljuEA8nY/akFyGvhwdPt6
 8S9Q==
X-Gm-Message-State: AOJu0Yy0uBnh5uPk3oTUyxqOAkZNkq69ewVMm6KAa4XDYHg8UhXplSgE
 EbXnEAIJT8jOus1tkCgtb2/QvvPcf62YUgBWnCLaUiN+UE/K5orfekKDKHyGdiBbxh36YctKWjd
 1
X-Google-Smtp-Source: AGHT+IGucAvYJ/o+X5DGY6lskQlZAM5N2o5WvC7qT0XqIsVC0n7Oerb10GHvH8pzf6y04oubM/Sivg==
X-Received: by 2002:a05:600c:1396:b0:426:61af:e1d3 with SMTP id
 5b1f17b1804b1-42c9549a39cmr1961175e9.31.1725401023877; 
 Tue, 03 Sep 2024 15:03:43 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb37f7849sm189805685e9.7.2024.09.03.15.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 15:03:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 00:03:41 +0200
Message-ID: <20240903220341.1335509-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1725401024; x=1726005824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QhNKKq2HJadIILy65OoemhQg19eGKykd6yXA02bwwfY=;
 b=nRGg/KpenznB/ERn59WxBN09QMRClixV64LJ2Ze3WBF+Nx+nWntJROCpVpaWbJq7MA
 3PYSkDndpmgcA7h74BFXssAyxDkzu6yuz7MRdzoxn8/u6bI8hbJnYKN+KDPFidIABcqG
 UT2f2rgvsMsD3MtRVnpO2jfJJvOtGr++k6CIY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=nRGg/Kpe
Subject: [Buildroot] [PATCH] package/mender: needs libopenssl engine support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 623d3bbe43e9193aa8e3395367d01af59071b859 disables
engine support when BR2_PACKAGE_LIBOPENSSL_ENGINES is not set.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7717334889
http://autobuild.buildroot.org/results/818/818f8c156311010d03d2f64b42231f486b543837

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mender/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 4831548f76..c9b9d0b757 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MENDER
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
 	help
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
