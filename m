Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3582D13590
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 01:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60F0660A82;
	Mon, 28 Oct 2024 01:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbWdlnowVJc9; Mon, 28 Oct 2024 01:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 610C160AAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 610C160AAD;
	Mon, 28 Oct 2024 01:04:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F29CAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40ED981858
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6myB56W93KPE for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 01:04:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4FF298186E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FF298186E
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FF298186E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:04:31 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83ab21c269eso147547239f.2
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730077470; x=1730682270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3I//zHtCCDXWF7s0v6fJT2xNnaVN25Wgiu2LExKvxLM=;
 b=LPOuHCBtqDB/kAOEszjmcKHnxyj2olPU5yj1hWvOvrvQ4Ha60ag46d2li9hhY/RHKI
 5mvOU0XQhZ++xMxqpBFyWRJiOXnWstHHf68s+TSNU/Z+leBnMmMuJ2CBsujksYz+wIPs
 4Vg6HHifTuShuoOSs774oAm+Kzb85sbaydtjoWx+O0xVRMnn9a1cWei8flMkkmQBlvs+
 tfoiPfMBKnUO/To4HYbbdaKVWlDZhX+5YFdH7cUYoEsRn/eZGidzeG6wUhTXWsmrDAGR
 yfvSKYh+Oe7WFmokEo9bxT/fnJs2MmHPlDWCDQKvfuXshJlUso03kcX5aCW2557akoKN
 6s5g==
X-Gm-Message-State: AOJu0YzvvxzgJS8NxDvEcJW/Syb29wrwxBqYZNfzQ7Wbz93hCs92/4c+
 Nk71GiEP+4kUvSswBNXpa4+yPf1Th0LDAZ3ttnbRspiEvP39zzp6GO/hjw==
X-Google-Smtp-Source: AGHT+IEZ/y9Bnd3VYD+GrI67wq9S3hazuPicA5YrqyLY4PXNmaGP9yLeyIkXaNmnP/IAsvO3vlrL4g==
X-Received: by 2002:a05:6e02:1545:b0:3a3:b497:f951 with SMTP id
 e9e14a558f8ab-3a4ed351c49mr49547995ab.23.1730077470019; 
 Sun, 27 Oct 2024 18:04:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6e022e2sm13890125ab.51.2024.10.27.18.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 18:04:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:04:24 -0600
Message-Id: <20241028010424.4123705-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028010424.4123705-1-james.hilliard1@gmail.com>
References: <20241028010424.4123705-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730077470; x=1730682270; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3I//zHtCCDXWF7s0v6fJT2xNnaVN25Wgiu2LExKvxLM=;
 b=WJft7J0JzcBkQ+ywGMHgeBtRzHlC2Fo8FWy9W4zIaaYPUZPF7ZlYUVh1dXvG+OW22V
 7BRDSoEYrofOS1/J2Otl9I9rYcEnMN6LhuQF4/Udx74630Roi5M+D58ZwpJ+QmF3wzM4
 5HoOXNgOKYkS/ZHsepSWPmQ/f49I0piOHEgByy/FxO/1+s8wBqdnIX/cK8myUX0TiJ+h
 b0zaZ3zAUXRs18sh0+e9yhc9RKnQB1zeG5MwJHYj6sMt8D1sRqG/yAGgMzoZME8Dj3nc
 BcOVY+nzHpGwlMdWuOZN2gVQ+lk23WrjFYa1mKaOkJCScziV7RH7GkGDzy+2t5xNv28r
 XaEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WJft7J0J
Subject: [Buildroot] [PATCH 2/2] package/python-webob: bump to version 1.8.9
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-legacy-cgi runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-webob/Config.in         | 1 +
 package/python-webob/python-webob.hash | 4 ++--
 package/python-webob/python-webob.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-webob/Config.in b/package/python-webob/Config.in
index d3397587a1..d4b24d3d87 100644
--- a/package/python-webob/Config.in
+++ b/package/python-webob/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEBOB
 	bool "python-webob"
+	select BR2_PACKAGE_PYTHON_LEGACY_CGI # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  WSGI request and response object.
diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
index 065a878d41..8f9c7a1fe2 100644
--- a/package/python-webob/python-webob.hash
+++ b/package/python-webob/python-webob.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webob/json
-md5  2372b45cf0e0a3970daaa901fc9d0f64  webob-1.8.8.tar.gz
-sha256  2abc1555e118fc251e705fc6dc66c7f5353bb9fbfab6d20e22f1c02b4b71bcee  webob-1.8.8.tar.gz
+md5  4167b16880e0d4c22aadee8ec3cc6c26  webob-1.8.9.tar.gz
+sha256  ad6078e2edb6766d1334ec3dee072ac6a7f95b1e32ce10def8ff7f0f02d56589  webob-1.8.9.tar.gz
 # Locally computed sha256 checksums
 sha256  27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index 0240d3a456..1e58d590d1 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBOB_VERSION = 1.8.8
+PYTHON_WEBOB_VERSION = 1.8.9
 PYTHON_WEBOB_SOURCE = webob-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/a2/7a/ac5b1ab5636cc3bfc9bab1ed54ff4e8fdeb6367edd911f7337be2248b8ab
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/85/0b/1732085540b01f65e4e7999e15864fe14cd18b12a95731a43fd6fd11b26a
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
