Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A429CA5FEC
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 19:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BFCD60717;
	Sun,  4 Oct 2026 19:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRFbz7VUBfnz; Sun,  4 Oct 2026 19:07:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 21B82606D6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791140870;
	b=S0XdT6CljdAYsXvoav8AtBSTa97tWtlauj8CsEgLt6o6KIF7/tvqjM+RQb9/yCgBZ3uh
	 q+pAdmCyROFtZ7+i7Li5SVY6XpAwm68auOa9uA0A39V0yBvQcWvxDRxW4WT3M0jRtPQNh
	 LvGeJSo5A3OkoBX3ks+b0OD0kob1H+qdgiYIkttFJyEl2v+KotGcYZj8N53J9/90ZVSf5
	 Hhi6OBSELM+hmNU6cIWuszzIqB+ah2DZjaZx/o/4ifom4cpupjTA8tT7QQOxvRzwiVSu9
	 C/Av//vwZ6+0C18QyoChBA1Vrxslmi72XUsMxk4pjGtrArCelq7wf4t9YYQPiN0Hf1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791140870;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iJu9AS3B37A3ZXJhKxl/Kw5K59CppRP6zik7HbVHMkc=;
	b=KXO13Tlt47zAetvwhzyzTf9PzrR5QOkUUy15IavEbqIkMNFdfEqIkBhuLLXdQ0MNigGp
	 wYCwwnghNKZfkZQpbZyW+5JfdFAA/KCsR2oGLd2b7VMXkMmuzmMp2q5gUNmEr/HJ5KyAx
	 kvM3Gn8rxgH495fj1SS6XHy7GyKkgHgv85Mq9NKYGI0ZGdvfhm4Pna8UpkAGbQ2mSBdBD
	 M6dwGQ7igfbS9uoOfuwyo883yCPe2F93Fu01PwMQFau5iG7qfvmt7rN+nbDHDIjbYGoVH
	 mifsKv7I5g+6yl/XnlebGQNJQ6cFxuAuQgZKF/Yd6mqKZLsSxEUiNV9TN0PI0fNOPAw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791140870;
	bh=iJu9AS3B37A3ZXJhKxl/Kw5K59CppRP6zik7HbVHMkc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AnzYaAQ7UXor3urb5Yp81VPinU7KYJMjPmd8gty4VEaJL3xZYW1ktwp1du+5nMi+z
	 xDG5BU/Z4YaumxyEEvwWUQBXoQEAaqAB7oJCCpbgAY0W5+bKbuLcxi/B5jtIksDxOW
	 W3vftYeMMFlxfM7m/uLtOVvnmGacuqocNh+n+TFKMkl2XLbKGHZgjkS5xe9waeRGmZ
	 w9z6mxpxElrx/+rq2vRpHZgvJ2wLrl5Ig6mfhr1qMlazI9kJT9y4fXHLRinrYlwaQn
	 iKE8I8+jEWCIDmThUUUNW8u0CLzk2bakZNuURl3Q2nR8NhxtJ0Z6pDSbkRao0rubrN
	 SwFcYYyt2Jxhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B82606D6;
	Sun,  4 Oct 2026 19:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8587E22B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82EE380CCC
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRiTgubpeRoI for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 19:07:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7B21580CCE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791140867;
 b=cQ/fSaERTs3lip+dtMPqKBpprb6zcwDftp2+HNcl00wIv5xN6GrwecI3kMfJnVpeRCZF
 exlYHzE4hoXpZvS13ULnWHpmDAgeJjjt0xkkw8CJ54rwB5gC5gK6jW573691rIMbGX/Vz
 9wisx/ULrN6Z0xAIft+47OLHSvAmxJ/YZ0kZDlVvXaWaX85ijBRCDkwolpVvXZ6i/pyWl
 VhzDJf2eb3oKeNVoQMy9/XQQN4UtszxUmhrUlagxEJhFczjYErVMhJ8oHmkiSSHRihTEa
 cjTkEyoUsrLJu1linyuCKnM5m/bbfVtiPTcwJnpU9c+mQenT8+VYBKzsyDDM7ROfYdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791140867;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FRJW2euJ4ZaNpqnu6liZyRPkKisXtIuLPoW+dipJ8lo=;
 b=Glydp+rJ92r05YB73OSX0/G/bqVFPpAR6Yxog63s63q6pLbTvM3V90Ht5SZs8MkFLBwK
 hzoS5SFpbdveVlab7HhAb/HCcWInIruaEC7JYbEPWRI7462jGzdPfim9HLQoqTGeD6jE9
 dr+0KQkjXQG/3KiUtAFXk8QkNySRpU5nG6uQ+bR//t07swc5SQkYrMI72tSU/uJlULGtG
 VrEmmPK2+sIfQUaDsF1BdERbxkqMdoEO2oxEiT6nhcR/LzUewzFxALU2T6v2RpJG8nhNM
 4R7TYfK626vk1PxOeslBMShBU3jRp9JsNkfHOpxMuXIJayauFMkv42ME98N9TGv4wJw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B21580CCE
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EE8A8D323; Sun,  4 Oct 2026 19:06:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 21:05:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb129a641b403cfc4c1b2ea9280b966e19837b62
X-Git-Newrev: a7d47860f3233659aa2b8491fe8f35a5cd212184
X-Patchwork-Hint: ignore
Message-Id: <20261004190632.1EE8A8D323@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btop: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7d47860f3233659aa2b8491fe8f35a5cd212184
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Btop++ is a resource monitor that shows usage and stats for processor,
memory, disks, network and processes.

https://github.com/aristocratos/btop

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
[Julien: move the "v" from _VERSION to _SITE]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/btop/Config.in | 36 ++++++++++++++++++++++++++++++++++++
 package/btop/btop.hash |  5 +++++
 package/btop/btop.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 72 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 090bb58200..32ac338dc8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1130,6 +1130,7 @@ N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
 N:	Fengwei Tan <tfx2001@outlook.com>
+F:	package/btop/
 F:	support/testing/tests/core/test_flat_stacksize.py
 
 N:	Fiona Klute <fiona.klute@gmx.de>
diff --git a/package/Config.in b/package/Config.in
index dc829675ff..a82e369aff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2802,6 +2802,7 @@ menu "System tools"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
 	source "package/balena-engine/Config.in"
+	source "package/btop/Config.in"
 	source "package/bubblewrap/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/cgroupfs-v2-mount/Config.in"
diff --git a/package/btop/Config.in b/package/btop/Config.in
new file mode 100644
index 0000000000..fe4be53454
--- /dev/null
+++ b/package/btop/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_BTOP
+	bool "btop"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	depends on BR2_ENABLE_LOCALE
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no quick_exit()
+	help
+	  Resource monitor that shows usage and stats for processor,
+	  memory, disks, network and processes.
+
+	  https://github.com/aristocratos/btop
+
+if BR2_PACKAGE_BTOP
+
+config BR2_PACKAGE_BTOP_GPU
+	bool "GPU monitoring support"
+	depends on !BR2_STATIC_LIBS # dlopen()
+	help
+	  Enable GPU monitoring. Intel i915 GPUs are accessed through
+	  the kernel perf interface. NVIDIA and AMD GPUs additionally
+	  require NVML and ROCm SMI respectively at runtime.
+
+comment "GPU monitoring needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif
+
+comment "btop needs a glibc or musl toolchain w/ C++, threads, wchar, locale, gcc >= 14"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC \
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_14
diff --git a/package/btop/btop.hash b/package/btop/btop.hash
new file mode 100644
index 0000000000..e748dbb373
--- /dev/null
+++ b/package/btop/btop.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  933de2e4d1b2211a638be463eb6e8616891bfba73aef5d38060bd8319baeefc6  btop-1.4.7.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  include/fmt/LICENSE.rst
+sha256  e0309e3ea5d2c839946816c557ac8da5ec022b3f0bb26a5b5de0f709567902b3  src/linux/intel_gpu_top/intel_gpu_top.c
diff --git a/package/btop/btop.mk b/package/btop/btop.mk
new file mode 100644
index 0000000000..50cdca90d8
--- /dev/null
+++ b/package/btop/btop.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# btop
+#
+################################################################################
+
+BTOP_VERSION = 1.4.7
+BTOP_SITE = $(call github,aristocratos,btop,v$(BTOP_VERSION))
+BTOP_LICENSE = Apache-2.0, MIT with exception (fmt)
+BTOP_LICENSE_FILES = LICENSE include/fmt/LICENSE.rst
+
+BTOP_SUPPORTS_IN_SOURCE_BUILD = NO
+
+BTOP_CONF_OPTS = \
+	-DBTOP_GPU=$(if $(BR2_PACKAGE_BTOP_GPU),ON,OFF) \
+	-DBTOP_LTO=$(if $(BR2_ENABLE_LTO),ON,OFF) \
+	-DBTOP_RSMI_STATIC=OFF \
+	-DBTOP_STATIC=$(if $(BR2_STATIC_LIBS),ON,OFF)
+
+ifeq ($(BR2_PACKAGE_BTOP_GPU),y)
+BTOP_LICENSE += , MIT (intel_gpu_top)
+BTOP_LICENSE_FILES += src/linux/intel_gpu_top/intel_gpu_top.c
+endif
+
+ifneq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+BTOP_CONF_OPTS += -DHAS_FSTACK_PROTECTOR=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
