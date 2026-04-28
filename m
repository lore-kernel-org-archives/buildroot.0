Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14464FF886F
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFADD61083;
	Tue, 28 Apr 2026 17:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUR7yWgZvJVF; Tue, 28 Apr 2026 17:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BDE0610AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777397274;
	bh=AlMILRC4VzNaHQNol1XOEiKgsL0cqBE3ghjX5PWqSc4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZKtwp01JHp2w5SnPfLe9xCOmHO27CsdB7p8np7XF7GvawD+H46zepZdxSgaJfCPPs
	 sTxxTESr80IEUIYatlRYk2u3S2rgscE9G4DLZ6h5tHAx2l+ayf1Em+bdvavtZr67xR
	 IvG8ZSQXpwrYRxNXNJkBYVNWXbadDz1JRysLkJJmZ/vFt4gNj+WQMPjxrZ1xXOF5qI
	 Bli7cS5cGA00/tI4zq8lct4AOsml3ShIKeCTPEQdxeInglR5U6SQ3jETKbLlzrXZte
	 87fMI9454+T0AElnM5qnzmbA5igTZmFyNkXBu0+NWCeGc5xB1EPXrLiCCk7craOLdB
	 bB0/J9ufLzHhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BDE0610AB;
	Tue, 28 Apr 2026 17:27:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A3A51B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BFDB61083
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pT_-nTnG5mJ for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:27:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f43; helo=mail-qv1-xf43.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B00C610B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B00C610B5
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B00C610B5
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:27:51 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id
 6a1803df08f44-8a210c813f8so74986316d6.0
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777397270; x=1778002070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PICTDaXRnPmFoVtETJulnjZMc38w9qM7OCgrVz/xAgc=;
 b=IepUoga0Lp1YHl+Q4/CagYRX+IxQXSLoGCS+QS1xuqQqMiDiIYxnoGBPtO+IFYrPt1
 /hHjHTv7bcpaNfXeZMjrqR2OHiL/bJZxKjKmMIHH8jTjq1834PaxhdKAj3SG+mB/GdgG
 MHvPTVxL2lFF9M3m30M+iT86eH9fE7xUxNNpm7JLwuaRfUEfvmECt0APVqs9GK5KeCUQ
 8g1BGAtknB5hMTz7pRSFgHp8TglqVvPpV2PN3ZWO37SsZZLXZyKMj4HesVtM6IPQzUCF
 V/6eHSbVbLDpQzgO6FF1zdK2pQ4tMLihCLGosUg00Xcq9ZOHRxm7fq3yxn5q9lMZE6jx
 AegA==
X-Gm-Message-State: AOJu0YxKPISzmw6EiTQdFWImeHuOieN2oYi0FJEwDXiOIUU3wkhRvAFU
 aVYcfzIAfok/JUzOdId9/Qg7NPp5AtqWzmkQI5tAdznvIewB21Dh0P0J14KYEkClhqypmFeo
X-Gm-Gg: AeBDievBnpa1cxC0OVpVswbWjw3fZzmNI0hi0dJkFs6mZ/zXTR1D4zoA+/l3omjPN9i
 PMe/PZqR1/dUndz0OlMLeKfYGSgd8II7uOytLiaCGh7we4BWHUC6Ar2czlHl73RZS9kcoQO7Ztd
 z9w7chW35mNQlzlSxhQ1yskemLwN2ypmqMgFrTJwZHmndD/wGGuvQx4EvOy/oJcUHQsRT2AombL
 qV6LR5csrI4smMyTrdGw+zw/Ca/pwbwrYBdL+KwTiZ+/C7FzPNiuZqFJh4n92KzScFc1apqyHTk
 GGLhtLrviMmeg0/X6Kt4+bggteNZjls2Qqwl1+tOAuG53w7sGzKIMBdg9b818JWM/YdVQhnzsi5
 AnRWXYvbqoQMIKisU+B0AaKX5Ptk52nAI3iF8tbKBD3VUrI5/xQslK+G5cHLvli85qGkaq/PA+3
 Nwhwe0Y5/d4cXSE8qzJt2QfgnhL8sAjjkNa/t67wNzhhphnvRWmfS4lbYqQdRUAIrzKKV123YLv
 q/9fP0337vUXpQdE8J1
X-Received: by 2002:a05:6214:5d0e:b0:8a4:db54:b3a4 with SMTP id
 6a1803df08f44-8b3edcf11c1mr6479326d6.7.1777397269999; 
 Tue, 28 Apr 2026 10:27:49 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b3e2956a8bsm25447036d6.31.2026.04.28.10.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:27:49 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:27:43 -0400
Message-ID: <20260428172743.2840-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777397270; x=1778002070; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PICTDaXRnPmFoVtETJulnjZMc38w9qM7OCgrVz/xAgc=;
 b=IJna1DhxpmiXJLrNxChCoYdLAW377YWC/zePkAbN5w4hNNTUR96DOyzkk5A4nw9uqb
 T0fKQQRZLMvhgnySgSbB7mUdUKhzvVeFyLS082BL74GACX0Kr3yACaFCOG+GgJvqicq+
 I9GHSXYVfmcF76ADYxraDC9xvtRi7mIHbsKFkC8YH5aSTiQXxRALD6i0YLSYy4BaBnCG
 oqyUAsFCzYB8ZpQLCCf7glcI6n+R3QzQ85y4RUHXqVGAIfeFnz2zb5joTdMQlgYVvka4
 /kXVuEipkvPI1RS/S9FpsqxrnHm4Qk92gAKBoCkjNG4beZV6o7CkIrhOklR/fa0Q1uEq
 jt8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=IJna1Dhx
Subject: [Buildroot] [PATCH 12/13] package/python-azure-iot-device: new
 package
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
 package/Config.in                              |  2 ++
 package/python-azure-iot-device/Config.in      | 14 ++++++++++++++
 .../python-azure-iot-device.hash               |  3 +++
 .../python-azure-iot-device.mk                 | 18 ++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/python-azure-iot-device/Config.in
 create mode 100644 package/python-azure-iot-device/python-azure-iot-device.hash
 create mode 100644 package/python-azure-iot-device/python-azure-iot-device.mk

diff --git a/package/Config.in b/package/Config.in
index e41224d086..45c8ce7820 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1013,6 +1013,8 @@ menu "External python modules"
 	source "package/python-automat/Config.in"
 	source "package/python-avro/Config.in"
 	source "package/python-azure-core/Config.in"
+	source "package/python-azure-iot-device/Config.in"
+	source "package/python-azure-storage-blob/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
 	source "package/python-base58/Config.in"
diff --git a/package/python-azure-iot-device/Config.in b/package/python-azure-iot-device/Config.in
new file mode 100644
index 0000000000..87f66f5864
--- /dev/null
+++ b/package/python-azure-iot-device/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_AZURE_IOT_DEVICE
+    bool "python-azure-iot-device"
+    select BR2_PACKAGE_PYTHON_DEPRECATION
+    select BR2_PACKAGE_PYTHON_JANUS
+    select BR2_PACKAGE_PYTHON_PAHO_MQTT
+    select BR2_PACKAGE_PYTHON_PYSOCKS
+    select BR2_PACKAGE_PYTHON_REQUESTS
+    select BR2_PACKAGE_PYTHON_REQUESTS_UNIXSOCKET2
+    select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS
+    select BR2_PACKAGE_PYTHON_URLLIB3
+    help
+      Azure IoT Device Python SDK.
+
+      https://github.com/Azure/azure-iot-sdk-python/
\ No newline at end of file
diff --git a/package/python-azure-iot-device/python-azure-iot-device.hash b/package/python-azure-iot-device/python-azure-iot-device.hash
new file mode 100644
index 0000000000..90cc1405de
--- /dev/null
+++ b/package/python-azure-iot-device/python-azure-iot-device.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/azure-iot-device/json
+sha256  b6d48d4932c240025736ace544c4e71bc49a1576ac998ea1de778af82496ffce  azure_iot_device-2.14.0.tar.gz
+sha256  dea9265341829002e2c23a7372393eb2ed6e26085fb623f38a4ba0af833f30a6  LICENSE
\ No newline at end of file
diff --git a/package/python-azure-iot-device/python-azure-iot-device.mk b/package/python-azure-iot-device/python-azure-iot-device.mk
new file mode 100644
index 0000000000..e53d2664c4
--- /dev/null
+++ b/package/python-azure-iot-device/python-azure-iot-device.mk
@@ -0,0 +1,18 @@
+PYTHON_AZURE_IOT_DEVICE_VERSION = 2.14.0
+PYTHON_AZURE_IOT_DEVICE_SOURCE = azure_iot_device-$(PYTHON_AZURE_IOT_DEVICE_VERSION).tar.gz
+PYTHON_AZURE_IOT_DEVICE_SITE = https://files.pythonhosted.org/packages/51/6b/447e9f205ccefc03998931677784d29354e0c6453a7715a662d4109a567b
+PYTHON_AZURE_IOT_DEVICE_SETUP_TYPE = setuptools
+PYTHON_AZURE_IOT_DEVICE_LICENSE = MIT
+PYTHON_AZURE_IOT_DEVICE_LICENSE_FILES = LICENSE
+
+PYTHON_AZURE_IOT_DEVICE_DEPENDENCIES = \
+    python-deprecation \
+    python-janus \
+    python-paho-mqtt \
+    python-pysocks \
+    python-requests \
+    python-requests-unixsocket2 \
+    python-typing-extensions \
+    python-urllib3
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
