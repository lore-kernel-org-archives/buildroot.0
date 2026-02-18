Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3956EE9A04D
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 22:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B7E680D13;
	Wed, 18 Feb 2026 22:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwD-_1O3r5T6; Wed, 18 Feb 2026 22:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 028E680B88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771452284;
	bh=hvSjHyvJu51vc4i9u2DnZo0JW8J5p/mmlRxOVtAFPVQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=saOuc+DUgI3Ri1RnJw/1XOdBbJrh834d34JwIK9ib6s/ZnXAvG9hgW2sv3wQXzNSj
	 U1fnp4EQkQ97JLPIDrxefc/ry5+Qn9kCTLLPYr+qXGzzrHQuTss7atnKLVChXqT2G8
	 r+PUqJY7b3bqaEcwO3EOctI8yrAlc+V/7U4ywoPi1iuOg7TxeTy+vu58vZRt9l/7QT
	 rH0WF5P7BWtrmAQnKcS2LxmqPVKOGT92Hqcs73DPKmJqiLMqXe20YrcuW+DH3yfhFk
	 k8sij+aCK+Qn/+8AM1piu1N5rn/hJ5e3HvX/nCaSQ719C8JHBKn5QzsyTHHyhNkVAw
	 SBRxxtElOS88Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 028E680B88;
	Wed, 18 Feb 2026 22:04:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4655E1CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 22:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43CBC405F7
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 22:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUJVmesDc1HR for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 22:04:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21B61405D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B61405D9
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21B61405D9
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 22:04:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so944368f8f.1
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 14:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771452278; x=1772057078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCwVLErPL3Ij1v0eqwhpLIQnLMo3TZKxIkWA8L39fCM=;
 b=h0DOc2YVF3h86RqtZS4yq8VfNjQIoIdH4oIgvytKCL1dKCYye7UsKXnIfjyhYMnYZO
 o4CWqtSt9T7w4b3sqfUt/Rw0wUIx9yXrqej60xlfo0QDZAe5cYP3IuPojKKpqmfFgmYC
 S8jNXpvrjRs+kAcIrG3wswVYyGIeMGMKU4jr6NlvevEWcBqDxDi13zoWS4mkRZlwneWl
 +qwP+p8FSkNZ/pon5KNryJMOAlJUXEOV3pTA8rDkcJGnpJc98XJx4y/xhc9gvRqVKn/7
 KpGrKmB4YdkawJt0l19KW81id5MldFyD40Lmc4pY1gskNq0/5IKPxZFJb4yjeLrEq1wU
 kU7g==
X-Gm-Message-State: AOJu0YzaQiJsY6+5EGM//qPnz7feL7bkb9vZCi9hcPQAcpVHtxwXE7g0
 m+J29v5TsoXM8O1TsnWgr0i4W9ZNjq/VeQ+eULQ75DB/dnLdnV52h31bHRoDAQHw7BQiRiG/xLh
 BcaWr
X-Gm-Gg: AZuq6aJkR9PfqEp3HgOouuyB8gFpAulDIg88RZUWMyiwFdGT8w+OXIqcyZ+eAbJDA0/
 s84n/7/Cu5Nxr03KGOYB2KnGkDKafirAN6clmCM2FmEOlW1O+7ucRP1n8wxi9mpB8RYkXQS//bp
 rAf2lRP7JVoQcydNOFpWmvPyHdnUc3sOQq6qlJ/q99/XWd12B+B6ViIiUid60H3+Wbe34on+NRG
 pn0y3FpbYpXy2mO89B+UHONcMqISCwAwPDO/DCVffQwIIPF0Jt2WG9uevVnuy8qm5xFHtFVUyKo
 O4sUzMu9YOOiqGN4nlv5tp4CmeLNeyBSWLybfSiWFL1uJ4+mG6TENUB39Ow1VQZIh5ZXgjJAR7C
 k+J1ntDW4yz7AINDLprbKLiMSKMA23HBDxtwgw6kBTv6J3BXdGhiROt5SlnlAF5jB+FPvRwi/kJ
 znCjIRpXnzTS9hABO4bmXCI8fpHSE4z8SJLQj7Qxmwt4p0FuiCDGf08yn8sr9dSFLb5R+i+YnYr
 W4dLvfgboCFWhxA1ML7X+otEeEF4mW68RWM
X-Received: by 2002:a05:6000:2504:b0:435:9538:939b with SMTP id
 ffacd0b85a97d-43958c03381mr5836770f8f.8.1771452278279; 
 Wed, 18 Feb 2026 14:04:38 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439567aad3csm10418878f8f.36.2026.02.18.14.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 14:04:38 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>, Vincent Fazio <vfazio@xes-inc.com>,
 James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 18 Feb 2026 23:04:35 +0100
Message-ID: <20260218220435.1849890-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771452278; x=1772057078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lCwVLErPL3Ij1v0eqwhpLIQnLMo3TZKxIkWA8L39fCM=;
 b=JzqVqz8zYmzE1p/ATsEp6LXkC6NJQDhP2QuOqPZot5h8JiiNjfpFXiI0D2+yMZIQoc
 q1PnYziBqCsHxrk/rf1/+Q2rBdYWhszgKhO9Kqyw8skUg/hjIxP5GZPjeffs4huTmbmb
 6lLjK9nyR3yBrYWC7XUrsJDLGYVNVa+1i21hQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=JzqVqz8z
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
v2: add missing package/python-pybind/python-pybind_version.py.in file
---
 package/python-pybind/python-pybind.mk            |  7 +++++++
 package/python-pybind/python-pybind_version.py.in | 12 ++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-pybind/python-pybind_version.py.in

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
 
diff --git a/package/python-pybind/python-pybind_version.py.in b/package/python-pybind/python-pybind_version.py.in
new file mode 100644
index 0000000000..c4cc5d074d
--- /dev/null
+++ b/package/python-pybind/python-pybind_version.py.in
@@ -0,0 +1,12 @@
+from __future__ import annotations
+
+
+def _to_int(s: str) -> int | str:
+    try:
+        return int(s)
+    except ValueError:
+        return s
+
+
+__version__ = "@@PYBIND_VERSION@@"
+version_info = tuple(_to_int(s) for s in __version__.split("."))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
