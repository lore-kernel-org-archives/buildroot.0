Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A97FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15191612C1;
	Wed, 22 Jun 2022 20:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15191612C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uyHpLxPk-bLG; Wed, 22 Jun 2022 20:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E97260F26;
	Wed, 22 Jun 2022 20:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E97260F26
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F09F21BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D900B60F26
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D900B60F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WcUG1VlL08os for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:22:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21F2C60C1D
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F2C60C1D
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 831E38751A; Wed, 22 Jun 2022 20:10:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 22:22:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c5f30cbc78661025f2d95a98ddbe68d49e54056
X-Git-Newrev: 4de196a1cecbf74fd64a5660898abe7f49cb3fc9
X-Patchwork-Hint: ignore
Message-Id: <20220622201029.831E38751A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/br2-external: add kernel
 extensions
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

commit: https://git.buildroot.net/buildroot/commit/?id=4de196a1cecbf74fd64a5660898abe7f49cb3fc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot documentation section 9.2.1.6 "Additional kernel extensions"
indicates support for kernel extensions defined in external buildroot
trees but unfortunately, there didn't seem to be any support in
br2-external script.

This patch copies 'init' code support to include external kernel
extensions defined in 'linux' dir at the br2-external root directory as
explained in documentation.

Signed-off-by: Nicolas POIROT <ni.poirot@laposte.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.ext.in          | 3 +++
 support/scripts/br2-external | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 5b968b0bcb..3cbf42d344 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -148,4 +148,7 @@ config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
 
 endif # aufs
 
+# kernel extensions from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.in.linux"
+
 endmenu
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 56dc6f53ca..2c33e6eacc 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -163,6 +163,7 @@ do_kconfig() {
         openssl
         skeleton
         init
+        linux
     )
 
     for br2 in "${items[@]}"; do
@@ -242,6 +243,14 @@ do_kconfig() {
         else
             printf '# No init from: %s\n\n' "${br2_desc}"
         fi >>"${outputdir}/.br2-external.in.init"
+
+        if [ -f "${br2_ext}/linux/Config.ext.in" ]; then
+            printf 'comment "linux extension from: %s"\n' "${br2_desc}"
+            printf 'source "%s/linux/Config.ext.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No linux extension from: %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.in.linux"
     done
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
