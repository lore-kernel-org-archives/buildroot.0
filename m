Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9CDFF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25F661093;
	Tue, 28 Apr 2026 17:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XxhEBjMjYUS; Tue, 28 Apr 2026 17:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8C946077D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777397250;
	bh=H2ZGoCKebQ/hQyFKKT6qaFd2R5RUeON5H+z7TqkB7o8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=P/Pck5Yfuyfbt1QvEVH4WfRrkLClJBmzqRzu+7MXDgZnGWj1BWWG0LxrEJhyA1C/P
	 R47lYr3MFivtHwz6S8jIw2P2NrNbBSKW1QWIQ//mxOstgL2hiAJ0/GOfbf26w6Ci4q
	 b4RSZ+UouboZBwjWO3+LblK3yMqkHSFyNQe0M0svAXt3Wc8oQJ5P4PbbtewgDSBgLO
	 06WIy4rP7d+LqE2jscv1QzZJi3OCstS/1MOWOgBmLqYx7ndPuZszJT1fG/8H9Mqs/0
	 WS+b02PVJOmHFIHHERzyhjIQIIQUpDSXs5u1SWMZ20RNVDmjnyKbmmHcQH2FDLHx35
	 MNvO374pD/TrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8C946077D;
	Tue, 28 Apr 2026 17:27:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD88D1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A377A83C55
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfVBBSU5BFR7 for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f44; helo=mail-qv1-xf44.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A74EB83C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A74EB83C4F
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A74EB83C4F
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:27:28 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id
 6a1803df08f44-8b1f2b7f1bcso889826d6.1
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777397247; x=1778002047;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Kp0WmI436MbGAlj0uycJRiJvxDlpeRxemHADjcl23c=;
 b=FS8xdIirSRvcDvd8YB7hyX8F6F/el9XRCrq5SaMrFRnnQ0l3dQdLvon9kkFm4FapUF
 Tc3tQBMF4+c7CkEYrt6932xDX7TNjdmBE/qnwa5VjeonFG2w6m0LLb+Jhnq3+fvRGboC
 6zcM9/mzkeCvznx/S6Gne1wRaUGfqvss9i7ECBKT2DVJ32SPje9LdGu7GibcM0aRYqTV
 0LDp9agz2B+YXTACMqeyFfAb2JNFi3M/0BNdfWOYv6KpjchzTGHplweHZ43s2VK/eTXr
 XzSBwq7BN6p/KkhXWqQpC4G1L9FozACNYy2+R9lbCEHw/95WrTYDHo0a4RKMZbDkNZCg
 iGyQ==
X-Gm-Message-State: AOJu0YxpsOfXG4PHvCGR9w42xpnZ2lHnE5ct10DpvgbBKg/xlsYgfZiG
 DRuLUrvqt+x7Vo8CkFb7UMMldLxKDfSMKjjE84VFiKT0WRUPBbN5V2FrwMVuT1qULlTilNF4
X-Gm-Gg: AeBDiett3f78Ai9WZLePTVJd06IY3Ao8sw924IcTaRqM8D9UZGCSV9aTY6rk4D5Lqn8
 twfdaNdpGkj4azCOaN2r51yvaP7dsvHtnGlJPbbPAmooi/gAQeJlooW2O3H0Fmw1K1RxOd9+4yN
 OYPFtyOjoy/QHJi/2noyx/wQan/vi2ewLmxOYGIqcdmIcc4ZJmYvJidnX9dxYT8j2a+xnXF+mZc
 f+u+azyN2hLqkX5abMfAKNCL9boQWw+0tG8nx1qmRq2Mm9+zqK5ysrBaGrOyWu+OKd0ZslghFt7
 cp6UdAgfL2JkvpUakE2Wb3uG6X5wcOZgb1ScNzbzrIDu7t9II3mpqJeprnDtZHgsYdb88dPiks4
 5ZLuOEOi2cZjRLK9uhSpYQg5RnF5Pwl4nWrZwSlcmZ8P2DWm6BK+NTv3CSZrLB06fLi7uayC/mc
 4ag5MGqG6VdOocu3Iltbr58Hmgld0p0XXPK0/22svIcirLGZSUoH1vXRV8HHOs1FxL5Ni5tEeK3
 f0t2CnZqSqdwSr78aeA
X-Received: by 2002:a05:6214:b67:b0:8b0:33a2:2520 with SMTP id
 6a1803df08f44-8b3e38cf1d6mr52507396d6.10.1777397246897; 
 Tue, 28 Apr 2026 10:27:26 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b3e28468bcsm24466476d6.18.2026.04.28.10.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:27:26 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:27:07 -0400
Message-ID: <20260428172707.2790-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777397247; x=1778002047; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Kp0WmI436MbGAlj0uycJRiJvxDlpeRxemHADjcl23c=;
 b=SVAeAjJBvTr6P+2Ltoa7jQwsiHyeGfcIP7aoOxY1yDhhsqy5ET48li76pnOgFm9vzn
 rnXDjNfmyFEh+BEqw7lXslrf/AfXjvVerPRSTiqydtn/MgBoc94RdaDAQCmcQxOW7jES
 Ndenw5LmpMFCl+nWsKZ+tR9Px4xxZqCULWOtWtVHY9xM1uHx63jgxFE9H+NRViOZsNQX
 xEIagqwC0l/qrC8ue0h33Ns5plrJes4Ohuki2aQXlFQjEsPPlcHWi6uPTo1dfkA8EeMB
 98G2QJVYUHyqBaXPwk/ao8RRv+HbZy5hhltzcmSQabfUtVgOHpCg/TEDrEbIVlHZwiFL
 rrkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SVAeAjJB
Subject: [Buildroot] [PATCH 10/13] package/python-pytest-runner: new package
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
Cc: Alexandre Ondet <frcomdev@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-pytest-runner/Config.in             |  7 +++++++
 .../python-pytest-runner/python-pytest-runner.hash |  3 +++
 .../python-pytest-runner/python-pytest-runner.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-pytest-runner/Config.in
 create mode 100644 package/python-pytest-runner/python-pytest-runner.hash
 create mode 100644 package/python-pytest-runner/python-pytest-runner.mk

diff --git a/package/Config.in b/package/Config.in
index 3c89a2a480..6513ffc4bb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1367,6 +1367,7 @@ menu "External python modules"
 	source "package/python-pytablewriter/Config.in"
 	source "package/python-pytest/Config.in"
 	source "package/python-pytest-asyncio/Config.in"
+	source "package/python-pytest-runner/Config.in"
 	source "package/python-pytrie/Config.in"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
diff --git a/package/python-pytest-runner/Config.in b/package/python-pytest-runner/Config.in
new file mode 100644
index 0000000000..0a14e35c5d
--- /dev/null
+++ b/package/python-pytest-runner/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYTEST_RUNNER
+	bool "python-pytest-runner"
+	help
+	  Setuptools plugin used when upstream packages rely on pytest-runner for
+	  their setup or test entry points.
+
+	  https://pypi.org/project/pytest-runner/
\ No newline at end of file
diff --git a/package/python-pytest-runner/python-pytest-runner.hash b/package/python-pytest-runner/python-pytest-runner.hash
new file mode 100644
index 0000000000..4bbcf9a9f4
--- /dev/null
+++ b/package/python-pytest-runner/python-pytest-runner.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/pytest-runner/6.0.1/json
+sha256  70d4739585a7008f37bf4933c013fdb327b8878a5a69fcbb3316c88882f0f49b  pytest-runner-6.0.1.tar.gz
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
\ No newline at end of file
diff --git a/package/python-pytest-runner/python-pytest-runner.mk b/package/python-pytest-runner/python-pytest-runner.mk
new file mode 100644
index 0000000000..82b3c8628f
--- /dev/null
+++ b/package/python-pytest-runner/python-pytest-runner.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pytest-runner
+#
+################################################################################
+
+PYTHON_PYTEST_RUNNER_VERSION = 6.0.1
+PYTHON_PYTEST_RUNNER_SOURCE = pytest-runner-$(PYTHON_PYTEST_RUNNER_VERSION).tar.gz
+PYTHON_PYTEST_RUNNER_SITE = https://files.pythonhosted.org/packages/source/p/pytest-runner
+PYTHON_PYTEST_RUNNER_SETUP_TYPE = setuptools
+PYTHON_PYTEST_RUNNER_LICENSE = MIT
+PYTHON_PYTEST_RUNNER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
