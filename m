Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779F0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:56:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E51B60F5A
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E51B60F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A084068C;
	Sat,  9 Oct 2021 20:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bs3usP2A277; Sat,  9 Oct 2021 20:56:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BAF04057C;
	Sat,  9 Oct 2021 20:56:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA0631BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9B7F6075D
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aaQsIu5AWCur for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1B5A6073A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:33 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id ls18so10156992pjb.3
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzEWu1+D5M0IGUsTAFt35BDNJ3rlIq3CjliXxX4zUKs=;
 b=Dml2ZHGShhYm2g2Qvg0tEQ7T784EF/HbGv6IEhrlnlLOT1IL4FxRV7Ody5fi/6vyUb
 NfLYIFP1mrQkMLe38o3NHjnWX6bpSgiGzgmwgCX/FZUYp/8jWcAAg6yvlqBTdo3RDC2s
 6fcubEv2XSokDcTFxoBrXFqoPquGu/Mkk73pqhiRdDEgW7FjYNZPinIQNfBGLuv6k/IS
 lmv8EMPshbRfSCSWgr9rKHLLPaDD9ba27MxkNVdiDYk2cO4aS6KdJP3O4+hZEWK8ApeI
 puoANp0Wc4OYSdm8QLU5JcuZmLAZTIL43/fPoBqhr6hdjrbjh3n+IobdlIIm63UQnOhd
 867Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzEWu1+D5M0IGUsTAFt35BDNJ3rlIq3CjliXxX4zUKs=;
 b=tcHWn+XIbSpOn99ofPriD/A1+OUG52JHP19GzgEUzwgvXWh3sQUOvhi4S/bwyYXVyw
 86ImpGf+MSP+v/KxpKUWwAAleEjL/T/XI0j4oL2nsnyrAJ2vN1DPSG2FGS6f0xFDyAw9
 xbdgwvktaDueNlGAemOX524g6DFa7BhGBGQzJMaof8QwXn9bKdH/oZckTTdr2NrIgbJI
 XZUaZdKM6U5AA8D6yYHLekrHHvvFQz5k4aBOvLALzFcl/O9yu3TiZFV2ZYGnUxEvx2TU
 d69sNycHNMzoHJpH/ARP+r3YKewaIDq1r/1Em2aUICvkOoCP43l/gP8HplgcxV9qhkcw
 Ls1Q==
X-Gm-Message-State: AOAM532u/Wlja5Yr6lKIPKyiBwhtf4ti9X9gOKWXJMyVIXJ04shx12Sa
 mPYMyjxB8jFISjYhSsniNDapwY3s0JGKTg==
X-Google-Smtp-Source: ABdhPJy2sjthNSVW0biM7Ju/qoYZBEKjVsRD/UxZF/1bY4XjvRfeQBE7Yrw7Q0X2cUqI/J/0EaGJPQ==
X-Received: by 2002:a17:90a:b288:: with SMTP id
 c8mr19972679pjr.67.1633812933173; 
 Sat, 09 Oct 2021 13:55:33 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:32 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:09 -0700
Message-Id: <20211009205523.3137859-7-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 06/20] package/python-ipython: bump to version
 7.28.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index e8e25f5cb7..5f591129a4 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5	68542bca2ebf39af7d9d0557e7fb5708  ipython-7.9.0.tar.gz
-sha256	dfd303b270b7b5232b3d08bd30ec6fd685d8a58cabd54055e3d69d8f029f7280  ipython-7.9.0.tar.gz
+md5  f733048322cd34ce392ec5404813540b  ipython-7.28.0.tar.gz
+sha256  2097be5c814d1b974aea57673176a924c4c8c9583890e7a5f082f547b9975b11  ipython-7.28.0.tar.gz
 # Locally computed sha256 checksums
 sha256	341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17 COPYING.rst
 sha256	e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 8136353ae2..c669dd1b92 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 7.9.0
+PYTHON_IPYTHON_VERSION = 7.28.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c0/e5/ba19ae58e9bdd80832332873cb4e11a90cf2049df052c1aadeabc2cdadeb
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/e2/c8/7046d0409a90e31263d5bbaa708347d522ac584a1140c01a951d9deb1792
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
