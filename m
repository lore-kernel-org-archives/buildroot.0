Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F398FF886F
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D96D06107F;
	Tue, 28 Apr 2026 17:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbJsRbwD31v6; Tue, 28 Apr 2026 17:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDD8E61080
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777396768;
	bh=z8f1tMMhYDTXKq/g0yASjFktHr4kzdhOwVxkV93GqaA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=aaaYGvAh8IvOYKsVxGIh+PIBND7iuwG+RjW4FJbtOEd/WgksVIjXu/VGw6ikfebqS
	 iUOHtWyh1OzJ/iCGQuVv/uaZXkm6UY+r+dFEopTGp5L2oPttOy+oE6i1efcjik0yJg
	 zUlxdKqOLo/XHtmfd877qailaNMCJS35aMNpwTmNVQAbuLu33G6WxNWcfKvRWS3N4Q
	 Baj1cK+wif+pcWr/a9dAUV3VDv7Gs5oxQmbYO9FLpuiKzDRxqzVCyzdJy/SvnZSmvK
	 VVx0NBjK3Hrjn2/sOHOGvbSHP9ZpA1a1O9cqSX4kUM2QxDKrey6K5Q+5kRsLJ2P4vW
	 FX2D1TzosKfjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDD8E61080;
	Tue, 28 Apr 2026 17:19:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B38DE1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A590283B6B
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4J06Lz097eJ for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:19:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e41; helo=mail-vs1-xe41.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBC5883C05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBC5883C05
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBC5883C05
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:19:25 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id
 ada2fe7eead31-605a27fa8d5so6351305137.1
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777396764; x=1778001564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hnkaXVg/icksstLMMdoAG8m+e4+z0sUTqpTDiYroDnM=;
 b=mtHfld1sW/lTxM4u24rJaWcYrjymMjY7uh8s5j0oaQvGOdKnqCMRgsnmYK2Xq70ATO
 kqLEDRg2lR5G70gu9ZOaRM7V3p4hXf/iCWPpCKb1Lx0dTRzFIe+AFZ/sF1TUWh48EcoK
 DdmVosGQirBTg9IZYgSNaK5HQXHaxMHSk+SYrGlkfUC6sVCMtk3QV6H185KNuOMzQ0Ev
 /6YAZdUKXejdI6Yi5XqA5CAMzeh/eaQ3hcQh989hrSlR8w4RZt6OZ9Cppn3rAGr1WwSH
 8RsG9VOLpymWKPpy9g6bOceKtx5kr2G78AoKuxsDvNh3ps0oFf5UPm+t06FnqUlQkG3+
 6frg==
X-Gm-Message-State: AOJu0YxcztC1563TTQgeAE4wn2xcFvSfHp0HYJfn91dN86LR/9uoWn4a
 9eozLykcNoMOB7icecdDH7p2eJLHKx6YAGutiUIBCw9YK7bnEQoiCAJP+KTVgSCQ6/Nx5UHX
X-Gm-Gg: AeBDietLJJfL4IY9OQ3RW3jqxuvJVNPU+7KRUeAPTDw8I+8txnQM4vXUA5N5GRPp4NC
 qmD+XK6qawpQ8Ucv98aG9FV84zGhUa86z68BX58g3e2X1GWwyxHxqE8wDcoIz335DtYWAUSUiHF
 nHItW5POSpVJKkOEvQXPPlxvo1M7KCQgPhnfNNL3bpp+QQRKUSsH79IL1LhfsMvLpff40LNtcNK
 IsV4MIO7jRkko6w1OsS4X2wH+TGjw6OWCgVf2zbi+jotck8rVajha1LteZ8qyIv2bV1DteXYeCZ
 necB2nws2kSQhppTHCKpP68PYNE0nhYsfI9FresU6sxv55XHPWk/SfIzlz/3SiVd3rcHlT81ZRw
 uQCI4nhkdRlMDTj9ckYjnSMZMllrmRoD73irnu4h+jd4u5V4/q/TYiTLRRIkkb/sHrdJtqquQI7
 38gguyR+4aJfvfT7X7ec0DKyQznjYddQ==
X-Received: by 2002:a05:6102:950:b0:607:7991:8edd with SMTP id
 ada2fe7eead31-6280a8c5705mr2274185137.19.1777396764331; 
 Tue, 28 Apr 2026 10:19:24 -0700 (PDT)
Received: from precialexwin ([76.65.67.233]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-627f8032e9esm1607774137.12.2026.04.28.10.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:19:24 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:19:03 -0400
Message-ID: <20260428171903.2621-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777396764; x=1778001564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hnkaXVg/icksstLMMdoAG8m+e4+z0sUTqpTDiYroDnM=;
 b=InnwQQG6cFwx2+z57PcGoO0lmuvlEBf4FygOk0rpV0XOyXmEHFsqyPPlxK5l+0t2RW
 zS4J9zn/gdj+N9E92SBFejtMxkcwN+AZIkNv/XJ4sXoQjuCNe5xhlLQ0GCbULXhCxMjj
 QjvWCwuD1LKHQ+yES10t/j0ARaMWzmwaa5Ot6ZnbmnzzjKHG5p4ROlYuFHlyRD+DcybL
 kGYxJpj6s41qdXRxVRDgCGK9Ip4W/M8Br54V+lKGvNalAvmS7gAQliIJ/GKDU+CtBny7
 hkueD5Xwm1jcJ2Qsv/TACzTdLMInYxCRLH+H7p9MXl4qU1hXRx0Uxf0TKhcGh0i1Lwgp
 D1hQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=InnwQQG6
Subject: [Buildroot] [PATCH 04/13] package/python-hpfeeds: new package
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
 package/Config.in                          |  1 +
 package/python-hpfeeds/Config.in           |  6 ++++++
 package/python-hpfeeds/python-hpfeeds.hash |  3 +++
 package/python-hpfeeds/python-hpfeeds.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-hpfeeds/Config.in
 create mode 100644 package/python-hpfeeds/python-hpfeeds.hash
 create mode 100644 package/python-hpfeeds/python-hpfeeds.mk

diff --git a/package/Config.in b/package/Config.in
index c6f809b31d..1409370bfa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1153,6 +1153,7 @@ menu "External python modules"
 	source "package/python-hiredis/Config.in"
 	source "package/python-hkdf/Config.in"
 	source "package/python-hpack/Config.in"
+	source "package/python-hpfeeds/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httpcore/Config.in"
 	source "package/python-httplib2/Config.in"
diff --git a/package/python-hpfeeds/Config.in b/package/python-hpfeeds/Config.in
new file mode 100644
index 0000000000..e08ac6e98e
--- /dev/null
+++ b/package/python-hpfeeds/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_HPFEEDS
+	bool "python-hpfeeds"
+	help
+	  Python client library for the hpfeeds lightweight publish-subscribe protocol.
+
+	  https://pypi.org/project/hpfeeds/
\ No newline at end of file
diff --git a/package/python-hpfeeds/python-hpfeeds.hash b/package/python-hpfeeds/python-hpfeeds.hash
new file mode 100644
index 0000000000..493aae730e
--- /dev/null
+++ b/package/python-hpfeeds/python-hpfeeds.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/hpfeeds/3.1.0/json
+sha256  e23337d6c911e494493f7026ad2d08e7815d7d0bdad1f45f19905097c5fd55ee  hpfeeds-3.1.0.tar.gz
+sha256  c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271  LICENSE
\ No newline at end of file
diff --git a/package/python-hpfeeds/python-hpfeeds.mk b/package/python-hpfeeds/python-hpfeeds.mk
new file mode 100644
index 0000000000..6f745b0917
--- /dev/null
+++ b/package/python-hpfeeds/python-hpfeeds.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-hpfeeds
+#
+################################################################################
+
+PYTHON_HPFEEDS_VERSION = 3.1.0
+PYTHON_HPFEEDS_SOURCE = hpfeeds-$(PYTHON_HPFEEDS_VERSION).tar.gz
+PYTHON_HPFEEDS_SITE = https://files.pythonhosted.org/packages/source/h/hpfeeds
+PYTHON_HPFEEDS_SETUP_TYPE = setuptools
+PYTHON_HPFEEDS_LICENSE = MIT
+PYTHON_HPFEEDS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
