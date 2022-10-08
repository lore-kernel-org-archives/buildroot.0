Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9776C4332F
	for <buildroot@archiver.kernel.org>; Sat,  8 Oct 2022 17:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2328D410BC;
	Sat,  8 Oct 2022 17:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2328D410BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKyUFuiK1FYM; Sat,  8 Oct 2022 17:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38CA409A2;
	Sat,  8 Oct 2022 17:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E38CA409A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EFAC1BF2EB
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 17:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3449060B36
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 17:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3449060B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXyRZ9FVexJv for <buildroot@lists.busybox.net>;
 Sat,  8 Oct 2022 17:36:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F448607C1
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F448607C1
 for <buildroot@buildroot.org>; Sat,  8 Oct 2022 17:36:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id bk15so11390698wrb.13
 for <buildroot@buildroot.org>; Sat, 08 Oct 2022 10:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=My+yEWazAA52DggW5bkPuGUGewuU6U4mWvfi48NExeQ=;
 b=kaQ5YIW5kzVYCPHpbdXeXad4dfzLfxN34E/hux2gTGRB38SL9sKuAaIrxNWFKQWib9
 YUkKfqAwYuPFz4IsTkrOMmWPjFcCuhJZFMN//CxVaNqpzICS30ShooobUaN83C9GmE9Y
 mqG/IK7swj33bRyzL2h4cEIQsZZMI8FU559ZffRjRyD8CuPFCxZUx4Qihjj7Dg/pE2b/
 IxtT8Abu9hfbLvHKgluw+C9g1f++bvWA4NQ1BFZoagW1tR+fWsfCVhsLr1P+RnOG6WMp
 ScJgCp8Z/hiFzTHlW3PpPHXyCZbyWR+PmZ9bwbR+LEmjGsF23XVBd4LVeEzYvjaAZ6ML
 wN/g==
X-Gm-Message-State: ACrzQf0brxzhPTcpD8tvQYwf0o4O0YMl7wWpZjnFsVyAN98u/79zekp2
 yY6nRziwUzje1Bjprc1tGd4/tCCyhgg=
X-Google-Smtp-Source: AMsMyM5gS1rSUXeBtE0NkUxfT0EWrDfuapuiuLRx/rdIFdftmEZnyWHfMYvMIXZicki/8DnN0nhk8w==
X-Received: by 2002:adf:dd0c:0:b0:22e:4bf6:6c08 with SMTP id
 a12-20020adfdd0c000000b0022e4bf66c08mr6904048wrm.617.1665250582561; 
 Sat, 08 Oct 2022 10:36:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m15-20020a5d624f000000b0022e327f849fsm4894388wrv.5.2022.10.08.10.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 10:36:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Oct 2022 19:36:19 +0200
Message-Id: <20221008173619.76606-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=My+yEWazAA52DggW5bkPuGUGewuU6U4mWvfi48NExeQ=;
 b=ptXyBlOEWtemwqFXU5sSSlHjkP2bOsV9ctdr2ZzX7jaEIN9vjUe3wqg+Ih8Q9Q3kDp
 hDXqfdn7v5x2D16C5qT4vH7JRP0v0uctXmqNnxspylN6hJCrtYJ66fB8dKeJzQxL3psY
 8ST6ytF7uB9s2nGFqBSkBSjjjY8vu3mDjOyP+45WJaVxq8XeA8xJoaAjhKHb1vF162U/
 q7f8l2o+4Fdli8MatnqVoHwltUuFGsK2JbR4+uW3grDuvfQmo/cjt/wvZJlaVuPV4tWA
 aBLbs2AnoK/kYxVpop7mcpdwnsM81LpiuQ46pLj3P5kbNJDEtSgAXhW9z5c9rrRHe9kG
 Oupg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ptXyBlOE
Subject: [Buildroot] [PATCH 1/1] package/libinput: add LIBINPUT_CPE_ID_VENDOR
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:freedesktop:libinput is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreedesktop%3Alibinput

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libinput/libinput.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 3454907bab..d9a7ed1519 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -11,6 +11,7 @@ LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
 LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
+LIBINPUT_CPE_ID_VENDOR = freedesktop
 # Tests need fork, so just disable them everywhere.
 LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
