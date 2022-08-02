Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB47C00144
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 01:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DDE1813E4;
	Tue,  2 Aug 2022 01:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DDE1813E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4I9XNIEC1um; Tue,  2 Aug 2022 01:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCD3813ED;
	Tue,  2 Aug 2022 01:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FCD3813ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BCF91BF28B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 01:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C24D81331
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 01:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C24D81331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J73BCs-OB1Jf for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 01:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57E648130D
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57E648130D
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 01:34:03 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id w10so12100422plq.0
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 18:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=noTGwBf0UnqgjZXbucLCOAMop9kkueN54QwPyFNLZ1w=;
 b=YpKhQqNwGVqtwuvrqEi7mWG21dbNeBelJLsGVkT7VZqDxSd3CcpGcgt47bbJh6Qf2J
 GcWuf+IpETHTECPypsQhVYPK/kIJ1p8JMg2ARnCymW119uBilH3J+2vd9vVVS3jc8xd5
 y00QWL2BWvO8aJj7PAvrWrMHZwK6htR5bQzG5UN4M6iZGDq/0vpSEk/UsMOQggJNcn5K
 Q8QGPu1v15XBLpe3C/946T3eBECjbxXRoZRuI95ynqi2yaYdxs5GVJDbe0ZuvX8NZaCb
 BC7SkVApnM0jtvB1UX4cTHU6D/EMnCW1xgIJDpel3ymQi58gxA8CeJaOYjwX8v2ZVr/5
 zxiw==
X-Gm-Message-State: ACgBeo0XEKcSgfnWUTBtS8AXJ8WlFZVOWSUOsVBqT1br4PLMAUEcJrl0
 CMpHlAOVL87YGXre/e2gYLHjMBJjB4VYQQ==
X-Google-Smtp-Source: AA6agR53QW3T8AxIQJySoFUFxTd7KmILcjqXaiO7RUF1VBWMFbMOjFv+rUnclGJvQ2MpIOsmlytMrg==
X-Received: by 2002:a17:90b:33cd:b0:1f2:b0bd:6da with SMTP id
 lk13-20020a17090b33cd00b001f2b0bd06damr22587959pjb.95.1659404042217; 
 Mon, 01 Aug 2022 18:34:02 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y15-20020a17090a16cf00b001f216a9d021sm12315264pje.40.2022.08.01.18.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 18:34:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  1 Aug 2022 18:33:59 -0700
Message-Id: <20220802013359.96843-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to 1.18.5
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

go1.18.4 includes security fixes to the compress/gzip, encoding/gob,
encoding/xml, go/parser, io/fs, net/http, and path/filepath packages, as well as
bug fixes to the compiler, the go command, the linker, the runtime, and the
runtime/metrics package.

go1.18.5 includes security fixes to the encoding/gob and math/big packages, as
well as bug fixes to the compiler, the go command, the runtime, and the testing
package.

https://go.dev/doc/devel/release#go1.18.minor

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 4 ++--
 package/go/go.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 45af1fc06f..2a0f02abfd 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
-# From https://golang.org/dl/
-sha256  0012386ddcbb5f3350e407c679923811dbd283fcdc421724931614a842ecbc2d  go1.18.3.src.tar.gz
+# From https://go.dev/dl
+sha256  9920d3306a1ac536cdd2c796d6cb3c54bc559c226fc3cc39c32f1e0bd7f50d2a  go1.18.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 172bf16b6f..16602e590b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.3
+GO_VERSION = 1.18.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
