Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25716C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 07:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DB4A60BC5;
	Wed, 15 Feb 2023 07:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DB4A60BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LYbTrP4MTi2; Wed, 15 Feb 2023 07:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E9960AEE;
	Wed, 15 Feb 2023 07:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5E9960AEE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC1E1BF5A7
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 07:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73F0560AEE
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 07:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73F0560AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gk9AS1X3MlGh for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 07:29:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AB50607BC
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AB50607BC
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 07:29:27 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id jk14so822208plb.8
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 23:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2DLD6cQG5d47MAKGcWjPvj2V0xTytEib3700rdnBuHU=;
 b=5173yLJXbHzq8t8IK979TSreNTsdOVigHr29nPgU2d3SouADwHHqrcAg494OtgGclA
 v+A3D7wEeRK6vrvXUlxr/fzsJxCbTUL51eJcAOPbJA9P4NWPFE9AuiBnE/QyduyRlZoQ
 hH7gewNtJurSCwQ3sF8VqvgKpEQLPPbdOPBZgwBZFXlNNP0f9uW3nUTeArtfgUfXFsAb
 vylc74YZrrNnjwscTe6baBWZpkgmDcLjxBBoT0LlcND7qGyLVW1NIt7OLnOaGw5pXpyM
 3mKNtYcU0JMluCu3iC/0aerRu8LaaF8dsSZPxAFrfl5zjpCDxcqabG9Sb9lyamJjGS1t
 G1tQ==
X-Gm-Message-State: AO0yUKV8x0O8RwIxNIDNMHOEm38y6MsWuDRad7kiejV1sMJBXaq8Wa2N
 7cFkqePbP/sYkirzJdk4eNK7eMAbee8=
X-Google-Smtp-Source: AK7set9sRb9CpWWZYUAUwionOfr6OcaoNr0VljpRQMBFh1bhz7IuUHfPlY4cCuP8vf/ByX+6XwxpYQ==
X-Received: by 2002:a17:902:f541:b0:19a:a815:2876 with SMTP id
 h1-20020a170902f54100b0019aa8152876mr1630863plf.62.1676446166543; 
 Tue, 14 Feb 2023 23:29:26 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 p7-20020a170902b08700b0019aaccb665bsm3837527plr.245.2023.02.14.23.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 23:29:25 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 23:29:23 -0800
Message-Id: <20230215072923.184867-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 1.19.6
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.19.6 (released 2023-02-14) includes security fixes to the crypto/tls,
mime/multipart, net/http, and path/filepath packages, as well as bug fixes to
the go command, the linker, the runtime, and the crypto/x509, net/http, and time
packages. See the Go 1.19.6 milestone on the Go issue tracker for details.

CVE-2022-41725: net/http, mime/multipart: denial of service from excessive resource consumption
CVE-2022-41724: crypto/tls: large handshake records may cause panics
CVE-2022-41723: net/http: avoid quadratic complexity in HPACK decoding

https://go.dev/doc/devel/release#go1.19.minor

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 4c22f0f274..8254a91524 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f  go1.19.5.src.tar.gz
+sha256  d7f0013f82e6d7f862cc6cb5c8cdb48eef5f2e239b35baa97e2f1a7466043767  go1.19.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index c38ae0b99c..a9056da47b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.5
+GO_VERSION = 1.19.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
