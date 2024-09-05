Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B837CD4F20
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 05:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD9CA400C7;
	Thu,  5 Sep 2024 05:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8u80V5ZBXTxK; Thu,  5 Sep 2024 05:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E0EC40290
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E0EC40290;
	Thu,  5 Sep 2024 05:19:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAB3C1BF836
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 05:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D80AE608C1
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 05:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKQswxTzrh1a for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 05:19:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3976608A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3976608A9
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3976608A9
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 05:19:35 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-82a763b2752so14899539f.1
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 22:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725513574; x=1726118374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yPBI0Nqwct+VgNQ6C6EySIAUMSVW4SExBQhh10h7bNo=;
 b=XXjFofKuThK4dftVOKmj9ZztDiAsLYquhRTfcG+wCokVJWe+Mx8ZKgPEg9U5YofB0h
 6UIaWb7fXnO/fOPsBw7AY3we7XBSfw6o886Pl3ivi3a1d6ZXBuckSMZTbJJN4e4kpOzD
 IlC0HDh8o+XuIAo5Fhn44X8guioacwxph20jZEb3NcGnTsOQy7QCXEUgvMA2rM5EXBS1
 2TxKCOvZNfV3zb2lF9rInDmH5rsK/jvJPrAocpa8V6JCIoi4YFBONN1lDyt0gLyW+csA
 9THypx38uMUXa6Nyu4cq7nwGh+gsFxBADjnKF8oZeMLgGDQ28VQhsKgidVYOnAMlA01L
 S31A==
X-Gm-Message-State: AOJu0Yzb593ESm+Oo1QGZuiTAedyRN9A3WMn/1k6LL3WtwYojReCs+Ad
 PSjI+6AErMuYTP9oGSWcd1GkrOpR0jz2z2EojbrwEiaBGYAdt2ngGftQxA==
X-Google-Smtp-Source: AGHT+IH42/y/8PqVGDabHIC/+S5I9dsbcOSm1wJQanGIlC56MK8Zq1z2kQGK5twgYZUED8CAjZVnjg==
X-Received: by 2002:a05:6602:2dcb:b0:829:ebd7:4a1 with SMTP id
 ca18e2360f4ac-82a375531cbmr2185540439f.12.1725513574499; 
 Wed, 04 Sep 2024 22:19:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d06da1137bsm170276173.98.2024.09.04.22.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 22:19:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 23:19:25 -0600
Message-Id: <20240905051925.3337643-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725513574; x=1726118374; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yPBI0Nqwct+VgNQ6C6EySIAUMSVW4SExBQhh10h7bNo=;
 b=mZDVx/pE+CzUIb2+z6gcF21pDm8pUfUmvTOuWaKi0J4Mg74hrhk+HqqqDHIn3B7B/l
 cQd9g7DZQEpvbzeFRUGSxZSDGTnHL9WfLLUK83a/tEm9I+IOxjXNcxETl1/wlg3UXbqo
 sFzft6WOVKxKxQMTdbfNiztgMY1x3XE0OEA0v8XgXz9jODDr2wZD+yiQMAX8GMHJDyA/
 HW5MGD7nK2ho/VIofnvK4i63qcPCtgpCp/TWl33c73VCcB1BZ5WzGBAEieU1mWUmIZ1x
 WVGTFY4hBaJDRXdgOn23HqKFZjK70adWCtP12j42SKVTUfcgUIZBdqhbWimoi1w8D+zs
 8rZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mZDVx/pE
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.13.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 6060b6cab7..2c1bb6c698 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  98621433d1f8565f1f00576d47be30ce  sentry_sdk-2.7.1.tar.gz
-sha256  25006c7e68b75aaa5e6b9c6a420ece22e8d7daec4b7a906ffd3a8607b67c037b  sentry_sdk-2.7.1.tar.gz
+md5  d56d6bf0acd0bd0663b420199c9afc29  sentry_sdk-2.13.0.tar.gz
+sha256  8d4a576f7a98eb2fdb40e13106e41f330e5c79d72a68be1316e7852cf4995260  sentry_sdk-2.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 50ca854330..dcf2b2c420 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.7.1
+PYTHON_SENTRY_SDK_VERSION = 2.13.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/b8/63/310d89868a0dab17f6d7c1f35eba9c304dd06c2a17d0d26905738763b614
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/bb/41/97f673384dae5ed81cc2a568cc5c28e76deee85f8ba50def862e86150a5a
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
