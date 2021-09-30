Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAFBC433FE
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:02:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DA28615E5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DA28615E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 614574253E;
	Thu, 30 Sep 2021 07:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EF1H31Vfs-h6; Thu, 30 Sep 2021 07:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDA942566;
	Thu, 30 Sep 2021 07:02:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF9D21BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC8A0402D6
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3QV3j7YxiuB for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9259C400FD
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:09 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c73-20020a1c9a4c000000b0030d040bb895so3516514wme.2
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cALlQxeUfldJKeUpB2AnRq9tPAwkHY4jVtIWqBhoVao=;
 b=ctZ4OOXKdnryIgsAb7GDkFE96+MNelDv9tyYPhWNN5ZMi2V17UTUPm6DUEyjooLESF
 EFFftrX9u4jHonCYwvls142rFrwG9GSqXE3SK1DqWw7ib8cd/J8azOYuHcbjYd5NrcbU
 V5J5pA60sOI4F/PdfFbJrYCXhjWwaodAs1zBqBM6KMt2DL9BoChKXYAZ0wm6P2CfCCCy
 6bO78Efdu+FLQfxhgxaiOyD9/MLs9eJKUWxmjjVpk+/Aw7ig7wi052JSRsnhxPOk/7Aj
 Wm59vjKm5JPlasXWu83pzSXvZoiTKw17kUMT4MU3WhWVrg27DjTUz+ekXk0D+tiGw3Wp
 zGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cALlQxeUfldJKeUpB2AnRq9tPAwkHY4jVtIWqBhoVao=;
 b=71oX+vWzcIc3ZaFqk4UYhkOOcYk3+veQ9VX25m72mz90Ym/wEvObBYPaYMbJPY5VSU
 BUpY9PokcursfYFR9+DHi0YJRQmXeDLl9kld/qS13F47yz8hWD/7H5TZ+jSCzPWy6u7C
 Qzqbg4QQdsUjhjA9VVAfhKbQ2sl/hIK3SAEi61VQ82/PxkhDkYJY2lj4uYEahrsPjxTW
 qT5Vie/IAi+EoHXQlOXB9wXyM8mY/myuexOHT+hi4Tq9rz3q2jpDDIGEmrbh85kni/gZ
 HBlGA3MN3vt9SP187jrvLaUha2MXOV2COQqmDeVPIq41QdQo/CRYioe4IC6LtOtPyLRy
 833g==
X-Gm-Message-State: AOAM531NEWwZop28vJcwZX4G9wffkVPqgQ18udpmC4fH24oCVtxHF0a2
 RErkqNfxeEYBdsH4l4uUOVq5homC6oM=
X-Google-Smtp-Source: ABdhPJx1TzeTAAFVxPIGOWY6VZrTgTliWrJiKYU4u4V8IG/KSV59U3Ck0VMTKRUSS+yPLVA7CK3cNw==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr3658579wmb.158.1632985267526; 
 Thu, 30 Sep 2021 00:01:07 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:07 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:44 +0300
Message-Id: <20210930070051.40361-8-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-sortedcontainers: bump to
 version 2.4.0
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

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-sortedcontainers/python-sortedcontainers.hash | 4 ++--
 package/python-sortedcontainers/python-sortedcontainers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sortedcontainers/python-sortedcontainers.hash b/package/python-sortedcontainers/python-sortedcontainers.hash
index d97687dd19..31463f5e4b 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.hash
+++ b/package/python-sortedcontainers/python-sortedcontainers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sortedcontainers/json
-md5  660260df593a3769c7b5854f13d574c0  sortedcontainers-2.3.0.tar.gz
-sha256  59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1  sortedcontainers-2.3.0.tar.gz
+md5  50eeb6cb739568b590b28f9a3f445c78  sortedcontainers-2.4.0.tar.gz
+sha256  25caa5a06cc30b6b83d11423433f65d1f9d76c4c6a0c90e3379eaa43b9bfdb88  sortedcontainers-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1db7cae7fce6452e2e608e401a0f953e0133e4c2d75db69fb8ae851d2086f5b6  LICENSE
diff --git a/package/python-sortedcontainers/python-sortedcontainers.mk b/package/python-sortedcontainers/python-sortedcontainers.mk
index 31cab76fd7..51df517264 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.mk
+++ b/package/python-sortedcontainers/python-sortedcontainers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SORTEDCONTAINERS_VERSION = 2.3.0
+PYTHON_SORTEDCONTAINERS_VERSION = 2.4.0
 PYTHON_SORTEDCONTAINERS_SOURCE = sortedcontainers-$(PYTHON_SORTEDCONTAINERS_VERSION).tar.gz
-PYTHON_SORTEDCONTAINERS_SITE = https://files.pythonhosted.org/packages/14/10/6a9481890bae97da9edd6e737c9c3dec6aea3fc2fa53b0934037b35c89ea
+PYTHON_SORTEDCONTAINERS_SITE = https://files.pythonhosted.org/packages/e8/c4/ba2f8066cceb6f23394729afe52f3bf7adec04bf9ed2c820b39e19299111
 PYTHON_SORTEDCONTAINERS_SETUP_TYPE = setuptools
 PYTHON_SORTEDCONTAINERS_LICENSE = Apache-2.0
 PYTHON_SORTEDCONTAINERS_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
