Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0674CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 12:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D43760B98;
	Sun, 24 Sep 2023 12:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D43760B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84kHw1sh9NSF; Sun, 24 Sep 2023 12:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2AA060AC2;
	Sun, 24 Sep 2023 12:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2AA060AC2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0408D1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE98760AC2
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE98760AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iXsd4TSKUi9U for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 12:08:31 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C61F607A4
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 12:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C61F607A4
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32008e339adso4442979f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 05:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695557309; x=1696162109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LrhTh1OkaBCY9q5sFQIDe39X+dykbW9/MbpTx/kHcWs=;
 b=YEQ/wk0YLYVHUIAt3Ths9VN0bb+Cpt1ARygb+mHOGlP8/yMmdKb5D2FeUX22xuSnJa
 qQdoBH3Ep3AhMk/JizQv+pz3PnYxqlF+RWP/jIe2eA8SUDjaxvU+Hv+gigB2XgMj02ge
 RQKlVvI2WkP7qYmTvZZYf5Cm6Gzgiq5mcaVHHSQeyVmoQrvdXtdn573gppb5YtbSws+u
 mOqFEPrQgADRGgKnyZlZ94Xm/haLL1SmMNFp8yGtWQJlU/veX0cSDTmLIGFtmr2E9/cK
 S21JuiAbB3EnkUoiMp01jL5TOpkPsCpISNIo45K2vhNpODc3M/nogSYAh4FE0mCeWzRR
 QB8Q==
X-Gm-Message-State: AOJu0Yz+my/AY8OWvxURFL4MQXp9mEK74MyCrTJq+KEbfXQNNqq5tUnA
 D/d8QT7UZx+JBYijx/ScoA63Zp4kCEw=
X-Google-Smtp-Source: AGHT+IERomvnv2bfRYSVeNgZYit387XY1liVwNb0sZxseAjVY3PF+rEqWl+hgKnE/OMZZqTU58ClIg==
X-Received: by 2002:a05:6000:185:b0:321:8d08:855e with SMTP id
 p5-20020a056000018500b003218d08855emr3377973wrx.24.1695557309073; 
 Sun, 24 Sep 2023 05:08:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s13-20020a5d424d000000b0031f729d883asm9142716wrr.42.2023.09.24.05.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 05:08:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 14:08:26 +0200
Message-Id: <20230924120826.112454-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695557309; x=1696162109; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LrhTh1OkaBCY9q5sFQIDe39X+dykbW9/MbpTx/kHcWs=;
 b=GLqWS+ye0aOJeXAnxoMwXgueUrbRwlu+X9hw+BwiAnUfJim5iaqK5GddZ46nYGzahq
 LULsCN6dkybHOHX20UHaqERqXo43NK7F3bTKi2oYYzG2Ji1vYqRjKnyFFmlU+IpdaQXH
 LM3RbTVLKY76XDjmSe+dW9wGo61G/uMMuRb//BCxIFTaGcSLJzVWMiuhnSKjjMdGXLH1
 8wqmKB0XKVD1iIoq5o3NOr2TC7gstccd75Jlk38SW/wsPNbFqolhGB5zvgY508xtO0YL
 QYnyndccOqbHSGQRoRmzF4ZioB3WXvrB19A2R/qa/zV04+nqNNoOnlMS1T9qrDvvbaXW
 Fmsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GLqWS+ye
Subject: [Buildroot] [PATCH 1/1] package/openipmi: bump to version 2.0.34
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

https://sourceforge.net/p/openipmi/news/2023/09/openipmi-2034-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openipmi/openipmi.hash | 6 +++---
 package/openipmi/openipmi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index fc3cf1a520..fdba9518c7 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
-sha1  4387f227aad92756e296d1c9421e83231d355dbd  OpenIPMI-2.0.33.tar.gz
-md5  923d2914dbbc3307712f8c58401bab0f  OpenIPMI-2.0.33.tar.gz
+sha1  bc910d5d682710e9ff290c33e0780a71edba29d4  OpenIPMI-2.0.34.tar.gz
+md5  9d27cc86b95a29251009db96452e7213  OpenIPMI-2.0.34.tar.gz
 # Locally computed
-sha256  fb53e9ea5e2681cf8af7cda024b1a0044c675f84116ca27ae9616c8b7ad95b49  OpenIPMI-2.0.33.tar.gz
+sha256  93227e43c72b5c3bd5949323e0669aa5527d1a971473a3a365af03fb8284a95f  OpenIPMI-2.0.34.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e  COPYING.BSD
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING.LIB
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index ccf86f93cd..1c406879e3 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.33
+OPENIPMI_VERSION = 2.0.34
 OPENIPMI_SITE = https://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
