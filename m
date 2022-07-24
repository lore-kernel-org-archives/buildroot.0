Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06ADC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 06:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBA741296;
	Sun, 24 Jul 2022 06:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FBA741296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aXV36VdfBuZE; Sun, 24 Jul 2022 06:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C4BE4046D;
	Sun, 24 Jul 2022 06:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C4BE4046D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 301121BF588
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 06:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AF7983E76
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 06:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AF7983E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BeK03FohfUc6 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 06:33:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2F6983E5D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2F6983E5D
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 06:33:16 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id n185so4984029wmn.4
 for <buildroot@busybox.net>; Sat, 23 Jul 2022 23:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bdbwue2k8m9Y5deBy5+SyicwFjQyg6lr9kCUfXdsTfY=;
 b=Sw5wLcl0MJHSGwD9SeZ+b9xX9IrR4NWq0Md/hVsr0bhR9WLZiQ7eIowLk6hqB2f9Vn
 C87bbWd8HtX4BRGvA1qGrvL6lWs13cTeI6rZA4WEbFkw42gP1bmytbHAo34PVOpXLpST
 hVctuQ0iRdczlkrM+BAgwoF1xA8I16Bh5hukHRAHSd1f0SJ9P57t18LxYnJkTSFUIDkX
 949PIWPCmjYSUaKFjOrNtt5uY2JcULoSNHT45V5qyQaYIoxWGCUuQszagd/4KnVZXFUU
 7jI3r/CV+jIXhK9m/ZQsF15ZcdjtcrXJn12X0Le92hPkEG7yn7FAzkNA2B8tDewkR5B9
 N0Wg==
X-Gm-Message-State: AJIora/6jOfQbkGz7xrcPghr0dg3ZE7QDFpYM3ykDMtzkZ23nvzbzsng
 COhHf30eEpavEHkitqulDQcxVbBfqis=
X-Google-Smtp-Source: AGRyM1sv+UeY7CVxFPV5qgVg45v8A2Rn6Mi9xvKpKBr0AZE18SEhSlCBUp4OrhrOWvBAcQ4VoLryTw==
X-Received: by 2002:a05:600c:4f0e:b0:3a3:44ee:d40b with SMTP id
 l14-20020a05600c4f0e00b003a344eed40bmr5570566wmq.199.1658644394830; 
 Sat, 23 Jul 2022 23:33:14 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b003a046549a85sm14879059wmq.37.2022.07.23.23.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 23:33:14 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 24 Jul 2022 08:33:11 +0200
Message-Id: <20220724063311.3305437-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bdbwue2k8m9Y5deBy5+SyicwFjQyg6lr9kCUfXdsTfY=;
 b=clDh7HJhzh3uHcdWuIutL4xqPsVGFFj6F/faev8RqMuTYLGM+2yb7GGeuvyYevj29A
 q5uZEhop6LtzceQSXfHg+ntBHnXaIu6I+bzqwp+4XKfqPp4OE979v8DFcdVt48C8R5W1
 wNUEBv+PoG4THNYcDOwmXj8NRPGkeLjHY51X5NUYzaqwim0XcY47r83I15hIQ0tGLFkY
 nlL4K8rcVGzvYbXh5Zi8PJ42vaIbQR00KjuXPOWc7P3NGR2awmHXemIccTpW1i0doFi1
 kW6K3UXT1uDeYn63SmNW5ZN0JCy+0/dFCFFuCKN6Mmkgz3MSNSsSAH5KiFSuaENRsxLn
 dpnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=clDh7HJh
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2022.06
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 31d91457e..a2a022393 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae06f50ba5562721a4e5eb6457e2fea2d07eda63e2abaa8c939c9daf70774804  MoarVM-2022.04.tar.gz
+sha256  598ddf88c18f4d3825970cd391eebcaf66984d43ebf1ef43116356365b6bfe60  MoarVM-2022.06.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 1408f161f..154a783f2 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2022.04
+MOARVM_VERSION = 2022.06
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
