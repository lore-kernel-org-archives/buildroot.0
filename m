Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29F9FC6160
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 17:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92A2140545;
	Sat,  3 Jan 2026 17:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWc6xnZti75m; Sat,  3 Jan 2026 17:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B7C240538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767462940;
	bh=q3QCZNM62E9fghFl9Y4r2jCxsBxegpNY04zNNB/wCy8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=e/ApfSoMebYOtc4teOWFZLv8JXZBwxYyArsXArA1ljue1M2zo7uzlaV9XhDw11YkU
	 5PyVYtftX51rwx9+ti0kREw6EooyoR4ZF8Spio13FH3vOKU4SwaZAkhfq4DgnioqWh
	 2pTllaEHmB4p5I3MXj7hmEFagdN6F/nFidkUWc08DoOGbdafbxkiFZXh5AKXaqUVKP
	 TesZCq9WtktCIFLqt63RoHv93SbipRo2c/Gvh3HQa9quErXodT4QDe9fJo3iipgRHj
	 jwduAduv6xp1qjWiP/KUBPi6QIZmQfILTlAuJrT7QjDCzp5vVDDUcusgcYGrTw1RFK
	 z9EiRYqrAaVuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B7C240538;
	Sat,  3 Jan 2026 17:55:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FE0D249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 17:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5342E4033C
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 17:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fK3NnCnnDjjP for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 17:55:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 589E5401CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 589E5401CE
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 589E5401CE
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 17:55:37 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7c6da42fbd4so7178879a34.1
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 09:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767462936; x=1768067736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8fUc4pg186l9QlPcvi+PnIFxpruCGATiFUmEhRufcM=;
 b=cmKMSlxx2lk5xsH47J6RuM6FGJP3D6sKZ60aR7xxvr2S/en2eucVw9+88jJq+4GKiE
 bf05s63wFRrkBef2jqqxWmdiW0ZX+VpxWPZY5V5GIwbg11Sy693lLTOH6mjM3C9+Ct/U
 7v0ainj2SfTQGC4xzaxosaKTUc5C9lVDlmla/TNHVLkCywJjEkGjGtfMtvYyDiPwbKBH
 qZnhOGHIVwyfTUYzSHEl4vggjD9BrIUCU+EXb4GahsAzhUWG1/biIYO9d8okDDwXmQVH
 4VW83GhbF7ktiQM44K11+ihsShhTb672JBQ9wA2dQqffwdErPTlTRQgcoSOsxx6xIaZT
 zMCg==
X-Gm-Message-State: AOJu0YyD/icqj7q7ySqqsKcMx0tPPFlF4IAFjjlIqHBAk6+yg8wq90rr
 7UDQw+m4py7tHKpXxnlZJhc5L6sRNKkUzqxP+SNMt2e95fVhoI8jWMRzTQ/fGXT7
X-Gm-Gg: AY/fxX6JkZfmEBRpp2DITjbR3ANh1Zd2H8s0+qzg+Eh55laxEp2Gi78A34XYlm1B/oP
 WLxLZsK+R7aGpxzTCbUocySdi8oGG0Gyc4ZIfcX3fJ/4B8AdbSIAhUbrjvH4NKed1m+sJa4nD/+
 t2KQpGQc3WOnQ0cRPssSNxA7DgP0PbxeIDjBW4dZfFZUqz7aQ/6LKlt0u4e5jS/twilRmaESbgV
 QHBj3+bK6rRw2ZwB19KgijjhRBt/Od2RkaXRfLUdEUg3pq+c6jG/VadxzUlRgpStA5zCp7gCWcW
 ZcSiRoKcYEfSL31IBbwe6KjW5qzLgIgw+ZUASuhyc2/9MYqbLaYJfERjd023bc8v40RRCbkq5AP
 504fcfL1gtAYcS7BUVKbNDuyApcwrI7/ZsV6pO2MnonNNRIKi/dh7g/a0meVtNEQNNn04bn2+6S
 k4wbGolNzW/iif6Jkaqf63MIUTVAZl75YrKMPKTKlUFbCnnDWS9u0XJuCZHjRFHciulqCrZFCRz
 0fVITRLUnsV7aOadGzGX3FRzkPKR8SZXA97nw9aSB3xNGKPQ4K2KMc=
X-Google-Smtp-Source: AGHT+IGD77hy6zwrlCmCpQ1qE2081g5ifJgVvOYmwy0iL482g2X6kL6FXKaQDTjnaQTv1wliZOPVtg==
X-Received: by 2002:a05:6830:4ac4:b0:7c7:6063:8e0f with SMTP id
 46e09a7af769-7cc668eb42emr23125558a34.15.1767462935811; 
 Sat, 03 Jan 2026 09:55:35 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6680e5bfsm33598988a34.31.2026.01.03.09.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 09:55:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 10:55:32 -0700
Message-ID: <20260103175533.1988160-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767462936; x=1768067736; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+8fUc4pg186l9QlPcvi+PnIFxpruCGATiFUmEhRufcM=;
 b=WLo6+8WwRdo2/qgfZbhungGj1O1vx2R5YVfYXwwO3YomV6BCu9FvKHhKjYdIcdr7fI
 djCM7VB9bsOqvhcc4Qs7zmVDDeQXpV/DvuV7ECDEvfxh8EJhtHQD9WnoQJnmpm88SZvc
 onNZFWMgTXDnENTwPsGBLfm66VXzPd8BMt9rwJPJNDclnwNiQkxWznqdEeZCnarAhHaK
 sFfisqOqAuEnbWUiQEl7lC2FXLoMMqPC+aIfelPPCzM0IihindfgMCmtKgyAetvk77NY
 BbHPushDXEv/J7/GWQw1NwwnZhEw5aofVri6CfwhqyrtytgLaJvDO/e/LhKUzI9Wo/HT
 3big==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WLo6+8Ww
Subject: [Buildroot] [PATCH 1/2] package/python-mdit-py-plugins: new package
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
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-mdit-py-plugins/Config.in           |  7 +++++++
 .../python-mdit-py-plugins.hash                    |  5 +++++
 .../python-mdit-py-plugins.mk                      | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-mdit-py-plugins/Config.in
 create mode 100644 package/python-mdit-py-plugins/python-mdit-py-plugins.hash
 create mode 100644 package/python-mdit-py-plugins/python-mdit-py-plugins.mk

diff --git a/package/Config.in b/package/Config.in
index f5f1f6a741..237dc16666 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1223,6 +1223,7 @@ menu "External python modules"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-matplotlib-inline/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
+	source "package/python-mdit-py-plugins/Config.in"
 	source "package/python-mdurl/Config.in"
 	source "package/python-memory-profiler/Config.in"
 	source "package/python-memray/Config.in"
diff --git a/package/python-mdit-py-plugins/Config.in b/package/python-mdit-py-plugins/Config.in
new file mode 100644
index 0000000000..5c0f9311e0
--- /dev/null
+++ b/package/python-mdit-py-plugins/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MDIT_PY_PLUGINS
+	bool "python-mdit-py-plugins"
+	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
+	help
+	  Collection of plugins for markdown-it-py.
+
+	  https://github.com/executablebooks/mdit-py-plugins
diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.hash b/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
new file mode 100644
index 0000000000..4537d908af
--- /dev/null
+++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/mdit-py-plugins/json
+md5  8afddf3e020778a9d4490f43ce469d2a  mdit_py_plugins-0.5.0.tar.gz
+sha256  f4918cb50119f50446560513a8e311d574ff6aaed72606ddae6d35716fe809c6  mdit_py_plugins-0.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.mk b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
new file mode 100644
index 0000000000..dcbec98089
--- /dev/null
+++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mdit-py-plugins
+#
+################################################################################
+
+PYTHON_MDIT_PY_PLUGINS_VERSION = 0.5.0
+PYTHON_MDIT_PY_PLUGINS_SOURCE = mdit_py_plugins-$(PYTHON_MDIT_PY_PLUGINS_VERSION).tar.gz
+PYTHON_MDIT_PY_PLUGINS_SITE = https://files.pythonhosted.org/packages/b2/fd/a756d36c0bfba5f6e39a1cdbdbfdd448dc02692467d83816dff4592a1ebc
+PYTHON_MDIT_PY_PLUGINS_SETUP_TYPE = flit
+PYTHON_MDIT_PY_PLUGINS_LICENSE = MIT
+PYTHON_MDIT_PY_PLUGINS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
