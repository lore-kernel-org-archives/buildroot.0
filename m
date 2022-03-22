Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569E1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 17:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB05F61263;
	Tue, 22 Mar 2022 17:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89ThldYwgDWz; Tue, 22 Mar 2022 17:08:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 230C7611B3;
	Tue, 22 Mar 2022 17:08:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F09D1BF5DD
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 17:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8885240270
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 17:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEzmaR1aVE1A for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 17:08:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A843140246
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647968889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qrppQ8IPZuFVonEaiQ2bQqBj4Pg+h/KX6eJITWxKEFY=;
 b=EN9wAhkG5ITjCO9FfVlKY3keaMCosox9Z0uvJH9S+hvcPTW64RYqRbz2S/cCOQsgXmsnrx
 N7jSv8K1CnGJqER177HhVTSFdb6ZOHJ8uNLxrhpwIhPuDiKbS8hBUP6CzETTbGsHcPX40U
 tRz1LixGMhac7W19cVsY+eqDbk2UbhU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-8YsZc4VKP9OR20oRk-ZeRw-1; Tue, 22 Mar 2022 13:08:06 -0400
X-MC-Unique: 8YsZc4VKP9OR20oRk-ZeRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4F4F803524;
 Tue, 22 Mar 2022 17:08:05 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.194.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDA0E145B960;
 Tue, 22 Mar 2022 17:08:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 18:08:00 +0100
Message-Id: <20220322170800.1872403-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: add more arm support
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
Cc: Cornelia Huck <cohuck@redhat.com>, Matt Weber <matthew.weber@collins.com>,
 Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add some more cortexes with VHE, and enable aarch64.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

Resent because I was subscribed with a different email address.
Sorry about the spam.

---
 package/kvm-unit-tests/Config.in         | 5 ++++-
 package/kvm-unit-tests/kvm-unit-tests.mk | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index e470dd6157f0..b084375e62e9 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -3,7 +3,10 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 	# On ARM, it uses virtualization extensions
 	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
 		BR2_cortex_a15 || BR2_cortex_a15_a7 || \
-		BR2_cortex_a17 || BR2_cortex_a17_a7
+		BR2_cortex_a17 || BR2_cortex_a17_a7 || \
+		BR2_cortex_a55 || BR2_cortex_a75 || \
+		BR2_cortex_a75_a55 || BR2_cortex_a76 || \
+		BR2_cortex_a76_a55
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc64le
 
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index d610442e039f..d72eba02bc3b 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -10,7 +10,9 @@ KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive
 KVM_UNIT_TESTS_LICENSE = LGPL-2.0
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
-ifeq ($(BR2_arm),y)
+ifeq ($(BR2_aarch64),y)
+KVM_UNIT_TESTS_ARCH = aarch64
+else ifeq ($(BR2_arm),y)
 KVM_UNIT_TESTS_ARCH = arm
 else ifeq ($(BR2_i386),y)
 KVM_UNIT_TESTS_ARCH = i386
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
