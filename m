Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA911C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 998C060FD7
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 998C060FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A4D80F81;
	Mon, 27 Sep 2021 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dsUGLR2lJ3qy; Mon, 27 Sep 2021 19:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA35980F4C;
	Mon, 27 Sep 2021 19:52:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE61F1BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEE3280F77
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zs5FZW9ZYv7V for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB0E980F4C
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id z2so1465150wmc.3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4RirxC+zYNIfSP7HQKt1D2AEc5/Kj4ESIz3FzPunZ3k=;
 b=J62sdWvuBDA+agve8SRkEHwv5LJx2DVfNyHw7A2mJR10DhzSFfh5Xo6NZOm5iqFCfs
 5YPs0PVm9HUuOeBkjra0Ys+0qgIXWp2UGXcEmnzNwPf1PpngkwJLXcM3rXnCTK8v2x2Q
 B2hfSW2N3dvPjWqCasRO0q0EjEVZgv0hhkGANqKPT592QD9VxiW8fDprspNMvPJNYCoi
 Me1iD2GQgISmZwlg9HgjbMu7n5kLDREO60faWnZfP0V4FfkzcW9Nx1EnH9IbacSDNK+F
 RzEgJrGqovA2U5NUpnIW0MkBTCI7GAwHMH+p7genDP1p58QCPv/KWc0qxTBFi5X6lHhO
 8pFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RirxC+zYNIfSP7HQKt1D2AEc5/Kj4ESIz3FzPunZ3k=;
 b=IyeZknjujqmXTEG22abj9MPcqlKaERa74FimY7TtPTuWKu2d9nDWLgfxar2GdKMIzt
 9tAF/sx0kA+FeAzGfoJ0TYcoi2lh+TjsW6GFcWoqVdhFS95H3/nnTWnTa9Qr0jE/24t/
 unBI56+6pYN4wHcU9N1d9+sNzbFnTR8BUPf1EP4ICdzdiVoZ9+xvF+QsSQKkfEks/jeF
 jjcnGobAhbI7M22yCl2wFw0ieOH+3Pc+CszhY9E9M/jd3n+eRaCkwygrPi5LYtCovBd4
 p6KlBahfLXQNbeYOt9mibxHIfacN9sIK42Xv4jraMGFDn4WcwZBSUAOxsQnybPZEVQw0
 /RwA==
X-Gm-Message-State: AOAM5316fPuQZzYIOeSvYgjr7P75oJ5HVmskgLVOVTKEKlyvJ1999UGq
 VcMx5EQ1gZvHBy6+o3d1WIUBfkB3dqI=
X-Google-Smtp-Source: ABdhPJyhPcDpFMY2st7jwQ3T7HJGUOhf3VZLlSIJMSPChPTsedjAZsaadikC7klRt0gZN4+E6906nQ==
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr852605wms.135.1632772308969; 
 Mon, 27 Sep 2021 12:51:48 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:48 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:29 +0300
Message-Id: <20210927195136.549542-5-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cached-property: bump to
 version 1.5.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-cached-property/python-cached-property.hash | 6 +++---
 package/python-cached-property/python-cached-property.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cached-property/python-cached-property.hash b/package/python-cached-property/python-cached-property.hash
index cfe34ca1df..835e9e0200 100644
--- a/package/python-cached-property/python-cached-property.hash
+++ b/package/python-cached-property/python-cached-property.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cached-property/json
-md5	4b6f3cd429da5f487f4ebf3242bb991f  cached-property-1.5.1.tar.gz
-sha256	9217a59f14a5682da7c4b8829deadbfc194ac22e9908ccf7c8820234e80a1504  cached-property-1.5.1.tar.gz
+md5  3451c63f8733ea0756ca1dd2b0c04bb8  cached-property-1.5.2.tar.gz
+sha256  9fa5755838eecbb2d234c3aa390bd80fbd3ac6b6869109bfc1b499f7bd89a130  cached-property-1.5.2.tar.gz
 # Locally computed sha256 checksums
-sha256	ba4756c8039b25b66e3c456cc5bf635aa528cf459b97ee1499d06684ccd89b9a  LICENSE
+sha256  ba4756c8039b25b66e3c456cc5bf635aa528cf459b97ee1499d06684ccd89b9a  LICENSE
diff --git a/package/python-cached-property/python-cached-property.mk b/package/python-cached-property/python-cached-property.mk
index f83a1f18f4..9e1b3f8aff 100644
--- a/package/python-cached-property/python-cached-property.mk
+++ b/package/python-cached-property/python-cached-property.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHED_PROPERTY_VERSION = 1.5.1
+PYTHON_CACHED_PROPERTY_VERSION = 1.5.2
 PYTHON_CACHED_PROPERTY_SOURCE = cached-property-$(PYTHON_CACHED_PROPERTY_VERSION).tar.gz
-PYTHON_CACHED_PROPERTY_SITE = https://files.pythonhosted.org/packages/57/8e/0698e10350a57d46b3bcfe8eff1d4181642fd1724073336079cb13c5cf7f
+PYTHON_CACHED_PROPERTY_SITE = https://files.pythonhosted.org/packages/61/2c/d21c1c23c2895c091fa7a91a54b6872098fea913526932d21902088a7c41
 PYTHON_CACHED_PROPERTY_SETUP_TYPE = setuptools
 PYTHON_CACHED_PROPERTY_LICENSE = BSD-3-Clause
 PYTHON_CACHED_PROPERTY_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
