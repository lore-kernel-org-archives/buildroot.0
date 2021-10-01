Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA911C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 01:54:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FD2D61A59
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 01:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FD2D61A59
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 395AD824EF;
	Fri,  1 Oct 2021 01:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qisob-xkF3ZP; Fri,  1 Oct 2021 01:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84FEC82503;
	Fri,  1 Oct 2021 01:54:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25BCA1BF2C0
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 01:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11750403FC
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 01:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=yahoo.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xxd0txCRqgbm for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 01:54:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic315-55.consmr.mail.gq1.yahoo.com
 (sonic315-55.consmr.mail.gq1.yahoo.com [98.137.65.31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1C0640124
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 01:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1633053283; bh=EyABLOjNCEZLpxLqvJ1iXbSyk3R2mAPDeXDmk6fpVwY=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=nEGguuoZWFLMJRDhvjCGex+Uczjf5I12Vbq6Wi4xlfJuNV+H2RNfUq0YClmExcvA+DuMfdY5ecfV6h1ykC1ibvQAFwZD3bsRv5BAca+O7oPWIndD1rElxXmR40Yt2o4lZIsvh8YdS5zZlYrt7gU4BeebGYLh+q2tahTDsQYJwjlLW9IPYm7i9kGBSSch7XJ9jgztfmrLJVoC5KwUZVywVMWoNow1ULRWPb8gbrujrFdmBxxMTlqdu/esPmZinWgBuXhwiXe8U0u/ZuV/x+LGunsv1XEE9ggvkWk2m5Ge8RHMbLuFpDiRyan2lNk91gzv9AZC85Eu/CEpYl/tJ6rY+g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1633053283; bh=jUNTh8/bz0MGEyJI6t7ZOpOJFZfL5raWxpkgLtCkOR8=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=McL28efhDy3PtHXo3/ywSONnTAq2xF+cOysBL0gKxOPWKxs4yFTkMC+FAxYcMDVycRfKKGls5pDjmDkwEByk++pzBJbArWtbbOH+6QSr3LjrkfEK0gVpnv6rMrURBqufTR9J74YPS6GH/HMlMMbVZnToif2SbfQdGsZlGmM/yHKkS2Tx1CH6od34j7s+Kr13fhtehG7XjaKxPWW8Y1MJkgnJ+Rzqo/hCFEziv9Ei7kvNGaH1x7XrIv0oNjEZSQO1B88jnH0+LPvLBiAD/tCuZV0mN1jiVY9skt2th5YJb2UqTMVo0G7ExmJe2ImHvFX+0Rf/T21KlVr12IDtr19Eug==
X-YMail-OSG: SrTOaJkVM1nnyOzvx9_opikKjYiy9TM5FC6A1TFGRQgDGH4VxrF.WkBAy6ss1FM
 cy9iaakx3nVsjQ1wwFAjWKSQatAutFZIimHqRxnXtU7vUNEs6UVN9rG89rAhuitmOlZw1_lBk04Z
 x5VaeAmRtsQ8OFZnNzT5oq81sbAqJBsbApFZn9KIECTGzGOpbEx4BxLxSUq2w46Nm1vgbCB6OCqy
 VrzH8cXayJ6cX6o0GZGbviee0Bprj6BB3LrjR5SP8WnzUMPPOaOixTj3ojr8nS6W_Yk8Fqg_oFIC
 nAFAh8Sztjb80rUMUTutCkUUTWPVEPhagDh4fR18ezi0twlvT8kC1W9X7hLNg2qlz0NEb3p__hHB
 HJ3A0WbtcApUEBsmuFk1JJatZ7EkUTvVCTxFHoJMCom.gwuZsqYY7gPVeusqMZvakPmh.LxTHuFP
 0Gh_7sJfQlWMTZMjIvY26L_XzS4zpnHn_qooIo0yNrLARs.ILfJ_pYyazPMZYZOZoXvIZglkLfYW
 az.77o.LQO3hfSOAjCse1bRw_4S_Q.N.EZf4ff2pjAhl93SZjb8yXMI4Zu63rWEFqlapmP7gL3rA
 FZuXn2qf.qOt04ljvDeSSe09s5cBveSC0aMpuKhbZYJqplklJbKixgoM3BjoCqZTQ.55zRlL6vXD
 vEftfb832uGR9ZOCFBgGeyZ3CygC53nlxP1TkkFsOkWlJrQWt44tKk5OUQOy0GHgxTyeW8ReIBwP
 zgagUxyCkNbkA0xUa7QLhwrVoKLvlupm4KTXNNEbc8NUm9nSdqbDiUBR0q0vh5dTKs9k4_i0jDWx
 WtspPbio_qrOlnD8j9.GRdvb.6X8bU.SvPcapCgbCSnFG4ZzVX6iRFT8NYJ6FlOAv3p68B6EAzIh
 hhYbmrnAmsV3uih_847Uokooefa9632IUC6q_sISHNxMutoF1_Pz1ub1FwGndb.5Q5vhCKQYVcbY
 fLqxLLa8AdA6wpQAp4a69ro0chSkJDqmS7o5AEK8A4jOUqPIN691ojzQ_M4MQPcu3qx7JwvNc1II
 gmviD4zNwmMxWvJbnBA8ja69EvF7nZMAnevFzyHu0H3GIEUrljiscwY4qJWf0Gr9P9PNO9Lb2YeH
 3Yq_e04HUP28IMmnSIvIDgH8oUax4p_mxqYZmHQtjLUw5GtHYTGD95TkOcd7MWmuvspEq7y25yKH
 _NDaYo5cS93PLuksvGavYWr03oYXK6MfAwdyvKZmRvXCBFPuzgcTzWv1lNYgQ76sEcJ9VeMaFu9S
 p1_5sIXDnagK1uYD6qMND27Q47UBLuNrpTRAkPh7K3AfyZQ.jEI4GU3HQA7x3qkJCDQIHK4bmiOy
 7kC9nRhqh85u9V1ty36EbjbPbCvVrbdiuWbZ.vcPWAi9Kgj2upZHqCVOcaZBtdTj_h7Nob0YQVi6
 TdtsVsc_DBdR7fUfrs0ReGCflRftuSGbcAtz3wxBJCqy6prtXbH5ZT0qFvzu_o_jVKLQANgDNbee
 WIysHyKZUk8KVmolxN.z0rfJJ68j2_S.vZl9f_y49bMB3RaIN1pLSNBqEKoDIlMpqkI2OsWmjmFD
 ihVdgXLJzKGFbw4mvwACPULiXTQfuBNn_2xz50PkGQdnLCV_8vtDCvSjToJfmo_ctOa_13r4nAr4
 oqPVgKHnrIErCrVnMEjYcml0rqa7Sy8prF2DgCeFC0nD3GH4kjissc31BKhbMIhLMRoAiekiRB88
 1J6IbnO3vNf937lyuiLrM0_hepkyPaeXavmy9QNRXE7ElTulRLekeYWaevpptAAPY7n1kJTcsTdk
 Bl0tx.9BLuVdG86LIpCgJF0pn7CN5qr2HmS9AEf9fb.jqvkEnrIdLd1cH3cd2dPm4fZECJGLDnvb
 qr2u4XpG1WGx8gWFhH15n_RwRZEfaYxix7EMoUaBR3eS79IyWFld.dHDnpc0Ybvwdg4VV.QFwfZd
 PMMFRvfyrC9kYvfq88WoOwOPwIHnseoj_MaGQ9u04RYTtNffK05fnzRY_YB4DUMf6GxmVvszmvIv
 anlhDREPkUtwrCjX7pX6PvyfAFFqLXcSvEzd1r3tj.YptflSJIKM7upupnbt7Xssvtnb0NboK3ri
 7W6r5lQpJosoKg7nu1komNu41yFvBRJOmhG.wzZ5zhXhu6PJs71WOK.PMiau3GBd0wiuFjVUVMsT
 9VCQacXKG3.R6SNSJs8xofz4ku8eVuBhXNd5PniFL4fxLdvIhcGR4yhv5Mx8jOeh0oRYIJ_w7hiE
 V6CX1DWzrtOC6JbVHI7AyF.SW127d4efc_FNUGXB_YqZpmP0SLeXGmc4JtSEa95Z9Nr8U86iV2hQ
 .RUtyMk5vLyei
X-Sonic-MF: <tallubko@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Fri, 1 Oct 2021 01:54:43 +0000
Received: by kubenode524.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 2901588e982b217b02c63c79dd2eb4dd; 
 Fri, 01 Oct 2021 01:54:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri,  1 Oct 2021 04:54:33 +0300
Message-Id: <20211001015433.11176-1-tallubko@yahoo.com>
X-Mailer: git-send-email 2.17.1
References: <20211001015433.11176-1-tallubko.ref@yahoo.com>
Subject: [Buildroot] [PATCH 1/1] package/chipsec: new package
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
From: Tal Lubko via buildroot <buildroot@buildroot.org>
Reply-To: Tal Lubko <tallubko@yahoo.com>
Cc: Tal Lubko <tallubko@yahoo.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Tal Lubko <tallubko@yahoo.com>
---
 package/Config.in                             |  1 +
 ...ed-modules-instead-of-source-modules.patch | 27 +++++++++++++++++++
 package/chipsec/Config.in                     | 19 +++++++++++++
 package/chipsec/chipsec.hash                  |  3 +++
 package/chipsec/chipsec.mk                    | 23 ++++++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch
 create mode 100644 package/chipsec/Config.in
 create mode 100644 package/chipsec/chipsec.hash
 create mode 100644 package/chipsec/chipsec.mk

diff --git a/package/Config.in b/package/Config.in
index 2f83c87582..ce73e2db72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2010,6 +2010,7 @@ endif
 endmenu
 
 menu "Security"
+	source "package/chipsec/Config.in"
 	source "package/libapparmor/Config.in"
 	source "package/libselinux/Config.in"
 	source "package/libsemanage/Config.in"
diff --git a/package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch b/package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch
new file mode 100644
index 0000000000..08a87bf3cc
--- /dev/null
+++ b/package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch
@@ -0,0 +1,27 @@
+From fd67e6878daec7abeef649bb687464c832a04ee6 Mon Sep 17 00:00:00 2001
+From: Tal Lubko <tallubko@yahoo.com>
+Date: Wed, 22 Sep 2021 15:50:46 +0300
+Subject: [PATCH] search for compiled modules instead of source code modules
+
+change chipsec_main to search for compiled modules (PYCs) instead of
+source code modules (PYs).
+---
+ chipsec_main.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/chipsec_main.py b/chipsec_main.py
+index 1aa46ea..11cf9c6 100755
+--- a/chipsec_main.py
++++ b/chipsec_main.py
+@@ -215,7 +215,7 @@ class ChipsecMain:
+                 while len(subdirs) > 0:
+                     subdirs.pop()
+             for modx in mod_fnames:
+-                if fnmatch.fnmatch( modx, '*.py' ) and not fnmatch.fnmatch( modx, '__init__.py' ):
++                if fnmatch.fnmatch( modx, '*.pyc' ) and not fnmatch.fnmatch( modx, '__init__.pyc' ):
+                     self.load_module( os.path.join( dirname, modx ), self._module_argv )
+         self.Loaded_Modules.sort()
+ 
+-- 
+2.17.1
+
diff --git a/package/chipsec/Config.in b/package/chipsec/Config.in
new file mode 100644
index 0000000000..3da41c14a6
--- /dev/null
+++ b/package/chipsec/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_CHIPSEC
+	bool "chipsec"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+
+	help
+	  CHIPSEC is a framework for analyzing the security of PC
+	  platforms including hardware, system firmware (BIOS/UEFI),
+	  and platform components. 
+
+	  https://github.com/chipsec/chipsec
+
+comment "chipsec needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "chipsec depends on python3"
+	depends on !BR2_PACKAGE_PYTHON3
diff --git a/package/chipsec/chipsec.hash b/package/chipsec/chipsec.hash
new file mode 100644
index 0000000000..344eb4fab8
--- /dev/null
+++ b/package/chipsec/chipsec.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 0470326e00f66c91d751e9827d9e0050e3e4ac5b2bc7a9943a76381beda58162  chipsec-1.7.1.tar.gz
+sha256 4c2ca80f4d3675a53a216a64d67e7b411a81a6e958defd248c6f1ecf44dc6607  COPYING
diff --git a/package/chipsec/chipsec.mk b/package/chipsec/chipsec.mk
new file mode 100644
index 0000000000..96d96176cc
--- /dev/null
+++ b/package/chipsec/chipsec.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# chipsec
+#
+################################################################################
+
+CHIPSEC_VERSION = 1.7.1
+CHIPSEC_SITE = $(call github,chipsec,chipsec,$(CHIPSEC_VERSION))
+CHIPSEC_SETUP_TYPE = setuptools
+CHIPSEC_LICENSE = GPL-2.0
+CHIPSEC_LICENSE_FILES = LICENSE
+CHIPSEC_DEPENDENCIES = linux
+CHIPSEC_ENV = KSRC=$(LINUX_DIR)
+CHIPSEC_BUILD_OPTS = build_ext -i
+
+CHIPSEC_POST_INSTALL_TARGET_HOOKS += CHIPSEC_INSTALL_LKM
+
+define CHIPSEC_INSTALL_LKM
+	$(INSTALL) -m 0644 -D $(@D)/chipsec/helper/linux/chipsec.ko \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/chipsec/helper/linux
+endef
+
+$(eval $(python-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
