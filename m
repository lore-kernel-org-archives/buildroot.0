Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83569C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 23:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22DAE40015;
	Wed,  8 Nov 2023 23:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22DAE40015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIQa2ncuFnBB; Wed,  8 Nov 2023 23:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C18640296;
	Wed,  8 Nov 2023 23:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C18640296
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE2641BF3BA
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 859BD40015
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 859BD40015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8wtziJ2ONpn for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 23:41:38 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4379240296
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 23:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4379240296
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-35743e88193so1244235ab.3
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 15:41:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699486897; x=1700091697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=16lkHi5HQkGpjOsMVDNPEQ5EzpGqlY1INSD+pSYQoxc=;
 b=O/dpiiAnfyuto2Rw50fvuD+yurn2w3i2p//atOP9o/L15WaZ/qSK+ExBaXuVULvE5X
 VI/xLm8syzRh742bS6QBzYeYlTQMppmEpCjL6iqghOwpzQ2IeROnwAvlAuzZBUXrpwe2
 lgI3AlpwuPy4UN27dmulmd5gHUb6hM5bwuqPmCPRXg5a7C5jE2/w4M9D7yjyuswrWVRT
 zxc1hPcNXGwYmga2Ax4EwyohW6LzoDYk+1YD2Otdip5qUTbRppI1QMnZfwGnNIrUC8Aw
 tcVLQUVDegdyJpiI5fbTpjPAEwhb3b/jSTZtalIrAnjqHJAZn/inkLH73nrdb/xsykCR
 97bg==
X-Gm-Message-State: AOJu0YyKVaXCfENE+98mek61spiyf/ygzn2Fm1MjHwd/nZinfrq/qAQC
 m19K4WzZMujq9n30YY21521pmS68dgE=
X-Google-Smtp-Source: AGHT+IEUHUBO0SOEy1nvsNs1iC1qcqOeepb0iYWgv8F9JY6aA0uODsu19LZk9TuU0TklqV8D4Gz5UQ==
X-Received: by 2002:a05:6e02:156f:b0:359:4a25:fab with SMTP id
 k15-20020a056e02156f00b003594a250fabmr3917393ilu.5.1699486896806; 
 Wed, 08 Nov 2023 15:41:36 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 h11-20020a0566380f8b00b0043a1e2ffdd8sm3441968jal.33.2023.11.08.15.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 15:41:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 16:41:34 -0700
Message-Id: <20231108234134.3652054-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699486897; x=1700091697; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=16lkHi5HQkGpjOsMVDNPEQ5EzpGqlY1INSD+pSYQoxc=;
 b=T45ejhU3sE+HVJQqiNqxmxIxTa5WTzlXB7N/3FXxDzeWpiINmD4IBqTMSa8Qfnq48n
 v2C0zkSJx7Ocm7zmtAyJ3Av7+e8LIzN9xMQ3mioxmg72Pb36ZHWWR0uvKS0lkIPolZCz
 zBdCsx+NT2kiDG4yvaybKAIebscr9mvlBqX5nCrhy5HtAs5GB7LguCrE8dQ5yxqYC/bn
 tcRViMceha5ZQrJathwl7011Ht9szrSI1E6q7hOu50DcOEDTFadRA4CayxXPB8xqcprH
 3lhbyWqM60vwKseTdsK6v5osWMK0J1kC3MK5dWt0xgYkxSjBwZURD/oPbCQezCVRnmdY
 //pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T45ejhU3
Subject: [Buildroot] [PATCH 1/1] package/python-mbstrdecoder: bump to
 version 1.1.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 4 ++--
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index dd2f412bee..2943ef293f 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mbstrdecoder/json
-md5  62efa113a3cd2d40942359d6699338f7  mbstrdecoder-1.1.1.tar.gz
-sha256  0a99413b92bbaddda89d376f496d710dc7131417e98414a756ebcd41374e068d  mbstrdecoder-1.1.1.tar.gz
+md5  33522a4bd9217dae46ebd0761e1a1e7c  mbstrdecoder-1.1.3.tar.gz
+sha256  dcfd2c759322eb44fe193a9e0b1b86c5b87f3ec5ea8e1bb43b3e9ae423f1e8fe  mbstrdecoder-1.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index f875e4d71d..566420a60e 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 1.1.1
+PYTHON_MBSTRDECODER_VERSION = 1.1.3
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/ba/ac/ba46bb6eb6165541ce25ff230469efe1c04043cf173f856dcc91876c38de
+PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/70/8f/dd5d4efbe3f90d2d38c948f0ca5c698e2d6cedc58ead2f5b90272cbcb4fa
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
