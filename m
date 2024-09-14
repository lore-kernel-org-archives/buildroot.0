Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6617EC021BB
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F20841A6;
	Sat, 14 Sep 2024 20:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mB0o2AONKZi3; Sat, 14 Sep 2024 20:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5289B84137
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5289B84137;
	Sat, 14 Sep 2024 20:38:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0069C1BF3A4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA2B66064F
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FOTkEv_L1FZ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D26BF6069E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D26BF6069E
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D26BF6069E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:37:50 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82ce1cd2026so110894439f.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726346269; x=1726951069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fsQ2O4ZupyNUVnYbgsBaOZ8N6/5TAx6BiorbeeroqbM=;
 b=rXDgn9tVS2M8Vk1ZrwrL0xNfTQkuN8g7HEctUqcjV9rBddBFVV/a/EKwc556c1FnLP
 7rRs52VatMwOfEyTXXoJW7AxWOM4A8NDmbAw+amhApfv/fX8Ik0JIebus3MRSu/aaD1P
 jV+6Pln2woMJSMabRcwW+KiMjuYEYr03hckq/7ORMr0DngYvL52HbFInniRLmlGNzp5u
 94baUOI1Pwv668BgQUg3Kp+EOQCPz7/jsE2mwXweA4nQl0cNHhARbEzjk2C2I3zujWVp
 Dtt5s792sefsAG0fbanZ52iMcPg537EfSnvLdj8Oq7JWU5RbcM7I+gP3eImC8h1pgR1G
 Poug==
X-Gm-Message-State: AOJu0YzeOy1tWCPixn37513bnT+Lb0RRny/V3oAFuYnPeGFmvylSRkOK
 xNK8SLwgsmp8ovTqJHWxQvVteoumLpJb4o4u9nqpCw9nRvJRyORYYbi9eQGZ
X-Google-Smtp-Source: AGHT+IHTXxZTL2jR+QFOatj8vFuci4hMmecoeQmZWiw3+BmVUMvOzjOzfs6H001TxvLaQvz465BcJw==
X-Received: by 2002:a05:6e02:19cb:b0:3a0:56c8:f7ef with SMTP id
 e9e14a558f8ab-3a0848c92f9mr112419315ab.8.1726346269559; 
 Sat, 14 Sep 2024 13:37:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d093sm564035173.74.2024.09.14.13.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 13:37:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:37:39 -0600
Message-Id: <20240914203740.1089249-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240914203740.1089249-1-james.hilliard1@gmail.com>
References: <20240914203740.1089249-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726346269; x=1726951069; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fsQ2O4ZupyNUVnYbgsBaOZ8N6/5TAx6BiorbeeroqbM=;
 b=kdyQkYw6UNd2sL3e8YoPIKc7lendI/SOlLUKS7Q//B5U6GhY79i1Y3jI4jQsZ+OvrR
 WkxORU+ikf8QK2px1/Q0AgRUegsWA4QGZ4Ocb19c5v5YJpYLmYyRU8AYfNxFvtlcjbkP
 LBcJIX0Zwv+vcSd+jIuEdja7sQuxUie3l4rtcGE5h4aySECNJFd52BgLnT0+6a4PWyEY
 yga2rW6Ex6fE6HDkQpx3PynaTFD2+m6secQOjjgYeFVsco0e8kZI5YtZFn+AfJ4xl7pj
 hSUIBbApTA4j9yqQgDFSGu1xg4oOUB7F2sfBMvXoZ6cXS9WM5NY3dFnS6jpdLZBg+XWZ
 j8iA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kdyQkYw6
Subject: [Buildroot] [PATCH v4 2/3] package/python-scipy: bump to version
 1.12.0
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/scipy/scipy/commit/0ace7295322148d74932bee32b0647e29c38fc8a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-scipy/python-scipy.hash | 6 +++---
 package/python-scipy/python-scipy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index bee5d698a0..5b8cac8055 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,8 +1,8 @@
 # md5, sha256 from https://pypi.org/pypi/scipy/json
-md5  0e8eea0f7c4fe7d8102366230c96d66d  scipy-1.11.4.tar.gz
-sha256  90a2b78e7f5733b9de748f589f09225013685f9b218275257f8a8168ededaeaa  scipy-1.11.4.tar.gz
+md5  22683fcf9a411f0a5254b7509bea0a6b  scipy-1.12.0.tar.gz
+sha256  4bf5abab8a36d20193c698b0f1fc282c1d083c94723902c447e5d2f1780936a3  scipy-1.12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5517022426a56179540ee6eace15fd723ef8fdb83b2900fed2152dd2e2f972a2  LICENSE.txt
+sha256  c29fb8e5936f33237a8b15256b4c6e93037f05bbf58c3d7b5755aede4c200173  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
 sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 6626826e33..9110a5b847 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.11.4
+PYTHON_SCIPY_VERSION = 1.12.0
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/6e/1f/91144ba78dccea567a6466262922786ffc97be1e9b06ed9574ef0edc11e1
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/30/85/cdbf2c3c460fe5aae812917866392068a88d02f07de0fe31ce738734c477
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
