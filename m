Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B681C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:34:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA7461374
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADA7461374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CA0E40583;
	Wed, 20 Oct 2021 16:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OIVNB6GlEZb; Wed, 20 Oct 2021 16:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D5584057C;
	Wed, 20 Oct 2021 16:34:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BF791BF372
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA0F280ED2
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYbQWwtmDK7K for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 16:34:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06494801E8
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 16:34:13 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u8-20020a05600c440800b0030d90076dabso5575861wmn.1
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OtUhyQUFeVXf7I2MNQ6Aa/uDX6N3U6DQSSe305ZA/YQ=;
 b=qYSQXp1lVsmj2NPD3ax5OX6etm0889/lZZ3WQOwe/7zqlNAsgw5RjIs05/72vKnrPf
 iKD6phBIFNQWyZ32wYYeAIsksKoj6nWL0QogCTWGAUctVqhg502WWPRiA0ocGC1wqZ39
 wLZ4YHv60OfP5AIH6v54zip0QEaS6ewfXUxm8RHa9o0miaw6eyh3gvHegT2Ok2vfFvPJ
 jTbC5aWHsrLQYpG59317LOylGTYoxzf9HcVokeLhoZKzvjDY50iGEznvozmNh89a8krn
 wNdZsGRFpQHxBQAiaToVgUWUqzhCDGXhztj7lZcn15zkAVAaKBpK3uccij31zJz4yg0g
 +bNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OtUhyQUFeVXf7I2MNQ6Aa/uDX6N3U6DQSSe305ZA/YQ=;
 b=CREMVKNONTUiq3e0UGqlkWBnUaK7HsnpgbrxE+0lb4SIdMuQJulzfyqi1JHxDhh+/m
 5C7y4Qzxij2GiL1EHHgSaEwAkxU2bXDMPkPq0IfqhcP2NH3CF0tAgDyTfVVRLpZAyuc4
 sxbYePys5m6bBbiKRxZvBx0ABm80vAywvjLcPHhopxd7iZ5MK9D2waotUcDV3fqW/Gw3
 CIyBE+Au3VzBayDTgFpez2LS2uLW7ILqMSEd8qO6SUlM+auGzx1wJEN+JYlUiRvCl8lJ
 QKxBt4nHOiewQXYtdHPQWpG886xtMznTetyuLD4ozb5vwV/wp1wSRYvHMUJhSgt2ks/a
 RQZw==
X-Gm-Message-State: AOAM532l1KKWhcRpdL7UEzsn6Bl/810wSbyAVC1RP472iGyQEu/fR0Ph
 5DYimQE/4/1sOfVE8zcnFSZnOyUDTKc=
X-Google-Smtp-Source: ABdhPJw78S66+0jMB0bpuIFkPr9SI0Lq+5rTINO8bnMoSWzD0jA1I6QeWfcnOvdjgrDei/9JgiA0OQ==
X-Received: by 2002:adf:aad4:: with SMTP id i20mr326200wrc.402.1634747651882; 
 Wed, 20 Oct 2021 09:34:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id t14sm2395385wrr.75.2021.10.20.09.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:34:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 18:32:37 +0200
Message-Id: <20211020163237.2695154-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: drop httpx.py
 for python 2.x to fix pycompile issue
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop httpx.py to fix the following build failure with python 2.x raised
since bump to version 1.4.3 in commit
fd684ab9f38ad908013d09fe7e46cebfada4406c and
https://github.com/getsentry/sentry-python/commit/e2d0893824481c9a5dd3141872d90d0888c4c5f8:

error:   File "/usr/lib/python2.7/site-packages/sentry_sdk/integrations/httpx.py", line 69
    async def send(self, request, **kwargs):
            ^

Fixes:
 - http://autobuild.buildroot.org/results/fd651abb3bc2fa33c861238acf1c4ad49fdac160

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 5ccd2aff5c..556f03e137 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 # only needed/valid for python 3.x
 define PYTHON_SENTRY_SDK_RM_PY3_FILES
 	rm -f $(addprefix $(TARGET_DIR)/usr/lib/python*/site-packages/sentry_sdk/integrations/,\
-		aiohttp.py asgi.py django/asgi.py sanic.py tornado.py)
+		aiohttp.py asgi.py django/asgi.py httpx.py sanic.py tornado.py)
 endef
 
 PYTHON_SENTRY_SDK_POST_INSTALL_TARGET_HOOKS += PYTHON_SENTRY_SDK_RM_PY3_FILES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
