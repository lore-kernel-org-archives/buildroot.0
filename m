Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A20CC83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 23:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D8483AC0;
	Tue, 15 Jul 2025 23:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhykWgYoLZSf; Tue, 15 Jul 2025 23:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB7E81E5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CB7E81E5C;
	Tue, 15 Jul 2025 23:14:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AC34DCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E582840190
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjGez_1RVFMf for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 23:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B80640B78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B80640B78
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B80640B78
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:14:27 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-86efcef9194so244095939f.0
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752621267; x=1753226067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rKYLf9w3tTjoDgsKp3fnY/GjfDncITJNSqnClT6bG3o=;
 b=b880CdvNDufOeESpCy0YsJ1dXd4Gu0hWBxeT/QISOyVZz8157RDfPN6U2yTZQAJsx3
 HhdYyCB+VLhdoVftpHbDSnZJGFta9pa0zQmPG9w5BAZJPsGoa25uzY3W9kbTYVzIlcO5
 Hfu14zUjPEoR+EVhNU9BIuEnjfHgtzLbdsjYOtsUW5od7/wbjoBN3Rbewhaawkl54EnH
 VF7nGCQn69RiSkmwOYhlW/RrqOi+LlPswrt2roSbUW0PfoLdfSCzCNseizkc8HYna9ys
 oUE5AavO+n2KFL/QUd9NJHoAz5ADLMJMSj/ph5iuUYyR/1D73XYm7a9j9yIvZhNGcL9+
 K0lA==
X-Gm-Message-State: AOJu0YxDckpOjiE4TcHzQ5gF5CLGn0g3ZMz1iFkQMWuFeqmOo1/SmcVk
 Y8MrnsYcqJkYrHTrpW2qodkeO0QlZBifPg11Jk4kmHq+iqfi8MLTTY29aGoB3DNccio=
X-Gm-Gg: ASbGnctQsJaTxs//3ezP1EaD6JI4FvpN8w9xq6DAyVFia/xg2i9Y6gQ50tcNazIyW/B
 g4/3oTzazw2vkk2Em9vORvMMf13hFsiUlOsMrvfQH5KoArWkgH4JQCdmHHOklkU2mcALcIbPriq
 yClrkLSu7JRjRAvS4lgoMvC8WyuR+M3xs1EWeUrczld0dal2vhPa7r3zVD9I/CdtsmJYgTNrIkK
 F3LAccZKoAtfmaPPR+fRIhHrnKi9gOQJV8dIeJSICzooZkgGai7ZajxOPEsifK73jU7aGUu5zBt
 g5AHXxvunsew4SyQxjbXqkASpPeeBcfl3GsHUr/fGMSjQRfX3QGXPdSQLik/bgCva2j0+IqWjrA
 SvX5182KISWaX5MvAms7GOE3RuDJMWjSMgziai9weBNXKB6TS+Nr9QD37O/BsNxMu0o4zKPEOPU
 FA1wIGHJk=
X-Google-Smtp-Source: AGHT+IH5fZMfq0Wfk+b2NmbChQecS7pgjNKOH4WJVVY68jGsEw360cK9F6BduNtrm0KHfkNKeeguqQ==
X-Received: by 2002:a05:6e02:218a:b0:3de:2102:f1d8 with SMTP id
 e9e14a558f8ab-3e28249cb49mr11404345ab.18.1752621266702; 
 Tue, 15 Jul 2025 16:14:26 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e27694a34bsm10452285ab.54.2025.07.15.16.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 16:14:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 17:14:22 -0600
Message-Id: <20250715231422.831691-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752621267; x=1753226067; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rKYLf9w3tTjoDgsKp3fnY/GjfDncITJNSqnClT6bG3o=;
 b=Pio0gT96HZOambRbtusgW76rmkRyFwmWkEpBQBXAaxSZczhVIB2UFdz2SYNPugvVBm
 niidUcopoEZxD5rU8esOVxER/rkjtJuGv0X84JZidYuqP/d9V2mPaylZaFQnl+rDvVYc
 HiDtVVbLSenr6MXSPmeyCrlaFcJxL81yUvv9bvoiwO9qCaQ1psw8tqqcFy5pdh8K0g51
 CEa3KOrdCr9D+xeXaPGWU7hHERwuWNZP0msAEOjxlrAfBBfIGYWRhdJ0PcBJWfuOuIiH
 /4e8J9ehH7S1ip6Q4layPrkmMm4shzahZZE61TzCvzwzVspPnZwyTxeZ6Zu4joYhrwN0
 IzwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pio0gT96
Subject: [Buildroot] [PATCH 1/1] package/python-hatch-fancy-pypi-readme:
 bump to version 25.1.0
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
 .../python-hatch-fancy-pypi-readme.hash                       | 4 ++--
 .../python-hatch-fancy-pypi-readme.mk                         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
index e3a6363eb7..e2d22cb287 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatch-fancy-pypi-readme/json
-md5  f5f9e639f066c91f8e623ec6231beae9  hatch_fancy_pypi_readme-24.1.0.tar.gz
-sha256  44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22c265dfaf7c1514b8  hatch_fancy_pypi_readme-24.1.0.tar.gz
+md5  8e1ed2416887685adc1c909ed4fb63cb  hatch_fancy_pypi_readme-25.1.0.tar.gz
+sha256  9c58ed3dff90d51f43414ce37009ad1d5b0f08ffc9fc216998a06380f01c0045  hatch_fancy_pypi_readme-25.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e69ea57f96e599e617f61af3e85bf326b87e833994709fb5e5908a81197730a2  LICENSE.txt
diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
index 0857864965..5e658239b1 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCH_FANCY_PYPI_README_VERSION = 24.1.0
+PYTHON_HATCH_FANCY_PYPI_README_VERSION = 25.1.0
 PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_FANCY_PYPI_README_VERSION).tar.gz
-PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/b4/c2/c9094283a07dd96c5a8f7a5f1910259d40d2e29223b95dd875a6ca13b58f
+PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/f3/0f/aed57c301f339936eb91cb4d8c1e5088a101081854bd3ec18a889df32365
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = hatch
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
