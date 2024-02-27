Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4EBC54798
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 12:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A37880F24;
	Tue, 27 Feb 2024 12:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9anH-dA2hSM; Tue, 27 Feb 2024 12:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE52981750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE52981750;
	Tue, 27 Feb 2024 12:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECD461BF338
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 12:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D747D404D9
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 12:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLeaeLHTwKj9 for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 12:01:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=bobrofon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A70AC404CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A70AC404CE
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A70AC404CE
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 12:01:31 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-512bd533be0so5070164e87.0
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 04:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709035289; x=1709640089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EimpP1LWEobe4qEVjvaEz32e800ZDAApjepiPKQ6mnM=;
 b=gUZfJZpfYSCQ8Pok2JpHQg/k807AFVmBwfTwVTvy5iMW+j3hfq+51LhhmAtrVCHT/B
 4y3+P8nQS0gFs6qE1j9m43+TcsI+HHMk3xMYFrfPF+0QVQRVeGSqoLivZ34VKbGVRv55
 wLiWV9uloVBio+fXZHKOKeMWXHgPt780jFNoBvOQIAHsTSTc24UcMCcRIhD534iJX7XY
 6JW3yE3WBfmhMUkioXr7grKqmD98M0lsyUPgZskzMPKzTcErVGRogZNgwOf/3UAxrZu0
 mueXLa8ozKgWGNYtMEAsdANuP6VO+p3fQDHxa2dV/6nw6y6b9054PtG6tWW2Homi1tbS
 q7Xw==
X-Gm-Message-State: AOJu0YzLcuonSpichvSTOhIFQZiBNTsMRcpjVe9852CWjw00yEI5I8u/
 f5/h0wr36K4KvOj9gPDJeW669k5F+1DSjuxaJiP57JTwnKUQA5nmQWVlX30N5ak=
X-Google-Smtp-Source: AGHT+IGtkxJObVRSu+F0nnyOByQsrA8jRRE6G42ZtFCpz/0saMBFcFPdjT2qiz2KJfvv3CwUvolVCQ==
X-Received: by 2002:a05:6512:201b:b0:512:a6cd:b37c with SMTP id
 a27-20020a056512201b00b00512a6cdb37cmr5367819lfb.47.1709035288629; 
 Tue, 27 Feb 2024 04:01:28 -0800 (PST)
Received: from nibiru.lan (109-252-187-192.dynamic.spd-mgts.ru.
 [109.252.187.192]) by smtp.gmail.com with ESMTPSA id
 y12-20020ac24e6c000000b00512ec8f4840sm1168138lfs.48.2024.02.27.04.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 04:01:28 -0800 (PST)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 15:01:23 +0300
Message-ID: <20240227120123.405763-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709035289; x=1709640089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EimpP1LWEobe4qEVjvaEz32e800ZDAApjepiPKQ6mnM=;
 b=W15lblDipStFpG9SLUgGQuPPtO5mVqWDHPakgaeersMfysEstGj5MNjYfXLkcyVhdZ
 VoO9MGJlgX2VGPiJ2m3U5EeczQbbVKzmV/nC6OnhnuF8go3A6sJ12ccI5fUce2Igm7fW
 NfOhc8gc2NGO9USmzkoTDKkXXoV/bFSIbaQSl1C3RGQmmGyQTvSXBZS9kCl28+kq8CLo
 rogA8+mrFDkKgLq97IaXVSAHXQywj2jQRZCdDicThE0T3f0NbUVhfS+dWGKjfMlsPz2i
 1JINfKKPdbg63K4NsEt7rj8jzv4LUQ0cqMZJcAPQ5qRa3Jp5VYYESrk2Edkl1HHGCCAw
 ME/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W15lblDi
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 1.5.0
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.5.0

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index f4336228af..b5ca7ecdff 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  ca7405c7f0f9ae3023dcfa37bc68974c4b8a1c9ea2909b970e0aedc3e8657ee6  sdbus-cpp-1.4.0.tar.gz
+sha256  577986929f911320fb9ef6a3e2badd464dc38411ebc25d2966f5cb85c39f0897  sdbus-cpp-1.5.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 9ffaeb26d2..18fc6a88a9 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 1.4.0
+SDBUS_CPP_VERSION = 1.5.0
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
