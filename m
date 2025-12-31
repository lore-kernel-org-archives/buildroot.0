Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDD5EE644A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D9181164;
	Wed, 31 Dec 2025 21:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYMoV4rd28CR; Wed, 31 Dec 2025 21:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9DF581166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767217935;
	bh=jmFVIomXSSlPMcEw0hpJlK7JuCPe8B0rBoamMDvpK5k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=c5X+P0NI8I8EAIV1QI+TEc8CoOk54J6MoLMLCYHLw+hpJ3D/QkYDYlJMNsSzufusV
	 EeiAfUHe5pwQHnp9MqjHzNzewdPQcW9a493Kq7Uo/7a0jKtDZUhL8xz5XzuvfA1CnN
	 Qci8PYLTNEWd9ycL6VH2szrFfuMBV1tiPAkUfGCVB8g3RvN4Aq1TTL0q8PHr1LyY/a
	 HoLVR43p3fFcbwGw6o19fkmWDZOKwMuaTpVlahB8zOU5hXL94qRNFEU+49Nr5eS0aW
	 lhxAh+Urmh32ukELYC1nlgJ/ifSkxQIpLLWzC0sRpXLFgz716dPhI0r0mkLfdMiyHC
	 QzmDEq7Cf/O3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9DF581166;
	Wed, 31 Dec 2025 21:52:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 730F9249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59BCB404DB
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tz-958HcC9eW for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 21:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FD9C404D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD9C404D7
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FD9C404D7
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:52:13 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-3f0ec55ce57so7835272fac.2
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 13:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767217932; x=1767822732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rx8Vo++DSCAhbp2pc6NykP3EyqzMdDFj0c6e5h8h+dQ=;
 b=keHe1xXy2ivYQewZ5/kbiNeOkPXrvr36vyE7LRNLl6hhgCsasTedatTNsrJcVZoj5y
 tEpEH7CttnnmE2TK7oWbx3ohr8Z7U0TfNwGVZAfgCuYU1ymt2iRWwWt/OlqUrMCnwDKl
 7FZYBM5q4EL+y2t4EddoxMJu6nZ9Zxs5FUbsU/Q+v4dXvANSwOJpyh+YA/0qREZalRii
 0K39a/9g41oXRcuvsc6CgsYaEAXu743UR17bXGkZIMiWPqmp5pIcJREiT9RXleAmvG0f
 45Rhb0tjrQjNOmWkdXlTY4qvE5xFkBWchSpdNQMzZItkN9u3RLEAbKMdHyEGxM4JS+X1
 smbA==
X-Gm-Message-State: AOJu0Yydk3RdH6VXRidX93Ejy1tPU6S58JGDT4lxKjyovwIKhlij2j9C
 lIHA7w2N/vrxLrQkVtVxV0Zl6svY++Iyo1reHBaKsbWNVs0O24Sp+rfUkXDPOYKMkKw=
X-Gm-Gg: AY/fxX4NYrTna+obi6KRe06bSOQAhplllUSr+CyjJDSKGSrGwG4gV8oJ+hbCeulzOHZ
 PXYbbFn6Ih1ti7hEOG5uk7K7nLOVaG0tJsLRreSi7Z2HuPWJB47Kbu6w4EUy3KKAz/Dn6bsxOA5
 dN7rDE/6seDrgW3Md/yQav69m8jWVdkMugGohOMWtfEwUBhCWy1wY9Txt16A6qhSLYqW8m5KZt6
 HH2wZyDb7rXkwpJ9uUXKam3FlSQ1lQPcVkLxv7UcD79OX8MyQUR4/2RxPj12ZJwbrXRkJ90Lhr2
 o31YcC99E1wiL438iXDc7avZBT9mZAZtB8HHDJXrKLbL2C3FYcxunCcLTAomIVFVuFw6YAIxZw8
 9zzAKd3WXXKtqyFfnLOHXo2345jPkmvNA+5ColTNlTPx5YntfmVQer3Snb4UNtsH7//QVevGWel
 eEpy/2lhHDV3tYuwo/RBKewbRQG5pjsjTU3B44wwmMSY/fgYEOJDykvpQL5UJODil00ba2/AAGR
 shoiyk0VIDRcLf1THC1lxlT9qmQGRYbJ+9lWr12387e/fb61SdTeKY=
X-Google-Smtp-Source: AGHT+IEECWciYLBQhvUIIoowdu+Ky5LqLEqZBK4hvzHPAWuUlpAtY7FOyQ+W4Rey+24xvZuZ50/cOw==
X-Received: by 2002:a05:6870:d687:b0:3ec:4183:7487 with SMTP id
 586e51a60fabf-3fda58956a4mr14505876fac.49.1767217931792; 
 Wed, 31 Dec 2025 13:52:11 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa8d44fdsm22359505fac.3.2025.12.31.13.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 13:52:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 14:52:09 -0700
Message-ID: <20251231215209.210254-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767217932; x=1767822732; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rx8Vo++DSCAhbp2pc6NykP3EyqzMdDFj0c6e5h8h+dQ=;
 b=cm//4V93fNCMGaM2o8lJlppgdcJuWGcwdmf6L/cjDyxpLu7dszcmTXZ0fghBkHxWU2
 25ov4vtj8OkAkmKSiDV1HmsHpNGOJKzunnu5NW0awsGE+4Q0Alx0XcyI4EWRBxXyLWec
 xlKpN/uwypJx4bhEjizt3p54D18GqWzyiF/JhV7s+OyOZpa7hcQW1wqhQ4g+3vLZ164F
 p6e2giMmvAoipdE6hUDL5TvHO+uQcIVkRvGaaWv1iSGKc5ujsfRjMQx4Ohgokhx7SA2S
 gaIwrl61mnsTP62wIed4s5YP6O/8Xi1BkOH9bN9ZCAzx3NB5Hwfl9Pb0xG2kaM2V5aG5
 +sUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cm//4V93
Subject: [Buildroot] [PATCH 1/1] package/python-pyparted: bump to version
 3.13.0
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

License file renamed with no content changes:
https://github.com/dcantrell/pyparted/commit/78876337d9e0037fc8034f839c2b918a99d05e3b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparted/python-pyparted.hash | 6 +++---
 package/python-pyparted/python-pyparted.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyparted/python-pyparted.hash b/package/python-pyparted/python-pyparted.hash
index a13276ce79..421fe26309 100644
--- a/package/python-pyparted/python-pyparted.hash
+++ b/package/python-pyparted/python-pyparted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparted/json
-md5  97df779564210100ea3e4eda0d33f7b9  pyparted-3.12.0.tar.gz
-sha256  da985e116beb733371feb605b174db9eec8bd0eedffc8f739f8e603f51b521e7  pyparted-3.12.0.tar.gz
+md5  70f1346ab01fb752d38c181a285a64d0  pyparted-3.13.0.tar.gz
+sha256  443b59eb9ac63b8ca87094e02376646e172c7ea075f955f105889ca3485b06fd  pyparted-3.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  LICENSE
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
index 5e12995e2e..e8b15fecf7 100644
--- a/package/python-pyparted/python-pyparted.mk
+++ b/package/python-pyparted/python-pyparted.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYPARTED_VERSION = 3.12.0
+PYTHON_PYPARTED_VERSION = 3.13.0
 PYTHON_PYPARTED_SOURCE = pyparted-$(PYTHON_PYPARTED_VERSION).tar.gz
-PYTHON_PYPARTED_SITE = https://files.pythonhosted.org/packages/c2/d0/d32aa5758d6567eef620075f5c84f475c93bb1bf8da9d17051ce3ef055db
+PYTHON_PYPARTED_SITE = https://files.pythonhosted.org/packages/e7/53/b02306f89dc3eaf949659e8814545cde575867bc0175f60361809af7f71a
 PYTHON_PYPARTED_SETUP_TYPE = setuptools
 PYTHON_PYPARTED_LICENSE = GPL-2.0+
-PYTHON_PYPARTED_LICENSE_FILES = COPYING
+PYTHON_PYPARTED_LICENSE_FILES = LICENSE
 PYTHON_PYPARTED_DEPENDENCIES = parted
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
