Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0ABC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 19:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A079783134;
	Fri, 17 Dec 2021 19:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dhi0wBKxD3U9; Fri, 17 Dec 2021 19:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F60682F50;
	Fri, 17 Dec 2021 19:21:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0131BF35E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DCCE41F15
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBE4h14vs5LX for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 19:21:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75D8941F13
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 19:21:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r17so5591236wrc.3
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 11:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/NaRbEl+ZDd2k4OSja3jNdxiCRra4LLgq6F4B5f9cD8=;
 b=o/4Vvbqj7TNRnrBqfw1eOnWxhLut2CLACB2+NAegsMWj37SiHhkA8RCeMb3d5kE+ik
 4BC/EwSXsNgTszZ54ED+WJ0BecDSa51C+CNJx6eOelpY5Fvjif3TOG5sSktOR74dnf74
 nCcRIoze6f8XXlgrNYzB2Tlbmb/qrzfKlJRsI/zbki7oQSh4Q9fIx9aWMHcCB+4WIJiv
 1dJP/ZDgrNuwU8D6ktvAm+8nhJ5OTSzHNnHZfnJzAEf5ThIsbPb0bQsM87bCRxB3U8EB
 y1I+omDia5iiMWBVuvpYxXyjcYwdyrKAiS0Rkr/Vwp69hBIZ4QXUOcLQBRLwoMObzxpB
 c16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/NaRbEl+ZDd2k4OSja3jNdxiCRra4LLgq6F4B5f9cD8=;
 b=jFW0Ymmu4CyjY463uiqEfcakqrGRpgMzScmxXD8md0yw2Jf9RueguSnD3QkL0BWvXo
 D3JNNRulk0JsBHtIoQ79fTIyLherpNIveHDahaNh//2wUEo0Z4ZkTIRPqjseU4NPnfsa
 m0oBlHzpUUp/GiYNjOBNDHveZmTnOLDMDtFSRkUIuN5pYkQNZ+BGBrYRLwN9RlZTLJ2U
 A3wCk30qjPIjrys9EDftMMS4bFcGKhXuFNsAGnDLT6SvQOT7iEeoKIQ2Ewnow9l9TO4J
 wl8QuuMwdPF+oD8Zx7B962jJAn63ycjc2nn36DvOzWf1FaCLTlh6tECjiK2gJ7JhHjIu
 d2Ug==
X-Gm-Message-State: AOAM5338tbxbjHR1VYkhSUB4mxiSdQuNlhFAvZ6UsfOZtxY9Br0nUihr
 IMc7bFlgMmNibZ2WXn1WZnWLt/bC30H+QA==
X-Google-Smtp-Source: ABdhPJzCxccYs5vFh5/8rOn57ImUAf1siGz+LH2tKWYJ5TVSG8d8l/Js235wR3m9RjXT6QcCZtQ6FA==
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr3728939wrr.616.1639768891560; 
 Fri, 17 Dec 2021 11:21:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id n14sm9855016wrf.69.2021.12.17.11.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 11:21:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 20:21:04 +0100
Message-Id: <20211217192104.32165-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmediaart: needs host-vala for
 introspection
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
3db4d486d689b4a9d59c8f7637211893b0a1cb1b:

../output-1/build/libmediaart-1.9.5/libmediaart/meson.build:63:2: ERROR: Program 'vapigen' not found

Fixes:
 - http://autobuild.buildroot.org/results/189e12686b059ddadf84ced40efcd9875e5e1521

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmediaart/libmediaart.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index b4c09d85e1..77665fd95b 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -28,7 +28,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBMEDIAART_CONF_OPTS += -Dintrospection=true
-LIBMEDIAART_DEPENDENCIES += gobject-introspection
+LIBMEDIAART_DEPENDENCIES += host-vala gobject-introspection
 else
 LIBMEDIAART_CONF_OPTS += -Dintrospection=false
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
