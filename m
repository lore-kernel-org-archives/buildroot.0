Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7198C624B4
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 08:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6845E60BC2;
	Sat, 25 Nov 2023 08:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6845E60BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kw077f0GyhqO; Sat, 25 Nov 2023 08:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9FF760B5D;
	Sat, 25 Nov 2023 08:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9FF760B5D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57C9E1BF3D2
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 08:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 308458221A
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 08:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 308458221A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xzjAlJJvQ5bi for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 08:15:12 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3266E82218
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 08:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3266E82218
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-35c7cacb0d8so2247555ab.0
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 00:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700900110; x=1701504910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HrhmxgPNPRVwJ+8s+lx39IdQc71uTkc05iWkmWXe5fg=;
 b=qrnLCm5zqGkcVdS1Ll3zlb9Ikbv+uNxqle+ZcY175qCKZWnp2mMrJWFTEjuRTbdTT8
 JYUkZUwQUdhUzBIyLKZfe7EdrcKWMngrxKHxCcQz77ap0kZfOh14B85NIPHBkSdAWELB
 sH3sphaQrQbmpccNOhyfufj05Lv/Bu2Wr9bSot6jKx/2ELlvkHe2X42aqnW/jg4EmMT5
 hFtWjkdziUoPw1KMum3Vz+V+zRB+MBykPfEnkgnuXiUvMf8X85e7u68GqmE/XPuWEORt
 UM3zXviAlfXLnl2wYBzDw9cRJtsdXX/P8ZVq3P+Et8FQJnpqunKDU5J76+iSyyRa6Owy
 r9BQ==
X-Gm-Message-State: AOJu0Ywh9h4O8sp6zkErhlODg7ZfsLHwaI7z6hb348m8BfxOd+chIMej
 mNHijd0OX9o5IwiW56RNqcShtvH4wlU=
X-Google-Smtp-Source: AGHT+IF4kVPzMeBYwUJw9Blu8xatUk2pvNFi2sEKbitYBg85G9TwYx4jyPjKqKd02vMrjcLkJj4q+g==
X-Received: by 2002:a05:6e02:20eb:b0:35c:7b32:2425 with SMTP id
 q11-20020a056e0220eb00b0035c7b322425mr3216713ilv.8.1700900110185; 
 Sat, 25 Nov 2023 00:15:10 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 h14-20020a92c26e000000b0035129b9c61bsm1518509ild.45.2023.11.25.00.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 00:15:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 01:15:08 -0700
Message-Id: <20231125081508.885295-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700900110; x=1701504910; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HrhmxgPNPRVwJ+8s+lx39IdQc71uTkc05iWkmWXe5fg=;
 b=BPah4ZTf7tJEfRV7IuEkQQW1vKHmhg3/I6dQKV02C7xZWzYqg1KQ1PyMHLD+nKjy1V
 eI6PWccl1HxTuZxJPYFyAxO/5qRfZD5utbnOU5sYzi6vMmEA2DfyN2OeN0UnoZX+R2p6
 Tc4IVK/0iEndNsztzTDJ2fgpcWwRW1DW/hsq7k1Mz4IYBuB7DeSZGeTQfHWPETaEkQJJ
 kLfIpJ6xDfCeEpRAhJ1RFiWWpXtUardc9+0/zTUzoJADVbWJDv9lefHOa+8hSAXh91L7
 xft/vW99Jt27YF/XZBroo5hXJECHHxklukZdth28j4LGn0+er0HVqfatmr3q/EEUCL/7
 DxCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BPah4ZTf
Subject: [Buildroot] [PATCH 1/1] package/python-pydyf: bump to version 0.8.0
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
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index 4e52429dfe..b2dac04516 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  52a772655c1398e7b60d22e930e13094  pydyf-0.7.0.tar.gz
-sha256  a5a88cb06e5beb64a1ef2147ee879b0e5139f5fdb827fda2fcf14a018c7b11e6  pydyf-0.7.0.tar.gz
+md5  a3650927d9a84da1dc0aa1d268f21376  pydyf-0.8.0.tar.gz
+sha256  b22b1ef016141b54941ad66ed4e036a7bdff39c0b360993b283875c3f854dd9a  pydyf-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index d941a00a9f..e9b7d229c7 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.7.0
+PYTHON_PYDYF_VERSION = 0.8.0
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/28/ec/b6b327f2a249a83022501b2f57844ca05b2b26e0cadf28648ea5c0f72aa6
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/18/dc/b607bbc7c15327c5d5ec25681a3707c847906134925d21a26ec6e7416a4a
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
