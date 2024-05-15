Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB6EC25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 14:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12B0260623;
	Wed, 15 May 2024 14:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSR6ycOU9DKw; Wed, 15 May 2024 14:12:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27C726062B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C726062B;
	Wed, 15 May 2024 14:12:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 270551BF4E5
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 14:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10D4541A61
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 14:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8Lwmcs7wZuQ for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 14:12:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E72240BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E72240BA1
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E72240BA1
 for <buildroot@buildroot.org>; Wed, 15 May 2024 14:12:51 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5238b5c07efso1468261e87.3
 for <buildroot@buildroot.org>; Wed, 15 May 2024 07:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715782370; x=1716387170;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jgQPlnEIACiJeVgpp3lg19DnNSP58P8jWw+1UbyhPKM=;
 b=vWYsXkiKusuKfvw1c6zWuiYo61opIkVcwBbC9z6rKabOgo15hpxQv2NsASQd4gE71t
 DjcY39tNj3PZNQDEW18nmiCU+96a8rjs11M46RBHW59rYCcscfOebbWgdjuzkr8dnsxx
 19MqEu6fBK0s8A5z9pcY8ajJqjkr998ezsShNxfcvwP23CtahaKTIYZ2yPDeSsVnytKl
 FRhMsiyK10lUjikpd9vDKlU8UMeYi9W77VGeZySzMvegetb+Xuagek8JvzTdVQFAJeLI
 WejHHlDr/K7m7438p3z1QAob4bj7VSTzbqq6vPDQCNXO9L3374y5WqQAJxlf6L6Bh38U
 Xxsg==
X-Gm-Message-State: AOJu0Yzec117hZnlpaMsU09g/56iqkj0P2+p16xuMdbQUMnLwI3UK5cf
 QkdH6feX4vhQtBme3+OMJeFhWOEDrciW7V68cX0z5bHzYfix19plE2W/DDwg5f7U3OXGekPpYHS
 s
X-Google-Smtp-Source: AGHT+IHceJLkILJq3MrPeptKtF/Y/ObUoDUsU4A0O0DngzXxSXbGp0Rne5vc9l4CY1UiVMHGW3XJmA==
X-Received: by 2002:ac2:5049:0:b0:51d:8ff3:d156 with SMTP id
 2adb3069b0e04-5220fb6aec0mr9999070e87.19.1715782369855; 
 Wed, 15 May 2024 07:12:49 -0700 (PDT)
Received: from P-NTS-Evian.. ([2a04:cec0:1030:da2a:210f:2c50:ac23:ce17])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42010940845sm153935455e9.35.2024.05.15.07.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 07:12:49 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 16:12:46 +0200
Message-ID: <20240515141246.44580-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715782370; x=1716387170;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jgQPlnEIACiJeVgpp3lg19DnNSP58P8jWw+1UbyhPKM=;
 b=vjv6vhaqWdYMfETcyqsKRjYp8tH9bL2nWteeY+R2fUgeQ/Uk/eZ3LS1Tr/akl7sxsU
 19GlYYgXOQh6j/kmU7OzWhBh/tZN1kRdNJXhbxPLYgoVgr4fZEswViLlY9d2sNROp+8D
 2ryHyKCcKrm54889G2ktKigqZy4Cbi0B9WCDa7rYn5Y1XxKBBFeOnees01GfiA/Im+Jb
 CT/Kux2AI7zYTloN+omHZIuwMTEgB37YQmiZZzEx6R9jNlXhYkKdjminlxQbfIXDHrnw
 4Wi0bMTXUy+1VSjTvjOHPsAV4vaMrsulcoUJTDeETVDJFbCb03+rFYwnQc/eeLqeV7Lc
 eyUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=vjv6vhaq
Subject: [Buildroot] [PATCH] package/python-ml-dtypes: remove python-pybind
 from C++ dependency comment
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-pybind dependency has been removed since the version bump to
0.3.2 [1]

[1] 06e1a3620e5268951be089d2b150c1802de7de4c

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-ml-dtypes/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
index 58c218b214..7dce2fea42 100644
--- a/package/python-ml-dtypes/Config.in
+++ b/package/python-ml-dtypes/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_ML_DTYPES
 	bool "python-ml-dtypes"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on BR2_INSTALL_LIBSTDCPP # python-pybind, python-numpy
+	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
