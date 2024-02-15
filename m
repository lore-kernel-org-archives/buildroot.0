Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A383C48BC4
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB9760FF9;
	Thu, 15 Feb 2024 14:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2u_E683o6gV2; Thu, 15 Feb 2024 14:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C34C761010
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C34C761010;
	Thu, 15 Feb 2024 14:24:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E37F21BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D172781A34
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fQ2uEhIibPV for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBFF5819FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBFF5819FC
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBFF5819FC
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:24:40 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6078ad593easo9277807b3.0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 06:24:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708007079; x=1708611879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXGk526ZuPnWAwKv+uS8U1Avh/m0GRAMzJ7qTkaIsvo=;
 b=UZzEE3SRNTp8N4mSHD7bFYH0DQPg/ZUiIHNnIukVMf9bF7MRgZcAecWkKCtKhsOgSl
 PeZy2/oHtWz+btuJiR5VFRBfW7qRCfr4hittdzSYQTmfToq++w7vn2Uy+XcKhno7vbs3
 DYH6Tk7o5JOXGrp66olTqkHRSO7hYTnxHgvcsXDr+lKwJNPLkBXQG//EiKiDWY9Vfw7r
 VBsv70nfK4YcP50yLfC2mnw8gUHFXIwq+IO1fTiVWSSh8S8+nzl7Ahd0gV1qeFWo6vei
 KhJhNDdbOW8hjXWFTAXUD7xwKpyOIJbbZNjhDHm+KuShhU4fsRU+RtAYZwS4W830TU6m
 PjWA==
X-Gm-Message-State: AOJu0YyYSE5nmXQOYaXEryEjixpqPuXsvetFz28+THENsDkMAFeCNbAk
 aU3eEgcEFULGaTqkJ+kMNlRGwK1U4CX2Q3yHesb+xY80DiQM6xj65ogrd/GZp7w=
X-Google-Smtp-Source: AGHT+IE3iuTItVIYpwy5JMvnWeXGDxogz/derm4zprhRHlL4zCSjZWkgUUY78nQT2+IQk5zbdc0caQ==
X-Received: by 2002:a81:c40c:0:b0:604:eb7f:30f4 with SMTP id
 j12-20020a81c40c000000b00604eb7f30f4mr1657643ywi.31.1708007079348; 
 Thu, 15 Feb 2024 06:24:39 -0800 (PST)
Received: from gilles-Precision-3571.lan
 ([2605:59c8:6662:b310:7f4:4b02:4a36:4d21])
 by smtp.gmail.com with ESMTPSA id
 i197-20020a0ddfce000000b0060437133f85sm260967ywe.7.2024.02.15.06.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 06:24:38 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 10:24:13 -0400
Message-Id: <20240215142413.451505-8-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215142413.451505-1-gilles.talis@gmail.com>
References: <20240215142413.451505-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708007079; x=1708611879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DXGk526ZuPnWAwKv+uS8U1Avh/m0GRAMzJ7qTkaIsvo=;
 b=X2qeDWcy8MpzoMZNONVL52Z2bcb5YiVXB69S2MTjMrSEUj3Ojn0XYPe2QVmRFjA95o
 HV+n97kduN1GGAzhKp6M2DiTxJepERwk+KFVYPTxHcugETkinkcoBfQof7h2hf3k1U2C
 pXJ0TPUnebivtXhm6WxedRPXWP+LeS4lpPlG1GssGCpsP60HVmk2bLl7Rz/XTiFYWRgt
 tJmLSnSfkq3R19IwXaWBsOBhUnMkWou86m/M1AqW22YAgWCoDTuBXZgS7hhKPe+zHQkM
 eqydL4ZOBdpb4WMGAbPgheZXCCqa1fGu6iDBuHgWLheIAydgZbXmXL4ZrrvRb09lBGOQ
 lwoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X2qeDWcy
Subject: [Buildroot] [PATCH] package/xapian: bump to version 1.4.24
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log: https://xapian.org/docs/xapian-core-1.4.24/NEWS

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index e570f7e2f2..16889b4559 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2022-January/009934.html
-sha256  1fca48fca6cc3526cc4ba93dd194fe9c1326857b78edcfb37e68d086d714a9c3  xapian-core-1.4.19.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2023-November/010009.html
+sha256  eda5ae6dcf6b0553a8676af64b1fd304e998cd20f779031ccaaf7ab9a373531a  xapian-core-1.4.24.tar.xz
 
 # locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 464e5478df..33c36a5a26 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.19
+XAPIAN_VERSION = 1.4.24
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
