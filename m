Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC5DC433FE
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 13:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CC560A9B;
	Sat, 12 Nov 2022 13:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36CC560A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EXizp0K-Rnmb; Sat, 12 Nov 2022 13:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5087760A6F;
	Sat, 12 Nov 2022 13:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5087760A6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73B511BF5B4
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 13:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47D2840383
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 13:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47D2840383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ePGUvW33Bgz for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 13:37:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 327E3400DD
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 327E3400DD
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 13:37:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l14so9823859wrw.2
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 05:37:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pJ5+0iEgWrTQ96XYhx4VYpk6mS2gNYZ1JU3sHFCy5Q=;
 b=cNbQrX9tP/WNpGJHzyzBnpsYSblbF2/osy9mDbO6o6hBIlyIxbDUL5rj3OiYHfkTIX
 CPMt8nSWlwBMkOt6P0X/5Jsk9CKqS/cV4y1AJpLUV6ymOS4F3h/WKCe/JgUE+IcYH5/5
 bbIO6/PHIoLizi7KM0bTBmoWIfAHAp2AF5knzVdJBZysbvkFOl9OimWcLYXvTfB88DX3
 P25RmW+7e88RMIWaNxppUMXuPDimmSloyS3N/dHeEbrQLGDNipDIU6W5/U04kXTJ+Uol
 ftoHX5s1XqOTjuW3wgVui8/CBK9mg2qdrgDbFrptpcgRM/yJWQ/rvHQ2hPP0hRD/hWO+
 r5uw==
X-Gm-Message-State: ANoB5pn8qtipAVSP2HmWFoyOxRj9g1xHaXHJEaM2/6+ow8UdF+zX0nm0
 SyZuvRXZ8ll1fxXGXsqKaNw9cAB1gGI=
X-Google-Smtp-Source: AA0mqf46T/UDDI/e32eIzvOkf6/s1VaxS2X2t2BnyFNo3zOUD1KQNpGvNDsxBhAttc7EEthDv/R4vg==
X-Received: by 2002:a5d:4589:0:b0:236:698d:9c44 with SMTP id
 p9-20020a5d4589000000b00236698d9c44mr3518952wrq.571.1668260228272; 
 Sat, 12 Nov 2022 05:37:08 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:12bc:32e:ad2a:4f42])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a5d58d8000000b00236695ff94fsm4347530wrf.34.2022.11.12.05.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 05:37:07 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Nov 2022 14:37:07 +0100
Message-Id: <20221112133707.1674986-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=8pJ5+0iEgWrTQ96XYhx4VYpk6mS2gNYZ1JU3sHFCy5Q=;
 b=UIte8p2tqs7Az06DYG2ZU7ySQ/x75NR59ON9GCua+Ig83t/0Cxgz5jc4y7tH6mWqML
 k4rRIleNjt7mJiQ9b8VWyCR/5xcOAmqktEd9+XEf0/8XjnBC3kxIVSqCG8X0pJ5cAYDk
 HVHQ9KZ/DR4YzFsjgCv+R5ZkgmwIDWV2dVJgoWt5VdUXN3C1KiLLHVSvCycgtkrPKV9E
 VTF+EWvbHehw38wYBjc00MFLgF3O0OFrYofSjrh7/6raExxJGENGJT1kukj/1Ihd0cqr
 wcfKj01PtkAj6XBV7oenw5IoQ64XCISY0ydVWh+rbbZcAhKDl/p785v2gRp3LGDh7EAu
 9Ncg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UIte8p2t
Subject: [Buildroot] [PATCH] package/dracut: workaround breakage on
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
Cc: Adam Duskett <aduskett@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 package/dracut/dracut.mk                  |  2 ++
 package/dracut/merged-usr-module-setup.sh | 26 +++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 package/dracut/merged-usr-module-setup.sh

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
