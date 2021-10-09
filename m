Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8853CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:58:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B53C60F39
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B53C60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0989340709;
	Sat,  9 Oct 2021 20:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJSi5BxETvOy; Sat,  9 Oct 2021 20:58:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6216040690;
	Sat,  9 Oct 2021 20:57:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62AE41BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 523786081F
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7DLpEC1_HrH for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 441936073A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:41 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id oa4so9457993pjb.2
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VtdhwQ2sSPIXcIoZLaDSstNN2CIgQbeCkU7s9/OCiDY=;
 b=oEvMYQJc04NjEk9+CWwUzPlPcyzKTgNhixxoc2dbjJkjSt+/951UsuLub5nKdSalzp
 bn++ZEoymTkCHjND8n0FkTMJJ4apKnUS+Tu/6Dkj1YNyjtMapZolkBTe/xO9EXS/adkA
 F2UWN3Ibknu90FoCtJh/AsAnjGuDTXEiVxGuzfI5JNIxpYoaDHUjorglKH6WG5VVmvn1
 bDRdzs9IvD9+6gu93Fs2Tl/nyjBFPZjkB+EhkMAT5eAM6/G0w/PY93TIxMZ2IldgiVYT
 cA/K7rHcKGmfqvqoyVm1y4XMz8XWt4hCxEd3Kp8Uc2HqHz3N+z3iPCjZsHGpcZMQJ9tO
 8mNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VtdhwQ2sSPIXcIoZLaDSstNN2CIgQbeCkU7s9/OCiDY=;
 b=gDyWysbYZKYVnku1OGvFqwClX5w6VVK8xoo794wvpcQpG/i/6uUEDN0ja7qW+SuQLB
 fnvgdNi6WC373fEvikvgjxCJyIKxTsi2HF0HserXLdhi+oq14VrSnMkQHNNoiiEJ4rn0
 aIvyYFjDneUt+NBbymr3n72U3ysO6qCp6FrCFeN5tWBT4Z9FhKaXj7uxFoIww6zHFnAe
 uwLXLW4uhNtUAYhqASHNc/rqPFtSTm4sURZMfE6EKAiHnhwK9b+DXnL8lBEwAdgehOnR
 bQclMTD9H8HP8VlXIBOIjuAWI7eYItM+Ffktu52EC45Pib9kNESM2XIiyeQjK0VTCun3
 fJxQ==
X-Gm-Message-State: AOAM533hUNFhjQsuzqNHvatkCHFdNPAI+ETIPTtxeQmdToxuknDganfp
 iF3K44cPw00dz3Sjeo/bIwUKTgNxcLV/Dw==
X-Google-Smtp-Source: ABdhPJwP+5px8GuHotfSojBlZQroaLZy8NkV+pX3BD7djR/yOtghXnXYMaQceCXbdrMi+Qg1rdhNMA==
X-Received: by 2002:a17:902:9882:b0:13e:1749:daae with SMTP id
 s2-20020a170902988200b0013e1749daaemr16258029plp.60.1633812940572; 
 Sat, 09 Oct 2021 13:55:40 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:40 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:16 -0700
Message-Id: <20211009205523.3137859-14-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 13/20] package/util-linux: bump to version 2.37.2
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
 package/util-linux/util-linux.hash | 4 ++--
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 3f9fe39818..eafbe9254a 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.36/sha256sums.asc
-sha256  f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f  util-linux-2.36.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
+sha256  6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9  util-linux-2.37.2.tar.xz
 # License files, locally calculated
 sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4bc7a11294..cf0fee409b 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,7 +7,7 @@
 # When making changes to this file, please check if
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
-UTIL_LINUX_VERSION_MAJOR = 2.36
+UTIL_LINUX_VERSION_MAJOR = 2.37
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
