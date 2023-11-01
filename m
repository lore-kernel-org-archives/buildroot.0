Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE67CC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93D1984BFB;
	Wed,  1 Nov 2023 17:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D1984BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJpQDZZWmHOX; Wed,  1 Nov 2023 17:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED96484BFD;
	Wed,  1 Nov 2023 17:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED96484BFD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6CDA1BF280
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EB3D43290
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EB3D43290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZu0I0qhnk2x for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:50:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D956E43287
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D956E43287
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3C16863E5; Wed,  1 Nov 2023 17:50:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 18:49:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0aeca68489a7e90a4834a58bba976184222db58c
X-Git-Newrev: bd4c86806e2c5d1bc57822009000378366a8fdf7
X-Patchwork-Hint: ignore
Message-Id: <20231101175014.C3C16863E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/conmon: seccomp needs headers >=
 5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd4c86806e2c5d1bc57822009000378366a8fdf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

conmon unconditionally uses seccomp_notif_sizes which is only available
since kernel 5.0 and
https://github.com/torvalds/linux/commit/6a21cc50f0c7f87dae5259f6cfefe024412313f6
resulting in the following build failure since the addition of the
package in commit 06f50ff1bf066feb6cf6ed512113773f87c884fb:

In file included from src/seccomp_notify.h:4,
                 from src/seccomp_notify.c:26:
src/seccomp_notify_plugin.h:33:78: warning: 'struct seccomp_notif_sizes' declared inside parameter list will not be visible outside of this definition or declaration
   33 | typedef int (*run_oci_seccomp_notify_handle_request_cb)(void *opaque, struct seccomp_notif_sizes *sizes, struct seccomp_notif *sreq,
      |                                                                              ^~~~~~~~~~~~~~~~~~~
src/seccomp_notify.c:47:36: error: field 'sizes' has incomplete type
   47 |         struct seccomp_notif_sizes sizes;
      |                                    ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/cbfa2f3a585b7feecd902137bc589a1ec15cbefe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/conmon/conmon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 50807f8c6a..214cb460a5 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -11,7 +11,7 @@ CONMON_LICENSE_FILES = LICENSE
 
 CONMON_DEPENDENCIES = host-pkgconf libglib2
 
-ifeq ($(BR2_PACKAGE_LIBSECCOMP):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_LIBSECCOMP)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0):$(BR2_STATIC_LIBS),yy:)
 CONMON_DISABLE_SECCOMP = 0
 CONMON_DEPENDENCIES += libseccomp
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
