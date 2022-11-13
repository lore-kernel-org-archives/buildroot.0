Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9427BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3328781430;
	Sun, 13 Nov 2022 21:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3328781430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBxozgkVT-ao; Sun, 13 Nov 2022 21:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B6881428;
	Sun, 13 Nov 2022 21:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B6881428
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A4521BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D396F81428
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D396F81428
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EW_37X7ekrAN for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:11:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D219C81398
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D219C81398
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B41048379E; Sun, 13 Nov 2022 21:11:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:10:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cd084b54e2223e49c37962b0cbefae7bea26ef5
X-Git-Newrev: a4f5ed5a7cf035d448c49edd8d106a09ce945170
X-Patchwork-Hint: ignore
Message-Id: <20221113211123.B41048379E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dracut: workaround breakage on
 non-merged-usr hosts
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4f5ed5a7cf035d448c49edd8d106a09ce945170
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dracut is not really ready to be installed with a non-/ prefix, and it
has a lot of hard-coded assumptions that it is going to run on the host
for which it is goign to generate an initramfs; for example, it
hard-codes calls to /lib/dracut/some-file in some of its modules. It
also uses the host system layout to decide whether it needs a
merged-usr or not.

Furthermore, dracut populates the temporary directory which content will
be used to generate the cpio, with a bunch of files, even before calling
any of the dracut modules.

The name for that temporary directory is not predictable (looks like the
output of 'mktemp -d dracut.XXXXXX', with names like dracut.1Vfn9F seen
while debugging).

As a consequence, we can't prepare the temporary directory with the
proper symlinks beforehand.

So, we provide a very-early module of our own, that will (hopefully) run
before any other module, to fixup the messed-up layout prepared by
dracut. This module moves the content of /lib, /bin, and /sbin, out and
into their counterparts in /usr, and creates the usual symlinks.

When we do not require a merged-usr, then we have nothing to do, so the
module checks for /lib being a symlink, as the hint that we want a
merged-usr or not.

Note: currently, we've seen nothing that dracut installed in /bin or
/sbin, but for trying to be future-proof, we also handle them; this
causes a spurious warning:
    mv: cannot stat '..../build/buildroot-fs/cpio/tmp/dracut.YQnzNP/initramfs/bin/*': No such file or directory

Since there are already quite a bunch of similar failures in the
official modules bundled in dracut, an extra such issue or two should
not be too scary...

Fixes:
    https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261241
    https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261239
    https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261236

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dracut/dracut.mk                  |  2 ++
 package/dracut/merged-usr-module-setup.sh | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 742a073a36..597492bc5e 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -22,6 +22,8 @@ HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
 # "ld-musl-x.so" symlinks, respectively - else the init process cannot
 # start
 define HOST_DRACUT_POST_INSTALL_LIBC_LINKS_MODULE
+	$(INSTALL) -D -m 0755 package/dracut/merged-usr-module-setup.sh \
+		$(HOST_DIR)/lib/dracut/modules.d/0000-merged-usr/module-setup.sh
 	$(INSTALL) -D -m 0755 package/dracut/libc-links-module-setup.sh \
 		$(HOST_DIR)/lib/dracut/modules.d/05libc-links/module-setup.sh
 endef
diff --git a/package/dracut/merged-usr-module-setup.sh b/package/dracut/merged-usr-module-setup.sh
new file mode 100644
index 0000000000..6dc0e7ca7b
--- /dev/null
+++ b/package/dracut/merged-usr-module-setup.sh
@@ -0,0 +1,26 @@
+#!/bin/bash
+
+check() {
+    [ -L "${dracutsysrootdir?}/lib" ]
+}
+
+depends() {
+    return 0
+}
+
+install() {
+    # dracut pre-installs a set of files before calling any of
+    # the modules, and dracut also messes up host vs. target
+    # system, so on a non-merged-usr host, it will prepare a
+    # non-merged-usr initramfs, even though the current config
+    # is for a merged-usr system.
+    # So undo its borkage.
+    for dir in lib bin sbin; do
+        mkdir -p "${initdir?}/usr/${dir}"
+        if [ -d "${initdir?}/${dir}" ]; then
+            mv "${initdir?}/${dir}/"* "${initdir?}/usr/${dir}"
+            rm -rf "${initdir?}/${dir}"
+            ln -s "usr/${dir}" "${initdir?}/${dir}"
+        fi
+    done
+}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
