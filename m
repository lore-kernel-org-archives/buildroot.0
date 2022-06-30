Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4124AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 03:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E33D404A8;
	Thu, 30 Jun 2022 03:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E33D404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnTh2hKeSO9Z; Thu, 30 Jun 2022 03:51:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9B0740949;
	Thu, 30 Jun 2022 03:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9B0740949
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49D771BF9C2
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 03:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DAA041B60
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 03:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DAA041B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlkvvRk0FVhF for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 03:50:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 757CC41B5D
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 757CC41B5D
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 03:50:55 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id lw20so36490266ejb.4
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 20:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wy1/KXmbLVp7R+/6sfbg/6Kxrq+jIjvwRcPMj7+iSOk=;
 b=EkxAZr+cZFs3CJe14D9UwHgUruuGD49AOxvGuyUddm9vXcY64ij2KRRHEMJ31OQYhk
 y9n0QSqUwIdUujpH1j9YuAXTh4wgdED0JcFBqMkLPugovXmOft2arpiE3Zl2om4cn51L
 rZiaeyNDPwtThRzb6QMGUcLUDw170eEgKdgZRLQhtYPOobCi/kX0sDaVRDxMEe7NVIiP
 qeqXzrQN+3TzOs+u/oPz3u/lTrc2voJBqWH07Qn8rOQornuPVMhWNV76+lgajRsDJhJs
 MBk+7yBdHrY5xs0ofcuFhGNQKH1WVEH5wnIp8ejYRt0iqDBWKSjnG20uyDR9Nn+e2L5C
 kSqw==
X-Gm-Message-State: AJIora+l08eOp9otuIqwFPhtrPDVxJQ0YE+M9mHKvVNbDHofjS0fj9tM
 TjymYZFnW9Y5XZrRt0FfKQDtZX0lYknczd1R
X-Google-Smtp-Source: AGRyM1tGhol0PaKbqMYzHa+C+AL6DpqWhkVWL+k6GS7EjB16lOBnAWwbIkdaCnYXWM4AnYlOJL8ShA==
X-Received: by 2002:a17:907:3e13:b0:726:eebc:3461 with SMTP id
 hp19-20020a1709073e1300b00726eebc3461mr6519295ejc.528.1656561053216; 
 Wed, 29 Jun 2022 20:50:53 -0700 (PDT)
Received: from smartcross-dev.lan ([185.217.109.52])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a1709067c8300b00722fc0779e3sm8555001ejo.85.2022.06.29.20.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 20:50:52 -0700 (PDT)
From: SmartCross Developer <andreadaoud6@gmail.com>
X-Google-Original-From: SmartCross Developer <dev@smartcross.io>
To: buildroot@buildroot.org
Date: Thu, 30 Jun 2022 11:50:28 +0800
Message-Id: <20220630035028.3090253-1-dev@smartcross.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wy1/KXmbLVp7R+/6sfbg/6Kxrq+jIjvwRcPMj7+iSOk=;
 b=ea860PFEnh0TDtWYONxA1WNRuYqLFC5S2kRbtV9oFWIo7eziSakSNgt4wDLxSJBOGU
 jBvpro2U68AckjQypc9JAeCvUdK0Eb0XNK+cDKZUWjSVrB/CoNs9tTvEpK1Lw3lbqE6F
 2h2+gD2wGLaNWpH7miiQLAE1dXn2CxhGavYvHL47CdjUYGxUMglOOn7xfgwdxNzwHo8a
 HaZ9A5CKDK4s6Ufhg3KUK4C4ueA56j0yPRUgZHUiPBfDyf1cgBI1BqB6OxA8Lu2cX25o
 b+skUaooo5NCHD/81jOQolW/uxRIO7Tjcc7LWbPKzDZc6N1fDHFm4GLQGkV2/NBKlqX+
 NrLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ea860PFE
Subject: [Buildroot] [PATCH 1/1] package/stm32flash: bump to version 0.7
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
Cc: Andrea Daoud <andreadaoud6@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Bernhard Petschina <bernhard.petschina@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Andrea Daoud <andreadaoud6@gmail.com>

    Bump to latest official version.

Signed-off-by: Andrea Daoud <andreadaoud6@gmail.com>
---
 package/stm32flash/stm32flash.hash | 2 +-
 package/stm32flash/stm32flash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
index 7039f06eec..afffbc68ac 100644
--- a/package/stm32flash/stm32flash.hash
+++ b/package/stm32flash/stm32flash.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ee9b40d4d3e5cd28b993e08ae2a2c3c559b6bea8730cd7e1d40727dedb1dda09  stm32flash-0.6.tar.gz
+sha256  c4c9cd8bec79da63b111d15713ef5cc2cd947deca411d35d6e3065e227dc414a  stm32flash-0.7.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/stm32flash/stm32flash.mk b/package/stm32flash/stm32flash.mk
index 6e38e09d98..1fff27df76 100644
--- a/package/stm32flash/stm32flash.mk
+++ b/package/stm32flash/stm32flash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STM32FLASH_VERSION = 0.6
+STM32FLASH_VERSION = 0.7
 STM32FLASH_SITE = http://downloads.sourceforge.net/project/stm32flash
 STM32FLASH_LICENSE = GPL-2.0+
 STM32FLASH_LICENSE_FILES = gpl-2.0.txt
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
