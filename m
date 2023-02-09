Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADD1C05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 03:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB69820C8;
	Thu,  9 Feb 2023 03:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EB69820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4El2C1B8Fz7; Thu,  9 Feb 2023 03:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59E8A820C5;
	Thu,  9 Feb 2023 03:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E8A820C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E09A91BF4E5
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7B7040186
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7B7040186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQqQYudLsW5J for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 03:04:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEF26400C4
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEF26400C4
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 03:04:30 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-15fe106c7c7so982409fac.8
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 19:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bWwDjt35/+qIuB0325rS7PBYZTpeChDC2VzPnv/8Z+g=;
 b=tEDAoqwIe5RN/dwOUBWFo8Fqi0lguCMKaQlVDIl+UdY/I8B89EwzcV0lClQVvcww+M
 DbYWWVjCdMrAS3iOp9d7MJrcT7DO6Vdyw5M7iyZ1YyjpiZBHxP3coXF3C5vKdM1LkjNW
 pG+Nl1b74iNCaWnH1DzartbZe2SFfH3tczMGPnEXMFkOHpV5Oz5+8QgGeVG1ngSzRo+6
 LdGTYX3dsKB3iQJ9eoCUTCgfPUixsNVANv7qrNJn5uiofEnjpXlsl4fOuihCxyRdZ48i
 Yzg2RCYJXlawBS6JAOtu39XVz2tmQVvmiMF/5HCIVbixeF0c5MbWXNquIKWt/UyPxwzX
 wxiw==
X-Gm-Message-State: AO0yUKWizYl7MVkBXRdlfhbbCK2hANa0T/IqpRAiMZBMgkqQggTFhsuh
 B9Xhydo0f33dizXaYZ73fy1d8qGUzsg=
X-Google-Smtp-Source: AK7set9GJliG03mg1zoUx8KbjIgtINjsbgQDyPR5FevOmlA8UZbdpLfEITcEZmyO8AUR/mjMKvLhUQ==
X-Received: by 2002:a05:6870:2115:b0:163:4a10:827e with SMTP id
 f21-20020a056870211500b001634a10827emr6010902oae.16.1675911868420; 
 Wed, 08 Feb 2023 19:04:28 -0800 (PST)
Received: from nowhere.attlocal.net ([2600:1700:65a0:14f0:dce0:30dc:b696:f26])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056870a10500b0014fe4867dc7sm108383oae.56.2023.02.08.19.04.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 Feb 2023 19:04:23 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
X-Google-Original-From: Charles Hardin <charles.hardin@chargepoint.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 19:04:02 -0800
Message-Id: <20230209030405.33574-1-charles.hardin@chargepoint.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bWwDjt35/+qIuB0325rS7PBYZTpeChDC2VzPnv/8Z+g=;
 b=qF0CzUjSIId0d+Sa5ngqFqaeHnJOyzZzcHTooRNevplJTafr3UgUrqnI/LN9ExXpcD
 tRPZ43EoLeNb3dUeAdgz03LVw9hwjjg/q8h1y8yGdoFDbs5HjZJ5uG6JMOUoBURrrXQV
 eVSLiQISEfsjV0opgL62qJwWI0FN5g5kzs3SKokikvj87Y30ZAMns+OrjlyZPtuCQPog
 9UhTcbYjejZrjznmbwB5mkbp6u4F+FZmO5AFNrqjRc94r+27kbei4dvbuoAG+j3+DVLo
 RgY/PEdtVpckywu/PQEzgXoojiLIWeW/CO/R7HG/ri5W3d1T3tbEPNxGPtzFxRbuK3B2
 doaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qF0CzUjS
Subject: [Buildroot] [PATCH 1/2] boot/uboot: add a setlocalversion rsync
 hook when overriding srcdir
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

During development the override srcdir is often used with a local
git repo and branch. To help track the builds used in those flows
it is useful to have the scm version available as part of the info.
With this hook, the auto generated version include will include the
example.

    #define PLAIN_VERSION "2018.03-01358-gbda75d6a8b"
    #define U_BOOT_VERSION "U-Boot " PLAIN_VERSION

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 boot/uboot/uboot.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..e340d2cf11 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -40,6 +40,18 @@ UBOOT_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
+ifneq ($(UBOOT_OVERRIDE_SRCDIR),)
+define UBOOT_OVERRIDE_SRCDIR_SETLOCALVERSION
+	(cd $(@D); \
+		if [ -x ./scripts/setlocalversion ]; then \
+			./scripts/setlocalversion --save-scmversion \
+				$(abspath $(UBOOT_OVERRIDE_SRCDIR)) ||:; \
+		fi)
+endef
+
+UBOOT_POST_RSYNC_HOOKS += UBOOT_OVERRIDE_SRCDIR_SETLOCALVERSION
+endif
+
 ifeq ($(BR2_TARGET_UBOOT)$(BR2_TARGET_UBOOT_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 endif
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
