Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F69C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 21:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B88410C9;
	Mon,  6 Jun 2022 21:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29vbg2gy2svt; Mon,  6 Jun 2022 21:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B81410C2;
	Mon,  6 Jun 2022 21:17:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45EC41BF279
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3361A40992
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ivluq-A5h-q6 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 21:17:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B70440179
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 21:17:14 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id o10so20455558edi.1
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 14:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rxDUTFHsJnVC2XSEE2Ee8BQnsJzUpIIDNYBlnnlbxY4=;
 b=m2+B6gVzPfQPJtiWJ31QiLsNDVA/zTGxZSeXWvBNukVDrufFBNbAFCpdq8MQAn0yHj
 AFX6lAmCVK05Q/Rbl+KCDrnzuFktJ0f9WQVh/5xmIYM9ucW5i+4OruFkdy8WVDl8P+0t
 Jqw7JNXe/FeevKfhE6kkh5elZlFw5EM6fTZZ1aj237fLhrX+sEgDFEJ8Hu2q+720nTRb
 ieU8iGb0iuLzR7U3MN7oq4dicBMc9K0sMzzUPyx2X5edcjP+Xkl/iRY4aksD86mVsf+G
 kJFNXekEOzUd1rudXzSBCqCdHHBQX0BfAA771Co8tNULzkqa2vZ0dBvCJOTvOLJ0mEs2
 j+IA==
X-Gm-Message-State: AOAM532CrDkkNjXOLnE2opGVrknTwxhLTRXOZFlmPZcimGSaq4G0UIPl
 I7mn6sApjVVvaKV3gizxPI1JU4GBvxcNCQ==
X-Google-Smtp-Source: ABdhPJwLpE/+nwa17HWANHLj8uZO3ZGTKW8ouLn3y90Dzx+AS+PGtpkwn2nA6ZJjMtETU52taLTnAw==
X-Received: by 2002:a05:6402:5191:b0:42f:b303:ed61 with SMTP id
 q17-20020a056402519100b0042fb303ed61mr18588196edd.233.1654550233131; 
 Mon, 06 Jun 2022 14:17:13 -0700 (PDT)
Received: from localhost.localdomain (ip-109-42-113-141.web.vodafone.de.
 [109.42.113.141]) by smtp.gmail.com with ESMTPSA id
 qu19-20020a170907111300b006fe960c5c5asm6791862ejb.126.2022.06.06.14.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 14:17:12 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 23:17:04 +0200
Message-Id: <20220606211704.609386-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: fix build on armeb
 targets
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
Cc: Cyril Bur <cyrilbur@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 2d8a4e1fdd0ce0 ("fix build on big endian aarch64 targets")
already fixed this on aarch64 targets, but as recent build tests
discovered, we have the same issue with 32-bit big endian arm targets.
Thus let's also look on the BR2_armeb switch when configuring the
kvm-unit-tests.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 A failed build can be seen here:
 http://autobuild.buildroot.net/results/9a3783cefe542db58cc8a6bd4a6c2746a296c892

 package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index dd8f153710..f2ec3b2953 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -12,7 +12,7 @@ KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
 ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 KVM_UNIT_TESTS_ARCH = aarch64
-else ifeq ($(BR2_arm),y)
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
 KVM_UNIT_TESTS_ARCH = arm
 else ifeq ($(BR2_i386),y)
 KVM_UNIT_TESTS_ARCH = i386
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
