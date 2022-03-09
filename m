Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFA8C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 17:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836B941877;
	Wed,  9 Mar 2022 17:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crg_4FmruNqq; Wed,  9 Mar 2022 17:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A77034186F;
	Wed,  9 Mar 2022 17:59:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4C721BF25B
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 17:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1275409F5
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 17:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RRToPJaBw0P for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 17:59:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D9B340232
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 17:59:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so1993938wmf.0
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 09:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8+DFboeYxf+fd99cCPLq0IbwGzzspi9XdKeo+mKjJA=;
 b=nYpcuxnl7uapijyHnRxOpeTQoZRpUL1inGQRar2hcOs+bXPhHosxNkQYk+yl3H4Ci7
 dDeComCZPL5DwNIZFYC914nH+fIAotNq0eJumhB072WNH0sH8UMtkikDHY468650lAP5
 YIzDea01CKTn6UchipJTkKR6bmPv6dJbTt53T8sd9RAcbz/IlLTvw7p+Z9B+p33lLmLM
 0CrwGQNjEgmMdjnyrFB9lfOVn51b4tvOfKD+VvW1+zDzfRqlogo9HCtGkUXHcGrtufcE
 a/T2CPZlgTAajHIvSKUJp0J7VUZmI+f2FFFnx7GZEFn5lk79LgCnkcLqQ+HDsTrd0bWf
 QXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8+DFboeYxf+fd99cCPLq0IbwGzzspi9XdKeo+mKjJA=;
 b=5eUq097DymdOpkFvchIkIQ2U9STZU/hrFTTY+axVRkx/5phtWt9B/EzehGa/wjblIB
 FFgnYDpTczFn9UpimNzWSh2jfUQ6r+HLL6N4chGei4JBQKX8SDtlYapYMiKzxgMRNkkE
 crNS6kHx39yHYlEcp/JtsoihWM7Jr7wNXQwUAAEu+mtpnMxstNud7sRqX4rfkQxfcDxW
 Y7iY+UUpbr65Yrz+9mpH+JsnE5/2WNcvZagEe2sGaZ3SibIvUh8+IzgDB6a3ZOJoVMQ3
 oMqmjYSnUxuKSAA9G+RsNiLhoNRhSLtL4DsTMZOjlhLqDgGeca6p2GPWwlq7gTM6E9ho
 aS2g==
X-Gm-Message-State: AOAM5308UpRyUUoNHmMiH3aNw6c6kTqGjOBzsRq1ZO98ZWv1SXV9ZQgt
 A5RTNdpdx8OYoF0xvSTJTR617P2zDWg=
X-Google-Smtp-Source: ABdhPJxfd1X7ZqEY1iOy0X0KvzV3Ftku0JIBYvvm8K6Uu4ewrYHyM1slbBW76cbAc19zTXneIWBl3w==
X-Received: by 2002:a1c:4e15:0:b0:387:3661:e857 with SMTP id
 g21-20020a1c4e15000000b003873661e857mr8479680wmh.94.1646848754467; 
 Wed, 09 Mar 2022 09:59:14 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a1ca103000000b0038993e53be7sm5564751wme.39.2022.03.09.09.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 09:59:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 18:58:26 +0100
Message-Id: <20220309175826.538666-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ola! drop autoreconf
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OLA_AUTORECONF has been set since re-introduction of package in commit
16ff948444c3978d63f483344a3d92d994c64312 but it is not needed as no
patches are touching Makefile.am or ola.m4 anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ola/ola.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 5090076175..1874350784 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -9,7 +9,6 @@ OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VE
 OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
 OLA_INSTALL_STAGING = YES
-OLA_AUTORECONF = YES
 
 # util-linux provides uuid lib
 OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
