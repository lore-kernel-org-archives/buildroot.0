Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB2DC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 22:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 809C560B71;
	Fri, 29 Jul 2022 22:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 809C560B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhmLJBRLZb4S; Fri, 29 Jul 2022 22:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E10960B73;
	Fri, 29 Jul 2022 22:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E10960B73
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1BA91BF45A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CA6A401B7
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA6A401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXgZIZVxZBMH for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 22:08:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E5E5400F6
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E5E5400F6
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 22:08:01 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id bf13so4968362pgb.11
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 15:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w70F1b0DMv78ogmahX289W+e0mZGIOr6LWaZDYV+v8g=;
 b=bfRfEzmT4M+zpXywxV8mETPwZCnk3tOgj/mwplPbox1Dj+9Hx6dQlUPN1noyKja99u
 SXlzqqc8TYK1GnUnMkfWCV8M8FX9WPu5ghzXtgKwXXLXns55/9zz8judumC8z5eKXJwG
 MwFuRlaagG9tPZgcandcYIjrRFD53v56dF1DqzrkxtKX6csK7OCI4bA600BtwrGYUQ79
 1JpD1E0a15/WPxj0Oaq5xaxq41svtsFwnZBpMi4PJ/eEeqGULu14l2YybGOVPObPYv29
 RLK/9l5tqAgWHxqcjOk4gLv68KCA7QAP3et3+QtuQQ/muidMYgAezpdjpncyzk7iCFXP
 bfTA==
X-Gm-Message-State: AJIora9yKuD0+nO7qJpvBOkqlY3dRbYBTx3p5sR/GSwa+41qQYNUyE8q
 5FVvyAtdHQDub4Xt/0FhJJ/zNdPZSSQ=
X-Google-Smtp-Source: AGRyM1t5HsR60XviEcZMJ2DVGC8/sfCpmZgiYaMM8V/IAkNzF3eWr1VgHNPZcf565FwMKs2+gnbsZg==
X-Received: by 2002:a65:42cc:0:b0:3a9:f71f:33f9 with SMTP id
 l12-20020a6542cc000000b003a9f71f33f9mr4428694pgp.391.1659132481052; 
 Fri, 29 Jul 2022 15:08:01 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a17090a638f00b001f04479017fsm3563867pjj.29.2022.07.29.15.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 15:08:00 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 07:07:48 +0900
Message-Id: <20220729220748.3737915-1-shorne@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w70F1b0DMv78ogmahX289W+e0mZGIOr6LWaZDYV+v8g=;
 b=OD9ALjb0HCmSFt1NoWQ3GeL36SnfP/1Nm8P15YYZVLh9HjMtfhr6T25olr1YGZStaz
 L1YpDJK8elKo71iqgigbCseEV+c7I02GsFRtz20/iBSL9sn8DxNhVnV1qrfCAle+CdSs
 BJPdk9X491VIxqztvz8AjhgHxuTm3Bmd77zwL9xeGN2e7bSCEgvwwJQtL7e1GaB3o+UX
 lStDkkdVo0mrn5hj7f3D0vWvTWNLdoieKIRjYQ3MOqsZs+H06Xxus4oGjYWS4OtQVFsl
 P7eYQmX/6MRLeg/CUxecP8RlSZ92RHZH3wcqmtqWHHfL+r+P+C4H4PZGeU2M0y/+ArHK
 vkpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OD9ALjb0
Subject: [Buildroot] [PATCH] package/gdb: Enable OpenRISC GDB support
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
Cc: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The OpenRiSC gdb port has supported native debugging since version 8.3
and remote debugging since before that.  So it is now safe to enabled
this.

This patch removes the conditions blocking gdb from being built on or1k
architecture builds.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 package/gdb/Config.in      | 1 -
 package/gdb/Config.in.host | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index a39837fe71..2708834ee2 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
-	depends on !BR2_or1k
 
 comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 43af64a1ed..dfa9f8c384 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -3,7 +3,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
-	depends on !BR2_or1k
 
 comment "Host GDB Options"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
