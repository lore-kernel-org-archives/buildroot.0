Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918CBC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:47:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28CFA61131
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28CFA61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E63C5400BA;
	Tue,  9 Nov 2021 10:47:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17y6mrwurVeE; Tue,  9 Nov 2021 10:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21EC040128;
	Tue,  9 Nov 2021 10:47:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 820B21BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E1EA40128
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qg0WqGyL_GWQ for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:47:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BD73400BA
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:47:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 015358B7D5; Tue,  9 Nov 2021 10:43:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 11:42:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9c3541bad9b8b9b3b3215592205b4bba5900cf5
X-Git-Newrev: 827bd376e34aa76ff04dfdff2ae3d7d1b841452a
X-Patchwork-Hint: ignore
Message-Id: <20211109104308.015358B7D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tss: override auto-detection
 of groupadd and systemd
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

commit: https://git.buildroot.net/buildroot/commit/?id=827bd376e34aa76ff04dfdff2ae3d7d1b841452a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tpm2-tss is looking for systemd_sysusers and systemd_tmpfiles, but those
two are not mandatory. However, it might find those from the host.

But that is not an issue in the end, because they are only used to
instanciate the users and create the tmpfiles. At build time on the
host, we do not need them, and on the target, if systemd is being used,
then they will be instanciated/created at boot.

If they are not found, then the fallback paths are taken, and those
fallback paths are those using the setfacl and groupadd and useradd
tools, which we already know are going to fail but that we do not care.

So, we can safely force those two to =no to avoid the install trying to
use the system-wide tools, or even the ones we build as part of
host-systemd ourselves.

Eventually, when systemd-tmpfiles of systemd-sysusers are missing, the
fallback paths use useradd, and configure unconditionally checks for
it, so as for groupadd and setfacl in commits d9123dd79956
(package/tpm2-tss: fix build on host without setfacl) and c8f847c4f4dd
(package/tpm2-tss: fix build on host without groupadd), we just fake the
detection of groupadd.

Fixes:
 - http://autobuild.buildroot.org/results//97bfa8f7dcb12e36bd63c9d06fb39418070d840b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tpm2-tss/tpm2-tss.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 88ec892f20..71aa3feb96 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -16,9 +16,17 @@ TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
 # 0001-configure-Only-use-CXX-when-fuzzing.patch
 TPM2_TSS_AUTORECONF = YES
 
+# systemd-sysusers and systemd-tmpfiles are only used at install time
+# to trigger the creation of users adn tmpfiles, which we do not care
+# about at build time. groupadd, useradd, and setfacl are used in the
+# fallback path when systemd-sysusers or systemd-tmpfiles are missing
+# and their failure is ignored anyway.
 TPM2_TSS_CONF_OPTS = \
 	ac_cv_prog_result_groupadd=yes \
 	ac_cv_prog_result_setfacl=yes \
+	ac_cv_prog_systemd_sysusers=no \
+	ac_cv_prog_systemd_tmpfiles=no \
+	ac_cv_prog_result_useradd=yes \
 	--with-crypto=ossl \
 	--disable-doxygen-doc \
 	--disable-defaultflags
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
