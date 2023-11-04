Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B095C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 23:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0723160D7B;
	Sat,  4 Nov 2023 23:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0723160D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzUHQA3WEPJz; Sat,  4 Nov 2023 23:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4273060C17;
	Sat,  4 Nov 2023 23:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4273060C17
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8032C1BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 591AD60C17
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 591AD60C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dG0IDsptiRta for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 23:15:10 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D63A60B4E
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 23:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D63A60B4E
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7a9857c14c5so115618039f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 16:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699139709; x=1699744509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6dAV3mcAb02oXsP98iy0oTKLbpE4rwrywI9oorgE/pQ=;
 b=BkOntA1LC/Wd0E49kSzatkOeXagAc1kVTtyNRwfCs1Yn7oUkMRYwdcjQTurTngkEu2
 i3EOQwg2SWlfHj4r6ASnOFCDQC4D3sxXPYNcfJUE+tpUPM/BcKMNPLPN2xHeYAHjCdZ0
 hcDEz+JUP9QypomUjTxE8NJnSA1JcgLfbdGGHjWKlTNZzHDH/pvN2BN0Dz7jCsO3AmfX
 qqXLHyJpfjvbpPmG67Y9HLrMNaLOiVG/K+pETMfkvGFnI7sy3I1oXodKS5AU1ucfH6TU
 Td9E7LFOUvuFjtJLoR1GUACgCwrXlRgS4JHHm96rlFgh6wHrkclDzPpY5Mhj6DRkibbl
 WYYw==
X-Gm-Message-State: AOJu0YzgUbi22t7VPxLrWePFWBtV3ckwmLeKiZPZEjlzYc7dx+++H8Ef
 zY+U8W6jabGLue7gtvlwy65wMFfClY0=
X-Google-Smtp-Source: AGHT+IGcbdvrXOeuoHd7Sgl/jctMv0EAXC59RpywS3LqNIQbq8XQaqGFEy+2IJn6qMBxR0OxldIMmw==
X-Received: by 2002:a05:6602:2f0c:b0:792:6963:df30 with SMTP id
 q12-20020a0566022f0c00b007926963df30mr32236497iow.0.1699139709089; 
 Sat, 04 Nov 2023 16:15:09 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 o4-20020a6b5a04000000b0079fbb834232sm1379091iob.19.2023.11.04.16.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 16:15:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 17:15:06 -0600
Message-Id: <20231104231506.2669884-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699139709; x=1699744509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6dAV3mcAb02oXsP98iy0oTKLbpE4rwrywI9oorgE/pQ=;
 b=j1xviVx1pXRAR9zdfXs5iMDuutmVsErENw8uoAsqmb0MfpFnzf5Ac160qAHZn1w+Mt
 cFJOJfSUEbS7W9hOEMv5jWd6/5wyXYEyL4ONk4mtj8DKfOuAbcNQ/ujdTnNBBQ5GwURZ
 zzHXi+VqzFHYY8pcVWz6RIMJUxv8kH4E3Rcy7GQQT8VQL1SsKN8RM0ofmRG40iKkR8iN
 rOwXye7WJv854Qmy2iSgQP8rtjTtVu92JMPls/fWzr5rk3LC1pyKj9rqFwM4f0LQhObt
 WbTF1bRfbweSP+AkTFm1VI2ukweSQbyGxvQRnA2WqzzA1PHr9oPyBgqyrtB/bfyhOgu+
 Yj0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j1xviVx1
Subject: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.7
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

License file moved:
https://github.com/chrysn/aiocoap/commit/8f2e96d76bcf1f6f8d7b8065b5c5865afa50d20f
https://github.com/chrysn/aiocoap/commit/065945fb7f34db33f641199aceb527527c1a3431

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiocoap/python-aiocoap.hash | 6 +++---
 package/python-aiocoap/python-aiocoap.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index ab50ff0958..c9d73cda26 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  03ca0411b7401bfd6e9bdaefe09bd88a  aiocoap-0.4.5.tar.gz
-sha256  906c927822185c8acf04fdcc1dd98fd845f31dabf5d5e395c39137dcbd6ba1e3  aiocoap-0.4.5.tar.gz
+md5  baebbc38bc8db31472c438521f7121e3  aiocoap-0.4.7.tar.gz
+sha256  90f3bcaffd454f5421d3ad55ddbe3fe10a686d4b9f3c4445d427b130493a96a4  aiocoap-0.4.7.tar.gz
 # Locally computed sha256 checksums
-sha256  2bb211d412a6bfa4b2a9cf01123c7fe90e5e6185938896e23ab07b84f8494180  LICENSE
+sha256  0ad39132b3529369998eb7493b950dc7452b07ba9d8cca7619766b6c6d8270fa  doc/LICENSE.rst
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index 92f47b7a4f..73a0d61eba 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.5
+PYTHON_AIOCOAP_VERSION = 0.4.7
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/65/63/9051af6a2fc498f50b71f23bdbde0cc1d1f0a69eb767776dbf6d1411e240
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/de/14/843232b56c0f09b2ceddae3da37598d9109c4b1d9383b1ab72232018e9e8
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = MIT
-PYTHON_AIOCOAP_LICENSE_FILES = LICENSE
+PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
