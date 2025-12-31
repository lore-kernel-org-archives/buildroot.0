Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD52EE57C5
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 20:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F1F780B7E;
	Wed, 31 Dec 2025 20:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89JvXdgEmLvb; Wed, 31 Dec 2025 20:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B84180AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767212796;
	bh=oBJSP+3iAKQVGboCADKTViYXE/ZuwU9YzZPqOLW8IA4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cgpW9AxVfcKS3+KE5HsJo+9b9zhCwwGWwxqETIY/F10LbA495VdxXvBG+QbqrPSou
	 BYTYmy84sacaVmqAdbPQhPnL7tuyQ2ge6IQ14To/QdLWX6OFNI5b1fd4TZrWzqe6I3
	 QNndSg9n5/n61m//evRw71Zjs6RUPb74N4CKpc9HZ6LFmokOSjvd+VF54cHnGtO7t0
	 Gu2m0MfzJWSnHjJoB++eIZL69e/FjwEqQNMa8ITu/EgG1pWbOA3yCGPkNqtpBJXWwg
	 SpQJM4zaG+y+wS9wQchbdTLttXxz+obs0A4vdm6bh80Gc849WF/hl1szCWGI0sxf4n
	 +9I6c7MNCUvlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B84180AAD;
	Wed, 31 Dec 2025 20:26:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56BEC249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53EB5403A6
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8s9R9cKUpeZ3 for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 20:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 709924024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 709924024E
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 709924024E
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:26:33 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-3ec5df386acso7889653fac.1
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 12:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767212792; x=1767817592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YHFV2GAU9KVoe6O3Nzzzk7g/ePNBk+NVx1vvImmjBE=;
 b=dktHPuQpgpAc92ZhcW60RZtBIaLTMkOffIhDTaMB1e9geJxdDkcA3YUl7ML/eiLBqv
 29j8NtfZy5ylhyppZY3vNKQuQbKhBx5NHBIDe4AFAdS8h8Cv7xKvR2Nz9sdLuYbYEFw/
 dUlbAynL7jaG/FjuSUgiwXAePmpAeLwE+yk0s4TIAmYLLgs5tsLwD/KPayzqv9+q0Qgb
 vo0Jy/dT5U4zrFN7dEsmvlHpKB6MJ1VBKPTPkngHxQCZ7KenYMi+REjwVYNrweSDbMSE
 wdKBirgPyaBStQwxuYewbfaqjb79uHqqDhOydxhCdxAIKD6okFNuKlx47F210wAOY7JJ
 kHLA==
X-Gm-Message-State: AOJu0Yw1W9N1CHipNzdI0ioEPPCkHYLREbv4zfaSSERycdIGemG6BQDx
 d/YkbVJsejUT1hWsl08/Ut3MRwEfv3JPoUTAM1X2HUS6FvsxfqWxh9pn9sbhxSgimiw=
X-Gm-Gg: AY/fxX7LHt4PWXqQpSFOskwQqU28IeefI2+hbdzSMoEpd5jQB+wpyynSKvgcAQJEvj8
 hd/rBN1SkPO8Z2j1WbA63nb/NubQkWe6fEsQT30Wj6I1Loj+cFKEvWSecFzmMqkusQxlMle7aUU
 0p5bPqinKG0B9neKuj4+emNShgts/BPFGvH8V9mAtDROYYD7h5jIVt+O0IJ40OBxtdsOBMAKDIF
 m5Jx28yUkkdKvxDXWR5rADxfzxKyVht6buw7mdKSZ5RA1MmHZYR3s29GekirvswBXsrqFrcgIYC
 rkIs04Bp7LeaZiF9v80OqCoBmIPqF0f4Mv90xukeeIhK6QqTqG9Hu1XkMw2phrz5p5msqV9ethK
 LIkKamj1tOTjYHGvRJuUNYfXV+9DmJAXtY5sL6M6ZHIxKlLO9Rgl3dNCCFkwm5mz8V2Z3h/9tA2
 rDlRvtkVUBd61R1+m283aAuCt71scCGMsTJuaaFlD4gSWNysgUexqvczNCQYEvVs/VyKbEX+NKB
 RUG4ttqxFXFGA6f2NIOtBsIVzSInKxiQe2c6iRaes8r/g0KOdrP2yA=
X-Google-Smtp-Source: AGHT+IFnqK1hkTFDoyvRtBVln8qHriVo0KES6cy/vQeSnzePsMV61UaD05rKoNOE/umqkDi2m4O1mA==
X-Received: by 2002:a05:6871:3607:b0:3f5:4172:17 with SMTP id
 586e51a60fabf-3fda5481b05mr21583526fac.56.1767212791881; 
 Wed, 31 Dec 2025 12:26:31 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa8d366esm22801504fac.5.2025.12.31.12.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 12:26:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 13:26:28 -0700
Message-ID: <20251231202628.4099815-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767212792; x=1767817592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3YHFV2GAU9KVoe6O3Nzzzk7g/ePNBk+NVx1vvImmjBE=;
 b=NI1oNl24MqHQrdFkkIQRaJHUMdliuMPQAtPDW2uPtgKxDXmzXxUg2pYOvZppSgwv4w
 X9ejUEZQTPxAgrZbKTcQxU2G2Y6/NJGZ54LbxvB2E8DqZEkFk/3BWjmnI+vd0gxJe4fJ
 3iYRWFxsLphQ869JvRHfEjgY2eZuGT8puOEF+X/5EX5G8yv8SkpgZFA/pUO01g1T3fQV
 50yzhZtCQA5U+tfhtZ5V71I69YF0SYVS98dtZHz4u9QdqqJ7nLtFBx1/S/cHjZjmk3XH
 2ElgzVkVOEG5IZvtg2bQaG55SwUbQRFXDRkS0MRa6DEW03XxS4BwZXwazWZKyNHqjUlM
 JaFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NI1oNl24
Subject: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to version
 0.19.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 4 ++--
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index db511b90fa..5f7c758070 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel-yaml/json
-md5  ebfbf2a54d9a5b768bc849f4b2c43efc  ruamel.yaml-0.18.16.tar.gz
-sha256  a6e587512f3c998b2225d68aa1f35111c29fad14aed561a26e73fab729ec5e5a  ruamel.yaml-0.18.16.tar.gz
+md5  6966b2f273bdb08cf679f521fa0da4c2  ruamel_yaml-0.19.0.tar.gz
+sha256  ff19233e1eb3e9301e7a3d437847713e361a80faace167639327efbe8c0e5f95  ruamel_yaml-0.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0ce9ad6a9d4f0829296a72c77d07795dd67f42751e2922be56c051d39ae1c011  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index aaabee7be5..b1f7a3e039 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.18.16
-PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/9f/c7/ee630b29e04a672ecfc9b63227c87fd7a37eb67c1bf30fe95376437f897c
+PYTHON_RUAMEL_YAML_VERSION = 0.19.0
+PYTHON_RUAMEL_YAML_SOURCE = ruamel_yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/0c/5d/8a1de57b5a11245c61c906d422cd1e66b6778e134a1c68823a451be5759c
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
