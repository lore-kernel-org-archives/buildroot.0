Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A755C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 05:42:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2AA96124A
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 05:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2AA96124A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43FD842561;
	Thu, 30 Sep 2021 05:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LutXSSqhX43z; Thu, 30 Sep 2021 05:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A9342544;
	Thu, 30 Sep 2021 05:42:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7739E1BF2A7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 05:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FCAF84056
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 05:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qj7MTk_mtVes for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 05:42:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8BC684055
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 05:42:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k7so7877694wrd.13
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 22:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/94P+xWXeLBGgrim+AcacFqD/TrW4u8Bw/TwS/hXR8Q=;
 b=HkH85qQCPeJydywSQmQnaV3Zk6YahKOQUuyr/3BBYpbxRUMshrfIKcGdZqlv5fV6rZ
 +9V0RGlfCrdvQdmj2tvP/NTVsLHHVBv1+Qnl6Wm73+Ds33OhM3LcGPyjpJgCYEDpbwuR
 5RiP4/zXbVYDgjNYfLwXQp+y3jj+prw3tPoysTIv3GHaQBAmKndLNCiNsNBKXny78wGI
 /LXoJPHTxBledVdELC8s8PEtT0bEOVcWEyqYRYc/i6ocGt0pqjSF0HCu0ydElJGZuDzV
 cXl7xJ7V6QT3ErWS7lS6Rs9p5ReUNDH/anucv+l/85h/KHH+boDxDTblNIM3qluBba0+
 eI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/94P+xWXeLBGgrim+AcacFqD/TrW4u8Bw/TwS/hXR8Q=;
 b=E7r5FKPQRWxLKuWAh932Up16TsKfaVUiQiPFGmslS4MTB2fTq94DojlI7TAPHhltvj
 7xq51b+hT3g7/J8mMi9m1HfW0Tp20MYHayTz2dGr8X/bpKrDuyYz/o773pw8d2ITaGcW
 NymBsOXD+XYSNvBr0JNaTOjGOGL418DrUauABqw/0nnh9ZfyGsJN52GqXeENi8+Vs7yI
 KqblLnr1VRMTvg1KZYb4/d3KGg2IfoJf2F28MqZtoLEABd94eBN4PVhaf9wuJshDRuxv
 QO/jmYapVWia9ln+YfVwRnVSDeAFQsGYv9eHZSDXHEZc3VGHRgZMYRzVma5acq+nsp/5
 JTMw==
X-Gm-Message-State: AOAM533MIlwnxgp/fX0TyQCoegrXINIwRWuQijS/Fu2GGoSr74BzvFF1
 eOIy3WQy1pA24sD8amB+KoHCnk3tWDg=
X-Google-Smtp-Source: ABdhPJxsRfigeoURYe5sCw/WwxJeazenIoYVELMS7OSOCmseU7PTcBLAPPhku/0QX8NKdfrNKUDjHw==
X-Received: by 2002:a5d:5746:: with SMTP id q6mr3892717wrw.434.1632980545563; 
 Wed, 29 Sep 2021 22:42:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id r9sm1890156wru.2.2021.09.29.22.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 22:42:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 07:41:39 +0200
Message-Id: <20210930054139.1929150-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-inflection: python3 is also
 needed for host
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
Cc: John Faith <jfaith@impinj.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit ac120d277704fb212654356a6d2a2ff7be90737a forgot to set
HOST_PYTHON_INFLECTION_NEEDS_HOST_PYTHON

Fixes:
 - http://autobuild.buildroot.org/results/b0f7e56fd1dfe891396adc2b232a2663a9715196

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-inflection/python-inflection.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-inflection/python-inflection.mk b/package/python-inflection/python-inflection.mk
index 7c030e99b9..59f35aa135 100644
--- a/package/python-inflection/python-inflection.mk
+++ b/package/python-inflection/python-inflection.mk
@@ -10,6 +10,7 @@ PYTHON_INFLECTION_SITE = https://files.pythonhosted.org/packages/e1/7e/691d061b7
 PYTHON_INFLECTION_SETUP_TYPE = setuptools
 PYTHON_INFLECTION_LICENSE = MIT
 PYTHON_INFLECTION_LICENSE_FILES = LICENSE
+HOST_PYTHON_INFLECTION_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
