Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71041C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 06:19:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1B8C6138F
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 06:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1B8C6138F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C31783E7E;
	Thu, 30 Sep 2021 06:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9CGbPta6hWY; Thu, 30 Sep 2021 06:19:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3D7683D9D;
	Thu, 30 Sep 2021 06:19:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB60F1BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 06:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3B4840747
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 06:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M50e8nUfZxmo for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 06:19:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4C2140712
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 06:19:44 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id j27so3708553wms.0
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 23:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w0dyCi8twUffzR6PnXEO0oxkLV24E6FiQDxkP3QbmB0=;
 b=Uo1PFXCXH4GaaXzLz1juBdVM7u0RkPI8+TO/zx3wmTFUFp5qslNbm0nG+0f3YUPckT
 03qPbD68rPUJrJ525gTRP/w2vEJtq6/YuEpAeNUNxaKBhhzwDfkudEdG9DH6oZuafwu7
 zgwyWaDq6u6ufHsgqJrQRNoTo02UsepEkFwzcTDLqRxtrFnxujx3k9+uOZI9eXS5VlFK
 YrQG4yPLkFc9Xk3bXiIAFJakEihUtkl88lUNsoB+YesmRCALCUVISPndjrGsu4Ez9sSV
 GcjLfQxKvRD3nOpr1W22uwwooR1wUiF77vroDB8OXzc9fOS/YB6n4E3SpD6IgTBXDTl6
 NMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w0dyCi8twUffzR6PnXEO0oxkLV24E6FiQDxkP3QbmB0=;
 b=6nGLjmYMlsoT+4ikfMLj7RDcPZcpeB6FGdVmSx6lNBWiJ0wIPJz8OZUJOcxinFR63E
 RGD3HKcht0pSjD/tmHXVcF14dI3t40TpeilfatGPzmukGM/ZB6G/Eq6TTMBzMZ4Qk7it
 U/NfgGWFBCH7EmTMWDo3rYHcOGgr0ZQcSJw01oSPMgfX3tHn6Cbcf1movN1G3H46FHZn
 1iuTpZXhniOpNIcx8LEI/cHLRpKBrR6WEmTpDzhCrdf4P7y37Ka3RDW1DIoU8eQLwuon
 ZILjAQWt24Nxd4Fw+2/rQu0DoKt8AGVGeQ8HiydYJSqcacw/JAqI+rdN87aALClHCvnR
 3y7w==
X-Gm-Message-State: AOAM532W1EN8UvdUdsh7u+SUDOw1rXBsOyfeIZf5JuyJyhwItRXz8MSq
 vmxTXBa3IrqViwH9ehtwUHGuzRsvjX4=
X-Google-Smtp-Source: ABdhPJxPYEstaO6ySoxx8wmrILT/x1j+bRx04ViCJT+buF5OD0LyXmYrXlk5Kc/x0N7FUjLbxQJgQw==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr14004744wma.53.1632982782377; 
 Wed, 29 Sep 2021 23:19:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id c185sm1975574wma.8.2021.09.29.23.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 23:19:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 08:18:49 +0200
Message-Id: <20210930061849.2158537-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zbar: fix python build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Volkov Viacheslav <sv99@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with python raised since its activation
by commit cfc80eeeb4f3cb8e59b56bedd5bd49761764671f:

In file included from /home/giuliobenetti/autobuild/run/instance-2/output-1/host/include/python3.9/Python.h:63,
                 from python/zbarmodule.h:24,
                 from python/zbarmodule.c:24:
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/include/python3.9/pyport.h:741:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  741 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/43a8c8d5403c329f2d754ed09807a53772174397

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zbar/zbar.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 5554dca6a1..fb83fa01d5 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -34,6 +34,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 ZBAR_DEPENDENCIES += host-python3 python3
 ZBAR_CONF_OPTS += --with-python=python3
+ZBAR_CONF_ENV += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
 else
 ZBAR_CONF_OPTS += --with-python=no
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
