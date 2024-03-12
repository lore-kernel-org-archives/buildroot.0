Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEACC54E58
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 01:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A39B8176E;
	Tue, 12 Mar 2024 01:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ICREKajTH_n; Tue, 12 Mar 2024 01:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F7FF81774
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F7FF81774;
	Tue, 12 Mar 2024 01:13:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC4D81BF311
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 01:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A692D60760
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 01:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0EK5DstFmseu for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 01:13:25 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E98116073A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E98116073A
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E98116073A
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 01:13:24 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7c810b04bc0so85811339f.2
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 18:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710206003; x=1710810803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jf1VqBf8+YSgqkht7H3dXQOkrkSbYuLYhgScjRYhHSg=;
 b=Ihs4jKoBkjn+kdkP0Y8t66S7Qyr/SVgG79Iclnbj83qh23Oz5E5nLfodkVoJPon10K
 ECrYXD6DoU29mG6GQ9/Lkr8r8NUvq8LNqC9SX8rJHt40/0ChKj7+5kRN9SQTgygW+xJl
 FDGRFt+NgI6frbXNsPqzr+JOgBqLrdDDcxPJaBm1iyZ7WSx2GM6xL7azuw7m+lq57iAF
 A0RgLU4ArnqZ8RD2XTD/kOIVQ4f8eIbRUx+B2CR301K2tzybVmKuEIP/J5tHLgTM91FM
 l18hPGQLNlFjwMHQwqyog9jeX7o1CwQuDkA00xekedO9KtMoy88Dg/Ry70wOLYDdHnN9
 mD2g==
X-Gm-Message-State: AOJu0YyIn39tKJtmcF21vM/cuw0KFnUIDy7YLIlKZIBXAdcpJRYcYEwX
 MJBWszbXEVUHSL6e15NvtXmW4TeLflZIcLsnjZQMqhA4PiJbmjg13ZyCkb9l2ap5a5HiM6y11NG
 3Ng==
X-Google-Smtp-Source: AGHT+IGqN0M0Qazk21+4B6l2dsas6MiFqzHZyW1iE5BhL9Ldcxd2xhP0SdXdtEjF/ohM0N1b2gjAMQ==
X-Received: by 2002:a5d:9748:0:b0:7c8:8821:3810 with SMTP id
 c8-20020a5d9748000000b007c888213810mr9013546ioo.0.1710206003182; 
 Mon, 11 Mar 2024 18:13:23 -0700 (PDT)
Received: from earth (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a5d9704000000b007c8a6197912sm1826604iol.29.2024.03.11.18.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 18:13:22 -0700 (PDT)
Received: by earth (Postfix, from userid 1000)
 id 05B241062001; Mon, 11 Mar 2024 20:13:22 -0500 (CDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 20:13:17 -0500
Message-Id: <20240312011317.1956535-1-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1710206003;
 x=1710810803; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jf1VqBf8+YSgqkht7H3dXQOkrkSbYuLYhgScjRYhHSg=;
 b=fRPZRmVl1JX7X+BHzfGpNBrddtTijAAbaHuA04fFki5XEXWcMWRLK6sIpIZajssdkG
 3t4aFdR9wSUIKlGhpreAVj7JgJL9tOtkw1bwDWijmm1VqcgFH4jC4nBHggy13n3B18Ss
 GjdtN4K5lQTG50ZEh9BW02XLAA6LnlH6WDjVi8RHFg/Hyzy7QdAU8w2WSnWrPq4eVgBG
 S4UPip/p/aqLMdB40+uYsq1BwWBvBJSd5fOf3y+cV4H2M5pkF7mR0UGZ4GG0nLEy7nWD
 DT6efEuPwpZGm2GKgCAhCZc4gjVBFXII8XoSC0Y87ocx56/8KO8Oet6OOt57AZ9aTX2B
 wQqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fRPZRmVl
Subject: [Buildroot] [PATCH] package/targetcli-fb: needs python-gobject
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
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add python-gobject to resolve "ModuleNotFoundError: No module named 'gi'" error encountered if built without it.

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
---
 package/targetcli-fb/Config.in       | 1 +
 package/targetcli-fb/targetcli-fb.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index 04c6a1ac..722b9400 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_TARGETCLI_FB
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
 	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_GOBJECT
 	help
 	  targetcli-fb is a command-line interface for configuring the
 	  LIO generic SCSI target, present in 3.x Linux kernel
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index d2cbf79e..dbe36e59 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -12,7 +12,7 @@ TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_CPE_ID_VALID = YES
 TARGETCLI_FB_SETUP_TYPE = setuptools
-TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
+TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six python-gobject
 
 define TARGETCLI_FB_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
