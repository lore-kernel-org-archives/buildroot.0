Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCD6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 00:27:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4741860F70
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 00:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4741860F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0396E406C6;
	Sat,  9 Oct 2021 00:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCCyr3y16qYk; Sat,  9 Oct 2021 00:27:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E2C940699;
	Sat,  9 Oct 2021 00:27:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DAD91C1135
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 00:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F212D83A5D
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 00:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IexnXD1n76Jb for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 00:27:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66C4D83A42
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 00:27:32 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id u7so9448271pfg.13
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 17:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S6DKUp/JqtcfgcXQ5khOu/eJ1pv1sqqTyYnKHHIq5fA=;
 b=cMy64v9QOwWDG5Afua2OQlMmLljG0sVbyiQ8NTb4sktugTkq8LcQn18aQ/sNv6pz9X
 hYkxV/GIucojbtm2ii6ka2/hsw1jVFe+JMu/3o+n8rdbR7kRZneb4nWmbA/+KnLuoB84
 iIuxisDthzk1ArHzLBPVgMhABsVrzKphysiIbhYCy/fkTiY8OOX7mofY6STlni/COkoy
 U41zVEz+J1OTqJjBZlfYwvvkoLMLckGAZMtvYGQqsuLuwBFoUGrR64PpPJxVQRwBsmbu
 vOKVp/wQEdGNul1tnoFPGs5awwDVWzSdH97MAjnhQS2iuMAZzr7WGu87qdWJ0NFWqsX4
 GuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S6DKUp/JqtcfgcXQ5khOu/eJ1pv1sqqTyYnKHHIq5fA=;
 b=gUtP3cbS9GgNrq6tQRAvrfqYzs4kgyWkmuM7duHDPTAweeeuuypxZAZaLKiDaxC2MH
 7G6z2xaAGJPzAUdIQRkPd5/BRChwHq1sXy8KITUisAgzNFMw0Rgc/IElGsQH+9uhSUJf
 159v87vMlWwgKc7dGoCQnAAIh+KgvmsFX2n39ag94es3JhxcAZdPIGGrlhlov5tC58L+
 d157bvasY0h2+XT/c5UbEqQ9ZAdorbVd7y5VtNMyLvAh+V5tnQav0L5lxSIsZ2A6Givg
 6aLlYURcFlUn1rxG2J4Qr6plzhUV5wlf6G6gmzcxxCqR1DcMuVQiSyj+hBwNRLD0GpTH
 HrRg==
X-Gm-Message-State: AOAM533i9BMyU4Jy5PLhP8tVTxK1V5IO7p2t5V+rFYOueCdfOX0uavRc
 YxAK9NJ9RPpT1Ne9kKJ+399rIEE6t74=
X-Google-Smtp-Source: ABdhPJxKcUcLEdNaM96skyDYfqYn0TKlTboynzWDpmI/UIwkUnP1XqEo9Q9DBhPAHvc5CkJGB0e80w==
X-Received: by 2002:a63:7504:: with SMTP id q4mr7238074pgc.103.1633739251727; 
 Fri, 08 Oct 2021 17:27:31 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id e7sm398912pfc.114.2021.10.08.17.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 17:27:31 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 17:27:26 -0700
Message-Id: <20211009002727.972605-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009002727.972605-1-aduskett@gmail.com>
References: <20211009002727.972605-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/2] package/python3: Add bzip2 option to host
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

The bzip2 module is needed to build the host variant of NodeJS 14.

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
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
