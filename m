Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C4DCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 11:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C014062C;
	Sun, 24 Sep 2023 11:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74C014062C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FHr2MJrxTEC2; Sun, 24 Sep 2023 11:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D9E4062E;
	Sun, 24 Sep 2023 11:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D9E4062E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 534051BF33E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C92C81A34
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C92C81A34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpbEPdwPzZp7 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 11:59:18 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C20981A12
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 11:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C20981A12
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-405505b07dfso13876395e9.0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 04:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695556756; x=1696161556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bnZu0jpEep7f7TxYkUflfRNq45TJsFz3eoehlzvmYaE=;
 b=aEahtmuzjf3O2iPICvuREDRAJZtPYYjnKGZtAuhdOQ2yczYdx3li90t07yUCMQbxyv
 LlZT/omBDHQXoVLsEH6tdseWTi+1A7oGhwYHy+0XzCnSk0GOFLUU8xv3R7Lfz7sbgcV+
 Q+Rx2b2wzp3NIa3oOY1QzPPLzBKHSOp6RXHy90P/I/4f3vjUrTHe66lR+EtkfcjzBfB3
 uglsogjrpGl0XhO7iVVb6K4cp5M/1VKPMnQZ9xAJdBGy8beFnLo3uKxKyzTfXUG2KJEY
 C8W5WrvCwL9sAEhEpanXqgiRSSSozJQSVWEdLq0WaNyj+GL1W3VDHYXYoaLBHcDS2lS0
 FIFw==
X-Gm-Message-State: AOJu0Yz9nBYgWFK6nsPEKbRXkecJdfy+zt8pxXAvACUgKVSgY9NcMxrj
 s8qZbAwr+1886/MIyWJtRjiMryb6b7o=
X-Google-Smtp-Source: AGHT+IHsShubCnmjC9u17KPvsfxkcrYUrjSzcW7vEX2u4A6lF+jMii0Vv0+g0AhXuNfX0tXOkCCvbw==
X-Received: by 2002:a7b:cc88:0:b0:405:409e:1fcb with SMTP id
 p8-20020a7bcc88000000b00405409e1fcbmr3350586wma.5.1695556755674; 
 Sun, 24 Sep 2023 04:59:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcc88000000b003fbe4cecc3bsm4502258wma.16.2023.09.24.04.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 04:59:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 13:59:13 +0200
Message-Id: <20230924115913.46048-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695556756; x=1696161556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bnZu0jpEep7f7TxYkUflfRNq45TJsFz3eoehlzvmYaE=;
 b=U0XUUlD+2IWU+h/fX2VQZNC76klMZSkAblyytFtc/LtSfQTXQkY7QwX8CmAc8UDe+1
 5mB8RY6rMgrVbJdd3TWlKFSLCNBfscvFncvFMgLKtMn7Nb43oWn5ENBGT4YcRkDqZhQC
 GBLRGQxnizeaw3ehggbKIORiDPSHP7TwiT985ER0WcjwQZYxaLWCt7P7rb61ObeLfRNB
 LH2X5+Kwop4Ac2sCd/rTPgsZEwFQHQlHUxhZosrDmIDSKlCj2Rv70NmmK7FcABFKyuQF
 zcv7vS2im1/Ypeo1PrXEFrCMTTHuBIBlfUksZHmG1LpHJXKFTERv8rMxmYjz/UbZQr9c
 oeGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U0XUUlD+
Subject: [Buildroot] [PATCH 1/1] package/newt: bump to version 0.52.23
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

https://pagure.io/newt/blob/6e3a852c6becac7f2f231453682089577ad3de3d/f/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/newt/newt.hash | 4 ++--
 package/newt/newt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index 36487d998e..6d5f7c3dca 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,5 +1,5 @@
 # From https://releases.pagure.org/newt/CHECKSUMS
-sha256  265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac5abb31  newt-0.52.21.tar.gz
-sha512  d53d927996d17223e688bf54dccfabb2a3dc02bfe38ffc455964e86feaca3cd9f9ab5b19774433be430fa4d761cd9b6680b558f297acb86f80daeb6942f7d23c  newt-0.52.21.tar.gz
+sha256  caa372907b14ececfe298f0d512a62f41d33b290610244a58aed07bbc5ada12a  newt-0.52.23.tar.gz
+sha512  c845d03946f72a6b46301152d7dc308f71d17b03d255d73d02ea7deb5392e22522dc8504f941fcffe5309c6c10f1b56742dac8585a16b0dc7e0c463f18871dda  newt-0.52.23.tar.gz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index b39acb0fcf..3c9efe132f 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWT_VERSION = 0.52.21
+NEWT_VERSION = 0.52.23
 NEWT_SITE = https://pagure.io/releases/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
