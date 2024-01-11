Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0F0C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 477586143E;
	Thu, 11 Jan 2024 05:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 477586143E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZnLqeVfFG4p2; Thu, 11 Jan 2024 05:32:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E58361400;
	Thu, 11 Jan 2024 05:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E58361400
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEC771BF23C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 834354241A
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 834354241A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfen_0ZskHUH for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:32:01 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 612AE423FE
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 612AE423FE
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3606dc50447so26120815ab.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704951120; x=1705555920;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sqngzsBmsvMOmMePG2hJRTI9O6AGFiY8L0tmtlF23jY=;
 b=LKeaoxxN0v79k6AIOXZhbGsxatcARVSbzjuFhHt07SEJDU4bzLHIkGOvn95NJOssrA
 7x53A9hz5X9Bc8IXqi9/vsqXGy2IggyZ/OaV84pwlPRUkQ7OF6gextDLlgBm+uV54RI8
 MVC2xqra4+SXmkj3//lkdodmQP6rvgU4Fm6XtzXJ2HI2eJkytNMmTD5VHS6lu7rRksKC
 oXuWUe+Aq2Chod1dxIYh+ov+2+AR+G88VKU1Ij+5GggiBVmikUIUEU75vfsJ9xNXVyH/
 0MNwIKkFGkLYoWzbCdx7nKZX3xNqiNpAiZmwmNTU2ytw3W7o0Pn/tHmOHt8vUO97FhaD
 LWUQ==
X-Gm-Message-State: AOJu0Yyd5fCoRB+TqmBRbXxbrxPxWw3gRklZAnaCBAp9Xoj1n2Lja8XW
 lkibFsIQaBXHozH0KGCvtySfncprslgmaw==
X-Google-Smtp-Source: AGHT+IFKHvNXkoZBZlTHPEElY8D7TdF2HBz6gFIcxHArlSvvhgUwncAtF9jUCsUucNGrxUvzWWYhRQ==
X-Received: by 2002:a92:c081:0:b0:360:6aeb:1068 with SMTP id
 h1-20020a92c081000000b003606aeb1068mr707063ile.47.1704951119953; 
 Wed, 10 Jan 2024 21:31:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 b60-20020a0295c2000000b0046df4450843sm120298jai.50.2024.01.10.21.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:31:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:31:57 -0700
Message-Id: <20240111053157.2928259-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704951120; x=1705555920; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sqngzsBmsvMOmMePG2hJRTI9O6AGFiY8L0tmtlF23jY=;
 b=ctpHqfHmfBqp+0sMuxSiyeTN0cXq2UfSIH2l/9098nj7IgAkSwFt9h4rV6SrMPDSrg
 mjvPRLydMFmqJJIt1dQEdlod5pzuhbSLx26rvd6HxgNRK+1ztXlRkju7bIvTtOPHGq/p
 s4hbkXcLzTvCbWlnFZmfWotX/bWVaCHpG6imGW6jOdK9dn8pA8sLMlp/mbh2DUBw6Z+c
 DjJKMAfyGb9SifBIb7V37pqQkdcwu2NziJzs+PKRb0MrYTVwfR8IXepZ0ehsUqSHthW7
 1Bhrxjv42gi4GnRD139G7O4vY8Vl9jXLqFbKbIxxN2HctegGMYv258fnpFD3s83LgVyj
 XcOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ctpHqfHm
Subject: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to version
 0.18.5
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

License hash changed due to year update:
https://sourceforge.net/p/ruamel-yaml/code/ci/56b3e2666fb275deab3eec99193c103e4edf93bb/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index 29852a51ed..7b5dc1e29a 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/rfc3987/json
-md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
-sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
+md5  24fac3544a3c7bd7eeaf6e4f704a056e  ruamel.yaml-0.18.5.tar.gz
+sha256  ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0  ruamel.yaml-0.18.5.tar.gz
 # Locally computed sha256 checksums
-sha256  ab837b032c5aae84503fc0c733a116a26fd272e90dc4402fa68d3c9e51aed3b0  LICENSE
+sha256  ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index a6fed3bc2c..bbdac591ca 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.17.21
+PYTHON_RUAMEL_YAML_VERSION = 0.18.5
 PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/46/a9/6ed24832095b692a8cecc323230ce2ec3480015fbfa4b79941bd41b23a3c
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/82/43/fa976e03a4a9ae406904489119cd7dd4509752ca692b2e0a19491ca1782c
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
