Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88CAC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59F7340569;
	Tue,  7 Jun 2022 20:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AJqovrh-XsH; Tue,  7 Jun 2022 20:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65AAB4016F;
	Tue,  7 Jun 2022 20:36:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 020371BF25B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E533C60B60
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asZvDmNXfDTH for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:36:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3F3760A9B
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:36:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B8CC124000A;
 Tue,  7 Jun 2022 20:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654634169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIQyJsBdJt2nY9+NT+asmCr/ZMMPqDyVBGynR6j2hvI=;
 b=dcx8h1yQqiTs7WIQy7hLoqpcMDSZFNopdWjbqWmO+zEfj8MmAIT/sycq2ojVbDJyu7kJFZ
 TYrYYHdxYQ/D0g7D7eDS4Y6zmqIAHrvHEb+422tPanLkhUFrFOXYSLA6aS5rTwbWcYGqv+
 AXzOQ1o13LqfVjHcveFtvNxbGbTCzOg93VAqoJlYumntstshClvmaEo/DimeeMc/0o4siS
 3+hyY37uY8pBzsmXWCouvs59b5MtWWpckKPWBX7VP+tLYZCpfiIf9Sopu3kVpwGEzSVwcF
 lRwbtOBJkiHjv0nwq/s+L7UAdO3dkuUk1XRqPaSU0XXbQiBcREM0JcAXXS4cYw==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Jun 2022 22:35:44 +0200
Message-Id: <20220607203553.3307479-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
References: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/11] support/scripts/gen-bootlin-toolchains:
 improve dependencies of ARM toolchains
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

The current description of the Bootlin ARM toolchains allows them to
be selected for ARM big endian configurations, which obviously doesn't
work as these Bootlin ARM toolchains are little endian only.

We fix this by adding BR2_arm in the list of conditions for those
toolchains.

Will allow to fix:

  http://autobuild.buildroot.net/results/7befbb686bb972016ba4e742976dcdb3fed1be11/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 16773cd9cb..df1c000f9b 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -41,22 +41,22 @@ arches = {
         'prefix': 'arc',
     },
     'armv5-eabi': {
-        'conditions': ['BR2_ARM_CPU_ARMV5', 'BR2_ARM_EABI'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV5', 'BR2_ARM_EABI'],
         'test_options': ['BR2_arm', 'BR2_arm926t', 'BR2_ARM_EABI'],
         'prefix': 'arm',
     },
     'armv6-eabihf': {
-        'conditions': ['BR2_ARM_CPU_ARMV6', 'BR2_ARM_EABIHF'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV6', 'BR2_ARM_EABIHF'],
         'test_options': ['BR2_arm', 'BR2_arm1176jzf_s', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armv7-eabihf': {
-        'conditions': ['BR2_ARM_CPU_ARMV7A', 'BR2_ARM_EABIHF'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV7A', 'BR2_ARM_EABIHF'],
         'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armv7m': {
-        'conditions': ['BR2_ARM_CPU_ARMV7M'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV7M'],
         'test_options': ['BR2_arm', 'BR2_cortex_m4'],
         'prefix': 'arm',
     },
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
