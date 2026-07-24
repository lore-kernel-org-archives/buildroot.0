Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAAFC531F9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 06:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6DA881107;
	Fri, 24 Jul 2026 06:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_QecAVnHmXE; Fri, 24 Jul 2026 06:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ED93810CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784875813;
	bh=J8Raqu9PqGaGJP9b6kNaRHNt3kYY5WxmNiRfYnOmoDY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=iARBEbPfU3AXUPZLe2PXoAf2UozmY4/r4b/g8j/YVz92lWR6Sbsr6re6G3Myf/G6j
	 3+xeY9hNqUQ6OY6AZ+g3W/m8XXStKAFu9oXQ9qjHLzLKJnFGhRA0gFts3mMnA1dPaD
	 RKX3jNImFAp3as6sJC/gRmWFMgwyWoVz5+L8ziPvT47IOC0ekiN1AH+t1OO+0XUT5F
	 UAcAnwmRN4bd3t7hh4uniQpKtTj9zzJxMdSQlh4AukgfdvriVL//61EUT3x8qZLWnR
	 Kd/iCaac2+HpgJR43l+dab8hhLbqafvdoulByxbh3Si1xt5MMqFeP+f4xCAhCGRi8d
	 lDpMpkvCARJhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ED93810CF;
	Fri, 24 Jul 2026 06:50:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D01E0429
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2217407CA
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUvOG2810dvo for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 06:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6008407C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6008407C3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6008407C3
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:50:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49548e01d02so542075e9.0
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 23:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784875809; x=1785480609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zLNZnZugygAcxBuRrSGe7zci0nsPTR0G6TuAjUKGor0=;
 b=f1EB9TD/ovA3nOQ0kJEseYAO+HHhsxoNdDicFN3DtV6DVrFKwKtjrA8oyvV1jqq6Kh
 eBm3SVxbw/l3kikGELbVH2TgrzVgHHaS/l9Yz3u06oAIVDL5RlM+nGR0Qi+Sru9eWA53
 NdEc9LBbPgiI0VeyzoEtBqY8lHbONl/IawjkzYMUZM8Rqd0r7fUB03OWJuiJmUirjHd3
 w9469Rgakz3bAwKLRo3WUpzPTZSmhpkeJ4MF7UchXZmWMi+662qUoEoNY1IHfV5nL++c
 WSROGYeUIR745rhQ+W8R+LPIKPeqZkC1so/Eu5g/q0W2jxIuaVHXV3FA7yODgXqkixK+
 /gyQ==
X-Gm-Message-State: AOJu0Yyt+GroD1ENdHaUziqAdliGvCOC8SGqy6l+fQiMZmZ2upbievgi
 rv5ABhafW4gS/YiNFqwHPXylUCycXwOoGaOWJM+kgQ0u8rCAD1j6mNqRgreQV58Q
X-Gm-Gg: AR+sD12O4PmE2Xtu4NiLrboTuwEAVeAGlick3H+gEO9GcesJH10GLHhKSRVMmOwr9TY
 v9HEPDDcIWhXcVmqP/eGDVnCXuGn8AUpjHCU8uYj0LgmeSGgZNirJVvCsC39RbSa5lEAiaa+bbm
 WLSiU0al3UNkCYHvdWgc7rilyswXHqWen7L67X8mMh+iefiE8oYoVC+wskmtbgbFbR9T5DLtGKk
 dxT0jLx24ly0YsN9SLHi2h97kxXpl3b05WoKTyP4n9ISstQPPlpi+rw+00DXj7EPqUVp5a3NFWT
 4y64HDtNHvhNvQUwzSGBTPnGEcLOaJRNpu54DtwLHEZ/rBDvpCZsoN4JQD0Mib/19RBtRoolB/r
 IqXLgPwti/CLhEAJwZyHpR/zWDe5OyK2JtcKK6GBsSaacY8kfYwQsi/aSRrHFlOhNhQkWjEvU/8
 hLR6gILmvhvVq0P7fl9JmL9tqoAPQkieumPELbUu0jrDUXS54qpGdnmg==
X-Received: by 2002:a05:600c:3111:b0:495:44f3:4576 with SMTP id
 5b1f17b1804b1-49573cc2b8bmr64524415e9.7.1784875808475; 
 Thu, 23 Jul 2026 23:50:08 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.94])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c53052sm21166675f8f.18.2026.07.23.23.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 23:50:07 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 09:50:02 +0300
Message-ID: <20260724065004.217411-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784875809; x=1785480609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zLNZnZugygAcxBuRrSGe7zci0nsPTR0G6TuAjUKGor0=;
 b=M+1YNilJJQlUoZ3TGG1f3ipvynr+Z8irmXneOQRXG3wU62pDbG/siigrO52Lg226p2
 z1HR00Vx2CVAL7dFTz89mVYWk3qM2fWm/8viN3CSPqZYd8Hp5Vz/Ab0SAPcTJplmMhK8
 wHZ0VaHHy/mmyLD3f9hao0XwgF9zxTO9tG3AYr9MpN+tZwIqIpEQDn2I4P2G2D3y977/
 9bOUFn5gC4AMIrr7w1JvHmbtGtnNZbtX9h5qSlGtlV1eD08GbLon3vUxPHVbtqSTaKix
 pP1Zha8ZIXLGlSLWthgQ/roRa2LpQ9tXfb/PBqdMcIRPvvs/ZmW5heZI+Z57ZbrW8siL
 IRWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=M+1YNilJ
Subject: [Buildroot] [PATCH v3 1/2] package/python-cramjam: new package
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add cramjam, a python bindings to de/compression algorithms.
It is needed by python-snappy package in order to bump the version.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-cramjam/Config.in           |  8 ++++++++
 package/python-cramjam/python-cramjam.hash |  4 ++++
 package/python-cramjam/python-cramjam.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-cramjam/Config.in
 create mode 100644 package/python-cramjam/python-cramjam.hash
 create mode 100644 package/python-cramjam/python-cramjam.mk

diff --git a/package/Config.in b/package/Config.in
index fc1e57d30d..d4e3c2fe58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1061,6 +1061,7 @@ menu "External python modules"
 	source "package/python-construct/Config.in"
 	source "package/python-contourpy/Config.in"
 	source "package/python-couchdb/Config.in"
+	source "package/python-cramjam/Config.in"
 	source "package/python-crayons/Config.in"
 	source "package/python-crc/Config.in"
 	source "package/python-crc16/Config.in"
diff --git a/package/python-cramjam/Config.in b/package/python-cramjam/Config.in
new file mode 100644
index 0000000000..9485c6a77a
--- /dev/null
+++ b/package/python-cramjam/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CRAMJAM
+	bool "python-cramjam"
+	help
+	  Python bindings to de/compression algorithms in Rust.
+	  Allows for using algorithms such as Snappy, without any
+	  system or other python dependencies.
+
+	  https://pypi.org/project/cramjam
diff --git a/package/python-cramjam/python-cramjam.hash b/package/python-cramjam/python-cramjam.hash
new file mode 100644
index 0000000000..2042bb6281
--- /dev/null
+++ b/package/python-cramjam/python-cramjam.hash
@@ -0,0 +1,4 @@
+# Locally computed sha256 checksums
+sha256  542ea349a7528d88935856d3eb562cd17bff713d7a41eab8d6812d78a3cb00ba  cramjam-2.11.0.tar.gz
+sha256  10892f279948fe9a2dd5f2c559ef78aae1ebf4b5d5825e1eaf68b03787fde402  python-cramjam-2.11.0-cargo6.tar.gz
+sha256  b4f882bfc80d27a3732789bd883a8c1d342e8ffea7f622a71b3dfded834205ff  LICENSE
diff --git a/package/python-cramjam/python-cramjam.mk b/package/python-cramjam/python-cramjam.mk
new file mode 100644
index 0000000000..e1e060bfba
--- /dev/null
+++ b/package/python-cramjam/python-cramjam.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cramjam
+#
+################################################################################
+
+PYTHON_CRAMJAM_VERSION = 2.11.0
+PYTHON_CRAMJAM_SITE = $(call github,milesgranger,cramjam,v$(PYTHON_CRAMJAM_VERSION))
+PYTHON_CRAMJAM_SETUP_TYPE = maturin
+PYTHON_CRAMJAM_LICENSE = MIT
+PYTHON_CRAMJAM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
