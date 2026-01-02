Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78294FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 477B2813AA;
	Fri,  2 Jan 2026 21:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3J7BJZ6jXS-t; Fri,  2 Jan 2026 21:03:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D318814B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387832;
	bh=5US7aUNOIWrft0Ujxizqsp8M83M0SIOwXDZmDgPn3p0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=tHuLhdpWEEAE0ZkUoGY+VRj95NTnTkmE8t5fF+n+MNjAke5KLh80O/WEItsbVb0pm
	 D/QM+83VFsa1lcn8snrCG9wo8pOZVAiOvAjkAsmex8y77k2EGD9nNzveLCitoD/xeX
	 wM7c+BSUW5XEmmJqmQOcrK6xrfNczy2qzDEKkFx8ELbCudJubeOE68m9FJk2vbE9UA
	 MSDKUq+guRBaFiJeepaV7IfvQVKw13qsxdbJ7NlV346ibDLFmn/zpAJmiP8IS6vsZs
	 lHdk6iEjIMDWiFkil3+up9pCDhwZlaXIQ65FZwfMtDXUbqmyBc7TzNz+dPXvMCc1rl
	 h0x9+Of1e47tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D318814B5;
	Fri,  2 Jan 2026 21:03:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81A7019D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6892940111
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAK5JYJf3USM for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:03:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8BA1440072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BA1440072
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BA1440072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:03:49 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-3f11ad6e76fso10452310fac.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 13:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767387828; x=1767992628;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S1keAiSI99iLQlF+4Hwpjr0fF6MSOlcfhN8DY2Nxa/c=;
 b=TBI1Tpe3S94SsmhxyXPFSbUuG9VFtZcbp5t8nuqQOJJopfWXN4IgYA1vGN8mky/lgo
 Izp9FV8FrKV8/orNqltScByVP71GQc7nOslhzbAwdRON2VA+o3xqcxgdGDKtVt9aA5Oh
 D7IpZZftosVi4tb7P9VMidOgKRfw9BbAsdn+t9RyELhr00UdVy3asuqHd8BMBCuS71D2
 eA875YQbEYpubye/F1rQD2yVTOFjOath8lhhB/KOm9PQe9k4YVdxyQBR427iw6GhfHnc
 dejWukPVbVPLkrvUSG8eGgpl+X6v31ku0tq1B6r/M8djXF+6Nee714Evt/DTpTPlIUAA
 vNeg==
X-Gm-Message-State: AOJu0YzhAmSjOurfn/yFzJEQpuVGkALlEmZYQa4WDVs9xUnMDjdWZhNF
 afw+FbqddunBkSoz1ZLgCPjtdUMEgt42f77R2DpARFJuOEqBcDllCy95HACraKnpU+c=
X-Gm-Gg: AY/fxX59RR/RYmVlCB9pM7z7mu9KUKnUplmLEGIhtHrjkC53g/8mkJiEYvWfjYlwlXY
 NYTlksQCGOVrc41o64awNbZG0BI++Nx0+5K3+TjqwX4O9sjYeTrZOUxHRfvEaXeG/nXxuD55wCb
 STZaKITbHrCzpZt/bW0rwI512L6UoS0p6FdEYzNZbtxxkqu8TAc+h3RdxI2MdDlktRWkPoGHdhX
 44F3JZ8VHST8xZi7o1UpZriNRUtTsx8GyRoEWTnwScYByYvvSEP9oLND9Yi953q5C89tMTHaEhF
 HFXosIEwjCHI4OLR819tdTocPj2G8q0DmpkCsTVbxeNK7o4wx7uGjrdekSHdBCZ34EJIhmXwiea
 s5olxRQZdN0kDuF0cxcZA5CMJh+FRMWEHOSQkafJmcQWkyQ1gXT0uMQxdiFOTy4djYelRH6MaPp
 2hiv+ZfbGSeWo6yP239G4lcguzYXstvfXq2w9XTJQN09yRL+iAL38Bdfgba4HklYywBK/tNPCAg
 nsjb/Z8eOtEbIs6/lEGCsc4Kj9fvWpL1+OQ9MkXmoj/WBUydlgiBSI=
X-Google-Smtp-Source: AGHT+IGz6lYqIf3cA/lYCnwZGs/wUOPtWRaxIFOSot1VHzjCiUHjG7SzmVIHZVQAtLDl9K2y+5FNIQ==
X-Received: by 2002:a05:6871:5d18:b0:3ea:741f:2985 with SMTP id
 586e51a60fabf-3fda542763fmr20750218fac.50.1767387828081; 
 Fri, 02 Jan 2026 13:03:48 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa931b0esm26701625fac.8.2026.01.02.13.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 13:03:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 14:03:45 -0700
Message-ID: <20260102210345.45476-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767387828; x=1767992628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S1keAiSI99iLQlF+4Hwpjr0fF6MSOlcfhN8DY2Nxa/c=;
 b=PNKwSQWHtOpAP2HdiV+TxzgbImCx5w/5k7Uoi3XFXRD2GWRH9J9WtI5GKuoljNL4Qt
 oRjmSCxrZ8+Z4KuM6ju30FeBWuBe+V1v2DirYhalKzRbJd3PuY0ssq61eDL785ESB6Qo
 mc3Rnyo0i6fyjQAtlg1MLI2zrUbFhNxcGasG7p/NT2TybQbVQPkV9khi687gYaSf95Pu
 wQU9Yc70f5jnJMd268TRou6AYrT1rbuboTv2iurbinp+sxxWM2bBDcaQWz3mtvkORc/n
 LwMXW6QgEK/5hAC4zDTzAJPkJu7PEQMb6hxTphaZJKZPFjomOmvAJ+3zw8Ov/VKjable
 SO4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PNKwSQWH
Subject: [Buildroot] [PATCH 1/1] package/python-modbus-tk: bump to version
 1.1.5
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-modbus-tk/python-modbus-tk.hash | 4 ++--
 package/python-modbus-tk/python-modbus-tk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-modbus-tk/python-modbus-tk.hash b/package/python-modbus-tk/python-modbus-tk.hash
index c60733b02d..68c2420ac0 100644
--- a/package/python-modbus-tk/python-modbus-tk.hash
+++ b/package/python-modbus-tk/python-modbus-tk.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/modbus-tk/json
-md5  03873278a842535c9069cc0dd352f520  modbus_tk-1.1.4.tar.gz
-sha256  68977766eb10469973dd56a2814bd981b85dd180b79043248786d88008f2593b  modbus_tk-1.1.4.tar.gz
+md5  f05db07a592a17ae8009df905591a0ea  modbus_tk-1.1.5.tar.gz
+sha256  77a72a3ad9d5d32a1d2110bc04216680ca57d7522912e0f271e9bf5f1b701b36  modbus_tk-1.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
 sha256  aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
index 2e15354b04..8edf824f66 100644
--- a/package/python-modbus-tk/python-modbus-tk.mk
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MODBUS_TK_VERSION = 1.1.4
+PYTHON_MODBUS_TK_VERSION = 1.1.5
 PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
-PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/78/40/9ae5c428b1867bfccd3c184dcf18cfef04e3d9c5b9dc22b8e9eb8d480651
+PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/53/28/bdfb29ce9bec76015bf3d3ad6103324a0575843ee4b20663c53cc389c227
 PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
 PYTHON_MODBUS_TK_LICENSE = LGPL-2.1+
 PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
