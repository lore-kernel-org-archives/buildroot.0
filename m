Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED45C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 18:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5A3160F98;
	Tue, 20 Sep 2022 18:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5A3160F98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1jYfQuhQHBc; Tue, 20 Sep 2022 18:37:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFDA560F91;
	Tue, 20 Sep 2022 18:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFDA560F91
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E69E1BF2C6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 18:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A39B60F71
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 18:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A39B60F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VU1_QFbKMVJ2 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 18:37:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 363A760F2F
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 363A760F2F
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 18:37:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t7so5828113wrm.10
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 11:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date;
 bh=DKAEBibU6U5hAyORpGpSyDMkbaBuFyHoukBwRQzb5NM=;
 b=5AWncePnDLfpuLCJIgzvLjziaBw3/2cU7zIjVKHaRDR+l3KZTtX6FL2MCqO+rpS16e
 ad7wnT/5/aHOPlc3yOK0iHJgskhxOg1s+5wolBKG7+ISpC/8Tc9tZWp/7PYkvhg0Hpfr
 GgsF0doY45xOFIPiDeqNUL0WoWrYhwbBmxt4V4l4pPPxd2CP6R/6OXtSc8QtET6LI8v0
 k4KUn6SwUSllS3/7yNQLrVoLx2BSe6zGA7XLyiAmkOHLrpH/1YWWXVbPLy7LBd5Nmyml
 FizGfrGJCYn1ibvs2Z7nfO+IMVPIcSRG7eHFo/RdzvKsHQzCpR46bbR/H6g4dQ1v+RaO
 H5PA==
X-Gm-Message-State: ACrzQf2rj0m6ngFuHfbCi+4+bkijn7RKlPd8Q7Rb14sqpju7n7l7PQ3W
 nXveAMviyIP2zQQivfOiYP0fMkeOUWU=
X-Google-Smtp-Source: AMsMyM5nQabn+b8fF0uGe1q0V6bfTF7RTnsyBXl+k8OmqgcRrYBaHVhEnbcdb/ch57FD3K++v37gGQ==
X-Received: by 2002:a5d:59a9:0:b0:22b:e6a:4796 with SMTP id
 p9-20020a5d59a9000000b0022b0e6a4796mr4153784wrr.47.1663699033807; 
 Tue, 20 Sep 2022 11:37:13 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b795:8a2b:1e98:bedc])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a5d6106000000b0021e43b4edf0sm533636wrt.20.2022.09.20.11.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 11:37:13 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 20:37:12 +0200
Message-Id: <14d5b43f649a988b40972cad159fbedd02a1d9cf.1663699017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663699017.git.yann.morin.1998@free.fr>
References: <cover.1663699017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date;
 bh=DKAEBibU6U5hAyORpGpSyDMkbaBuFyHoukBwRQzb5NM=;
 b=GLMGr7DppU0fTQtcVX1oo63HPfcOrbZUuONHbyreua9glRiKxfUPEuPM0KGugDJTev
 m3f97Mk/NDqZMOz2Gn6wlCiVg3+oTZzI0HIR8XwvWNDOy3qSpLTajtYZl1MH3LB4UzPQ
 tR5Tdq3MObwhiGEDoh2x2EawnGxRRBz/QuA692WLQ++G5SLTErQIvLzlllZSnv2BEius
 zkx6Haqlib1RdhcpbBCC7vo9ayU5v7xoAKfJ7sGgOKL7a5G5Q8kQftdTfnBdBFLUHe0u
 FJ9t2EMEJT3X+BZOodnKJUCNan94fdkflDdP7fPHN5F56reUK0wfennZQj+yFpn6K1Ip
 04QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GLMGr7Dp
Subject: [Buildroot] [PATCH 2/2] support/tests/cpio: extend runtime tests
 for extra dract modules
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

Add a basic module that installs a single file, to check that it is
properly accounted for.

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 support/testing/tests/fs/test_cpio.py                 |  5 ++++-
 .../fs/test_cpio/modules/99cramfs/module-setup.sh     | 11 +++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100755 support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh

diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
index 8c0d357994..172af579bb 100644
--- a/support/testing/tests/fs/test_cpio.py
+++ b/support/testing/tests/fs/test_cpio.py
@@ -41,9 +41,11 @@ class TestCpioDracutBase(infra.basetest.BRTest):
         BR2_PACKAGE_PV=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_DRACUT=y
+        BR2_TARGET_ROOTFS_CPIO_DRACUT_MODULES="{}"
         BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES="{}"
         # BR2_TARGET_ROOTFS_TAR is not set
-        """.format(" ".join(["fs/cpio/dracut.conf",
+        """.format("support/testing/tests/fs/test_cpio/modules",
+                   " ".join(["fs/cpio/dracut.conf",
                              "support/testing/tests/fs/test_cpio/dracut-cramfs.conf"]))
 
     def check_dracut(self):
@@ -57,6 +59,7 @@ class TestCpioDracutBase(infra.basetest.BRTest):
         self.assertEqual(out.find("bin/pv"), -1)
         # libz should be, because of cramfs
         self.assertNotEqual(out.find("usr/bin/mkcramfs"), -1)
+        self.assertNotEqual(out.find("usr/bin/cramfsck"), -1)
         self.assertNotEqual(out.find("usr/lib/libz.so"), -1)
 
         exit_code = boot_img(self.emulator,
diff --git a/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh b/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh
new file mode 100755
index 0000000000..60706c8bd9
--- /dev/null
+++ b/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh
@@ -0,0 +1,11 @@
+check() {
+    return 0
+}
+
+depends() {
+    return 0
+}
+
+install() {
+    inst_multiple /usr/bin/cramfsck
+}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
