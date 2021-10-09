Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27850C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E61CE60F9D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E61CE60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE83A83004;
	Sat,  9 Oct 2021 20:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpN53xnbCA1s; Sat,  9 Oct 2021 20:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E573827DE;
	Sat,  9 Oct 2021 20:55:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C9FD1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C0676075D
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dyGPmPIvApJ for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F3E96073A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:28 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id e7so6797059pgk.2
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aRXDT3GQCK+41G9iGrcw5oJXpPM7hpbYawNcYb8YTlI=;
 b=n8qvZ2iBHzYLtUxYInWuOI4r2MQiKYr3zXycviteVL7cfYKt30F8mslTqLLhBOTxbG
 JMcAllYUcHQ4mD8iFGin9CBonHtWOBPBzKybNaM4oo+4nqKDaOR2GYYE3zsZGWZAkwlC
 ISnDkueN43hwzt5gKMJB6YioBlbVFpBXsLlHEEyiaCY7GW71Bz8jQdRpKTkXV12rvO9P
 x12UqWQ7Kz6Hy4wju1JkzUDo6M6poOP28dpY/imSnErr/HB6GPJvwlrHkkbPKw79srcj
 L72G6RukchdZJMNJdi2vQzhRX400alfkIk4b+yOC79AErOVhWOSakQt7giif5nnSMvKU
 GJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aRXDT3GQCK+41G9iGrcw5oJXpPM7hpbYawNcYb8YTlI=;
 b=JSAlkzLODtCge3n+AG6g82VqIp71n5Lu1fm3HOWvyOd90Dlb1uhosE4P0Ish2EGEm4
 GyG6Zob/l6xtKYU/RQOO6jwhy31LlaQaV5cQNN46P/SFgt3qdbhvOP9iDTmMoMny8umq
 QqWpldrdc7/ugngmhWtuMG/nP/3DUT+wTYRW8kn4qlApyYAeaD5Ub2QQNGKXphzS3Vdt
 3h8OxDdP+7l4SH7bFN9T52qQ/itBDALNMddNS3scD660knDbpf3ShZAnCZpjBvxFpuX0
 1tv5w4ee0/JigvwOKtNJZ0btI86vQCutfZBSWkcER6H8BtoluKqT6NnQEg4tsW5Da2W2
 qryQ==
X-Gm-Message-State: AOAM532Jialpw+M+okBUiCoKhZLko+BX1Qk6P8NcM6NSxDvMIcNsQ7a4
 BjN/wWCm6kbvPKPUJzuuXdd5nKuj4MFhKA==
X-Google-Smtp-Source: ABdhPJxyePO5dYvaJ+gBmFt8XcL4Qc6opYa2mgateh9CnY3occfY3tUOAfvak39R0sDiOTg8JUaWxg==
X-Received: by 2002:a05:6a00:816:b0:44c:6043:943b with SMTP id
 m22-20020a056a00081600b0044c6043943bmr17341430pfk.4.1633812927815; 
 Sat, 09 Oct 2021 13:55:27 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:27 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:04 -0700
Message-Id: <20211009205523.3137859-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/20] package/dbus-python: bump to version
 1.2.18
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
 package/dbus-python/dbus-python.hash | 2 +-
 package/dbus-python/dbus-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-python/dbus-python.hash b/package/dbus-python/dbus-python.hash
index e65695d616..8d1609dec7 100644
--- a/package/dbus-python/dbus-python.hash
+++ b/package/dbus-python/dbus-python.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  11238f1d86c995d8aed2e22f04a1e3779f0d70e587caffeab4857f3c662ed5a4  dbus-python-1.2.16.tar.gz
+sha256  92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120acf7260  dbus-python-1.2.18.tar.gz
 
 # Locally calculated
 sha256  1e4562245383fdb5203b1769789e5b28bba21af4923aea7e8b2614f7f93623c0  COPYING
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index f4b8996d76..3e28aed25c 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_PYTHON_VERSION = 1.2.16
+DBUS_PYTHON_VERSION = 1.2.18
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT (dbus-python), AFL-2.1 or GPL-2.0+ (dbus-gmain)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
