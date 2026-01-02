Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1025EEEC1C
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 00:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D7A080B4E;
	Fri,  2 Jan 2026 00:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S04ZwwuVSSaB; Fri,  2 Jan 2026 00:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56B5680AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767313595;
	bh=vd+58C99GBuJ+F2B138mjnD5T5CxrQlxbBYkXubpDao=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hKV1Q73D1MXGCDGgTFpwdW6BaCc7vOsPqIcEGggxUx2NOOmxIRTxWcb4tpa7u70Jm
	 kBHpGNne3GMgnn7l0DSFFuC5KZHE/piq6lVs15e6ORWqpuhgTbbSx6RK5X7t50pgVH
	 1vTVkBYBpO6Swr08ITkw2tgVLQGBMIz2A/JmYccacUCDvhd8zDN+Dhsx+QV2Nza9YE
	 4oL0uUX+RLboG9681QFXUv/CE2/Nv54cw3tRcejmWzdE9VMDEkcc6dVzPlnlzpxviz
	 NqjaC+sSsdGBYuvlW05klmpbXmk438f/urP8/iUrJvK6aV+VHe2ohXIiYGVpwAsAbN
	 nAYxUF3IgRZ4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56B5680AE3;
	Fri,  2 Jan 2026 00:26:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBCB919D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 00:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2FE040193
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 00:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMTrVFQAMRkO for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 00:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6B284025A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6B284025A
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6B284025A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 00:26:32 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-3f551ad50d1so4197076fac.0
 for <buildroot@buildroot.org>; Thu, 01 Jan 2026 16:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767313591; x=1767918391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C6lYCIzAi5OYqghKI1iOY6r67YgQASkZzQNY8LfGoZE=;
 b=wD3al4mUR0Sou76uMICQGbZvyZoYdRXGNVM9WwwHpOKWPhdw3IhNTXMG+prg9NsDQp
 Y6kHuwG45fm3ITVIej8eWpK3YtfYOLX+T2FtS4RqoA9rFSMo+ZF978mnXaAmkrD7vfh+
 gX0uaFPKLAV/bjy3p41FRpt34G6QgwS+c5eN9lmt3vFw9XXef80gTEG+usX6kQAUpQPh
 C1i93UzxBpWKKwZR++7WT6rXBbhcbE7CzVGC1s2ZUdfk4vlzauNoy6S2ldW5K18sMo9b
 2Wc9Wam/ooEznRjJ27MGMvLQlDSfc1KcPa0WFgWRmz40ezIIMrkCd1hmNwi1GqllAg2v
 aW4Q==
X-Gm-Message-State: AOJu0YxByTpJXVYfWJu6Ow098Q2KDrKFj/a8b0KjxjUoidgyRbORrHpM
 /9Z1gBYGkfmbXgS69dVh4B7AJg8Q7ao9KdfpZ2CqZCt09C8Ev7fRZgnnBAC3ADG9rLs=
X-Gm-Gg: AY/fxX6uoYcgry/cATVGLU7ueKYHxMBAfwLHEmyDvG4RoykWFgHm5DVeYCrfqJ+GQPX
 Wb915XnAS4kmJ8OCzaL+dwnji+LRRo49Ha/clVD7qdjUnlDpaQ1ajLicegschPPYCwbp8glS+gD
 xaIh2WENUlBRwG2XBSI2zww7FieVQrAAKGC2LSeq3s3o9x5vscdhEhMS+0hztOoTgGGnKMP0z0i
 DT2haUZW19njQ79nfINUv+Pgaz8kbMYextFkLz8IsmRTrgU3yCTgjinbDs/QjW9nKhaHUxIX7SF
 /vaMWh7bwI29E6wRahTSIiPrN2Cz2zpAOy3XVgzkDr4eAa4t4ksYgTn+toqqLRSEce6vazMhAuh
 giZzs11gKNr8XvFOuU6kZdKk5EqV4Aw7Myyge4E/cvC/mPhpilNHRDE1vAMIwFH5lM4WAmJjTvn
 ry8da2HIw0sd8yIK/l5VwRJ551sPtTvmAF7UfQvkdyFLUopGnrVJEWUmkuhaJfK29Gk7ob14/Mx
 B6byh3XAi9aAHEO7iTLtz2ynMepRokRUaDRb06LvSIFGWS5zx+6GnM=
X-Google-Smtp-Source: AGHT+IFF9/k84jDSUyDrpFjlf4xzCRqGIXgvc0o7esZGu5kM7MpBSmP5p4QyLjeV4zVU/GmUvdurOg==
X-Received: by 2002:a05:6870:b2c1:b0:3ec:5470:d9df with SMTP id
 586e51a60fabf-3fda58a8a53mr17426593fac.48.1767313591470; 
 Thu, 01 Jan 2026 16:26:31 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaabbf2e6sm25061497fac.17.2026.01.01.16.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jan 2026 16:26:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 17:26:26 -0700
Message-ID: <20260102002626.2690432-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102002626.2690432-1-james.hilliard1@gmail.com>
References: <20260102002626.2690432-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767313591; x=1767918391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6lYCIzAi5OYqghKI1iOY6r67YgQASkZzQNY8LfGoZE=;
 b=er/uhHE4yPw7YjY7Og5hskYr95eNfhLEykh8RWpPGrGquOZMXg5BISA1IfXVThwvY6
 FX03V68FGXgyxcdMpbqLAiJMux1aLUhLP5vMVwRMYF28hxdFqIwnSQ+uq1JfJEVm0veu
 8E6wRxVcKC9+d2XHbpGN5KOILs9c3t2ArVudxBF+VysREbW/zP9iwbJsR9pnaJuxQ1FM
 /qAE9eR9vafsIucGFG7Es4ik/Vr4oApImHnwXDFu0QOC6U4AfYHiDRjyG3ELUxnnZt4r
 QIY6TL6HppqXja9h1Dxs95F+WEzrZDX6UzCWjl8WNQcA4WjILwoRSyoxIXfe75FUjGLz
 w9nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=er/uhHE4
Subject: [Buildroot] [PATCH 2/2] package/python-mypy: bump to version 1.19.1
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

License hash changed due to addition of base64 license which
is BSD-2-Clause:
https://github.com/python/mypy/commit/8f922b3d879f31e4c52c1c643de70e27b5720654

Add new python-librt build/runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mypy/Config.in        | 1 +
 package/python-mypy/python-mypy.hash | 6 +++---
 package/python-mypy/python-mypy.mk   | 8 +++++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/python-mypy/Config.in b/package/python-mypy/Config.in
index 6c58bc4fc1..2ac5bd7c76 100644
--- a/package/python-mypy/Config.in
+++ b/package/python-mypy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MYPY
 	bool "python-mypy"
+	select BR2_PACKAGE_PYTHON_LIBRT # runtime
 	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
index 9f1656ddce..a31cb5dba6 100644
--- a/package/python-mypy/python-mypy.hash
+++ b/package/python-mypy/python-mypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy/json
-md5  9ea329f0a99bb98554683680b988c5ea  mypy-1.18.2.tar.gz
-sha256  06a398102a5f203d7477b2923dda3634c36727fa5c237d8f859ef90c42a9924b  mypy-1.18.2.tar.gz
+md5  a23b930a86aa298a97b72da06ee84084  mypy-1.19.1.tar.gz
+sha256  19d88bb05303fe63f71dd2c6270daca27cb9401c4ca8255fe50d1d920e0eb9ba  mypy-1.19.1.tar.gz
 # Locally computed sha256 checksums
-sha256  de341f6e031d021aab9eb27bdf713cc6fb844dee832ef3bcd4688bff5517220b  LICENSE
+sha256  fdf1cd17f50e1305ed8cfd37467312d27a984648dba622cef70573b5512e4e1b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index ba07ef5b9c..4b02753978 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -4,19 +4,21 @@
 #
 ################################################################################
 
-PYTHON_MYPY_VERSION = 1.18.2
+PYTHON_MYPY_VERSION = 1.19.1
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/c0/77/8f0d0001ffad290cef2f7f216f96c814866248a0b92a722365ed54648e7e
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/f5/db/4efed9504bc01309ab9c2da7e352cc223569f05478012b5d9ece38fd44d2
 PYTHON_MYPY_SETUP_TYPE = setuptools
-PYTHON_MYPY_LICENSE = Apache-2.0, Python-2.0.1
+PYTHON_MYPY_LICENSE = Apache-2.0, BSD-2-Clause, Python-2.0.1
 PYTHON_MYPY_LICENSE_FILES = LICENSE
 PYTHON_MYPY_DEPENDENCIES = \
+	host-python-librt \
 	host-python-mypy-extensions \
 	host-python-pathspec \
 	host-python-types-psutil \
 	host-python-types-setuptools \
 	host-python-typing-extensions
 HOST_PYTHON_MYPY_DEPENDENCIES = \
+	host-python-librt \
 	host-python-mypy-extensions \
 	host-python-pathspec \
 	host-python-types-psutil \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
