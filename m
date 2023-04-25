Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70521C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22DBC61467;
	Tue, 25 Apr 2023 17:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22DBC61467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSLP4fBsRH1S; Tue, 25 Apr 2023 17:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C89F6148D;
	Tue, 25 Apr 2023 17:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C89F6148D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A939D1BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82DBB6145E
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82DBB6145E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kj-k7Q299Wf1 for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF45061458
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF45061458
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:10 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b4e5fdb1eso7282386b3a.1
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442910; x=1685034910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzUFrkPlD/MQGl/7fPLqDQtZ7vVghGe5rdaoBEU351o=;
 b=crWPbODOZLAl8HpiHwL8a+7xUSZjggLtHY0CP+Zm40VVTJB0EJ4W1/wlzhW0l07bvQ
 HBhdiVmyZ/vzKTuLnJ1CKV+qEF3gJ5Z5ccPGli3gWOTNMZYxigUWuOF2be2GjQmW39uN
 VX9WhIQ9fwL0FMIv+KEviWQ3njFe1KL2X7w4llFHnsB7HmXukJ2zEYjDyoOMLnwrzjBb
 a7M11YYYI7fKeVJG9JyJovH6kXi6ZJv2l6/4J6K4lCQhRc0T3MKAdmtP5XvPPnEPVjZb
 rDki55pDiHd8w9pX+KdMs5CyOQCHC5wwMqNdY1WbZcGx/QsHeiXm7HLmH1JQXeusaefR
 Xgrw==
X-Gm-Message-State: AAQBX9d8+3iTjm2T53UBOLiRObGi8or5+2Aa61QFQrkAFoDd7akisdkC
 qr+/PiG7zlx+Hx4aRoK7MylbOO2YbZGQWg==
X-Google-Smtp-Source: AKy350a7Eoac/aNlYSCmavO/2PRQ2MciysX9b/I9i/b+t5lcwok4gc8zk8SiylIvC6uuE9xGJvLz0w==
X-Received: by 2002:a05:6a00:1a14:b0:63d:2d7d:b6f2 with SMTP id
 g20-20020a056a001a1400b0063d2d7db6f2mr24081972pfv.4.1682442909763; 
 Tue, 25 Apr 2023 10:15:09 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:15:09 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:51 -0700
Message-Id: <20230425171454.48802-11-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442910; x=1685034910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzUFrkPlD/MQGl/7fPLqDQtZ7vVghGe5rdaoBEU351o=;
 b=O39MLot23pA8kJxjFGjPxerrfJ4orYmnum+d81ORSt1ENpG1WwMFPJjUzS/Uyw+vsg
 MftfL9mqgU5Nj6sxxZcmZh5oHvjuRyo2vHkeWiPbQI/pEPrjP7tM+A38hKkaGPSPRYFb
 kUEpi40wN1T37MsNtXEIG/PWO7PnqGx3wGi3ajcMK00ypAIz2TOmy9xAnR0RwuNDDCkS
 3oQoDtmfpKl7/nLgDBsStz9bkNXL1033eAdQ887VN4APQQqP5E9+fkY9echu9WxZjtDd
 O3tLPU9uXiLhE6A3xI9/rJ55ZZV99/uZZPeHKE27U/fj7WiN4nJ3/kBo7hoh0r//b/Jh
 33Ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=O39MLot2
Subject: [Buildroot] [PATCH v2 10/13] package/audit: bump to version 3.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 6260f158d8..87c00ec241 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  8b4c78632a9301a1c7f859b0e38fc0b9c260b8214d6b7c771bf28b3d73a62597  audit-3.0.7.tar.gz
+sha256  b5cf3cdabb2786c08b1de3599a3b1a547e55f7a9f9c1eb2078f5b44cf44e8378  audit-3.1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 77e7c24000..252f5865b5 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.0.7
+AUDIT_VERSION = 3.1
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
