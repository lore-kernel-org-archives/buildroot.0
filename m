Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893E3C25B75
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 16:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E876A41574;
	Tue, 14 May 2024 16:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_GE7NjO8jnH; Tue, 14 May 2024 16:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A253C4157A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A253C4157A;
	Tue, 14 May 2024 16:53:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBCB21BF955
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 16:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6F3982509
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 16:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55HswnPZr2eL for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 16:52:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05741824DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05741824DF
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05741824DF
 for <buildroot@buildroot.org>; Tue, 14 May 2024 16:52:58 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2b346712919so4159119a91.2
 for <buildroot@buildroot.org>; Tue, 14 May 2024 09:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715705578; x=1716310378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=65ATPhcUQCi0xJhwX6MshQZgMF6opCBGrSgzCB5hWyI=;
 b=HjIIlGsDftGdaQ+yA7vL4PT+/l00XrlxuKlBpi0BVEsHDNJgvSr2282iAGVMWAGM4t
 ymyFCsBzLTxwmqP3KerSWnamCRBgU+K3/knEdDZ/uP7eisSkAsg7OVkXvFTNNpJZQTs5
 IAkVn0+YvNUav10m2gwo85/OQqKHFCg3bYR3hCO/IWGKzu2PeQvkAs7txPMRK0kfZd/Z
 EqDGGkHFD5mglqjgJCj5TXHDXgXv5SVl37rvbS/5r5FCjYlFhrrHUdPqnxPG+WVW+lMG
 Kn8Dv8ZSkpuLgcBSzgiphEHxLCseDdZb6FWj+6dAMDsV5n7rH29+WmHZQnxFYVetVfET
 os1w==
X-Gm-Message-State: AOJu0Ywm/CdZ+31V/rO3+GSEH1adm4yuLA5RkoVp1oqReLDavERfr8WT
 ix1mU0k93BQCSKRw4ilnZnk51M/egSdZTEZzKhr67NSQrEWTRAdaVXlQiQ==
X-Google-Smtp-Source: AGHT+IHwLJ3wxxYYbZe3nxN0p19BBClwutVU7nUfYurrvtpSSu9Eq2LxoanZZU7xcvcZ3DjlIm4tvg==
X-Received: by 2002:a17:90a:cc8:b0:2b2:9d08:82d2 with SMTP id
 98e67ed59e1d1-2b6cd0e7be7mr11217476a91.42.1715705577590; 
 Tue, 14 May 2024 09:52:57 -0700 (PDT)
Received: from localhost.localdomain
 ([2600:8802:2a05:9000:bfb8:57fa:3f5f:2fdb])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b6711660b9sm9942677a91.14.2024.05.14.09.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 09:52:57 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 09:52:51 -0700
Message-Id: <20240514165251.511634-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715705578; x=1716310378; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=65ATPhcUQCi0xJhwX6MshQZgMF6opCBGrSgzCB5hWyI=;
 b=S/Nd4wx/OkLmRJCW4+cRBQrTVyUkyIush/RGiWxn/7T7LcN4fywOviXf/3WrFd+fOs
 hkCawQpTRBB9PIVEXXQoUCQjzmLg7NUgrt6pSn44hI9PyGB/4XsnqFKfxGH3yI0poVzo
 A0y8qhanvOG5pWOZBN0QS3yDFpZ8gzQABAHZspnGSbW7CWDotPRAG23T2cBTbIe51f0y
 mzi6ZjBbc/qYboKWXTo6bU91NGjATwI8Ec149OL2jOKUgokY/sQyWD8pst7lRC4Io5Me
 dWUdcOQo8rkiF9iru9YFc6eM7DrfZtzFN2y4RCWbRnxcMfvYCovgc3rgGofSt4/h1cKF
 pOIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S/Nd4wx/
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.11
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

changelog - https://github.com/pikvm/ustreamer/compare/v5.51...v6.11

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index d3f603e0c8..7c70f0195f 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  88f107e02a0b5c6493d55ed1bce0c85f66ce83d2bc0271ff6319ad593c6584bc  ustreamer-5.51.tar.gz
+sha256  80ab01eeaa81c7d8e9c7f62304287d176fd729cb12ca5adb2e181b5a3da79216  ustreamer-6.11.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index dc8577b5e9..5b73e387d6 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 5.51
+USTREAMER_VERSION = 6.11
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
