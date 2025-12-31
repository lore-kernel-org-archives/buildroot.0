Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72620EE6441
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 21:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD1D80DE6;
	Wed, 31 Dec 2025 21:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bfUIr9WegAz; Wed, 31 Dec 2025 21:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5676180EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767216908;
	bh=fdnlWsXaoCJ4cnTbgU2YkxpI5LkWVRimJ1XXpsNgx7o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ErcLuXhtLuLZ+mCY0RR6CcOii/bitbzdcw9BduyKUHl9/aqk977ujSGgqjszwyN6u
	 ZzRvWXI/CN4XRowDIqkCjxoPn1c8YD3my2k0dAWTI3hBvRkCwiCnzussPdr3cflvOc
	 v/IO29uv5LenzPZmfFcTSFh+fXUKYNea0n8FKpUEzGFxygtvybIsMiqzbl/x5r8pV4
	 BvV0TPU7e8Te5PTd9k9SQNsRbLcCDbFQMHRHRTi7brfkTdZS5f9mPlUmmloUGCUawk
	 pqrDDglRmodc5i5v8EaiM+nIzQp3luf2jaLGhwioydBHwFIXUoWN+eRZCjFAaUzrcQ
	 A7KkdRjnEx7kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5676180EB6;
	Wed, 31 Dec 2025 21:35:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31B1AD8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EBE540331
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDVKY7bsVdzh for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 21:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56400404DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56400404DB
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56400404DB
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:35:06 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7c75a5cb752so7840218a34.2
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 13:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767216905; x=1767821705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAXhT9rFz+Kmg7bc7YORoAaPIE+UJB5umZMMsor+M5Y=;
 b=lEPR3wHV57RIzeKjzQa9CLLbMK3fIDaGFRYNV9NsDa4Ze7cT8Cv8usUDJM4/3WI+JZ
 xZ1wbyKWqEA0p7X36WZLJen2D1J0Hd4XkQGTy+WjmhHfaSdBPLwiYNnQ4jWvj29rgQjh
 PAFJ8pwE7cJm6ymGNLcduw+VepUvwR5ehrOvkGCHs9HMGampCpFOrZ4o9YdPK/y1mzc3
 NOjSyj6jqyw/v3gSZ9CictmhvfdMmgmlYTx+ZCDNyJvrrJAt4uA67Lh0tf8hsPmXR1R4
 ffgMtd/dkdxaI3eTTSF43GOp3uPfdOfhMvT8uuPU3A00qr7gb/CZcEyhu/CxmE14WUJc
 QcDA==
X-Gm-Message-State: AOJu0YxqFcKTgQShgQ7/TbwXiJNQZEdxM5R18DooxTplSpCxd12V88pD
 W917HBIGBnfaLLTl1VVzP7CPwVVMEQf4Q35RzjbRFK2UFqDuBdesKcuT8HByafOBbAk=
X-Gm-Gg: AY/fxX4YuLUQUxa+ybYgVavgyVRWJ7DZO/5JdBHeW/uHYvooe85ftI5Nd2ju5TF7vwb
 JD4h2BqB6ntiLDXCLX+TRzfrx0XWkVmQgf2NmvOwc3Wd4gojmoFU6HrET/+C3heprd8LwOQotGV
 zmzk1+9/9OEtVYV1LV9zWqeUaRvaIY9sKpjYd5IOgI+nIl6Q7Dt/3piTtwJJQqleVMNrZEuJkqT
 /6pB8FiB0NiC9MVgj9VYgWKovFQOHg84dlVUtTySywCGEpKDYkqscxJSLGd2MKQYyFC4ZR4atGh
 nlEbsmneCVGcn4N2+ftLAxTA9NjFb1VcXo6f8uuVhjTpFpXH6xX0eo6SDedGy1KB/SEVuzOCgt5
 H49KIz4g/wiqgEOUTP3jneUTpn/3Z6WEQEILhaz0NYUYgK4tsF5aFdDjZ+vPj1qCxp37jY5jkpv
 wwx+8K97pgmFAaP8IAlsB5rHGXe83RilmO3B16XPiLrKzVA4/89bwzbr9/+IUnl/YWp7GGRIzxj
 0BV08nm+UpBqGsC2Qtz0CWYIe3kpEh+qvmm9HYbVB1JmU7D7YMy1XQ=
X-Google-Smtp-Source: AGHT+IFpQLqkSggkY5QkPhgco1ICHkGic2Doa5oowWmVjPrXAav6LIjbeYm6+yiJwtNiiDUEnPmIpQ==
X-Received: by 2002:a05:6830:2e04:b0:7c7:82b9:471b with SMTP id
 46e09a7af769-7cc66a5c245mr18975919a34.38.1767216904823; 
 Wed, 31 Dec 2025 13:35:04 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667285f9sm25543539a34.5.2025.12.31.13.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 13:35:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 14:35:03 -0700
Message-ID: <20251231213503.10450-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767216905; x=1767821705; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KAXhT9rFz+Kmg7bc7YORoAaPIE+UJB5umZMMsor+M5Y=;
 b=hLbFDJKnGrXO4yEAg2bSK3GXiTN6iz0WHf/rfWjNs9Z+m/6bBl0qbPIp7oqyZpCr5i
 aBZ3qKX0nzBfQ+BoFAw6dmAdk515PE29+dh7iQD2i9VFBQABRJt+/QeGTkHTA9gtNJtA
 x21jO6a2z1+7Y19hJUr2poiyqqTIAHUknEGmOylvVzOEaDQL1VZ0kw9CLzWILu2OTN2K
 fHkx1n1KWpb+qdmhsMYtueEt3R13282Ata6+dTAYhtP+hYPp9UaTNdellwjpSNd+rvQP
 5amNH/MSDOOtuRbGX/W1/yxJtSzZPs1FAl12edBbRMcCquKUEi4RNa3pizmjMwmER8Wd
 XJbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hLbFDJKn
Subject: [Buildroot] [PATCH 1/1] package/python-pysmi: bump to version 1.6.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from poetry to flit build backend.

License hash changed due to year update:
https://github.com/lextudio/pysmi/commit/fdd7fe3d201b1d451eaecb858354a0e1bf9fd04f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysmi/python-pysmi.hash | 6 +++---
 package/python-pysmi/python-pysmi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index 30043f1b95..856f59baaf 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  187efbaa8ebb5d6d880906bab0116ef8  pysmi-1.5.9.tar.gz
-sha256  f6dfda838e3cba133169f1ff57f71a2841815d43db2e5c619b6e5db3b8560707  pysmi-1.5.9.tar.gz
+md5  406818a9bb351e665e2eb9e9352a57fe  pysmi-1.6.2.tar.gz
+sha256  abed01673113886d10f0f336426859238fc13b5383c7e28e13dbcd5af0443ba1  pysmi-1.6.2.tar.gz
 # Locally computed sha256 checksums
-sha256  bc211b99a3eb46f3b1f64f8152dffc869d3bc4bffed82545732ef9e34628513b  LICENSE.rst
+sha256  ba934e538c4116c2d9209c14256778b9a8a246234a3bd9256c62f396187e80d4  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 454cd11447..2288f04e88 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 1.5.9
+PYTHON_PYSMI_VERSION = 1.6.2
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/be/b0/19085322fc24f6b4a7bbc151643641c391b8b8d9aa4fd0e40d8178b2a5f5
-PYTHON_PYSMI_SETUP_TYPE = poetry
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/a7/80/917111aaa4bf931bbd4d9a6c89864de2304b79cba8ce49639a6440ecd5ba
+PYTHON_PYSMI_SETUP_TYPE = flit
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
