Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB37ACF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 19:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CBB24029B;
	Sun, 13 Oct 2024 19:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObJGkg061pWR; Sun, 13 Oct 2024 19:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41F5940185
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41F5940185;
	Sun, 13 Oct 2024 19:50:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE7E1BF3BE
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C0CC60625
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4vgnFXBUr_M for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 19:50:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5644A60610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5644A60610
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5644A60610
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 19:50:27 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-835453714e5so163560939f.0
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 12:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728849026; x=1729453826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DGCHNY45n23ZT/0vITzDemZwJ7uzjpZEdbrp/RaRP0s=;
 b=dPFfGHZMDdUIzgS2T8cmUHnb+ghYX1q7kwSLoSbGg9MJRByLavGubugGfAY0NtU9fm
 dhyjzRPQTxCiIrRZStyVMWE4mdcgBRQcZKIozoQaZU5x3HCooH17wpdfXh2Y+1XfTAp3
 /lUvJKnB2b81GgXJ1ZaTfmkvAz049zFX1bOV4VyO+IkfLq6F2x0wN6q3T4V9aMoB6akT
 hdqxbKxlRL5dXs25SuwEVdbNjRlYXWDhgBox2nPR+NrquQR/qsEQS/aT0qwnXFcUpmOK
 Jlmj0fXIO4/WZtA9E2WPcNQQ8k2OMn62G/v/TyBh8ymkGun5tmNI+Dib8hgBDUExUP3J
 Czow==
X-Gm-Message-State: AOJu0YxuOU5HHRFzK8hS9siyBb43wUpEc3kztn9qwulj5G1hvqRQYLNI
 puwGud8TsvmGKpDot6S2mQk5hgpfvF7I8y4QgsJtkWUqYpkiP64kJsYeOA==
X-Google-Smtp-Source: AGHT+IFlnVXFNZWUSYiwB38KbbvF4aA1TtyCsF5ad4Q/TY+Uu0abNQ/zFGyTI8s1ighOrXn3lbQdMA==
X-Received: by 2002:a05:6602:641d:b0:834:f34d:859 with SMTP id
 ca18e2360f4ac-8379231994dmr863689839f.3.1728849026022; 
 Sun, 13 Oct 2024 12:50:26 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8354ba257besm173154939f.41.2024.10.13.12.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 12:50:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 13:50:23 -0600
Message-Id: <20241013195023.2813141-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728849026; x=1729453826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DGCHNY45n23ZT/0vITzDemZwJ7uzjpZEdbrp/RaRP0s=;
 b=ABwgAWlbv61DaRMEvkfkFZCZ49Snaw4XkRxbVvU6pBdICYvolCGGdMzmDARrh0cXAF
 5dBGTylAnnflXuTCVTs/9eEN1Z57ky4W1N2GW0YV7v/9Yq7kchbqBMI+J7UioDeIURFD
 Munh35HUh4Gxqln2Xafe0ax2Qjt+d4B0XJdUnsHjQtsaFsj+U5t0kfIIiS93uoiE48eU
 OJ1PleN/Rk4wRtS/MSORCSOf/9cdM3mZSm1czfacezlg29lkVVn3ewrnV9ivkZtY/D82
 UvZ9IJwFczdhGvEP+VbBcbsbNVwgcHnynlDSrkZol4ZC0tNEnUDLJxFb91QnnZI0rPwT
 /qPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ABwgAWlb
Subject: [Buildroot] [PATCH 1/1] package/python-xmltodict: bump to version
 0.14.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-xmltodict/python-xmltodict.hash | 4 ++--
 package/python-xmltodict/python-xmltodict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xmltodict/python-xmltodict.hash b/package/python-xmltodict/python-xmltodict.hash
index 48fb5265f6..712f94a08b 100644
--- a/package/python-xmltodict/python-xmltodict.hash
+++ b/package/python-xmltodict/python-xmltodict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xmltodict/json
-md5  1ece0a5bbd494bac414058405606475e  xmltodict-0.13.0.tar.gz
-sha256  341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d037e56  xmltodict-0.13.0.tar.gz
+md5  9b98d656bb655aa7c7561a2ab811c83f  xmltodict-0.14.1.tar.gz
+sha256  338c8431e4fc554517651972d62f06958718f6262b04316917008e8fd677a6b0  xmltodict-0.14.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
index 9201bc1507..b151f28823 100644
--- a/package/python-xmltodict/python-xmltodict.mk
+++ b/package/python-xmltodict/python-xmltodict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XMLTODICT_VERSION = 0.13.0
+PYTHON_XMLTODICT_VERSION = 0.14.1
 PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
-PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/39/0d/40df5be1e684bbaecdb9d1e0e40d5d482465de6b00cbb92b84ee5d243c7f
+PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/98/f7/d29b8cdc9d8d075673be0f800013c1161e2fd4234546a140855a1bcc9eb4
 PYTHON_XMLTODICT_SETUP_TYPE = setuptools
 PYTHON_XMLTODICT_LICENSE = MIT
 PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
