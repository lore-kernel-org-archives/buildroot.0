Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F89C54EBD
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 04:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4517C81CEF;
	Thu, 12 Jan 2023 04:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4517C81CEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8feXhzm4TplS; Thu, 12 Jan 2023 04:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B1B881CA5;
	Thu, 12 Jan 2023 04:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B1B881CA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A86811BF381
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 04:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 815E34026A
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 04:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 815E34026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C7MMgIwWmfIT for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 04:05:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAAAE40022
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAAAE40022
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 04:05:07 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso19467350pjd.5
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 20:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eSyvJO5u02LOWys78FeHQezL6wn1JYk96RyZvUUX/WA=;
 b=uNzJ21zh6G7S/YLTaP/PQP2DC4CoKoTXuRtpx/udoS85eDvtrbhcwPnkuQk2+H7jB5
 5pN3Iz0xO6hPqLP65okL35BAbCpYOui6dW6LdjkIbtf4IVvKkW1zhpwwkFcs9tHdb7Q4
 lVLIg0Wpksyn4nWkfIok3p9Lyu8GKHn4vYD5EgP8Q5w7+FVglIYJFD/CooD6gJhp77ZU
 BMnzPj4i6ANNoONTrYMJGkDQx+QkB6TG2KZTcjlDOhf56C1GbehzqKT7awwckExdUtvr
 4Hn5O+bdUk774oLJZMinpFhINqaq0Y/MX5rD3UTNIM8Q/3HS5IVSDlHSyERIS5kwO991
 vjFQ==
X-Gm-Message-State: AFqh2kp2JrlA+bJuVGGMU+W6/aj45iqNxgULKo9SF5p2j/3dbwvHIT99
 k0E1Kvio7ngox72iLVmcvwSFWCoOZvygrw==
X-Google-Smtp-Source: AMrXdXtSAvIOJoUXJwG8nDSE0jxeQZm+5511v6oP2p0mXCy8AYZp1SpUaC9e/0wTj6SLk2pU81qFng==
X-Received: by 2002:a05:6a20:7528:b0:b0:3329:c395 with SMTP id
 r40-20020a056a20752800b000b03329c395mr4984279pzd.30.1673496306715; 
 Wed, 11 Jan 2023 20:05:06 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y9-20020aa78f29000000b0056b9ec7e2desm10751386pfr.125.2023.01.11.20.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 20:05:06 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 20:05:01 -0800
Message-Id: <20230112040501.328931-1-christian@paral.in>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.19.5
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

go1.19.5 (released 2023-01-10) includes fixes to the compiler, the linker, and
the crypto/x509, net/http, sync/atomic, and syscall packages.

https://github.com/golang/go/issues?q=milestone%3AGo1.19.5+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index d35db10213..4c22f0f274 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368  go1.19.4.src.tar.gz
+sha256  8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f  go1.19.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 44e0c622c9..d3ed07f03b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.4
+GO_VERSION = 1.19.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
