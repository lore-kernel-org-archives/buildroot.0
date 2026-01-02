Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15DAFA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 23:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05BB4408B4;
	Fri,  2 Jan 2026 23:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 570kCrGClgQf; Fri,  2 Jan 2026 23:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE35340825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767395073;
	bh=kFotWTObLij+YrhYFbhPUNMVTOT2tcGE81kQxDuN73A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bmXh1vxoZMmjr7LexaL/ztHJfBtYWJVWQ2zCCT9GcPYJyO3BpldeYM6+qSdRAX/yg
	 zCwX+0eJvx5YuMRSELkCO3xadAiLW4CPLbs5X8ZPrSqJ++xS5dxfOhfnTDqZox2ax6
	 7vUY5m1BgpuXDOLpugUUOZPZnw2+1eDvm/Qb87SYV3hut2oYis6L82S/2WmqzIg/CW
	 y/QDDz+6b0oLjhKrUUCFvutXymTcGc289mgoDo75kQMMSG24sguN7MU0g1/qXI9fsW
	 kp3TrCqcqeO1vVN75MTftjb8v6CMbIZkhWI1Zyb9qFpZHHuiO9rxK/8uaNRrnRrrd8
	 paPF/pH79lTig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE35340825;
	Fri,  2 Jan 2026 23:04:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68F54440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FA3040072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VR3IZuCyB_2I for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 23:04:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 561F840024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 561F840024
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 561F840024
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:04:31 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-3e83c40e9dfso8274064fac.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 15:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767395070; x=1767999870;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+u9AwZ6LQHr9CKefKSqF+9bbvNaslcnG/hSoMEhw1cU=;
 b=lojtWLQ4AbIMnG3wIR2+fky/yH9A3WUhUwNv5tCl2rtBfuRLHRiD9O42iVEeLT0mte
 CdYFEFjo2lsDslkPEVPfwwp/oPCZIF3m8ONOUL1DR0fJkuH7WncpgKjsdsI6rjFJe9LZ
 tmJy5I2YnNWSYDn4sbRoBI7cJCZRBdvZSKujh0UJWjX8GOldddlL09D7MAw71RTuf9+i
 RbXvGah/VTBx9QCY+NEdh/2PRXkeEMsuvKoNIj7jA4BFUw2fhplAorlZnv86mdlW49lr
 RFrLhadYem12hU8K2CXOLpJej7/Y2mBv2vWPFFE4HpOcgMd+5jC83foHsBzjwpaEnrHc
 MuBA==
X-Gm-Message-State: AOJu0YypfewpohXr7tXjmJgkG+dctVuFSKgDiEOlA9iGa9p4RJ4kF+iJ
 CTTmoEZXU/pkYkaUc7JIJnxZaIIP9ba7r9V6aRFEErSwuGswB5UWJHxts0uqoIV9RUc=
X-Gm-Gg: AY/fxX7Jkuqgcdwx8NtxvHcf16Ytd9ZgGss/OFrd/pjOkjMgJhf9oDxuCgd2QdCYAYr
 HHSxZJtC5OMDHxRMalPUwA4+T38c6KvY4Jc/cmpy8o7nNgOzqnZQvK4v4QO3OzNtvOWhZkWNO0s
 n7qIbVoPWkhyPfLrDLDx+FRL/Wz2x218rKjALMrYE2qJhR+EjKh5QALBEQJAI6KPShOUe4AlhtG
 t1MJdmP9AbrEtQtEO7eeoJJrIEuNJsqGum/bTMYP4t17trkDLLRtjN/Pep9oNJcjgkVmVRkE1Zf
 04jlGgQpIFATkCXw7LzUuc0bYwXQxigwuzgJ9whesjCD8nkeu40+/buoD/BbqK3EBYPi6pngY9f
 +9aLI094UxtBtDrxPuyV5MGKGm8u841FJYOW/RfT/2IfbzuLzJo8RaWYlY3FBJIIUKO8WmJpZvU
 VlE5/2vLxLbBDPtdQK+kon203V25XYPc1sQT5PzVp2WW3s2FwFebkPcfRry3c0B1KJn6DNq59Ta
 fF2QrKLiIQhGmTySYrZ9SB7yV8fRy4uiysqGXMrQfDDKjvdpNnMMTs=
X-Google-Smtp-Source: AGHT+IHA72Ace7Ys4pDR9G41G5+G7+6vpOI1iO0ikKg10i4O2O+maR5aspIHRnRfDvyVjRmZtqfSrQ==
X-Received: by 2002:a05:6871:6d0d:b0:3ec:3a39:f50b with SMTP id
 586e51a60fabf-3fda5674705mr22377081fac.14.1767395069853; 
 Fri, 02 Jan 2026 15:04:29 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa8d44fdsm25628666fac.3.2026.01.02.15.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 15:04:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 16:04:25 -0700
Message-ID: <20260102230426.531850-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767395070; x=1767999870; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+u9AwZ6LQHr9CKefKSqF+9bbvNaslcnG/hSoMEhw1cU=;
 b=HK3f4Ixx4eJHmhE+YhxzqBTO/EJ36dNw8OiDlrZr3nlaFw5li/xCW7vLilTWYLOqOS
 kObdrOnz9Rz+SgVSDj5KZlVhXBJq8LSbzu7O2BfnBszsQ8hI4wLnlsEB+vwFPrMXvI3V
 UW27F/3swZmK963fERL5/ZETE/6Oh+g9PHJCqe+t45Io7A/1raLNnelFjxd+f23yatBk
 LGtWM726dpAGKTWFlmSEnV7xyYLq2aiiklKM6Iz9E/7LkEc31mFgTAXTfcYoepYYLYUT
 4fIf6IlaArKcGchkSBHXzEGbMCYga3K4RirHl9M8OnrKkpLtnNcMVArkfxrVkqMRsIVs
 VZBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HK3f4Ixx
Subject: [Buildroot] [PATCH 1/2] package/python-ipython-pygments-lexers: new
 package
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
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-ipython-pygments-lexers/Config.in   |  6 ++++++
 .../python-ipython-pygments-lexers.hash            |  5 +++++
 .../python-ipython-pygments-lexers.mk              | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-ipython-pygments-lexers/Config.in
 create mode 100644 package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.hash
 create mode 100644 package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk

diff --git a/package/Config.in b/package/Config.in
index f5f1f6a741..def3db0e50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1176,6 +1176,7 @@ menu "External python modules"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
 	source "package/python-ipython-genutils/Config.in"
+	source "package/python-ipython-pygments-lexers/Config.in"
 	source "package/python-iso8601/Config.in"
 	source "package/python-iterable-io/Config.in"
 	source "package/python-itsdangerous/Config.in"
diff --git a/package/python-ipython-pygments-lexers/Config.in b/package/python-ipython-pygments-lexers/Config.in
new file mode 100644
index 0000000000..8b3a9fdb35
--- /dev/null
+++ b/package/python-ipython-pygments-lexers/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_IPYTHON_PYGMENTS_LEXERS
+	bool "python-ipython-pygments-lexers"
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	help
+	  Defines a variety of Pygments lexers for highlighting
+	  IPython code.
diff --git a/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.hash b/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.hash
new file mode 100644
index 0000000000..90c69fa626
--- /dev/null
+++ b/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/ipython-pygments-lexers/json
+md5  a8d51d899ed01e1cb6773657cf88f734  ipython_pygments_lexers-1.1.1.tar.gz
+sha256  09c0138009e56b6854f9535736f4171d855c8c08a563a0dcd8022f78355c7e81  ipython_pygments_lexers-1.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  b1d0dbc0fa79774d34b8e2d0aec91d50d8caf05f7b40fc22c3010a4bd9ad2bf9  LICENSE
diff --git a/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk b/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk
new file mode 100644
index 0000000000..e86284b265
--- /dev/null
+++ b/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ipython-pygments-lexers
+#
+################################################################################
+
+PYTHON_IPYTHON_PYGMENTS_LEXERS_VERSION = 1.1.1
+PYTHON_IPYTHON_PYGMENTS_LEXERS_SOURCE = ipython_pygments_lexers-$(PYTHON_IPYTHON_PYGMENTS_LEXERS_VERSION).tar.gz
+PYTHON_IPYTHON_PYGMENTS_LEXERS_SITE = https://files.pythonhosted.org/packages/ef/4c/5dd1d8af08107f88c7f741ead7a40854b8ac24ddf9ae850afbcf698aa552
+PYTHON_IPYTHON_PYGMENTS_LEXERS_SETUP_TYPE = flit
+PYTHON_IPYTHON_PYGMENTS_LEXERS_LICENSE = BSD-3-Clause
+PYTHON_IPYTHON_PYGMENTS_LEXERS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
