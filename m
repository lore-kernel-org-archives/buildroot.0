Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57BBC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 17:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29BE0404CA;
	Mon,  7 Nov 2022 17:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29BE0404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gr20pRbL3rmG; Mon,  7 Nov 2022 17:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0DA440302;
	Mon,  7 Nov 2022 17:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0DA440302
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CB221BF2EF
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5559040286
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5559040286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfQ3XWLDaxIP for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 17:25:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E8240012
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8E8240012
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 17:25:35 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bk15so17240943wrb.13
 for <buildroot@buildroot.org>; Mon, 07 Nov 2022 09:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFxOM+HD20QRvQvwgEkzTffUAFNnkuI9Ha/W88kodGg=;
 b=eYTi+MhzukKqBBfwMjPPmJXCpsWP4lKSKWRiGDAMPFhy/xMMvduzo2fGie7a8CdxnY
 OSGwD/g7R15hRhuQ8mH2nHiMIM0D8v6ASInu+BpM95h5p3gNAhZwJ01kJ7Ic6kyez+Ga
 9vkonap4phBlhL20b2Hg1HLPzQdwDIK0Pbg8Q2NQg8sj64pkhuLFmfo6av2SqRRQ5Mz7
 gBWJ7kjYbtCfWci6dWc3RAOc4GVFQIFkYZmS2EhrhEYsl8aksGN6XaZrNJjPPXTnEth/
 yQySGTmyJTJBthS7r7eQIjfox+gp7DTqd1Z3j0qadt0W+l9kvzueL1xuRf9F1d94en41
 6Vaw==
X-Gm-Message-State: ACrzQf1mTyZpBOZUTQhx5UA60/PtyQOCLuIsYk7NY3xWzFtMuuJzHc/h
 vkhHCUNeMdIALtwt216VOrzlQM0Sgsc=
X-Google-Smtp-Source: AMsMyM5NZxtW/UGRlSuxZt/sw5oYWmL/lTcI0tLZdQ/GoDOMExxUqYOIc92jOc9kfGvfVM/yz3jIGQ==
X-Received: by 2002:a5d:5143:0:b0:236:b339:c72e with SMTP id
 u3-20020a5d5143000000b00236b339c72emr32013474wrt.276.1667841933504; 
 Mon, 07 Nov 2022 09:25:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v15-20020a05600c444f00b003c70191f267sm13296771wmn.39.2022.11.07.09.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 09:25:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Nov 2022 18:25:30 +0100
Message-Id: <20221107172530.6748-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nFxOM+HD20QRvQvwgEkzTffUAFNnkuI9Ha/W88kodGg=;
 b=RRAr6qgVmvPyM3NxZS8KukFvEuoIg1r+oxwI83uaYKBzqyjDd7ZDVNqV7ZF698MHXF
 XLA0a3fAQzm+j1rRI4r6Ci/0zUZj1uT00bv17d5EiH6KulAcRZeBo1NHUxRavk58SlmA
 OKkhzeqbGNlwVP2SetDP56XgwhJGWjB6Pi88Im0fAaWe+rK0kwYGad/JxSQbOWkPaJ+R
 vLI7BcAHTPDmXG1xN4W1TK9WbGz52wYWwRd288E3h9GNlQVNMri/WWW1QkuG8N24fH/9
 GOaiUYi2DI70vKPiTQd4+hxPJr2LXpypgq04rertwFrGEBCGk6zfmmkyxvlyQi/Rnpf+
 27IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RRAr6qgV
Subject: [Buildroot] [PATCH 1/1] package/ipmitool: fix per-package build
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following per-package build failure raised since commit
82480ee22bdfae6f7d399975722b5c125749d8c7:

configure.ac:44: error: possibly undefined macro: AC_SEARCH_LIBS
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.

Fixes:
 - http://autobuild.buildroot.org/results/ecf72cd1ebd53f3b3b10f0a24082f9c0ab5d4d12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmitool/ipmitool.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index ebd8f9b337..b9f60d8151 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -12,6 +12,7 @@ IPMITOOL_LICENSE_FILES = COPYING
 IPMITOOL_CPE_ID_VENDOR = ipmitool_project
 # From git
 IPMITOOL_AUTORECONF = YES
+IPMITOOL_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_FREEIPMI),y)
 IPMITOOL_DEPENDENCIES += freeipmi
@@ -34,7 +35,7 @@ IPMITOOL_CONF_OPTS += --disable-intf-usb
 endif
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_IPMISHELL),y)
-IPMITOOL_DEPENDENCIES += host-pkgconf readline
+IPMITOOL_DEPENDENCIES += readline
 IPMITOOL_CONF_OPTS += --enable-ipmishell
 else
 IPMITOOL_CONF_OPTS += --disable-ipmishell
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
