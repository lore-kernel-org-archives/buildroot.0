Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F7AE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E143B610FE;
	Sat, 11 Jan 2025 15:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSCg2KPbUEsp; Sat, 11 Jan 2025 15:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9F3D61108
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9F3D61108;
	Sat, 11 Jan 2025 15:53:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77385940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5817A80D29
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPsdLcmSi1BW for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BF3D80D18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF3D80D18
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BF3D80D18
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:53:11 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-844bff5ba1dso207267039f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736610790; x=1737215590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t8wAZG1Uh+48nDuLOoUl4jlFsOH78mf8heNQHBiCZ0Y=;
 b=LyYgdr9rlvablz4D5K0hDKnd3eH5iY+amWDGBIjymf064ny2d+0afHWyMUAWp6OCwt
 I3gRcM9DqZspFHq8M/JsqTTfVliYgKb6lBjCMa+g15meY4DDSYTw0TVXZjTrLYX+OSQD
 WsfqOCZ6wU1XQzpn8vLeYID7HA0VTA6U9DKxIZCGbz94I8GS7Qf+VR/TxVVHk7SPAWVY
 oibgLVsdi/b+hnVdvUynUL4JOVrF7k0wGAlurZXy9i4kX7DBtmi0mczOBH/ifbaltWL0
 1y1/gDqA7Y5HmUXbcODLjYnJXKVqVzrp5jfP7gLlsaj2N4g+MAnk2e4NDg35yYmRhodp
 8MCw==
X-Gm-Message-State: AOJu0YyYIBquWTap3171RY+f+/+HUYaDlgWIEh5w/VWUeokAluz9JTAT
 UKc2vjqcBC3eAnAHCUNhxO/cLRiwAHziEIsVr7hxu/4UgTmC5/kHGBu36w/1LYU=
X-Gm-Gg: ASbGnct4Z+h/4JynYPw/SZREh5HU8jIIDbFgw6Y8qVKvAhtP8I9uKMvLhtH3i0mUq3e
 zUn/DvZB6wxhZ6fJ+WOvtoMgDVM/ZUs9UJt6U81ft2kTCE0Vr4vz7XikXEuzrFtswsqH2biZSCi
 K9fqxSEHkiph57MkR088vh5k0mstIIm7++Fr+nsRDnMD4GtRfgxmc4DZCtYLzam7DtQ2TG2XulQ
 mjUdSKYqje4c6BItDPq3vJZGNpEBLJrBzu+mJ598bmoirB9bZGhXhj2x0vTX7yuqJgT+pqjqfsZ
 Q9bPZCTKuZl/Hnclyj0xTDEa3R/3pEU=
X-Google-Smtp-Source: AGHT+IHpRPBhBG9wxWevcsz3mYP4dd0BLvXbpOXi+Mn6vkPDxDaIYtILkrqdf6DxiDk+7I+Wae0agA==
X-Received: by 2002:a05:6602:36c6:b0:843:e9c0:8290 with SMTP id
 ca18e2360f4ac-84ce00bb460mr1460856139f.6.1736610790044; 
 Sat, 11 Jan 2025 07:53:10 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7178dcsm1559029173.104.2025.01.11.07.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:53:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:53:08 -0700
Message-Id: <20250111155308.2859023-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736610790; x=1737215590; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t8wAZG1Uh+48nDuLOoUl4jlFsOH78mf8heNQHBiCZ0Y=;
 b=VdGFi3NOI8EpECAY2ALJ1bSViMInrdKZOV6H/Qeq5yjnUc/HhFnkFsSWz7oSgtUHrq
 87qbzSihzV/0xrvClNaT6Rh0b+XquRh4zTMRnxe2IPtTkjz7iS2MX0qIN0zQnXBMGqXH
 fJxEyaYaBoIcR+RN3jigcGV8dJFNnK8Qhqmw3yRnRdA/pgOC8gprr92ei4RKFhPaTWet
 M0jhvj/DRtmyOliB4AL20fM0pIWVfCahmdD9eMvvV+K1dvfzH3IjR5kUQ0uDpJ13BIoN
 z/QUtNhx2KXMUDDCan8YClHSNs+5EszkOXAZM8npeMMaBWOz/15RmqEsYmQpP8Lgm8ig
 ROZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VdGFi3NO
Subject: [Buildroot] [PATCH 1/1] package/python-pylibftdi: bump to version
 0.23.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/codedstructure/pylibftdi/commit/e604c863134200b370a963f6822eebf2b4315992

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pylibftdi/python-pylibftdi.hash | 6 +++---
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 00cee048f4..fd7d9f17b0 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  a1d3039e8e09b3fb73cb03f1d6f3119b  pylibftdi-0.22.0.tar.gz
-sha256  85a6aab438f765342843aa2d59bb28fbb0d30847a621fb9800985185990f01af  pylibftdi-0.22.0.tar.gz
+md5  c3f06a398c7e7e2bc9d6ff8476378d5e  pylibftdi-0.23.0.tar.gz
+sha256  bf5b4c6ba73d79a6f6df849c345b00ba763d023201bed9ba51d876a4397b16d8  pylibftdi-0.23.0.tar.gz
 # Locally computed sha256 checksums
-sha256  b8a7b113cfaa2c01d0701183de16ba653465692b1e29e0229244eee42fb3a9a8  LICENSE.txt
+sha256  d42da8dcd174be0b5a20366aa3427b6c7570528a1992d50df9c6597cb3ecb898  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 1085c4879a..e6c138bbf1 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.22.0
+PYTHON_PYLIBFTDI_VERSION = 0.23.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/74/b3/a3c333a250143d204a0bb60de7c1e5f841543231f04c71ff4fa65e5b90c2
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/9d/f0/551ccbd8e989e898707e0e0859344fcf538c2310521847a1035ad3e9b164
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_SETUP_TYPE = poetry
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
