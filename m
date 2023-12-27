Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677F2C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 17:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1204460B25;
	Wed, 27 Dec 2023 17:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1204460B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mHg3PCEsEfl; Wed, 27 Dec 2023 17:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55DCA60AAF;
	Wed, 27 Dec 2023 17:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55DCA60AAF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A01E31BF5A8
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7305760AAF
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7305760AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WW74uoBKmqS for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 17:13:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 137CB607C0
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 17:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 137CB607C0
Received: by mail.gandi.net (Postfix) with ESMTPA id 136B520003;
 Wed, 27 Dec 2023 17:13:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 18:13:41 +0100
Message-ID: <20231227171343.2903354-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703697227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QDpLSNVbGgQNGSvxPPM2M9Rs4M32nlGgHd/OkzfEfQc=;
 b=XJ7PXHAyIyfD/MdHHXySBX5nAxT735DiIQqpw6jyxTCrjyBEbAAPH+FItB49dsKkK9xOcO
 PAMt4JQZmqUik71VrA+BhC9ivyVNRUWxRUqS5reWdbFXRLDuCERNJJWVXSF4TnuJuYDwvp
 YqepsBnZh0Ne23YVwAJAQHNQyKHxttvffx/x89NPVXXd5/Mxc2YS+aEGFy237o4cGKvEgY
 J/Nk696NEh1MR47NqzmsNOu7exEpinSTnoeyr9oYwJz9AEFU4L6QWJPG56dlKDSA7s3+Ma
 ARKQWqgMteiUKmiV11qDI7vrWN3j/3UdG/UpKQJEpuaOmg8rq1Qc48AOEzyamw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XJ7PXHAy
Subject: [Buildroot] [PATCH 1/2] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit
a0d2a5cfec0ade7cb577cbff25aac289e746e61b ("support/scripts/gen-bootlin-toolchains:
generate BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard"), the
gen-bootlin-toolchains script will generate references to
BR2_ARCH_NEEDS_GCC_AT_LEAST_X including potentially against the "next"
version of gcc.

Indeed, a toolchain using gcc 13.x should have a "depends on
!BR2_ARCH_NEEDS_GCC_AT_LEAST_14" so that once some architectures that
require gcc 14.x are added, such toolchains are not made visible.

In order for this to work, we must have the
BR2_ARCH_NEEDS_GCC_AT_LEAST_x symbol ready for the N+1 version of gcc
compared to the latest one we support.

As we're supporting up to gcc 13.x right now, let's introduce the
symbol BR2_ARCH_NEEDS_GCC_AT_LEAST_14 so that gcc 13.x toolchains can
be marked depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14.

The other alternative would be to make the gen-bootlin-toolchains a
bit smarter, and not emit this depends on
!BR2_ARCH_NEEDS_GCC_AT_LEAST_14 if BR2_ARCH_NEEDS_GCC_AT_LEAST_14 does
not exist. But this would require re-running the script when
BR2_ARCH_NEEDS_GCC_AT_LEAST_14 which we are unlikely to do. While
today, when the script is invoked, the usual check-symbols complains
and reminds us that BR2_ARCH_NEEDS_GCC_AT_LEAST_14 should be added, so
we remember to do it right away.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index e37f4dab1d..9912f9fce6 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -313,6 +313,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
