Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1328C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 20:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64F2B4012F;
	Mon,  5 Feb 2024 20:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64F2B4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZdYVNSGmDyn; Mon,  5 Feb 2024 20:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F5A405B0;
	Mon,  5 Feb 2024 20:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48F5A405B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3355E1BF35A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 20:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A3F8405B0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 20:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A3F8405B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuMgmw71Td0L for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 20:13:49 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B5894012F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 20:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B5894012F
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40fc6578423so30877775e9.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 12:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707164027; x=1707768827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ji6LdAPM/E7efrp1qyF+AOPDh3k27ThmIBU1xVp4itE=;
 b=Yz9jPzEeIiPUyr9NZSMhlm24/sIheFlPMVLvQuy9eMqVkft0bY/P31QyEDRgvolifT
 pBP8/kCKxG4NG8YAcDBm8gk58E1khJNPjqNX3Rf6AnawYjP+MmfsJil6Ph/QiV0Uh2F+
 voDmgtZnZST5YFNxsMHW4RLEM32DzQKPEvGr3Gvt8/JGMRO2HfPhzRNqBZlPN/KFz3kP
 tPvspQVtbE33OrjAnN3kaBL9TDshhjiNEolzbC758QoeuD3/8hywJtVhRowsViXV+Jkb
 jLpkqFp8i97IQjU8wTVuxKZjMoq1/6ME+hR2R7cnN84t64rOm1EmhWOo3Q4RVPmdQP7e
 Iepw==
X-Gm-Message-State: AOJu0YyI9V5dArA/g27pe6qlpsJBTNjUxGVHdP/2JsvxQFMvRI4GYsma
 pw0qhd05BRaRyM1pWDAc3Q3NVDPN+UDQehs1OC9+/YrDJrxuW8G2H3l+tub3Onw=
X-Google-Smtp-Source: AGHT+IH7FVMSV7bcOh8f9oNOqJYbemROxu0BbrjzGwEya3vdvj8V0KLXxP/GUV9DabWVSR5deNdt7g==
X-Received: by 2002:a05:600c:4eca:b0:40e:fc29:f52f with SMTP id
 g10-20020a05600c4eca00b0040efc29f52fmr78181wmq.21.1707164026465; 
 Mon, 05 Feb 2024 12:13:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l13-20020a5d674d000000b0033b459e8f60sm141899wrw.18.2024.02.05.12.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 12:13:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 21:13:42 +0100
Message-ID: <20240205201342.2995-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707164027; x=1707768827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ji6LdAPM/E7efrp1qyF+AOPDh3k27ThmIBU1xVp4itE=;
 b=lTDrW49rBhmJqJF5pV1L7+kYvr2kn5sGEV0Sa+ZAvFby2D7cOk3eSRJukA+72v7YAc
 GQc5jy2fGFkKL7S9rW5RWBw4+yEElbjUEseoIILZ4DMu4iS2vu3LnSsM3aWdEwqdja1m
 iNdygAd07oPlPsoTCmn3TpiI4c7OS2/EGBMH+IY/RbWzOlcGCs2KBevkI1AjR+TfGjl/
 o/VEoo3k1RJVv0PZN3/39SjRzTE92Z2uMuD0hAZf2awhMzIdO7LXTqiPZOMOKweuAJ4H
 dJxUiAlecGU4n7YXzW54OriObcrWWARJq19OMqmtNwjdD6igamX1ZKQiBXN0dVGx/iNB
 Kyow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lTDrW49r
Subject: [Buildroot] [PATCH 1/1] package/gesftpserver: update
 GESFTPSERVER_CPE_ID_VENDOR
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

cpe:2.3:a:green_end:sftpserver has been deprecated in favor of
cpe:2.3:a:greenend:sftpserver in December 2022:

 <cpe-item name="cpe:/a:green_end:sftpserver:0.2.2" deprecated="true" deprecation_date="2022-12-30T17:53:22.797Z">
      <reference href="https://github.com/ewxrjk/sftpserver/releases">Version</reference>
      <reference href="http://www.greenend.org.uk/rjk/sftpserver/">Product</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:green_end:sftpserver:0.2.2:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:greenend:sftpserver:0.2.2:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gesftpserver/gesftpserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 5a3ab0536c..5a7106d707 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -12,7 +12,7 @@ GESFTPSERVER_LICENSE_FILES = COPYING
 
 # "Missing prototype" warning treated as error
 GESFTPSERVER_CONF_OPTS = --disable-warnings-as-errors
-GESFTPSERVER_CPE_ID_VENDOR = green_end
+GESFTPSERVER_CPE_ID_VENDOR = greenend
 GESFTPSERVER_CPE_ID_PRODUCT = sftpserver
 
 # forgets to link against pthread when cross compiling
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
