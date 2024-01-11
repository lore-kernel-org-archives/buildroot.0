Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00FDC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 04:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2016F83E46;
	Thu, 11 Jan 2024 04:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2016F83E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t5OHSkYT-LlM; Thu, 11 Jan 2024 04:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AC2283E47;
	Thu, 11 Jan 2024 04:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AC2283E47
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF2301BF380
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C505B40A2F
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C505B40A2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmwpVjDdZXdV for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 04:30:57 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D072540133
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 04:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D072540133
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7beff81df32so27266639f.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704947455; x=1705552255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ij/+j9S+ojrRBAjbJ8K1hUKYEdTeDRRODjXMExB0ncg=;
 b=j8r7IU7moa5dXb033adCRUBJSIy4ma4KgZJiOuavASr64/mp8Sb9H75Ax5kx0mjISU
 /Y3paY8AI1fG8xheSIaJDr73YmEwg/YriS5527MqhdmGkG+3X8M4ORvwVQ8PNbzINrZZ
 H3Tq9S++dc23X67aiR1LyIJcWVdwNheDaXOJQ0j1TTazy0V+nxUuJn3PWfq096v8RqAq
 qXtY0gABWpxsWz4xV/EEeq+uWZ9lek9PyY7dERmaMCMgDAriuWdZN6bu7R+NtDLITqNG
 JBgdNMpXmOnyv0MrF9rlrKvd1kzSRa2FNuhvlj97NB8+12YeZmaGLPcT2Qsywa/zgGTO
 A0EA==
X-Gm-Message-State: AOJu0YxWk/Id0aywgIfQIAKauXk4KV6vgISxbZNcvbjLPiN55Qit4mmi
 KQzLKwBsuEjvC/7bx3/hjI2zkfgdIwNAVA==
X-Google-Smtp-Source: AGHT+IGPSKKV0ZN/qkEvZDC7Myxmqu/zzYKmOmBKDGe2dy7T+bx0xmsFc4jVSV0YI8i4sZBVnKp2Tw==
X-Received: by 2002:a5e:8a04:0:b0:7be:ff7f:b029 with SMTP id
 d4-20020a5e8a04000000b007beff7fb029mr808451iok.31.1704947455316; 
 Wed, 10 Jan 2024 20:30:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 y30-20020a02731e000000b0046e4c2f9f5csm94855jab.28.2024.01.10.20.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 20:30:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:30:52 -0700
Message-Id: <20240111043052.2880841-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704947455; x=1705552255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ij/+j9S+ojrRBAjbJ8K1hUKYEdTeDRRODjXMExB0ncg=;
 b=cBZ7ItbhsmYh7YV5qqDkB8UM0AYzNq984HMqWodnBnlxe79wNrIDHXOl+4GGQCTiWP
 Qs05kp8TmEFCmssDnR9c2w6BujPRSH8Slvbo2JYLjRq7WIIJWe8bhfnU6yS+mNtFy1gU
 6PPQhDadLxQAPpjk9lBqgZzpU3DCE802OOTG89+Ijs5CzS45rIEKNrIL2N+XsaBqIuTl
 lqUMGUUpiO3PSFbX+6QTwt6XtTpIf4+/2K1Gnopzt+HH6sJRkIv2qvj86AraKCq43Fku
 G8wGBVyRpSdHQ8EuqXUxQW/5zmFEMprW1uBRqZq6PQ3LjdQsB4v6O7rIgvpvyXmW4Lpm
 48dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cBZ7Itbh
Subject: [Buildroot] [PATCH 1/1] package/python-pyzmq: bump to version 25.1.2
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

License hashes/names changed due to rename/reformat:
https://github.com/zeromq/pyzmq/pull/1837

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyzmq/python-pyzmq.hash |  8 ++++----
 package/python-pyzmq/python-pyzmq.mk   | 11 +++++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index efbc91d83c..3c91d25995 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
-md5  f10b7c3dee2c03557e2c5d00b73dfc7f  pyzmq-24.0.1.tar.gz
-sha256  216f5d7dbb67166759e59b0479bca82b8acf9bed6015b526b8eb10143fb08e77  pyzmq-24.0.1.tar.gz
+md5  280afc0992b0a9f109dafc1e672d2f26  pyzmq-25.1.2.tar.gz
+sha256  93f1aa311e8bb912e34f004cf186407a4e90eec4f0ecc0efd26056bf7eda0226  pyzmq-25.1.2.tar.gz
 # Locally computed sha256 checksums
-sha256  aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2  COPYING.BSD
-sha256  44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d  COPYING.LESSER
+sha256  c0cf5f5c03f8d6772f7a271df1cb671054578bd3d79527c72fc1f28f8cc72a7a  LICENSE.BSD
+sha256  5f1dac83d6c25674004810ec9e54b304ccbb8303ac5961813b09235966abfd48  LICENSE.LESSER
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 5792957eaf..1d9a7d01cb 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,15 +4,18 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 24.0.1
+PYTHON_PYZMQ_VERSION = 25.1.2
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/46/0d/b06cf99a64d4187632f4ac9ddf6be99cd35de06fe72d75140496a8e0eef5
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/3a/33/1a3683fc9a4bd64d8ccc0290da75c8f042184a1a49c146d28398414d3341
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
-PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-PYTHON_PYZMQ_DEPENDENCIES = host-python-packaging zeromq
+PYTHON_PYZMQ_LICENSE_FILES = LICENSE.LESSER LICENSE.BSD
 PYTHON_PYZMQ_SETUP_TYPE = setuptools
 PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
+PYTHON_PYZMQ_DEPENDENCIES = \
+	host-python-packaging \
+	host-python-setuptools-scm \
+	zeromq
 
 # Due to issues with cross-compiling, hardcode to the zeromq in BR
 define PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
