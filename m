Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F718CD98CC
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 19:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C0AE40E36;
	Wed, 10 Jun 2026 19:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vx-jAB1qTOoC; Wed, 10 Jun 2026 19:29:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4607740E3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781119781;
	bh=4Gq06bJE6SJExbq/hV+nJMLEA10PswxEgBPnV+JedU8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=docmIS+RjRkPinDCxAjFupCqykmgWFl/Cav9c2n/o5T+DbFeC5nqJ2nxdDU8I2QEB
	 IanCF++ry6xivVYnvnDxvDAm8agCWED8iuDQreCNzOYRJG7jJUxHtONN8Rgkmi1IIY
	 p6ZmsQNquUvMT0+zbjFnkgLtqbqLGCWBjWYDZxzdxcfpRAK15m7bcWnqlheYw7PCIN
	 ROzJ/1m7OdmASFaqwsWG7rH5PZqKrJxGzsYqVhFOvezSagO+WO/wTlRSm9MGyhKw9S
	 56OPCEaMY+oZUiotMSRwuBW8jHNYvuu3iEx/8WJbtqwBcjhgl/v/miyp5vi1wu7X4v
	 zj4D1vScODNdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4607740E3C;
	Wed, 10 Jun 2026 19:29:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A4C425E
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 19:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60BE040E3C
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 19:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxAhIzo2bdUk for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 19:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B7B640E36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B7B640E36
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B7B640E36
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 19:29:38 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-69e4d51b15dso4776369eaf.2
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 12:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781119777; x=1781724577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VrmgN2FnMWjzFP8slUpLDJz6Ahd9fgtpEsbNztXYvsQ=;
 b=Nb9nBOxO4umDq6KK9663uKwf/w0RgRhe4/KSnM0F0NDsyiMYTje7N7JN7YxB9LnM/R
 W57BY+rfRZM9acM9qRAS2MVJWgAcyb5DM9mbNIcgfvNW5cnIfI4lCNE2VwZc70foz+P0
 HvPA8sHaAYbZCgn/GDw355eVj38Qd9Nhq3ZwwvIT7wHeknI3G7BosR9WLgIG+nWfLhSp
 7GyC1m02TPSUKSOqZLDq+He/arzg5CQwnnJqg1kbCHKD98B2MApi08GwzRHqotH6/6uC
 lHGc14Ti92klh0Jkq2vK9gCMbUQ63eaq6hdX1Vh5C9JC726mrXTb1JtFzr5hZzYwl4y1
 z65A==
X-Gm-Message-State: AOJu0YyW6jM5XyIbSLDWZinmy4GGcs51GfLOyIoWw6X9JpsCwEjeaB4Z
 6iL2G3gULMmfhBbXU+uDSf2xIo71dL2m41MHzH85lUo2BIFpAXsMn3XsGYLoKEmJ
X-Gm-Gg: Acq92OFmyqvR9NYXpMAEqp45hKnRaCSjavE5XaLLJ0k1Zur5sbFe1rDMZMe8aqy4WwG
 Zi1yHv+SeOJSP3DcSfgxUPb35TsfKEhb7mHUiI1NjUKWWFvDV/mF3w85o6FhaCpglePQeh9MyqZ
 FIVUmejh+83mqLIog2Qp3zUjxquQ3UZtVXY6EQJN3InC+GgjvBH5xrDduVjxRgkzNh7a9v5pJXe
 KvJbF2Z9kjSSg9wgqqbzdLwvc/Mwv/4AVCZ3wqvlnV/ceMGnK6A1v0mXaYyy+PTN1gMfNMoLhvM
 XivStqiEGA1D0TozUf+DyPLM9bgwDbDQpAj+4tKFeWnd5UNFoXp4ARIkWEPCjceYB1mASoN6TIU
 BILZHJ95O/56jo9CRTaDyhy+i0NB4G3zDFf6tNwWJaL1OiidhUm8KuVQnRw9Kx1xIiGdVUEftdJ
 KVhX1QH/YYZypA2ax7jrrN2ykqYsSoQYFM9jHIrY3TE66QoPDQ+MsZBzbauGR3gUnc3FODc40iy
 0/deXZ+tlZrG6yE/xIfY/wvs3I8mQes/eXN6FLKjutolgt+OCxXLjkUh8EcaS14qZaIvqTZ8XI6
 Lz9jQnenqBt8+F0cUCzO8xyfUU9TqNp+ltmt
X-Received: by 2002:a05:6820:1687:b0:696:89e4:5493 with SMTP id
 006d021491bc7-69e68c06d10mr16346827eaf.34.1781119777222; 
 Wed, 10 Jun 2026 12:29:37 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e4623cc02sm13572674eaf.4.2026.06.10.12.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 12:29:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jun 2026 13:29:33 -0600
Message-ID: <20260610192933.1116376-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610192933.1116376-1-james.hilliard1@gmail.com>
References: <20260610192933.1116376-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781119777; x=1781724577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VrmgN2FnMWjzFP8slUpLDJz6Ahd9fgtpEsbNztXYvsQ=;
 b=LoSbf9ShzgPeH+IWIJtK6eWrfj29mkgR9OFPJ7ojlwB29xIDTZ+wvUjzUkiKPaeAzE
 4nRf8OdYk/qRK+KQMfEfMrw7MxETUQE8hAF/xiAUtSskxhVO5Avo9be+pqHjQuY6FbFb
 t546t5Sl81kfIzdS+9//BqOUkelVRIcteasWm9CUJAGHgGtJ3stk0Lh9/qwTjE4UJnbk
 aAdg78Ot3Ux36fLdr0cpntu0lhqV8ghF7Y2u/MFZbPSLQMN5C+W1X8a4Ng4UUgFR2v/r
 9h8+NRT3hVTW4oWG6oBHXwOl/+QCH1dxBkS7VyZc3quaaz41+nzE5ln6eMstIaCLpVz5
 /RtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LoSbf9Sh
Subject: [Buildroot] [PATCH v2 2/2] package/python-nats-py: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - bump to version 2.15.0
---
 package/Config.in                          |  1 +
 package/python-nats-py/Config.in           |  6 ++++++
 package/python-nats-py/python-nats-py.hash |  5 +++++
 package/python-nats-py/python-nats-py.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-nats-py/Config.in
 create mode 100644 package/python-nats-py/python-nats-py.hash
 create mode 100644 package/python-nats-py/python-nats-py.mk

diff --git a/package/Config.in b/package/Config.in
index 96e113e226..4a8d5cb9d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1254,6 +1254,7 @@ menu "External python modules"
 	source "package/python-mwscrape2slob/Config.in"
 	source "package/python-mypy/Config.in"
 	source "package/python-mypy-extensions/Config.in"
+	source "package/python-nats-py/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
diff --git a/package/python-nats-py/Config.in b/package/python-nats-py/Config.in
new file mode 100644
index 0000000000..cab8bb8bd2
--- /dev/null
+++ b/package/python-nats-py/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_NATS_PY
+	bool "python-nats-py"
+	help
+	  NATS client for Python.
+
+	  https://github.com/nats-io/nats.py
diff --git a/package/python-nats-py/python-nats-py.hash b/package/python-nats-py/python-nats-py.hash
new file mode 100644
index 0000000000..9407f34c4c
--- /dev/null
+++ b/package/python-nats-py/python-nats-py.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/nats-py/json
+md5  8ee5750a5b26973b5da386e83b238530  nats_py-2.15.0.tar.gz
+sha256  6622c547d9a7d2313d9c147d46c386188f4ec2c7b5c9f9a0438a4d1b55f54a93  nats_py-2.15.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-nats-py/python-nats-py.mk b/package/python-nats-py/python-nats-py.mk
new file mode 100644
index 0000000000..95f66c4cbb
--- /dev/null
+++ b/package/python-nats-py/python-nats-py.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-nats-py
+#
+################################################################################
+
+PYTHON_NATS_PY_VERSION = 2.15.0
+PYTHON_NATS_PY_SOURCE = nats_py-$(PYTHON_NATS_PY_VERSION).tar.gz
+PYTHON_NATS_PY_SITE = https://files.pythonhosted.org/packages/02/f0/fc5e93f2b0dd14a202590ad9d30eda1955ea872039b5204357348d0f4b1e
+PYTHON_NATS_PY_SETUP_TYPE = pep517
+PYTHON_NATS_PY_LICENSE = Apache-2.0
+PYTHON_NATS_PY_LICENSE_FILES = LICENSE
+PYTHON_NATS_PY_BUILD_OPTS = --skip-dependency-check
+PYTHON_NATS_PY_DEPENDENCIES = host-python-uv-build
+
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
