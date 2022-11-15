Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCCCC4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 217AC40354;
	Tue, 15 Nov 2022 13:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 217AC40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOrExLcCpe-a; Tue, 15 Nov 2022 13:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D01484033A;
	Tue, 15 Nov 2022 13:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D01484033A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9ABB11BF94B
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 837E481B25
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 837E481B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewbhHhoUx1MK for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:03:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A600180E42
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A600180E42
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9620483C6A; Tue, 15 Nov 2022 13:03:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 13:55:33 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2a6da8d48660027c48a007394b10369e277b3741
X-Git-Newrev: 278806d6f94389c52cf9cd261098d75d74560ab4
X-Patchwork-Hint: ignore
Message-Id: <20221115130300.9620483C6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] packages/sudo: explicitly
 set enable-tmpfiles.d
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
Content-Type: multipart/mixed; boundary="===============1421266477068060153=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1421266477068060153==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=278806d6f94389c52cf9cd261098d75d74560ab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

sudo's configure script looks up on the host to determine the path where
to install its systemd tmpfiles. That is incorrect in cross-compilation.

We can explicitly tell sudo where to install its tmpfiles, which we do
when systemd is enabled (in Buildroot, systemd-tmpfiles is always
enabled when systemd is), or we can tell it not to install tmpfiles at
all, which we do otherwise.

Signed-off-by: Nuno Gonçalves <nunog@fr24.com>
[yann.morin.1998@free.fr: reword and extend commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9c333176a3dae8aa4fa5468e3345d71bc10c44ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 67af546cfc..44a17dd348 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -17,6 +17,7 @@ SUDO_SELINUX_MODULES = sudo
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
 	--with-tzdir=$(if $(BR2_PACKAGE_TZDATA),/usr/share/zoneinfo,no) \
+	--enable-tmpfiles.d=$(if $(BR2_PACKAGE_SYSTEMD),/usr/lib/tmpfiles.d,no) \
 	--without-lecture \
 	--without-sendmail \
 	--without-umask \

--===============1421266477068060153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1421266477068060153==--
