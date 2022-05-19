Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B99C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63EEF843DE;
	Thu, 19 May 2022 14:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kfK2mfOLTWml; Thu, 19 May 2022 14:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AA9F842D5;
	Thu, 19 May 2022 14:12:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0BFA1BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D059B612E7
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8eEFZZ1Usa4Y for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C546960EAC
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id k126so2953088wme.2
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6wuphUP5Z0lgINg7CiCdrWqaUBTSnVgNcMekIDOCIfk=;
 b=RIx6P2Hm9cZAOpuuJpj2bhh/5xDq8nFlyzrEqNIf195pFSU8V55bUtNvt1fdrGk2TL
 ZmSvBBU+AD5m5BBXr9xKWXufVwlXBridGcIyPh5z/dPfrmSXnI3425VGwm0rt5ZbKDxg
 GsL1xMhvhpz5xCqiCLAnLVdKnMA8PRdPFf9LxO59K8xzAb30ouIGc6rLeCWBzKUl+AcG
 YY7jfPnOR5VHNZox7eRld4TCgp9P9Q9YvACQ6wW499Ps/NKvGr4i6C1Hx2Su4RwQuv4S
 RB7jKLbVx85u+ZJluVpzAqNBoMIcCpALvEdewcHTD4KjpEViHmXn16glmzOCBq73IWcN
 T75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6wuphUP5Z0lgINg7CiCdrWqaUBTSnVgNcMekIDOCIfk=;
 b=rJdc4iyFwtUR2/XkTTlRgNOdxcIEFKu5o4tmpoBULfjy66gqqobq5+MDmLZqEwXndz
 qgGlXg54elb0Wtkzuhu++S3p2ZQvYTIcobFe5fcllOSFbZs9+daL9Zl1SZOvT++BuM2X
 p5WKBFYBMu/OYYMZB1XZlCnQ4uPH2VXl2HHTBAo9rKrfRc4B2gDo2UvG4KpIfs/vzol2
 Hg9Kc0ObJy4VOXbadIALg3ln1rxfPQimWKFWcndBXB8WDK6qBS4SsjYLdL6YTAQaDOjF
 WxHt4sb3B6Lama+af+LjBvIeyVyW4iSojvq5C7+IQv8Ni5z6l3CJByn2QVnDLYMPauMo
 2PMA==
X-Gm-Message-State: AOAM532tHREmKGYJ+PbNlzBR6RWGyMirvGVaZgEP5CubNKc70twWlW/7
 kz9WIrymL2v9Gzk7pVMW/DnHR8Liq50=
X-Google-Smtp-Source: ABdhPJwN8bFvVcthCFwHXKmvkXZdllBM9wKs3oj8qrNguNLFoY5FaH6vozc1Sma6asMLHynoD/Sg+A==
X-Received: by 2002:a05:600c:a47:b0:37c:965:2b6f with SMTP id
 c7-20020a05600c0a4700b0037c09652b6fmr3964699wmq.31.1652969328071; 
 Thu, 19 May 2022 07:08:48 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:47 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:08:08 +0200
Message-Id: <20220519140810.1953601-19-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 18/20] package/erlang-p1-sip: bump version to
 1.0.47
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The copyright year in the license file has been updated to 2022, hence
the new license hash.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-sip/erlang-p1-sip.hash | 4 ++--
 package/erlang-p1-sip/erlang-p1-sip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index e52371e404..b20df00280 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b46349a7077d8e5f36a216ada4a5c0b51ef3d66005606beb0ea3962069f215a7  erlang-p1-sip-1.0.38.tar.gz
-sha256  6cd4871db940d055cf272c12c10e0c08febdc94362e404390758fde34b4ce01a  LICENSE.txt
+sha256  1de406bc59c30e2697b8b29cc0ad0e370e6f5a5d777d37e022d195586b80643d  erlang-p1-sip-1.0.47.tar.gz
+sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 2d2f0110c3..f0e999ec54 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.38
+ERLANG_P1_SIP_VERSION = 1.0.47
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
