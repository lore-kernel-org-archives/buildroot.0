Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2DDD149D9
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12FA140333;
	Fri, 25 Oct 2024 17:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0EoIkTeo3QSi; Fri, 25 Oct 2024 17:43:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA64D40891
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA64D40891;
	Fri, 25 Oct 2024 17:43:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F14281F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2561640902
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q47e29QK2thz for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:43:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECDC240301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECDC240301
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECDC240301
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:43:18 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-83ac817aac3so92004139f.0
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 10:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729878197; x=1730482997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=esekrcQQ3ixmhg0U3ibuYKNV13kzkJXt+xuHScTJcgw=;
 b=ZgTbDEzjfFwhOMwgSxuAJlQ5f61ZMDFDvdLaM/LRfmu4eGwR+0irQbNKC9/0Ss1tKT
 PIuGr0KBQt+y55L/IHBFqm49CtliNX76q9+rDfm63lO5+RhbfLZaY6Jtb1r9eC7HIjy/
 csDFxOdDj6ULnBqsBkUSyTprTsI6nCq19cnNVkIY/l5u6NaJocML5Rj9UnxLAgVU1jeN
 MHp9M/KI5wF10KilIIaf4Go4v11sCp2QR5+TYMHs0eJpbhsGd9r/GZjb0EhZvN1NGjMf
 OVpRTlc6cIphvofTb6dWsEYqnMZHGzJvzWBA7M5OFnWq5LDQJualLWrel4Np5e0jLHxT
 rNRw==
X-Gm-Message-State: AOJu0YzYFoJrUTJzHgRXS+GZhcsmO1Gw1Ik2ZHnaWVxZyJOuyawZZSFi
 dX0QYSe0XaHG15FCoDvalkbIZcWUdV4RvF4z2P1RNRYpW9oPPIGgpmFCzA==
X-Google-Smtp-Source: AGHT+IEClr7cUelaY51e7qTNjkVK+zR/KbbXCUiuHoJNDP8FOTAeKTOZIwT9xdMhs/Fh2m0KzrP7zg==
X-Received: by 2002:a05:6602:1483:b0:83a:c384:ea2a with SMTP id
 ca18e2360f4ac-83b1c3dd89emr20482939f.6.1729878197618; 
 Fri, 25 Oct 2024 10:43:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc7261833dsm354660173.54.2024.10.25.10.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:43:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:43:15 -0600
Message-Id: <20241025174315.3585195-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729878197; x=1730482997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=esekrcQQ3ixmhg0U3ibuYKNV13kzkJXt+xuHScTJcgw=;
 b=YJvUquKXq9foHcTnQyGATCPj0W39aBtejduihx0VwCr51GeRwMUMpqqGXdO4z9Fs2W
 X09roDpRYvvm9vmwAqnWRmxGtrtSSBskFOlNG0Ce8fGh8We/O3ifMOVDVNklAqa9HRRk
 LahT0gYEPkIEp251JQZXBKCJLpSeelOvzg/lp1dV1prn72rMqLJPNPWMqTCqb7LVCY6I
 ms0Uokv5Ap6SDjiGbHFj8xn9NEbIotmj4OzTEVFLFrjVBckj8yof3zKh+5j8S3ZMC0Mq
 XUivFcus+F1YrMamBuzuvDRL7rT1T917OO3rOz205fLXVpOgJv4Pr+ig7SmaUamOUoys
 ryxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YJvUquKX
Subject: [Buildroot] [PATCH 1/1] package/python-flask-wtf: bump to version
 1.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-wtf/python-flask-wtf.hash | 4 ++--
 package/python-flask-wtf/python-flask-wtf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-wtf/python-flask-wtf.hash b/package/python-flask-wtf/python-flask-wtf.hash
index f426757955..082db8a7d8 100644
--- a/package/python-flask-wtf/python-flask-wtf.hash
+++ b/package/python-flask-wtf/python-flask-wtf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-wtf/json
-md5  cbdd73ec30c7b3b887dc12026fd4954c  flask_wtf-1.2.1.tar.gz
-sha256  8bb269eb9bb46b87e7c8233d7e7debdf1f8b74bf90cc1789988c29b37a97b695  flask_wtf-1.2.1.tar.gz
+md5  4582b41cf00556f226e0256404310cfa  flask_wtf-1.2.2.tar.gz
+sha256  79d2ee1e436cf570bccb7d916533fa18757a2f18c290accffab1b9a0b684666b  flask_wtf-1.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d5f19036451578cb36eeef04c99ebf7d7ca2e70dcf043636519bc420e15a7c62  LICENSE.rst
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index ffc27079e5..787029639b 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_WTF_VERSION = 1.2.1
+PYTHON_FLASK_WTF_VERSION = 1.2.2
 PYTHON_FLASK_WTF_SOURCE = flask_wtf-$(PYTHON_FLASK_WTF_VERSION).tar.gz
-PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/9b/ef/b6ec35e02f479f6e76e02ede14594c9cfa5e6dcbab6ea0e82fa413993a2a
+PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/80/9b/f1cd6e41bbf874f3436368f2c7ee3216c1e82d666ff90d1d800e20eb1317
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
 PYTHON_FLASK_WTF_SETUP_TYPE = hatch
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
