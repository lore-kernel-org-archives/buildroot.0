Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55401C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE54461023;
	Thu,  3 Nov 2022 18:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE54461023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id butrZisfsupQ; Thu,  3 Nov 2022 18:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D3D961015;
	Thu,  3 Nov 2022 18:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D3D961015
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8381BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0759440B63
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0759440B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDHJ07zdIpBU for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:48:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9FCE403B7
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9FCE403B7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:48:25 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id e189so2134240iof.1
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=APdf02B79kG3n6AdyHKpp6QqO5TLqsR3AHh8vOftHqY=;
 b=4XmxWVUXGiWX8z05HwYf6LChEL1rLpOr3tjHyE3niGqb65d7/dOehfjqkBxdBaQCtc
 ZVsHiraYCGvCSR3m8F5CLSgm6/iz1T91HnizoM2tCyh5oRSYbz5kLba9iKJk669cSRFk
 D6FgZRTZbZ1BkCShxigEbFPQn3yUoQX3UZTV67U1qkR4NMypXJpSAH0NZCeFT4wtHFk8
 NjQkV1AP+w6tbFfqPP/hbjl32TM20R5opkFpRiALp5CMn91oGorZ9L2cvViYWO/ejxrl
 DoTAs9p4JDzTjU7q1ibZ6A4EWoMDaB8SOwMp2kKgHDr6j1x3eJKGELqwJ0kFl/9BS7wJ
 fH5Q==
X-Gm-Message-State: ACrzQf0cmyI4p+DuJp90a4CwV9GblwMmIOBnO0d3hUD3Yu7YjVHp2pg7
 UKt0/96+CvPZhKMZ9MLCTpIuj8Jw5674s7Vu
X-Google-Smtp-Source: AMsMyM6hDZmoTXhkkHrjc9eSfod6Wny5Z2wTBvGRzacckPd9yvNWVG/x0ssdeQq5VsavyBzsA4tLiQ==
X-Received: by 2002:a05:6638:1185:b0:375:2fbd:cdbe with SMTP id
 f5-20020a056638118500b003752fbdcdbemr19484576jas.289.1667501304542; 
 Thu, 03 Nov 2022 11:48:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o9-20020a6b5a09000000b006bcd45fe42bsm601611iob.29.2022.11.03.11.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:48:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:48:22 -0600
Message-Id: <20221103184822.2296340-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=APdf02B79kG3n6AdyHKpp6QqO5TLqsR3AHh8vOftHqY=;
 b=DyhiwPL7ei2ljbjzraN7rPwyNx6achv6XL5E0dMX/YtFn3QRYbJrA7vDjE43ih+nqx
 jEFsO/hxcMNi2v4teX3WMBOSdQuaPYnr5epPQJPZiSQMPv0QGjSFcy95YzcRVYt91kCI
 M9mE5bdizJa+GPxEArw2DofxyZmQpEwXJd7zo71u9xjpoh57s3SBEUkcobwhnPbH/DXH
 oNNzeJs1waLdS+haFwka38+QNb9TMRZmQhV11s992g2JCdxDBcwa39okyVAjCb0DWpWf
 Clsy+ld5Tp/KpsGNFv5ZujQ8Go4kJJ/d2eh2MI6uOdY0Zz1LrjpLyWBKD+fv1nMcnX1r
 t79w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DyhiwPL7
Subject: [Buildroot] [PATCH 1/1] package/python-regex: bump to version
 2022.10.31
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
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index b0f5bb05da..11a5765e41 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  cd206281327b4c087bb20bf93cee4ab9  regex-2021.4.4.tar.gz
-sha256  52ba3d3f9b942c49d7e4bc105bb28551c44065f139a65062ab7912bef10c9afb  regex-2021.4.4.tar.gz
+md5  a85ced10be8bfe76fed4f30c42d32d5c  regex-2022.10.31.tar.gz
+sha256  a3a98921da9a1bf8457aeee6a551948a83601689e5ecdd736894ea9bbec77e83  regex-2022.10.31.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index bb8fdf3e48..81bd460ecc 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2021.4.4
+PYTHON_REGEX_VERSION = 2022.10.31
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/27/b5/92d404279fd5f4f0a17235211bb0f5ae7a0d9afb7f439086ec247441ed28
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
