Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4EECF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 19:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6882840102;
	Sun, 13 Oct 2024 19:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49Rp0GBrkiNH; Sun, 13 Oct 2024 19:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 077A840139
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 077A840139;
	Sun, 13 Oct 2024 19:33:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98A061BF3BE
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8704940540
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCuEl-hJNX_y for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 19:32:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FE29403FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FE29403FE
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FE29403FE
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 19:32:59 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-835426c0fefso117857339f.1
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 12:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728847978; x=1729452778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/EsXmss4pir/yEtgFglxEnPCmOtpRP6iDMsf+mz7XP8=;
 b=Yyai5kb5YMZan8PCrEwGZt2mVcNyikQRzzbW3JyTlx54rUSOsWOK7rAMgPEVAz6zbn
 29oIFGFOg8POAqcmgFCPOGbGn8xl70G7oV2bwo7S32srtPKBoXvO3gsuAVFmEDRy+6rY
 7he+B2KeYuXxFcR78xPo5xyr4Jf6qRnxPmmcKGDNJkqZ2WWx8X2qScmp5+dK9hYGMh97
 +7txR48BFiTPXE4zh8x4QrJfbtU4gJQ9nB4pFCp4YXsSs98NfOXuZibFnL13Mr7s5O0E
 /4MtNL+zUEbDASIiotme0jJaAv9/y5NWXTTBNSaEr+VD37Bi4oETsBRnbMbsCQk6w1wU
 WI7A==
X-Gm-Message-State: AOJu0YzMZ+Rkb8cHnrhM3QbigX7oCfirezI6xdqT8QxFM1OYD6BFtU/b
 O1EftbkKikOrrWGdN+AMOWLWfA7XiKpMoRWSRJRl1weVg/1q0GPq+MRJxQ==
X-Google-Smtp-Source: AGHT+IE844uzlTj+u8Gi+8/kXKbBoKJqIV1NCKXCuU2f7PQmKZwDvv4iYpCuFCz3KAyoc4ux++Y0QQ==
X-Received: by 2002:a05:6e02:12c1:b0:3a3:637f:1012 with SMTP id
 e9e14a558f8ab-3a3a71e0cc3mr70703645ab.12.1728847977870; 
 Sun, 13 Oct 2024 12:32:57 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbc3de4e53sm860571173.15.2024.10.13.12.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 12:32:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 13:32:50 -0600
Message-Id: <20241013193251.2807543-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728847978; x=1729452778; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/EsXmss4pir/yEtgFglxEnPCmOtpRP6iDMsf+mz7XP8=;
 b=LfZ78yZWLUS9gzxzvxVbPRj9+p79l2krc131HBVqy253uVeZEIqZ0B8d5kBFzNhuCA
 WG3w0P0oYqtMDBVKKb/b2+vPgWUaFh+yKJD4Eiwmsz5uFV6cLoHqlMlO1lBOJg3atzSQ
 bbNstyeJAsUrW9cB/y5rLcu4WXrBzt6aViGwmNYZ37QtrIupswM9i/FUC34LqXtgG1qf
 mY+I3ZJ4qNwp4Q2Qd8bt15UqX/+4ylPu1nzbzJMl18MPDb/5nvmlUWaO+NvUF5mI4oyY
 prDfy0lezOzpyLyNx4uNubv+rM7tiPuGpoS5Kn+c+UtCl+YWIA/aZoShkSpfsE9vAfbv
 2iNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LfZ78yZW
Subject: [Buildroot] [PATCH 1/2] package/python-fastapi: bump to version
 0.115.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index f752d65dbe..a45c78e180 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  1be069a4db82af6acedf769e61c2aaeb  fastapi-0.115.0.tar.gz
-sha256  f93b4ca3529a8ebc6fc3fcf710e5efa8de3df9b41570958abf1d97d843138004  fastapi-0.115.0.tar.gz
+md5  cb1bde7504e7943d869a5d93d999f5bd  fastapi-0.115.2.tar.gz
+sha256  3995739e0b09fa12f984bce8fa9ae197b35d433750d3d312422d846e283697ee  fastapi-0.115.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 3a932ce34d..a15db2bdff 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.0
+PYTHON_FASTAPI_VERSION = 0.115.2
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/7b/5e/bf0471f14bf6ebfbee8208148a3396d1a23298531a6cc10776c59f4c0f87
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/22/fa/19e3c7c9b31ac291987c82e959f36f88840bea183fa3dc3bb654669f19c1
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
