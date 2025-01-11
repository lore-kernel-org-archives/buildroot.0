Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D112E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C22776115B;
	Sat, 11 Jan 2025 16:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loqik1QEUW0D; Sat, 11 Jan 2025 16:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB2D461153
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB2D461153;
	Sat, 11 Jan 2025 16:22:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32EA9940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 144176114A
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W24Y6XfEjWZG for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E52A610C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E52A610C0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E52A610C0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:22:19 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-844e39439abso88957839f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736612539; x=1737217339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4BGTuKTyqDJOHNy4Sul6YUqRvXbYjOe+vly6qpB47wo=;
 b=a4qzkiK5u8Yqz5H/+ioDIWV1HCMlLy169w8i7zPPt65iVLr3nSJYVVoN9wqNjlv/ht
 OhQYaT8UsOdfbGt4weDL1WMt0TAsFOd9nGVJktQwVoNeGD8uv7ADB5QzZugdOXtFFFm9
 jgMs6cp5j1LRfxUljYy62+J56EYL7X81e6PsIl9JDsnB2Q++eRqdQO5N/5BbdU+r1z9t
 Xgzczi4KB+YjOtFpTCRjiFVwqjlkUCV1kXVzq44qv55GSChXw4LYUt6IdyLEBsFg5jAw
 qeLdiyToja+krG06OsW+Br91SIB8lJixZMhjKFajo1xBWq0f3R3mDdjChdgnsC1qnGVA
 p7Yw==
X-Gm-Message-State: AOJu0YxswqjHbA+tp3XNr+tZoz5QoN2iwePSIG/tSOXpnHED3J0wNOgg
 mlNog1gEv4I/ehb3uvkJQJDoIME9QspbYzBAQGbNUATvhAuaC3g1/vl95/5E1iQ=
X-Gm-Gg: ASbGncscxuEYuPMjWHeaR1v77ZyLrKBA0r9dTdxDDhSqDFPo9OZnagZ39lZ8vTko2d8
 tHKJN0iB/yEUR39P5QpFFbUtxfnzY2uPdHAY9r/FmKCP3xyy1KG2xHwWM8jU3U2ccdS3xiwaw+C
 798GeJDmFTyko9jBs38KqgVdzGYvBZVUMOQjloT90XhXOy8bcsuAcsANaajQ+WPk3u72HYo9Gkk
 eBhPnXMloMOrJ5LmQZPwmEmiZZH86yku+CiWxvNyzCZwa9PEXFVZGWlK6+EaghzylRHDl7t+8Dy
 d0LnfYazZIrB353jCTpRLS1pzsypzok=
X-Google-Smtp-Source: AGHT+IHyXevsg7jPNlks7bWvNMItE1woAYtDC5P7MPS2iEK2+K/KK3yWAPwFgLH8m9d05bgvDQ3TBg==
X-Received: by 2002:a05:6602:380f:b0:84a:78ff:1247 with SMTP id
 ca18e2360f4ac-84ce00a6d24mr1337815539f.9.1736612538577; 
 Sat, 11 Jan 2025 08:22:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4faee16bsm160477739f.4.2025.01.11.08.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:22:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:22:16 -0700
Message-Id: <20250111162216.2875010-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736612539; x=1737217339; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4BGTuKTyqDJOHNy4Sul6YUqRvXbYjOe+vly6qpB47wo=;
 b=bXgryiRy00qKxLm/qhvedVYJQ899uqThJtvTQ72qL1pzI3alVCCve/NU1q4uPxYKLu
 P/44zGiz2hWOW6xvsSzk2U5coVVYnnYDkQjNAzKWteXkVLfoz0LbCcDqOgL8RR3sv1WI
 SRfCPq9xgnM1L0Abfsy9+aGoKF6MzQNK290QZ1+amcpbe59wDan7oYgci72PNo97rZpQ
 3C7VVD7OLyKSShsq8K8IpYF8Dl4hoS4in9R+HxVCQywKR7sD9SE6IiSnbe654GWaGuOW
 6NDbui+POCd2t8EyZMWUHhHknbt8Vk1HMz5QYUj4Dl6yjldjH6suWYpdWGMm0QmIjSpB
 xong==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bXgryiRy
Subject: [Buildroot] [PATCH 1/1] package/python-pytablewriter: bump to
 version 1.2.1
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

License hash changed due to year update:
https://github.com/thombashi/pytablewriter/commit/66d421e4750e7eb65b8f2bb8c9481c342d84c892

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytablewriter/python-pytablewriter.hash | 6 +++---
 package/python-pytablewriter/python-pytablewriter.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index d4432ee121..82185edb37 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablewriter/json
-md5  4e3d421d026f30fadec4ac1670e524ee  pytablewriter-1.2.0.tar.gz
-sha256  0204a4bb684a22140d640f2599f09e137bcdc18b3dd49426f4a555016e246b46  pytablewriter-1.2.0.tar.gz
+md5  2522e6719d47f315684800d8631cfb9f  pytablewriter-1.2.1.tar.gz
+sha256  7bd0f4f397e070e3b8a34edcf1b9257ccbb18305493d8350a5dbc9957fced959  pytablewriter-1.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
+sha256  130a35b917df1951aefbf366120491d5124045a87ded123f20ded21521f4e3a2  LICENSE
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index d8bc3615dd..6c22d750a0 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 1.2.0
+PYTHON_PYTABLEWRITER_VERSION = 1.2.1
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/cc/a9/76aa4430d32ae10b23e4347006dc4c67a3e2a00621e4bb38a60c1a77f15e
+PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/f6/a1/617730f290f04d347103ab40bf67d317df6691b14746f6e1ea039fb57062
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
+PYTHON_PYTABLEWRITER_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
