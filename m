Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81A4C25B4F
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 16:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 792C860B37;
	Tue,  7 May 2024 16:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPLcYiXb3hwe; Tue,  7 May 2024 16:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62E3D60B03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62E3D60B03;
	Tue,  7 May 2024 16:29:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 083B01BF362
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5ECE8233B
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ks5fI49P-WrH for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 16:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 710298129E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 710298129E
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 710298129E
 for <buildroot@buildroot.org>; Tue,  7 May 2024 16:29:45 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6f03a7118edso1727860a34.0
 for <buildroot@buildroot.org>; Tue, 07 May 2024 09:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715099384; x=1715704184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KTYGPBbmzYtuxt5y1ygEudsGjtS34ZJwMJTFD1imXTg=;
 b=kCZCiwaBdoxslGVFncHaCsst8Ldxb9DFjeCLtv0dsjXm512H+9DTwTmPl5AwkcCAR2
 xoXSiUZitFNNq5pWpkxp63g2/XkGvThonsPq7DphqekwCRuAb9biecHRXk4iXBomE7+2
 yZZ8vNHjiQc2y+Y5S+vXp542UoO+aSqVp0jPmkBSfYqJRcDVzLF3sxOGh2SwYa+oJf/7
 xPq0qZvuHoTtGpvTKLKZ+8FpWaMrTgAHci28QzEHrvTegZrc8S8/8ZV/cmOhs/HYJYpE
 54gqqLaqDzlOJQAqU3M+jAuA8sJZht3DsTz+NjuojxzOhiQ+wsf/edLAZZSPBglS9I61
 5xKw==
X-Gm-Message-State: AOJu0YzXIO36BZH/tnOu/BT1uULZe2Hvt9WRYZx873VEGN/07/qKnAuI
 shFmR8i2D63YbpLMGo8DwsO2lp4arVgdbhPFAurBqqQZrZGb/KwhLrQZQmTH
X-Google-Smtp-Source: AGHT+IHDWjkvO9pQUeebCf1Y3LT1M67vJa5Wub3V8Pkf4/XBRmup3cKW0Hg79S+UkL3PDg6y5Re0mQ==
X-Received: by 2002:a05:6830:1e72:b0:6f0:5203:4fb5 with SMTP id
 m18-20020a0568301e7200b006f052034fb5mr6630440otr.20.1715099383897; 
 Tue, 07 May 2024 09:29:43 -0700 (PDT)
Received: from localhost.localdomain ([47.210.125.56])
 by smtp.gmail.com with ESMTPSA id
 bb9-20020a056830470900b006ee512d78f2sm2568149otb.26.2024.05.07.09.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 09:29:43 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 May 2024 11:29:35 -0500
Message-Id: <20240507162936.18729-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240428024210.11950-1-vfazio@gmail.com>
References: <20240428024210.11950-1-vfazio@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715099384; x=1715704184; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KTYGPBbmzYtuxt5y1ygEudsGjtS34ZJwMJTFD1imXTg=;
 b=gx1UkvJl1rH//SCgL4aluw85nvyREXmhLsZI7OxRRssweZbD0QlecaP9532Ee3Fbgg
 9Y7Pc8XuWImqMwiYSxD5JI6Lf1UVezceQkjF3MT2p+GuTGdXVqz7+0fRxdprOe4zykuZ
 Ug8DbEPdjxb4+6PF8fTdDTepZDExJAV7U6KUlWArlWyXT2Jcpj1wETGTa1oAuKwzNayu
 OQHRYJsOW4VpMBABOTMMiwuN9DILj7nojrGeGGERZPteGhT/r04YlwgtZgSTAS3rzxzC
 yeF9p6v6t5VtpSSeC3x30oqKYcZtrMKIYx41IsLLeXqZwakcd+JUEzLbsXVaXr42oiBA
 Fh7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gx1UkvJl
Subject: [Buildroot] [PATCH 1/2] packge/pkg-python: drop custom environment
 variables
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Many moons ago, in the dark ages of Python, cross compiles were largely
unsupported. In these before-times, a patchset used by PtxDist [0] [1]
was adapted to help make cross compiles work.

The patchset did a number of things but mainly:
 1) used a build-machine compatible python interpreter for certain
    stages of the target Python build process
 2) made adjustments to certain files to make decisions based on values
    set in environment variables instead of the path of the executing
    Python interpreter.

Since the path of the interpreter that was build machine compatible was
outside of the target build directory, the code that made assumptions
about the location of headers and library paths being relative to the
interpreter path needed to be adjusted, hence them being driven via
environment variables.

The patchset worked by replacing the executable path to be the sysroot
which included the python headers and libraries.

A number of issues regarding cross compilation [2] [3] [4] have since
been closed since the introduction of this patchset and cross builds
became much better supported starting in Python v3.3.1.

New logic primarily uses the _PYTHON_PROJECT_BASE env variable [5] [6].

When set properly, this drives a few things:
  * flags a cross compile environment
  * sysconfig.is_python_build = True which triggers:
    * altered paths for finding the Makefile and config.h
    * altered sysconfig.get_config_var("srcdir")

When migrating to Python 3.4, PtxDist reworked their patchset to use
the standard environment variables for their cross compiles [7].

The distutils module was a primary consumer of the custom variables from
the previous patchset, however, that module is deprecated and packages
cannot target it as of 09de823c.

Package builds and unit tests seem to work without using these variables
being set, implying they can likely be dropped. Packages that still use
distutils should be updated to reflect its removal in 3.12.

Once these custom variables are removed, the following Python3 patches
which leverage them can be dropped:
  0004-Adjust-library-header-paths-for-cross-compilation
  0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros

[0]: https://gitlab.vahanus.net/ptxdist/ptxdist/-/commit/eef994411c20653cde95b35266000e3a8754e3b3
[1]: https://gitlab.vahanus.net/ptxdist/ptxdist/-/commit/6c79cb5ac373b1cccf531e8be3ed1b9722ed1622
[2]: https://github.com/python/cpython/issues/48004
[3]: https://github.com/python/cpython/issues/58538
[4]: https://github.com/python/cpython/issues/59689
[5]: https://github.com/python/cpython/commit/7e6c2e2cc49fa109662d3f04f4c3553596d31937
[6]: https://github.com/python/cpython/commit/9731330d6f4d63d6d57c8e99c8d11ef1def42858
[7]: https://gitlab.vahanus.net/ptxdist/ptxdist/-/commit/638a024500c214c1d8283bce8cec864fb95deacf

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 package/pkg-python.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 839f728e2f..88fadecd54 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -41,10 +41,7 @@ PKG_PYTHON_ENV = \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
 	PYTHONPATH="$(PYTHON3_PATH)" \
-	PYTHONNOUSERSITE=1 \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
+	PYTHONNOUSERSITE=1
 
 # Host python packages
 HOST_PKG_PYTHON_ENV = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
