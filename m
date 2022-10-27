Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD23C38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCB960BB8;
	Thu, 27 Oct 2022 06:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDCB960BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6zW9hp2gJgL; Thu, 27 Oct 2022 06:50:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C3D60AA7;
	Thu, 27 Oct 2022 06:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C3D60AA7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0C211BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF704055A
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCF704055A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CeK82MF7j7U for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:50:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFB0B400FE
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFB0B400FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBD4A872EC; Thu, 27 Oct 2022 06:50:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 08:49:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3f915c6561bcb2f7952faca3bedf1766f299538
X-Git-Newrev: cff78c34fbf80880c39725049ff42c3dd632fd7a
X-Patchwork-Hint: ignore
Message-Id: <20221027065010.CBD4A872EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbguard: fix build without
 asciidoc
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

commit: https://git.buildroot.net/buildroot/commit/?id=cff78c34fbf80880c39725049ff42c3dd632fd7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set ac_cv_prog_A2X to disable build of documentation and avoid the
following build failure without a working a2x raised since at least bump
to version 1.1.1 in commit ad21d84a589458fd4542993912891daa503d72dd:

a2x -v -f manpage doc/man/usbguard.1.adoc -D ./$(dirname doc/man/usbguard.1.roff)
a2x -v -f manpage doc/man/usbguard-dbus.8.adoc -D ./$(dirname doc/man/usbguard-dbus.8.roff)
/nvmedata/autobuild/instance-5/output-1/host/bin/python3: Error while finding module specification for 'asciidoc.a2x' (ModuleNotFoundError: No module named 'asciidoc')

Fixes:
 - http://autobuild.buildroot.org/results/e41950f3cd4bd83d9b067af498757cb9d2f207ef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbguard/usbguard.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index e0c9b58221..60b69df3be 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -10,6 +10,7 @@ USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
 USBGUARD_CPE_ID_VENDOR = usbguard_project
 USBGUARD_SELINUX_MODULES = usbguard
+USBGUARD_CONF_ENV = ac_cv_prog_A2X=""
 USBGUARD_CONF_OPTS = \
 	--with-bundled-catch \
 	--with-bundled-pegtl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
