Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E837D31767
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 16:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA95A80F55;
	Tue,  5 Nov 2024 16:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOff16vUuMj7; Tue,  5 Nov 2024 16:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E391C80F62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E391C80F62;
	Tue,  5 Nov 2024 16:41:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 017B5B8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3007605B1
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WmI9o2GGL-yr for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 16:41:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7AE3605A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7AE3605A8
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7AE3605A8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:41:06 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a6bdc8f7a1so13035015ab.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 08:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730824865; x=1731429665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XjJVFSgzhV/dX57jwn+kQ9svGWo46jDYH5+YxeMXywg=;
 b=JLkuDicrK9UW9hozbICAW1EasHe94INfWYI8vtGmGcfGIlbIImRPGX9It6egC/yBd1
 FAA6tZ+GF2yM73/awNwOFrBCt3q/zEeEg9gMzzp5YkRBQe98P4YJd9Rne7mCADdXk0XG
 x9JXx0enIFlUYhmcYxCyqx3uSQ4/611gO5v++qkr9/aiO8lM2sCu8WIeu9JjZwMcrjgY
 kkPxQfBvkCbzEBFBuJhifv9PYcMXqYQoQUgQsSCYWKyurbKAkSeiW46NSA0v8RFfal4T
 UthRVmKyXmcx7P+K8wu+pyvAcopbcn8XfTLNYVOIMPW+troUHPnUUp5sNJiPpQjZVs5v
 Doxg==
X-Gm-Message-State: AOJu0YycV0PkSNnG2isX6ADPwGu42udAFen8IYAlXKe+vweWmfS/B/ho
 68VMEiX+KmuEPRwjNiwrswWWWJiGexGcUOdoEuFGwgvuxVHzUW1SezKV1w==
X-Google-Smtp-Source: AGHT+IHzstTf8KxDWjvJmOh2bckTg7Eb7P3TutKStgDquc/Pw4Opis5IpuX+GldANGSP0U4qRlYgsw==
X-Received: by 2002:a05:6e02:152:b0:3a6:ac4e:2659 with SMTP id
 e9e14a558f8ab-3a6ac4e280dmr134950445ab.6.1730824865488; 
 Tue, 05 Nov 2024 08:41:05 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049c8187sm2472123173.160.2024.11.05.08.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 08:41:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 09:41:03 -0700
Message-Id: <20241105164103.1378386-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730824865; x=1731429665; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XjJVFSgzhV/dX57jwn+kQ9svGWo46jDYH5+YxeMXywg=;
 b=gjiuOkJvXzE+GxHmxSUvH43T8lQ/1aEeniRT38pXUKpdxwXIIta96tQEVmjoiX8L1J
 fRNtlho1Z4lX01+6U0/us8M3yIVlsJejmvNs8Qj1JZWAn8AvBJG+AR8JNPH+joL05V3+
 ZbIA7RyfkQpQxVjGwwQZkuIYEFLXC/Hw+Vwgu3p5idBC7VDNAwM9VxB1D2LxHuoC8856
 se3PqCwFTyUPhuMNZUkIJajz9ylVLXUw9F9RR6EJhtnAFUP0ITeEFhKuq2eZ4cU5I7ea
 0d96vdRClXhXifB7cqB8Z6GZD306Q/l9s8ISzEeXUEGd5PxGnzwwlA7/A4mT+zfXmoDE
 zfEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gjiuOkJv
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmpcrypto: use poetry
 setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysnmpcrypto/python-pysnmpcrypto.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-pysnmpcrypto/python-pysnmpcrypto.mk b/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
index 4472434286..f58bff1136 100644
--- a/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
+++ b/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
@@ -7,9 +7,8 @@
 PYTHON_PYSNMPCRYPTO_VERSION = 0.1.0
 PYTHON_PYSNMPCRYPTO_SOURCE = pysnmpcrypto-$(PYTHON_PYSNMPCRYPTO_VERSION).tar.gz
 PYTHON_PYSNMPCRYPTO_SITE = https://files.pythonhosted.org/packages/e6/70/b71f5f1321ea548a7152fc23926258caaec353c8c3edce1aaafbb030ba76
-PYTHON_PYSNMPCRYPTO_SETUP_TYPE = pep517
+PYTHON_PYSNMPCRYPTO_SETUP_TYPE = poetry
 PYTHON_PYSNMPCRYPTO_LICENSE = BSD-2-Clause
 PYTHON_PYSNMPCRYPTO_LICENSE_FILES = LICENSE.rst
-PYTHON_PYSNMPCRYPTO_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
