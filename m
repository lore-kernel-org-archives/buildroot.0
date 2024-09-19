Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33557CF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 18:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BEDF84A39;
	Thu, 19 Sep 2024 18:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cx8x_lDiN5Bj; Thu, 19 Sep 2024 18:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7960384B5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7960384B5B;
	Thu, 19 Sep 2024 18:48:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FF1F1BF5A3
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EBD441463
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K06G-jVPXk8H for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 18:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 177044144C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 177044144C
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 177044144C
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 18:48:00 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a08c907245so4557415ab.0
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726771680; x=1727376480;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sV4gTSM/WJkMb9F9GJMazeKHXzbF/KYwTqlJiS8eHzs=;
 b=MZGss2hZG+DElqdsV6qy3sGs5fozjHJQTagJDAqiaYpaf3+xcIo+j3t1oFTQFjDY4O
 +XCWtYQ2uq5tJpyLfnvE1/+62pbuw5LDacHvLuH7AmFBCWDLGIIMEzyWmRuyv4j9z6Pz
 LZA3GdVLS+cWU9pZR83dti+JR28xsiLY+q08momxP6+/E07EXYkNSnO1QXoLKe01sKxd
 DKzlkY9RwsGbDefCbuNGHQX38rs32Vlb1PdpjzMVkvq/spdh3E39zWX3vv/Gj1MqpoCX
 vsKaWtAu9XEnhPxj4jldVqcH71KekcL0XZBnFwH3S4azFbkXFenssyLnRtC88b7lERXK
 C4tQ==
X-Gm-Message-State: AOJu0YzFf77zIbibS+2j2YC2InRPdxwaC8frhMWmXyRoieE+bwJNkxkG
 lWPapQHpzfTOEHzueoGnlIwEupSVqvGMxB7r9Ejxx0db+W1z2MG8ksu7SA==
X-Google-Smtp-Source: AGHT+IGa+r/BToqzpXe7am1EEQK2+WyhC6jME7X6gDc4AJLxBEqDhb8m9/8xkOT65kOaKzJUBSYGjw==
X-Received: by 2002:a05:6e02:1788:b0:3a0:463d:ce1e with SMTP id
 e9e14a558f8ab-3a0c8cf777fmr5184895ab.12.1726771679841; 
 Thu, 19 Sep 2024 11:47:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfe7d9sm35802645ab.12.2024.09.19.11.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 11:47:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 12:47:58 -0600
Message-Id: <20240919184758.655792-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726771680; x=1727376480; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sV4gTSM/WJkMb9F9GJMazeKHXzbF/KYwTqlJiS8eHzs=;
 b=m7JB5jnNmoxpQsDv4uvkfaJsXytLqimY4Ngb+GW158eNrQkdeR30QJ6hhhpvJAuAWF
 IadTW2BI0s13LG8GkEpFaJnB3UcuBBsjpEmGgzjj3nhZfsySafse2b02WxQwws4v2QCR
 eg2ciZvou5f0qXvxGFWAys3DSBwIF2M2pTJJCvNjOLmJm2uMf/IyFTigXi+3+JFFLq65
 O4h/qjx0FPxMmiDvgrCPn3bm4uU/DqvfVX4Bo2SZlJw1AYdxfE2JYVv5dFuSEbL8VwG9
 XCMBOJ5TLQMtjF4rOU+RjvioDifmL01rGmaRS/MpLx8r7HQwT1FOzYTnobY/ekXZmXMe
 CrUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m7JB5jnN
Subject: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to version
 0.10.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 48be6b3a8b..c8b8f65d0c 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  ba84e7c06bc1dcd3151c3d2132621cfc  s3transfer-0.10.0.tar.gz
-sha256  d0c8bbf672d5eebbe4e57945e23b972d963f07d82f661cabf678a5c88831595b  s3transfer-0.10.0.tar.gz
+md5  891737ce35aeb23b02a47a72c7f9b639  s3transfer-0.10.2.tar.gz
+sha256  0711534e9356d3cc692fdde846b4a1e4b0cb6519971860796e6bc4c7aea00ef6  s3transfer-0.10.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 6fae824862..1851bb8426 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.10.0
+PYTHON_S3TRANSFER_VERSION = 0.10.2
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/a0/b5/4c570b08cb85fdcc65037b5229e00412583bb38d974efecb7ec3495f40ba
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/cb/67/94c6730ee4c34505b14d94040e2f31edf144c230b6b49e971b4f25ff8fab
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
