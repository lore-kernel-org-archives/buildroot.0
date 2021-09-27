Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A84C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:31:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A5F060EFD
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A5F060EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FE4D404B8;
	Mon, 27 Sep 2021 20:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h5yh5uX9tlby; Mon, 27 Sep 2021 20:31:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5BDB404B5;
	Mon, 27 Sep 2021 20:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A96D71BF239
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 976ED404B5
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnCP950VYmgi for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 20:31:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A946404B4
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 20:31:20 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id s75so2367003pgs.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4pJmj9c9OGFijFzV0vHflFyDS/XL+DunjjAVYf6kkFg=;
 b=MhpxeVuq5G8tmBHIECmptO5wS7MZL9+NiAuUtVCmQMAfLvSa4BrAvhKA128dC9486f
 Zdft5O+h8jaQkOi3tUU4fYvJgcBjYNN8x4sIJzuG2/3KPEflxJRRNYmG8gHtzCnmsc+a
 xLmmKRS09DUdoFBidPxRaq1ApKa9bksljIKudzXDpfD1Bi5fNRMkQnh3qR4+HwB91BJ2
 8yB26XWN/a/Qt9H6Ok98yQcaI5SrEavLG74Gg6uhzDKrOUGeKzN0TTunx7Koe88nmdGU
 y3jFnT/TlrwwA3mHIgWsS7OeFVxoFSYimU0WouyaDuTYNbJFAcJfNX86927EPFWwwZv+
 0A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4pJmj9c9OGFijFzV0vHflFyDS/XL+DunjjAVYf6kkFg=;
 b=G8b/fC/T3tdjKlIWZXuqc3c/o+5OFNa5x3J+WEi67g7wQtL3gsJCHc4mUq0NrPlif6
 HsyWbTEKnePzz9IZZLF3DEwHCeQH8cj0uUhv0MVY89WFM3WVQMKuDSRIFMw8FMB2NSFB
 UjZLYzeha8LI0PUEsIMyJm3TEbGG+rw04+ScbS365dc6rG/e47C+Ce+5xH3tQ7oZoOdL
 FVd2mCrEJCvhlcxmlJcLy6Bm2/F9n/2fcSyLQQv+Y7CmfSCBYrE0CVsTgSZpi4SSSWwp
 y67HAU41zALyU36h6tCKh40p0+dhcB56HbkhQQP7oc22wnWCJHqhvil+pWA9JJmGO5SH
 4ncg==
X-Gm-Message-State: AOAM531hxlAfGInSortCJ2G2HQD1AdxfMSKqRqxX0Gmup0U93mhq2G1p
 ZpT+sbtWFA0ZA3neTwaP+MGDu5u+yCs=
X-Google-Smtp-Source: ABdhPJz6QTB8E+fI8BDekRsijgdo+h26AYmbqSvSbOkk45//VhN/D1oX3TxBqA+4QBF4dNUKybDYnw==
X-Received: by 2002:a63:5d5f:: with SMTP id o31mr1316199pgm.312.1632774679463; 
 Mon, 27 Sep 2021 13:31:19 -0700 (PDT)
Received: from localhost.localdomain.com ([12.231.12.194])
 by smtp.gmail.com with ESMTPSA id lj7sm277472pjb.18.2021.09.27.13.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 13:31:19 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 13:30:49 -0700
Message-Id: <20210927203050.64177-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927203050.64177-1-aduskett@gmail.com>
References: <20210927203050.64177-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/RFC 1/2] package/python3: Add bzip2 option to
 host
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
Cc: Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bzip2 module is needed to build NodeJS 14.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python3/Config.in.host | 6 ++++++
 package/python3/python3.mk     | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 70b5dacdde..65a8df0754 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -7,6 +7,12 @@ config BR2_PACKAGE_HOST_PYTHON3
 
 if BR2_PACKAGE_HOST_PYTHON3
 
+config BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	bool "bzip2"
+	select BR2_PACKAGE_HOST_BZIP2
+	help
+	  bz2 module for host Python3.
+
 config BR2_PACKAGE_HOST_PYTHON3_SSL
 	bool "ssl"
 	select BR2_PACKAGE_HOST_OPENSSL
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3e88bc0ff4..779f6dcb6c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -43,6 +43,12 @@ PYTHON3_DEPENDENCIES = host-python3 libffi
 
 HOST_PYTHON3_DEPENDENCIES = host-autoconf-archive host-expat host-zlib host-libffi
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
+HOST_PYTHON3_DEPENDENCIES += host-bzip2
+else
+HOST_PYTHON3_CONF_OPTS += --disable-bzip2
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
 else
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
