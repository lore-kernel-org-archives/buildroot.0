Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80F4C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 19:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 671E182951;
	Wed, 27 Jul 2022 19:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 671E182951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z_nYKqU1-DCl; Wed, 27 Jul 2022 19:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68960823C6;
	Wed, 27 Jul 2022 19:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68960823C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD2B1BF3C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB12A823C0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB12A823C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87ELzhiu9pLB for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 19:29:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D06B9823C6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D06B9823C6
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 19:29:55 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h9so25877964wrm.0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDc54Qo2umevl8QGadivmSMqjH6X93Tbb+7sGFRNZj4=;
 b=1U+bcaU2i+F/f2KPVsObMfl+LJS9R2FJo0vuMys2FPuZhEUjelivvGON7uIwa7goWZ
 xjS8xfR2rIs7NK9fIPtNxwxzMcGwHCuizvrdV4xZGs5Nt+eibEZDCp2KRjpvgRTJatv1
 KgS34MiCalk+A6zId+Kpjz/7LvjLeiPHm7oVkq4/J9zSDEt/nPLDY4GiDhlDmlebMdG9
 YQBGuoVWA+347m/YgJERMz0K0eB0x/NGQK/zHAyH3L+mQLN+SPCrky8RHU5aB4yg+p3c
 HRVP+VTw+8/bBasYHwAuKnIPqzNzTtwbFJ9eVM7BR6V4COVepAGeqeZdax8tdzCh3wGt
 /wvw==
X-Gm-Message-State: AJIora9TjikUvyef89aMRxFs6VI8lHB7GzcPlLUwI2o3VvOxcMmYgJpt
 sNMDNu71rK332lF9fKFM6ok+KrFLPR1crw==
X-Google-Smtp-Source: AGRyM1thVV7/cQ6HZiTRr0IdYLM+wnIgnJiqyp2bLrn3jtrueE4JKNJfbCwDnBNz4hwLUNbGDqufHg==
X-Received: by 2002:a05:6000:70d:b0:21e:6113:d6d1 with SMTP id
 bs13-20020a056000070d00b0021e6113d6d1mr14500421wrb.709.1658950193630; 
 Wed, 27 Jul 2022 12:29:53 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adfea10000000b0021eed2414c9sm605554wrm.40.2022.07.27.12.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 12:29:53 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 21:29:45 +0200
Message-Id: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDc54Qo2umevl8QGadivmSMqjH6X93Tbb+7sGFRNZj4=;
 b=EQdKNZ5MwSb/Sba/uct9mPW242wMBv7s11YacyFWVcK9Z/dLuHjbYAVLXQIdFwfA31
 lHVrb4Rtx+ustsWMSIrgJxHn1iR8Q0b0sNY2Gq7+zWDLTl6rNJQ2HTjh2OtRQUwTbH/c
 DW9roNn9y8GMnG0eyf/agNT81e84etfCHi5myE3mg7QXgQAdPs08zhtcXyTh216wtEmU
 3NgefqS+plV0AinLnUtSPQJa+9mVjp6OW+TMLFsyZgV8JtAULCBl8RqAvDxSKe+MwO5s
 ngysbmgH1EEWGfxYmPC98vfV1XehgxrTwTW9DuF0a8XLY5cOoG/YBoyEjG5PDY6BJK1N
 D5nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EQdKNZ5M
Subject: [Buildroot] [PATCH v5 1/4] package/python-gast: new host-only
 package
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jmfriedt@femto-st.fr,
 gwen@trabucayre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Generated with scanpypi and converted to host.

It is a dependency of python-beniget and python-pythran.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-gast/python-gast.hash |  5 +++++
 package/python-gast/python-gast.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-gast/python-gast.hash
 create mode 100644 package/python-gast/python-gast.mk

diff --git a/package/python-gast/python-gast.hash b/package/python-gast/python-gast.hash
new file mode 100644
index 0000000000..f16d001a6a
--- /dev/null
+++ b/package/python-gast/python-gast.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gast/json
+md5  fdff900805e03e9dd76d377eb4cbaed7  gast-0.5.3.tar.gz
+sha256  cfbea25820e653af9c7d1807f659ce0a0a9c64f2439421a7bba4f0983f532dea  gast-0.5.3.tar.gz
+# Locally computed sha256 checksums
+sha256  6a04bbabd9b48bea6bf7c0bd3f3a062e1476b3c403a746448fd69b0d902e148f  LICENSE
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
new file mode 100644
index 0000000000..e02e87fb23
--- /dev/null
+++ b/package/python-gast/python-gast.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gast
+#
+################################################################################
+
+PYTHON_GAST_VERSION = 0.5.3
+PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
+PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/48/a3/0bd844c54ae8141642088b7ae09dd38fec2ec7faa9b7d25bb6a23c1f266f
+PYTHON_GAST_SETUP_TYPE = setuptools
+PYTHON_GAST_LICENSE = BSD-3-Clause
+PYTHON_GAST_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
