Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50745EE6441
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 21:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C76C81236;
	Wed, 31 Dec 2025 21:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcWH1qtJKo2e; Wed, 31 Dec 2025 21:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02A4081210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767215608;
	bh=pnYxQQCftBqWvReA2sDCmRBMUyL+9vUBHSqqBoBMgJk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GZFlbO01OdFBYfo3r9H8KlBDWiwiJJYBf1r5w4Wd1YcX7pWqtj4xaAUpVVIkxk1V3
	 XrjlTA1ccbsB8UqnDB9fz5NA2XuJiQW2aTQZksg/B03p3sTeVGAI8FdOxzSMxHRNDC
	 uQoFDEIL63XYL4fFRXocTTrooxKoURaIlG9fuk2/Di9QLq1RKeDLuGbaIxHmvMKOWU
	 Vi7VxIRfgFCqHjb3NXdAFf/7KvmedfypEkgo90jItGeLnGhT0a90mxfjkVEyG5Aedx
	 Vyoldnmb+tCjWWJf7SP4LfSfb/Vf/vsxUfocZoW8KgEdIT5aNLMhGLvrl4LmRggeaZ
	 5DZ1XTvSSP32w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02A4081210;
	Wed, 31 Dec 2025 21:13:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78F78249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F97281210
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iG9asm0OQWIJ for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 21:13:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E84881208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E84881208
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E84881208
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:13:26 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7c6cc366884so5314401a34.1
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 13:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767215605; x=1767820405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzkkXtzmBjbllGx8YomtGiWYEvg8+RdPfigTUDoBXQE=;
 b=RlTV80D+NG2dVUXWT+jtJ7M9aJ0U4wnpRO54hIfbtuNR44aoP99Mntn96WLUxILqWs
 b64yX5YUyEqqq3L5jY/X3Q1Aj2YR+39QFFTpkEeL0x8wZxC+oRXB8Wghf1lUxi2WLWV0
 ax28ZKl3yD5W6iz1AORZzfQuOPp52bofaGB6NvIpunKcRIl4rMQ9amLsyXVRV+8FqxAM
 +Rc4trj8k0w4LXzNHlCflzQL0wqbdWyv1k/Pvb+BJ8LYpg5GcsNHsXYPaLh3k4r+TeYt
 Gc56B8/GURo1ZKoaBY/vx7XfV2k7b3LZTnHsgJ6rTyxUh2W9e26S003izoVZJK0VRhgv
 Kltg==
X-Gm-Message-State: AOJu0YwaCA6QeJbdXVzIfyFNMGCTNf12mHyI+5AmCWrE9b/pzlGK2fr4
 aEKu+TD6n+JuIGTZ+T8ue+DpKKhk/pABNJltG1IjJD+CjSQuJl4LB0KXCcvi2WfWR2s=
X-Gm-Gg: AY/fxX4N13C2IZBO/Fnx4YNaefg9gHSBAw1ACjgZLrROUq+Uy6tj6jO+AU3PHFPgwY/
 g1VpidtJ13HXfPpizVG/lu7IQLLdPsYQw8g48G0whvFkhiRjAwoe6HSNgb049+Fe8EM9/8EbFC+
 BQO1127o/UTunQbg2BAvJe58dwocKdzDqA+iq/P9mqMSaAAc2eAK0PQs+k0AucUG3HW5Fgi79B5
 3NFCaKXa6+U4mOXb+W+VHUxINKWIM+i+Uttk9H3PbNKvWgh1puk8PveS5gh4XQ54wMD8EaBT1C3
 YQWGkJyBgPUhSfrc0uG+atfY0BpXVQQ3sxQO9FlrFCgRfXMzWNVuH4FdkDE2T7vAs3V2Jox9KFB
 QAKYbCZat9B+sDOVjFQS+VXLo9CN5f11vYwuYMfSdEEDkI9/4N+9WQSPDmgEoTXhNpA/PSfN0dV
 Bx2EZ81Sk/5ojV752ZhQ8wCh6Ex/jHVkw49bYum3KWqcFnbh9Sv1xr+a1CRsE8/P30+FOzwI2Da
 7hkjDkB8hVe6Zo2QvhLntMwJoMR0sVlsdPzKClByGdwz2O+WXOqCdw=
X-Google-Smtp-Source: AGHT+IFoERYwk3C/u0kHkvzV2MB4lGgHM0I6c8C8qso7NoU8TtCrIRCxMkfuHox6yld3TYI2ImkdEg==
X-Received: by 2002:a9d:53c6:0:b0:7c7:e3b:488a with SMTP id
 46e09a7af769-7cc66a12ef4mr15576641a34.30.1767215605199; 
 Wed, 31 Dec 2025 13:13:25 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667f9201sm25088773a34.26.2025.12.31.13.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 13:13:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 14:13:22 -0700
Message-ID: <20251231211323.4175261-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767215605; x=1767820405; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SzkkXtzmBjbllGx8YomtGiWYEvg8+RdPfigTUDoBXQE=;
 b=KzImwxiZA0eGbKpCYA2HIC5qU1dfl5vsUfym6hb79KqD5T2zYgKQZ/Oe0XrHTohdGG
 8FglEqJ+zWvdEnEO+Vpka+d4fg+TaBbTt/xBOzlXSrx8m5WYVDfMCDaII7AtDX1GTzfI
 5F9ZUSCugrBCjbGfS7AApQa7tkY71yCx8AOr6jDOhbc6N+Ld3n7j4SeWpDusGJjubY4q
 1gNF889fKY3+DrtHH3cG9arAVC99fQ6DNzFBm7YZZY3XStZyxAjxp7QJIstx8T944bSH
 X9WxTLkLQ4ZmQ/o3W+1S3bV3Q5FrZrQS0m2/3GAvrR++IabiFcyLgKPwF9e72YvPxWKJ
 h8ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KzImwxiZ
Subject: [Buildroot] [PATCH 1/1] package/python-pytest-asyncio: bump to
 version 1.3.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index a9b33e0ebc..fbd141d76c 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  84f54204d53c46291c412bce27562480  pytest_asyncio-1.0.0.tar.gz
-sha256  d15463d13f4456e1ead2594520216b225a16f781e144f8fdf6c5bb4667c48b3f  pytest_asyncio-1.0.0.tar.gz
+md5  f9bf0eed023c7b6bb1d68ebea82d0398  pytest_asyncio-1.3.0.tar.gz
+sha256  d7f52f36d231b80ee124cd216ffb19369aa168fc10095013c6b014a34d3ee9e5  pytest_asyncio-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index f8d1e87e64..da0bbfeb81 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 1.0.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 1.3.0
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/d0/d4/14f53324cb1a6381bef29d698987625d80052bb33932d8e7cbf9b337b17c
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/90/2c/8af215c0f776415f3590cac4f9086ccefd6fd463befeae41cd4d3f193e5a
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
