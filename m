Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1853FC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C586E60C20;
	Tue,  7 Nov 2023 21:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C586E60C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eeBe-1iYtfGp; Tue,  7 Nov 2023 21:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135C960D65;
	Tue,  7 Nov 2023 21:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 135C960D65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78F081BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5127E403E7
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5127E403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGcDl_u2w2ma for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:50:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F98340182
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F98340182
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E05B86C40; Tue,  7 Nov 2023 21:50:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Nov 2023 22:44:32 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 64afb0136d4e0b4398f4026b140a0fb0b57c9b52
X-Git-Newrev: a17b1842370444cfbd51cc588a7061734375b3a5
X-Patchwork-Hint: ignore
Message-Id: <20231107215037.1E05B86C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/nettle: add
 missing host-gmp dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a17b1842370444cfbd51cc588a7061734375b3a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Since the generic package infrastructure removed auto derivation of
host dependencies [1] (2016.08), the host dependencies must be
explicitly set.

While adding the nettle host variant [2] the gmp dependency was not
duplicated and host-nettle was built without host-gmp (or built with
gmp installed on the build machine).

While building host-gnutls required for building mkeficapsule u-boot
tool, the configure script check if Libhogweed (nettle's companion
library) is build with libgmp support.

If internal toolchain is used, luckily host-gmp is built before
building host-nettle (and host-gnutls). But when using prebuilt
external toolchain, following error shows up :

Libhogweed (nettle's companion library) 3.6 was not found. Note that you must compile nettle with gmp support.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/4bdb067e380e72c3a6cb9c6ccf3791a6cf8661e0
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/dac6e3011883ce3b35cbf64ec156186153bf0032
[3] https://gitlab.com/gnutls/gnutls/-/commit/eb24bfa808ee029e9b3b198d66d29256eea3fd08

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Acked-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit db3a730e8ce42b8f70f469eafe53e9e5981e57b7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nettle/nettle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 04e3adb84e..adeaf40868 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -15,7 +15,7 @@ NETTLE_CPE_ID_VENDOR = nettle_project
 # with static linking
 NETTLE_CONF_OPTS = --disable-openssl
 
-HOST_NETTLE_DEPENDENCIES = host-m4
+HOST_NETTLE_DEPENDENCIES = host-m4 host-gmp
 
 # ARM assembly requires v6+ ISA
 ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
