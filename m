Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD205C0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C37442118;
	Fri, 28 Jul 2023 20:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C37442118
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0ghDBBN2Clv; Fri, 28 Jul 2023 20:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D5F42170;
	Fri, 28 Jul 2023 20:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D5F42170
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01BA01BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC5124013D
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC5124013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GeAYmdVO2Od9 for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:25:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB676400CF
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB676400CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7FA8839B6; Fri, 28 Jul 2023 20:25:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:25:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 599ced8690398ed4f0ecb70a50c0e1c265fc4a5e
X-Git-Newrev: b21e072127c17f359f891b913fd6a294708aa4f4
X-Patchwork-Hint: ignore
Message-Id: <20230728202551.D7FA8839B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: remove superfluous =TRUE in
 DEBUG_ON_SERIAL_PORT macro definition
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

commit: https://git.buildroot.net/buildroot/commit/?id=b21e072127c17f359f891b913fd6a294708aa4f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8e9c8e624f "boot/edk2: introduce a new _OVMF_DEBUG_ON_SERIAL
option" adds a build macro definition with a "=TRUE" value.

edk2 OVMF readme suggests to define the "DEBUG_ON_SERIAL_PORT" macro
_without_ the "=TRUE" in [1].

The example build.sh script calls build to set the macro _with_
"=TRUE" in [2].

The "Build_Utility_Man_Page.rtf" documentation in [3] does not specify
either what exactly happen when a macro is defined without any value.

Looking at the "build.py" code in [4] shows that a macro definition of
the form "-DMYMACRO" is indeed equivalent as "-DMYMACRO=TRUE". This
was also tested with a qemu virt x86_64 grub2 EFI boot image, to
verify behaviors remain the same.

This commit removes the superfluous "=TRUE" as requested by Yann in [5].

Removing the "=TRUE" make it a bit clearer that it is the macro
definition itself that will enable the feature, rather than its
value. Defining, -DDEBUG_ON_SERIAL_PORT=FALSE (OFF, 0, or anything
else that would suggest the feature is disabled) would do the
opposite of the desired effect, and enable the feature.

[1] https://github.com/tianocore/edk2/blob/edk2-stable202305/OvmfPkg/README#L95
[2] https://github.com/tianocore/edk2/blob/edk2-stable202305/OvmfPkg/build.sh#L252
[3] https://github.com/tianocore/edk2/tree/edk2-stable202305/BaseTools/UserManuals
[4] https://github.com/tianocore/edk2/blob/edk2-stable202305/BaseTools/Source/Python/build/build.py#L2531
[5] https://lists.buildroot.org/pipermail/buildroot/2023-July/671059.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/edk2/edk2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 95cbe415ef..f49258ecb5 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -19,7 +19,7 @@ EDK2_BUILD_TYPE = DEBUG
 ifeq ($(BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL),y)
 # DEBUG_ON_SERIAL_PORT is only tested to be set, so don't disable it, as
 # it would still be set.
-EDK2_BUILD_OPTS += -DDEBUG_ON_SERIAL_PORT=TRUE
+EDK2_BUILD_OPTS += -DDEBUG_ON_SERIAL_PORT
 endif
 else
 EDK2_BUILD_TYPE = RELEASE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
