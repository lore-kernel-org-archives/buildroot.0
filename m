Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B526D116F1
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 11:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7098081300;
	Mon,  1 Dec 2025 11:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uCU7SmOwWfj; Mon,  1 Dec 2025 11:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 091BA812C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 091BA812C4;
	Mon,  1 Dec 2025 11:26:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8F40D3
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 11:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6A8A404A6
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 11:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjyLhkfXi1vB for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 11:26:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.43;
 helo=mail-wr1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD041404A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD041404A0
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD041404A0
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 11:26:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-42e2e2eccd2so904240f8f.1
 for <buildroot@buildroot.org>; Mon, 01 Dec 2025 03:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764588387; x=1765193187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VtHVZOked9touycw3HaHBpOWYnBhs4NdtFIRGZygu5M=;
 b=kHfmWDEPkzJzPYGEYYYL2Ep5GNPuvMMQPHh/Xa87RiiaQ7s0Nxd3lVDXQPXlq82G/m
 DHJpOEeOW5Xsz9I2eZ1eADiLr+eTsX5A3toBkCkssjh9Vu/0CvNn6/mahaH9uJpGaXT1
 WME/l83OhpNW/Srqz7qrZ76Wac77jaZk7S5UbwCR2dK73Rl8YHzCTP+qqqvUm6N/T9JM
 sBu9a2CY+cJJEWYkGIDE92KoCbW06NgOBjFW63oCzCLgiEd/QgIHKdxdor34HTocLEsx
 S2tyRYSLS9OlNSadlGws4M74XTEe5Y/Ne/wzkCFGsGMeP1FN7JvJ+F8tTaHq+brVN8TS
 EP8w==
X-Gm-Message-State: AOJu0Yzcj1TfnzBiOFehwN1LVjIYvsJFxHrq0OHrRYLTFwF5DuyuCKCB
 3zpR9xXxek/14c56meba/ibWcOjnWbh4yGwhuJW6MVTKg3qrIYClqn5/
X-Gm-Gg: ASbGncsWi53kTpaFXxNxWtyE5PY8qjFuqfpeeQ+ENagV1O8XxSm1Pk/E715SqIytGh1
 MnI4zCG3LVzT9tfII8lmBtvNgfr0pNJgjbdtt9j96reLUduNj351rpvmFhnKFbZVqfairrb6j4s
 lSNKkMqmgQCY+kpjgVAHqO52/EJhWnw6Xqx9hxKwiZsAEabuy64Axvz5gQEJw3wxYm6AwhiY+iU
 wy5rohpdbSCo2eJk42evpGnQSxWh2F0XjfedgAYxF04ur5KpwMr3BpfRaSRnZi/NLaeMLawuSX/
 MQH3dnlT70Ufoa/0zJQ7Slhx2px3puk3YWygYKk+tnyoRsPfiIgCa+mnuOWDiXyjBxHUrUM5Tb/
 uD6D0EPHeVgDBlN7WzVpnnnMVXQcCWol3al0eNLAVBuiUQp6OPYQuI1vqM8obq7ICkPzeUl2/9j
 rdXC29WKIKKt+GBbuYtto2I+sGA1CWBp2KasYJCxxRACMyqUA4Gw==
X-Google-Smtp-Source: AGHT+IFl/q96YnkWuuA/+dYGpVuPYNbl8YkOdve2GTDDf/CHc42aXX6p3mDZuKUJ8nlD1g2Kq8+pZQ==
X-Received: by 2002:a5d:5f54:0:b0:42b:4267:83e3 with SMTP id
 ffacd0b85a97d-42cc1cd9050mr40000131f8f.5.1764588386440; 
 Mon, 01 Dec 2025 03:26:26 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c30b8sm25887967f8f.7.2025.12.01.03.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 03:26:26 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: peter@korsgaard.com
Cc: buildroot@buildroot.org, christian@aperture.us, thomas.devoogdt@barco.com,
 thomas@devoogdt.com
Date: Mon,  1 Dec 2025 12:26:20 +0100
Message-ID: <20251201112621.242137-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <877bv7ii70.fsf@dell.be.48ers.dk>
References: <877bv7ii70.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 1/2] package/yq: add new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Version 4.45.2 was selected as newer versions require Go 1.24 [1],
which is not yet available in Buildroot 2025.02.x.

[1] https://github.com/mikefarah/yq/commit/5bc2cd03da9139160db70901ffb8002bf6e242d5

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2:
 - Added DEVELOPERS entry
 - Fixed Go version mention to 2025.02.x
---
 DEVELOPERS           |  1 +
 package/Config.in    |  1 +
 package/yq/Config.in | 10 ++++++++++
 package/yq/yq.hash   |  3 +++
 package/yq/yq.mk     | 13 +++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/yq/Config.in
 create mode 100644 package/yq/yq.hash
 create mode 100644 package/yq/yq.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d4e6335f25..5083db7889 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3183,6 +3183,7 @@ F:	package/vuejs-router/
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
 F:	package/libsoup3/
+F:	package/yq/
 
 N:	Thomas Huth <th.huth+br@posteo.eu>
 F:	package/ascii-invaders/
diff --git a/package/Config.in b/package/Config.in
index 83414b3e0b..e809491575 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -203,6 +203,7 @@ menu "Development tools"
 	source "package/tree/Config.in"
 	source "package/unifdef/Config.in"
 	source "package/yasm/Config.in"
+	source "package/yq/Config.in"
 endmenu
 
 menu "Filesystem and flash utilities"
diff --git a/package/yq/Config.in b/package/yq/Config.in
new file mode 100644
index 0000000000..d85b3e5601
--- /dev/null
+++ b/package/yq/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_YQ
+	bool "yq"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  A lightweight and portable command-line YAML, JSON, INI
+	  and XML processor, yq uses jq (a popular JSON processor)
+	  like syntax.
+
+	  https://mikefarah.gitbook.io/yq/
diff --git a/package/yq/yq.hash b/package/yq/yq.hash
new file mode 100644
index 0000000000..bc9dccad81
--- /dev/null
+++ b/package/yq/yq.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  39296b55e33962ef838cd8a1bc0e9850e775de4cc3843bf15f099324069d2632  yq-4.45.2-go2.tar.gz
+sha256  697db34dabb21562fe84487a2ccd031fbd45382b89c2cbdec8ef31682c486040  LICENSE
diff --git a/package/yq/yq.mk b/package/yq/yq.mk
new file mode 100644
index 0000000000..b42b8e652c
--- /dev/null
+++ b/package/yq/yq.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# yq
+#
+################################################################################
+
+YQ_VERSION = 4.45.2
+YQ_SITE = $(call github,mikefarah,yq,v$(YQ_VERSION))
+YQ_LICENSE = MIT
+YQ_LICENSE_FILES = LICENSE
+YQ_GOMOD = github.com/mikefarah/yq/v4
+
+$(eval $(golang-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
