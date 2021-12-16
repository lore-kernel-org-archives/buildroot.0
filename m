Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F271C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 23:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E095684B20;
	Thu, 16 Dec 2021 23:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKIkWLIMbZ4y; Thu, 16 Dec 2021 23:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 106D084B1E;
	Thu, 16 Dec 2021 23:35:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A61141BF3A3
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 23:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EEFC6104D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 23:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D07bxnwNiILK for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 23:34:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EF0A60B09
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 23:34:57 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o13so754009wrs.12
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 15:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gS4Afdh466NZ/7lzYMa7Rn0D7gKU3zPGNyIkNARUC2U=;
 b=f4Z2WStoqT5vvADS6hBELJvoI9lGW9VSnVIK9CGKfBbHLS1GpfmvkVWtW6m9mYkPjU
 vfyx46NoYr7A73OUmyT0eetEHzaM1SqyB8pMDow0urGyzrJEYtLuNrq8ZV4hsjkd857T
 aV8IuEy0JicRLCC2IUBzSTRhfr7XUAkcTzjb/qOu/zS5AcfZbFmMIEGU/19cQxgK8qul
 ICnbJ7XmJ5PNYqaMog7jnjD+5b/pPRVMmpQV8EKputWIfin4I7zOSmiUVCx4v0ILVO7z
 eqgSR6SSdF9mEPeVfnHnUMOo/AiuYWmog/bLJBAxTE77uOAgKKuHIAVRgX8ME5MH3b33
 FaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gS4Afdh466NZ/7lzYMa7Rn0D7gKU3zPGNyIkNARUC2U=;
 b=0CKQ+bkpqa0HRTFI8z746N7aKtZXladWUX5NfESSBCnFb4EEfGaJLOfVwK6TlHyb8Y
 kgxbHIxsowcUTv86QrjXB5lTH3JgkE0a2O714GXbyMOn1Pvx9CM3/QLYw0J2EBm0OJOj
 8OMyKjdBLdbxI6uQPpf7ZhdIWk6lTyFoS/8164qMOOPDXZJS6ya3/Xvt0+VRVfGD4obh
 0MoAUqo7/gb/iN2ruc/vwcQsDkbtqLMC82Qg5D5+1s4tBBOwFoN7bhu6ZX4a76cZsji1
 kDMSAEjIHi0KV8BeZtwKrHFLfkYM+fvNf0LDFy9dixUjuIhvKwiTUNWofluTCoDyYrCi
 Dtdw==
X-Gm-Message-State: AOAM531mHt212SvbXhpGDptCTX/2V7hTyanW3/C9HNLj0lSGgpkW3VMn
 4H0VDx/Wn/Aba7xSwozYmxYnRVldPMBYaA==
X-Google-Smtp-Source: ABdhPJyqQL6z4e0vdHw101ORp4lIpCkJIUWAU965auy3c/JjtP4u3RZn06Tp34qpiUOdSKEo5kgHMQ==
X-Received: by 2002:adf:dcc6:: with SMTP id x6mr208235wrm.607.1639697695432;
 Thu, 16 Dec 2021 15:34:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l25sm3876571wmh.18.2021.12.16.15.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 15:34:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 00:34:23 +0100
Message-Id: <20211216233423.1534607-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmbim: fix build with help2man
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with help2man raised since bump to
version 1.26.0 in commit be76508af2b2253f95137a28198139732be2dcb3:

FAILED: docs/man/mbimcli.1
/usr/bin/help2man --output=docs/man/mbimcli.1 '--name=Control MBIM devices' '--help-option="--help-all"' /home/peko/autobuild/instance-1/output-1/build/libmbim-1.26.0/build/src/mbimcli/mbimcli
help2man: can't get `"--help-all"' info from /home/peko/autobuild/instance-1/output-1/build/libmbim-1.26.0/build/src/mbimcli/mbimcli
Try `--no-discard-stderr' if option outputs to stderr

Fixes:
 - http://autobuild.buildroot.org/results/eaa2ba54b9c74f07292d3cad4fa96c80e6079702

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...add-an-option-to-not-build-man-pages.patch | 60 +++++++++++++++++++
 package/libmbim/libmbim.mk                    |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch

diff --git a/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch b/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch
new file mode 100644
index 0000000000..c91756e9a6
--- /dev/null
+++ b/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch
@@ -0,0 +1,60 @@
+From 792af73ea90e9689703ab526dd444fdb1c2f8e40 Mon Sep 17 00:00:00 2001
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+Date: Thu, 14 Oct 2021 12:25:46 +0200
+Subject: [PATCH] meson.build: add an option to not build man pages.
+
+When cross-compiling, the compiled binaries cannot be run on the build
+machine, unless one defines a helper (e.g. qemu) in the meson
+configuration, which is most of the time undesirable.
+
+If help2man is installed on the build machine, then the build would fail
+because of this, so add an option to disable generating the man pages.
+
+With later versions of meson, it will be possible to automatically
+detect this condition.
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/792af73ea90e9689703ab526dd444fdb1c2f8e40]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build       | 8 +++++++-
+ meson_options.txt | 1 +
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1c5ee2d..59f1727 100644
+--- a/meson.build
++++ b/meson.build
+@@ -184,8 +184,8 @@ if enable_gtk_doc
+   subdir('docs/reference/libmbim-glib')
+ endif
+ 
+-help2man = find_program('help2man', required: false)
+-if help2man.found()
++enable_man = get_option('man')
++if enable_man
+   subdir('docs/man')
+ endif
+ 
+@@ -198,6 +203,7 @@ summary({
+ output += '    Documentation:         ' + enable_gtk_doc.to_string() + '\n'
+ output += '    bash completion:       ' + enable_bash_completion.to_string() + '\n'
+ output += '    gobject introspection: ' + enable_gir.to_string() + '\n\n'
++output += '    man pages:             ' + enable_man.to_string() + '\n\n'
+ output += '  System paths\n'
+ output += '    prefix:                ' + mbim_prefix + '\n'
+ output += '    udev base directory:   ' + mbim_username + '\n\n'
+diff --git a/meson_options.txt b/meson_options.txt
+index 1305957..bfa33ab 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -7,5 +7,6 @@ option('udevdir', type: 'string', value: '', description: 'where udev base direc
+ 
+ option('introspection', type: 'boolean', value: 'true', description: 'build introspection support')
+ option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-doc to build documentation')
++option('man', type: 'boolean', value: 'true', description: 'build man pages using help2man')
+ 
+ option('bash_completion', type: 'boolean', value: true, description: 'install bash completion files')
+-- 
+GitLab
+
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index cdc3fabedb..6737afebe8 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -12,6 +12,7 @@ LIBMBIM_CPE_ID_VENDOR = freedesktop
 LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2
+LIBMBIM_CONF_OPTS = -Dman=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBMBIM_DEPENDENCIES += gobject-introspection
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
