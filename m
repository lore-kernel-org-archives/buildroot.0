Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2EDE9A04D
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 22:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AFFB8136F;
	Wed, 18 Feb 2026 22:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBLZlIu6LV7I; Wed, 18 Feb 2026 22:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CE5C80D36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771452172;
	bh=jOsNJ96X9yFCBvmkzpckT2wmeeKoy7neCBgqcI81qAg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=iA5kz0RksoBO6+ceWsi+rHwDAGEit5G3p4tJ7f18KqN/GkouCqkvQTaOpKUYZWdQ2
	 Q/DpxAPe4K0RYRoL6QQJlgDD5sRc9rC6h6hytAX5zGHu9uVxG+2O10cxuSdCexwnij
	 4c/kfybkdrydIk8jj/eaQ7uGKvUKf9rijd756MEssxwj8M+icP5t/8e2Iqp4kuktrp
	 FUDuM6REn/faW5RTNbjID8ZVs+AOFU2I3nlE5foTMHCBWhih1rj3vbEjZIiv8fFqtr
	 r5WqYyenxQXNKnD+FsZdLXmAAd09dq20QmMYSWhzX/9wcoLFERUiKSMxxqNbsWbekk
	 VGQvS45cw00RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CE5C80D36;
	Wed, 18 Feb 2026 22:02:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28D6A1CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 22:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A5D74047C
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 22:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ot-fdKqfnu3h for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 22:02:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10236402EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10236402EC
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10236402EC
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 22:02:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so266433f8f.1
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 14:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771452168; x=1772056968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mbTsKPaCV38TDOw+pfdbpKzdpwuS15pzozar/abyVlA=;
 b=n3DlQztWOuAhpSGplMdW56N5yK9C/nAQCXO4Vu11W9F5SUEaJIe3m4cAVB95LHS1I+
 OQwesWFrFYJuWcSVHzv+9nMpugyWoRcsfTchKp+IkI3QjuLy2/8wbC4zL136kGBK0plL
 EVS0LBFhRy9ZE17GCHFA7doUQ4U6y4D4pHiSsTdgxTe77sNo56E9209EFImddb8ECJ9F
 +2RI7ugAsFADhwIFHm10fpY2c7FOzZB66UUu0Vno94rje5t+qbqnpXKZlRfRDQUwT+K6
 1vxBUNOerdO1tc4SGjV3iR+HGnbtGGtUrZ/5iCZf75W7/EzVIm1aFgyuig/2yQO9mpmK
 aBcQ==
X-Gm-Message-State: AOJu0YwVokTW4F8CZbCZnCxXioizcpAzP7kJTZ3YtWQDFpcf+bJlYoKw
 n0e6027gMYRVZWgAT4KtONqmWlX4hq0fZrluNAJVypvKJsm+sgQg6raaEsujUBGSIdxyq4unqdD
 gO7w1
X-Gm-Gg: AZuq6aIykq1JCZCp467H1suwktTfQnHvDu8TquryubmeqtN06eoT0b5l3Cs/e0aQCGl
 WpHf4lkqpmaDkdA9b9LqpTnE2iHHJW12zhznDduHUgTEfxobUN80cQx3SwibwrYQbTN7AWOX60z
 a7AbN4l8q3d8hlScwVWGVN31m1LlKMVq2yZ3HTCjwxnZqLfb9SWLWvcuMbAVGcFOh6V0AvDZ7cP
 zisMWqOTYEm2KYWoCYDa9WYPybkknETSBwcPTKs2Tv7mgDc2rjKbYkitbPq+XM0GJ5LNjUNHoL9
 YJmo4w8k3WKfcRj0/s0qsT/d4ZQUsBI6mRsy3o2gxVjl9kBDCrj8p/WeN/woR6M2qfejVfIQaXn
 8D7sXGSwDSdLGZuxZYlJLVAlGkvNLmP1mVinuCjcXMzcrMyLmbF+ICsgkZQpkXWz3q6d8s00J36
 c5hBBNdlSIwfzNved1sI0LRLr2GZaQtFNaiLq54iFL5GPQF1yISyWRrKi7sYTYTM1RKlSJR5P2G
 EDMygLqzKxr3SxYwkiRPGMXNQ==
X-Received: by 2002:a05:6000:1867:b0:436:14fa:a3fd with SMTP id
 ffacd0b85a97d-43958c47999mr5787154f8f.24.1771452167938; 
 Wed, 18 Feb 2026 14:02:47 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d82sm44545219f8f.31.2026.02.18.14.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 14:02:47 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>, Vincent Fazio <vfazio@xes-inc.com>,
 James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 18 Feb 2026 23:02:44 +0100
Message-ID: <20260218220244.1849047-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771452168; x=1772056968; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mbTsKPaCV38TDOw+pfdbpKzdpwuS15pzozar/abyVlA=;
 b=z7fLfG+J6a9PAxt1neKbmA0aDkVFOmYseYAHrfXtF+pRDEKqXQdifZGljC1kueyI7h
 AsFU2pFXYFIzIzhqx6bJ1ZZjeH2JdP37afhSlvuaDqXnEcLRTLjPso/evAEeCtWP4hcQ
 qwbJEf3HsZTPrMefQxDg9aLMNvMnODeHShV4U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=z7fLfG+J
Subject: [Buildroot] [PATCH] package/python-pybind: overwrite
 'pybind11/_version.py' with a hard-coded version
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error with python-pillow since its version bump to 12.0.0
which introduced a dependency to pybind with buildroot commit
5f446a8d6dd8715385d6e2df2714f064bf26243d:

FileNotFoundError: [Errno 2] No such file or directory:
 '/home/bernd/buildroot/output/host/lib/python3.13/site-packages/include/pybind11/detail/common.h'

Implement the solution suggested by Vincent Fazio [1]:
Generate `pybind11/_version.py` file with a hard-coded version to avoid
copying pybind11 headers in HOST_DIR.

Fixes:
  https://gitlab.com/buildroot.org/buildroot/-/jobs/13138981946 (TestPythonPybind)

[1] https://lists.busybox.net/pipermail/buildroot/2026-February/796082.html

Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-pybind/python-pybind.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 7282c058f6..cdafc9d4c0 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -19,9 +19,16 @@ PYTHON_PYBIND_CONF_OPTS = \
 
 PYTHON_PYBIND_INSTALL_PATH = $(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pybind11
 
+# Overwrite 'pybind11/_version.py' with a hard-coded version to replace
+# 'pybind11/_version.py' installed by default that require
+# pybind11/detail/common.h header in HOST_DIR.
+# https://github.com/pybind/pybind11/blob/f5fbe867d2d26e4a0a9177a51f6e568868ad3dc8/pyproject.toml#L93
 define PYTHON_PYBIND_INSTALL_MODULE
 	mkdir -p $(PYTHON_PYBIND_INSTALL_PATH)
 	cp -dpf $(@D)/pybind11/*.py $(PYTHON_PYBIND_INSTALL_PATH)
+	sed -e 's#@@PYBIND_VERSION@@#$(PYTHON_PYBIND_VERSION)#' \
+		$(PYTHON_PYBIND_PKGDIR)/python-pybind_version.py.in \
+		> $(PYTHON_PYBIND_INSTALL_PATH)/_version.py
 endef
 PYTHON_PYBIND_POST_INSTALL_STAGING_HOOKS += PYTHON_PYBIND_INSTALL_MODULE
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
