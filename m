Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCD1CEE33C
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 17:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CC01407B1;
	Wed,  9 Oct 2024 17:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOwDtSoF_ZNv; Wed,  9 Oct 2024 17:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4111407A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4111407A1;
	Wed,  9 Oct 2024 17:58:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D27FF1BF3E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2427812E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0laP2d6yUbqu for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 17:58:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C4A42812E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4A42812E5
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4A42812E5
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 17:58:53 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82cd93a6617so1180739f.3
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 10:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728496732; x=1729101532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s+Texj01/xpGR96TPjcKzpVWWIsJRECvNU4S0nrj4Fc=;
 b=ZksN01fqt21M6e8cXwKjVZNIC7xyR/OiJL1mTNOIh5ROqBQQq85sWfS4pMQGj58svB
 n+KYhXzcVop7r92N5BQX3OpT3d3y827kIoQv6D9plDdk+w4bTSN0Henb23kEqUS5cu3g
 qyseNZlrQNPfw9uYz8dlYDFAUMOTjFiZBqnyk2Up2qr+h7buY7Yx8ymDkD0x+BV3ZU8x
 Rgj8fRVOKizNPjAIl5c7SHM2LXdLMDrM4ETMuR3Ef9sCwMPEAdkoITCAEhnhkw3R3ZZE
 QuV3KIqTMfaxrJVJTNBFLegDQdgtpeUh4GTyNQ72+MD/Wfs1sxByRYaHixKdQIzX+8CD
 K6Bw==
X-Gm-Message-State: AOJu0Yz9NFKIZ4y5O8DgCGzLjFYXvm5Oqh21fUIropX4yZ0brCWUIWCg
 HzSx1rgh706uGt4Dl0OiFhqsx+HmzsVvl+bDMX/1OBaJAKpYTYtWyrbadLIC
X-Google-Smtp-Source: AGHT+IEmC/l7dOmBnwob2aEf8wneJ5RKLJ8Y5L6/ql6y8HsIhpsxllqt6enDnPfQStNtgb2LFQli3Q==
X-Received: by 2002:a05:6602:2dc2:b0:835:45f9:c2ee with SMTP id
 ca18e2360f4ac-83545fa002emr193646839f.4.1728496732267; 
 Wed, 09 Oct 2024 10:58:52 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db7e49cda5sm1764551173.93.2024.10.09.10.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 10:58:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 11:58:50 -0600
Message-Id: <20241009175850.3869401-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728496732; x=1729101532; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s+Texj01/xpGR96TPjcKzpVWWIsJRECvNU4S0nrj4Fc=;
 b=njXuak5TfPnwIL+yoHktotXeS5zbAaUDpnYoNBvoBrMkMYwNjTmKSH0jsRVwnTpktW
 U9NjrNIFn1L0/iemX2Xga8hjQKp+jQJ8544xmlfd28UvC6tLyfCXzHQgmUPOPQt1TJnH
 nhfzHgqx2FvzKEuFdmIKTkVRsBhIEqJ9elT6qojyfP6dG2RRkCFsMDAC/TSFi2hmThPm
 HGE8ToTXv6yMoJ06HfGi2d3+tyiC0ow/GXckMXtwFyjwKTq2JdCtZgRkExY8hGZWPSQw
 7nsVkT5Us4gX1ieYsksnrXRqeCgL0P6pikP0E6DdcnBn99D7FYAz6QfCJZHZC0kngiVb
 PsQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=njXuak5T
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.16.0
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
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 3aa25dee92..12c41fccdf 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  bd02d1eaf38597296340ccffdf56428e  sentry_sdk-2.14.0.tar.gz
-sha256  1e0e2eaf6dad918c7d1e0edac868a7bf20017b177f242cefe2a6bcd47955961d  sentry_sdk-2.14.0.tar.gz
+md5  4849080466b6656849557cf251ced724  sentry_sdk-2.16.0.tar.gz
+sha256  90f733b32e15dfc1999e6b7aca67a38688a567329de4d6e184154a73f96c6892  sentry_sdk-2.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 334ae961f5..fbf4f847dd 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.14.0
+PYTHON_SENTRY_SDK_VERSION = 2.16.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/3c/23/6527e56fb17817153c37d702d6b9ed0a2f75ed213fd98a176c1b8894ad20
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/80/63/59640a54963747d2c4b2d149412b2024abed13bacd4e8d16ae5babb97da0
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
