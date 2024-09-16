Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10582C3ABB9
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 00:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A488640653;
	Mon, 16 Sep 2024 00:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0E7SP1IoOBw; Mon, 16 Sep 2024 00:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BD0F4067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BD0F4067C;
	Mon, 16 Sep 2024 00:19:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF4231BF94D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 00:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD94F400A4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 00:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsEv64y_WjLn for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 00:19:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D859D40004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D859D40004
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D859D40004
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 00:19:41 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-37636c3872bso9115165ab.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 17:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726445980; x=1727050780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8JKH2UkrxvsmxPMpV5EBC/P/kVzc0dbH4+Ifk0JCBSc=;
 b=cRTKeBCrD3es0QVKZLc7nFyiLQzL6fujz86WJR6spIdci+1smXQdqUwfyjkPnM/JW1
 WPdDaxVcwuHGgMUv+hpWMltkLOAbgZ+3rIrLH45W8WHlNlVYLQGstsUygXvJIsf1XfWC
 7JYVtA2VDM1GI7MEWgcs9hahwdScnJOBnHx81neVWnr7dVHEHoFeWdcfGnqZI+REY0Kh
 HkAIJEYg4tM3HrX5IijM3P0+RwkLOjngOMSy2dXbrpyZ6idNVnGAAxF46MT0vG9k2d00
 aGAOciklSKfVrLCsEPLIGk4fhL7h9sYXbdy9+7DjVA9kKzG4OGa1UmbKan8QsdX98uF3
 jsPw==
X-Gm-Message-State: AOJu0YxDx9nKCvrKzee1QDhT6TuX5U2yq6jQLm4AC+rkJq05PKXdu6Rb
 9xaDdiZzOa/9zPpoRMp71M0jB17MRZydEDJn9mxlBC/XeDtdkhWFGB7/vA==
X-Google-Smtp-Source: AGHT+IHSyUZnP+u8iHlH8sPZ/3jTf7/TZt3aZd4CPp/EQyH+1Yvz+Gz7WrukGz1IIHe33KmxWCmuEA==
X-Received: by 2002:a05:6e02:1543:b0:3a0:4a91:224f with SMTP id
 e9e14a558f8ab-3a08b6f87edmr91098575ab.1.1726445980127; 
 Sun, 15 Sep 2024 17:19:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf42casm1189973173.17.2024.09.15.17.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 17:19:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 18:19:38 -0600
Message-Id: <20240916001938.2145540-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726445980; x=1727050780; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8JKH2UkrxvsmxPMpV5EBC/P/kVzc0dbH4+Ifk0JCBSc=;
 b=nJeyhUKCtB0VrAdhn57LgWyQeVWfy22qYwO7FEmgejWfOAs9vgCixNppXL8x6tjZGA
 C0iqswlLqxc50DKYu3qQnOseb2of0lr0O7qGh4a7RweNZHaOZfwAWgO0ovueGblmPLZO
 yYSOMhvxEuTGqcUk9kT40ZIsHxaznB0t7UGU2q20ovhMSz4ubuD36VjkJpq5qfPCF9Ar
 FqGippuebvYthDSZm6SNMlrs6a7VwNNN63hOAiNRxX51tdjkCtLoiRRaQyLEzjROeQji
 nN80p56D+hePVkUVBuejqAtW3cstfleg+9zV/s7biorXE7f8e2uy5TDtVhlK8/HIpNh8
 Q3qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nJeyhUKC
Subject: [Buildroot] [PATCH 1/1] package/python-msgpack: bump to version
 1.1.0
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop workaround when a c++ compiler is not available as msgpack
now uses only pure c extensions.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.hash |  4 ++--
 package/python-msgpack/python-msgpack.mk   | 12 ++----------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 26599f2972..acacd6c664 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  6f4d91b00537fd5069dc6bfc52ae5652  msgpack-1.0.8.tar.gz
-sha256  95c02b0e27e706e48d0e5426d1710ca78e0f0628d6e89d5b5a5b91a5f12274f3  msgpack-1.0.8.tar.gz
+md5  e5769d4ab610491ac561c84fde4cf4a7  msgpack-1.1.0.tar.gz
+sha256  dd432ccc2c72b914e4cb77afce64aab761c1137cc698be3984eee260bcb2896e  msgpack-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 4e686a19a6..92d3516186 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,19 +4,11 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.0.8
+PYTHON_MSGPACK_VERSION = 1.1.0
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/08/4c/17adf86a8fbb02c144c7569dc4919483c01a2ac270307e2d59e1ce394087
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/cb/d0/7555686ae7ff5731205df1012ede15dd9d927f6227ea151e901c7406af4f
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-PYTHON_MSGPACK_BUILD_OPTS = --skip-dependency-check
-
-# When set in the environment, whatever the value, MSGPACK_PUREPYTHON drives
-# using the pure python implementation rather than rely on the C++ native code.
-# So we can't force it to use C++; we can only force it to use pure python.
-ifeq ($(BR2_INSTALL_LIBSTDCPP),)
-PYTHON_MSGPACK_ENV = MSGPACK_PUREPYTHON=1
-endif
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
