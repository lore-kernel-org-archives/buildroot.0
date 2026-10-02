Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4B9CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 15:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C6E860BBB;
	Fri,  2 Oct 2026 15:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gl7ztxk4MOwT; Fri,  2 Oct 2026 15:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0D12B60880
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790953975;
	b=BdzNtKyrz+IOLahPdyh9J2lFq+mjXhZFwbpXDbtR9LBkQ84JSdopp4WiTg4VAKIIPrUG
	 kUouw9LvE4HT1eRmQrYw1HmS3BMBz/eLoV+XlFum30j4UMDrJJaLC9I00qi+yrLgzMIMZ
	 vDctkZlbxDd9GaKNJhrNU2vR8f1LjtgwDuGAiYA7vyxtozPWPh5TjY42MitLlsMUr038C
	 BZJca4TXyROD+QMqMoB7E6S7a8DnNqD73zQcLU+HHZ2BfsMR9ugcVVXVX74UBMZmwZjA6
	 zB6iLVHnEzP36lfdXtQjKW2YlWEYDGZ10cT2ujDKd1dsxfh5Jdtbb5Qhn0zr+9te/YA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790953975;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vzXJSFLg+KCIzP06VFSk/Mw1mWgsCrzUGO/TzhIPtCU=;
	b=iZeGqWn+RcPvJHPnKgMFbb/+pLWvjqQfITl+6rgzSh3sla/OjWSUym0GezpAmL164mCQ
	 pdnMjDZ2uWnnby6ISAhDWCI2Y9soHDN0+hAr0eeZWKFRUuyrfAs53YFoLXNC2logARh+f
	 N/bzg04DIN5XRVwkFQKrMd5biBewvgK3epXuYRuQvTzj1FLqzDy0bjmYNdd6WGd0+HUhJ
	 wWY6sA+J1RQsQ+b+KFuSPrWOBJBOl5MKOzIhZ7Rf/alKCuoo53AovAKGpaBjvrm0GINX+
	 S+x5JqHvnt2U6Qs4Srm+ryMDB+8qWcQNvx/VoNpGTloKouakVQ103iDdth/2b2W8eSA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790953975;
	bh=vzXJSFLg+KCIzP06VFSk/Mw1mWgsCrzUGO/TzhIPtCU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TPw9Fi1UMIi52Se/uB3vazMpHy8MawkxnlN0j4/GVoQiMmAk/m5PjVWLxUr3mGSqx
	 2bs3A3sA5cmhYRUDjILD6yDZ/h8Jngv9CmhTCaI/l0DpG5xmgVBwWYqYYxnaH2KbNU
	 1tOQADgpJ0ZX92r3vyAUZ3B8S103aGxQDbswLLofd+5mtV4aVgMiX5YkkV2ZxhIiIx
	 ogBJS085tZvy5iPdZMELaFPb50pmXnAjzDNo/50K9HxW+dJ+DHLseDdgtPy19E8Vs1
	 4ZEqbc1ZnwubRMmsgCo5/95P8IdumNK9yB4Wi13J5WI6/g6aym6PTB9lSQoAiJpD/U
	 a1z6PLgi+Gvsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D12B60880;
	Fri,  2 Oct 2026 15:12:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4290A2E0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 340E481204
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMtsMIKZauLd for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 15:12:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6C08A811FD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790953973;
 b=BioLKThWKh+VHOf7mMvNIvX+oGsVuBH0DTA+5mixcgGq0WnQRPpWxucG3uBUVDA5o6aG
 sM1VANzDk/95IsI4RPIIiLwu4lZf9m8TmF4nD+vYrjMjb2CAlbTuCRCjgJOUoJ+RuFj2r
 4Zdi0Nb3F3p8BtYLAcAHp+bHL3xPqkzKf3Ej+tQwn1xmCzbto4zLccqK+DUut442u7USo
 7jfz0LaM7GbPtvh+qsn4mmo2iOdMD6wEquhTNtzFrgaiNP9yJeTCAdnoPAcbI6nf0LCry
 1ICgblPKbqWD9J9EX8Flv9GLD7lc4NP4c8FrQTMv+DvxumMNRZPMMX/qJwVsF9GFZzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790953973;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=jguI21K6SszG+vek/GfEjo517T5sGzLyOirFFHuudMc=;
 b=n9JQ7XDNmStUmrCvyfwjTxci+9A40bVmwv8XzzShSciiXcjcUhjhD05Zexqj+exxh9Cs
 z0lxbM6ehBk0ZLScPTknOoXttSP4GkTaq9ohvAeI5UQk6zdB/m5xIYWvgHxgaBR6DjDtF
 paBj5bb982L4SnhU6N0ZIae5qbjNX+YZTI+xz8rVszgZrrgw7NrN2bJnbln6u7I1M06zi
 fMad7k9WXs4YWDoleAHXvPtWigOoiuT3TIi2vDcNamj9wLHdhunZztqp+eydBieR6mjS1
 0kppe1KNTamc2oTSH5X6Ip8dhyMBelJtoCBay2KJ3YJWeEOTHIuL/sbdvERibqLndCw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="ENUZE/Hm"; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C08A811FD
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6Zq-1wV5aU0kes-00ZWLM; Fri, 02
 Oct 2026 17:12:44 +0200
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri,  2 Oct 2026 17:12:24 +0200
Message-ID: <20261002151226.867507-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002151226.867507-1-fiona.klute@gmx.de>
References: <20261002151226.867507-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lK+jxTyPZqejqCiUFKpyVS1wM1lxI/Lyw6M7X7JgKzQDSyBBjAn
 8VKBUEOMaR4ffkaXHsYJXMjwbRob8JX6aVASrMIEKh3KgQ+BFXpl1A0oXgHRo+EdOpRAcce
 3UU0+zQ4sr8UM42xTr2MTXuleRGKhVdSqnOwMSmU3YvWZGle05eStkQdklQI3WC10HxWG5e
 n3je6fY11mYScHHjwP7ZA==
UI-OutboundReport: notjunk:1;M01:P0:6u/XjC/D7n4=;U/eWr8L+rqvmHZnBfsgjeeTpGSL
 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
 Tr/1siLMx7HlsuLGQ==
Subject: [Buildroot] [PATCH 1/3] package/systemd/systemd-libudev: new
 bootstrap subpackage
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Some packages that may be in the dependency chain of systemd
(depending on configuration) depend on libudev, at least for optional
features. An example is lvm2: It needs libudev to allow using udev's
built-in "blkid" implementation, instead of calling "blkid -o udev",
which Busybox's blkid does not support.

However, lvm2 is a dependency of cryptsetup (because it provides
libdevmapper), and cryptsetup is a dependency of systemd if enabled,
creating a loop if the virtual libudev package is provided by the main
systemd package.

Create a bootstrap package for systemd-libudev, which installs only
libudev and its development header and pkgconf file to staging, so
packages that need libudev can be built before systemd. The libudev
installed to the target is still provided by the main systemd package.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/systemd/Config.in                     |   7 +-
 package/systemd/systemd-libudev/Config.in     |  21 ++
 .../systemd-libudev/systemd-libudev.hash      |   1 +
 .../systemd-libudev/systemd-libudev.mk        | 195 ++++++++++++++++++
 package/systemd/systemd.mk                    |  11 +-
 5 files changed, 228 insertions(+), 7 deletions(-)
 create mode 100644 package/systemd/systemd-libudev/Config.in
 create mode 120000 package/systemd/systemd-libudev/systemd-libudev.hash
 create mode 100644 package/systemd/systemd-libudev/systemd-libudev.mk

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 4c19a884b4..75b9a12464 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,8 +26,8 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_ROOTFS_MERGED_BIN
-	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_SYSTEMD_LIBUDEV # bootstrap subpackage
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBXCRYPT
@@ -108,9 +108,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
-config BR2_PACKAGE_PROVIDES_LIBUDEV
-	default "systemd"
-
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
@@ -636,3 +633,5 @@ config BR2_PACKAGE_SYSTEMD_VMSPAWN
 	  https://www.freedesktop.org/software/systemd/man/systemd-vmspawn.html
 
 endif
+
+source "package/systemd/systemd-libudev/Config.in"
diff --git a/package/systemd/systemd-libudev/Config.in b/package/systemd/systemd-libudev/Config.in
new file mode 100644
index 0000000000..d9c2687500
--- /dev/null
+++ b/package/systemd/systemd-libudev/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_SYSTEMD_LIBUDEV
+	bool
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_PACKAGE_HAS_LIBUDEV
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBXCRYPT
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+
+if BR2_PACKAGE_SYSTEMD_LIBUDEV
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "systemd-libudev"
+
+endif
diff --git a/package/systemd/systemd-libudev/systemd-libudev.hash b/package/systemd/systemd-libudev/systemd-libudev.hash
new file mode 120000
index 0000000000..c5f620b916
--- /dev/null
+++ b/package/systemd/systemd-libudev/systemd-libudev.hash
@@ -0,0 +1 @@
+../systemd.hash
\ No newline at end of file
diff --git a/package/systemd/systemd-libudev/systemd-libudev.mk b/package/systemd/systemd-libudev/systemd-libudev.mk
new file mode 100644
index 0000000000..b0c9d063ae
--- /dev/null
+++ b/package/systemd/systemd-libudev/systemd-libudev.mk
@@ -0,0 +1,195 @@
+################################################################################
+#
+# systemd-libudev
+#
+################################################################################
+
+# Some packages that may be in the dependency tree of systemd
+# (e.g. lvm2, via cryptsetup) need libudev to build. This package
+# installs libudev only to STAGING_DIR to break the dependency loop.
+SYSTEMD_LIBUDEV_VERSION = $(SYSTEMD_VERSION)
+SYSTEMD_LIBUDEV_SOURCE = $(SYSTEMD_SOURCE)
+SYSTEMD_LIBUDEV_SITE = $(SYSTEMD_SITE)
+SYSTEMD_LIBUDEV_LICENSE = $(SYSTEMD_LICENSE)
+SYSTEMD_LIBUDEV_LICENSE_FILES = $(SYSTEMD_LICENSE_FILES)
+SYSTEMD_LIBUDEV_INSTALL_STAGING = YES
+SYSTEMD_LIBUDEV_INSTALL_TARGET = NO
+SYSTEMD_LIBUDEV_DEPENDENCIES = \
+	$(BR2_COREUTILS_HOST_DEPENDENCY) \
+	host-gperf \
+	host-python-jinja2 \
+	libcap \
+	libxcrypt \
+	util-linux-libs \
+	$(TARGET_NLS_DEPENDENCIES)
+SYSTEMD_LIBUDEV_PROVIDES = libudev
+SYSTEMD_LIBUDEV_CFLAGS = $(SYSTEMD_CFLAGS)
+
+# Disable everything that can be disabled, we only need libudev.
+SYSTEMD_LIBUDEV_CONF_OPTS = \
+	-Dsplit-bin=true \
+	--prefix=/usr \
+	--libdir=lib \
+	--sysconfdir=/etc \
+	--localstatedir=/var \
+	-Dcreate-log-dirs=false \
+	-Dvcs-tag=false \
+	-Dmode=release \
+	-Dacl=disabled \
+	-Dadm-group=false \
+	-Danalyze=false \
+	-Dapparmor=disabled \
+	-Daudit=disabled \
+	-Dbacklight=false \
+	-Dbinfmt=false \
+	-Dblkid=enabled \
+	-Dbootloader=disabled \
+	-Dbpf-framework=disabled \
+	-Dbzip2=disabled \
+	-Dcoredump=false \
+	-Dcreate-log-dirs=false \
+	-Ddbus-interfaces-dir=no \
+	-Ddbus=disabled \
+	-Ddefault-compression='auto' \
+	-Ddefault-dns-over-tls=no \
+	-Ddefault-dnssec=no \
+	-Ddefault-locale='C.UTF-8' \
+	-Ddefault-user-shell=/bin/sh \
+	-Ddns-over-tls=false \
+	-Defi=false \
+	-Delfutils=disabled \
+	-Denvironment-d=false \
+	-Dfdisk=disabled \
+	-Dfirst-boot-full-preset=false \
+	-Dfirstboot=false \
+	-Dfuzz-tests=false \
+	-Dgcrypt=disabled \
+	-Dglib=disabled \
+	-Dgnutls=disabled \
+	-Dgshadow=false \
+	-Dhibernate=false \
+	-Dhomed=disabled \
+	-Dhostnamed=false \
+	-Dhtml=disabled \
+	-Dhwdb=false \
+	-Didn=false \
+	-Dima=false \
+	-Dimportd=disabled \
+	-Dinitrd=false \
+	-Dinstall-tests=false \
+	-Dipe=false \
+	-Dkernel-install=false \
+	-Dkexec-path=/usr/sbin/kexec \
+	-Dkmod-path=/usr/bin/kmod \
+	-Dldconfig=false \
+	-Dlibarchive=disabled \
+	-Dlibcryptsetup-plugins=disabled \
+	-Dlibcryptsetup=disabled \
+	-Dlibcurl=disabled \
+	-Dlibfido2=disabled \
+	-Dlibidn2=disabled \
+	-Dlibidn=disabled \
+	-Dlibiptc=disabled \
+	-Dlibmount=enabled \
+	-Dloadkeys-path=/usr/bin/loadkeys \
+	-Dlocaled=false \
+	-Dlog-message-verification=disabled \
+	-Dlogind=false \
+	-Dlz4=disabled \
+	-Dmachined=false \
+	-Dman=disabled \
+	-Dmicrohttpd=disabled \
+	-Dmount-path=/usr/bin/mount \
+	-Dmountfsd=false \
+	-Dnetworkd=false \
+	-Dnologin-path=/bin/false \
+	-Dnspawn=disabled \
+	-Dnsresourced=false \
+	-Dnss-myhostname=false \
+	-Dnss-mymachines=disabled \
+	-Dnss-resolve=disabled \
+	-Dnss-systemd=false \
+	-Doomd=false \
+	-Dopenssl=disabled \
+	-Dp11kit=disabled \
+	-Dpam=disabled \
+	-Dpasswdqc=disabled \
+	-Dpcre2=disabled \
+	-Dpolkit=disabled \
+	-Dportabled=false \
+	-Dpstore=false \
+	-Dpwquality=disabled \
+	-Dqrencode=disabled \
+	-Dquotacheck=false \
+	-Drandomseed=false \
+	-Dremote=disabled \
+	-Drepart=disabled \
+	-Dresolve=false \
+	-Drfkill=false \
+	-Dseccomp=disabled \
+	-Dselinux=disabled \
+	-Dsetfont-path=/usr/bin/setfont \
+	-Dsmack=false \
+	-Dstoragetm=false \
+	-Dsulogin-path=/usr/sbin/sulogin \
+	-Dsysext=false \
+	-Dsystem-gid-max=999 \
+	-Dsystem-uid-max=999 \
+	-Dsysupdate=disabled \
+	-Dsysupdated=disabled \
+	-Dsysusers=false \
+	-Dsysvinit-path= \
+	-Dsysvrcnd-path= \
+	-Dtests=false \
+	-Dtimedated=false \
+	-Dtimesyncd=false \
+	-Dtmpfiles=false \
+	-Dtpm2=false \
+	-Dtpm=false \
+	-Dukify=disabled \
+	-Dumount-path=/usr/bin/umount \
+	-Durlify=false \
+	-Duserdb=false \
+	-Dutmp=false \
+	-Dvconsole=false \
+	-Dvmlinux-h=disabled \
+	-Dvmspawn=disabled \
+	-Dwheel-group=false \
+	-Dxdg-autostart=false \
+	-Dxenctrl=disabled \
+	-Dxkbcommon=disabled \
+	-Dxz=disabled \
+	-Dzlib=disabled \
+	-Dzstd=disabled
+
+ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
+endif
+
+ifeq ($(BR2_PACKAGE_ACL),y)
+SYSTEMD_LIBUDEV_DEPENDENCIES += acl
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dacl=enabled
+else
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dacl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_KMOD),y)
+SYSTEMD_LIBUDEV_DEPENDENCIES += kmod
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dkmod=enabled
+else
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dkmod=disabled
+endif
+
+# Build only libudev, libudev.pc is not part of the pre-defined
+# target.
+SYSTEMD_LIBUDEV_NINJA_OPTS = libudev src/libudev/libudev.pc
+
+define SYSTEMD_LIBUDEV_INSTALL_STAGING_CMDS
+	$(HOST_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(HOST_DIR)/bin/meson install -C $(@D)/buildroot-build --no-rebuild --tags libudev
+	$(INSTALL) -m 0644 -D $(@D)/src/libudev/libudev.h \
+		$(STAGING_DIR)/usr/include/libudev.h
+	$(INSTALL) -m 0644 -D $(@D)/buildroot-build/src/libudev/libudev.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libudev.pc
+endef
+
+$(eval $(meson-package))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 290c2f1307..d122bf8229 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -10,8 +10,10 @@
 # - If yes, propagate the dependencies to BR2_INIT_SYSTEMD
 # - If the required kernel options have changed, update the Config.in
 #   help text and the list of KCONFIG_ENABLE_OPT.
-# - Check if there are new meson_options. Make sure all options are set
-#   explicitly (usually to default value).
+# - Check if there are new meson_options. Make sure all options are
+#   set explicitly (usually to default value). Same in
+#   package/systemd/systemd-libudev, except options not needed for
+#   libudev should be disabled.
 # - If there are new services:
 #   - create new options for them (if they really are optional);
 #   - create a new _USER if necessary;
@@ -58,11 +60,12 @@ SYSTEMD_DEPENDENCIES = \
 	libcap \
 	libxcrypt \
 	util-linux-libs \
+	systemd-libudev \
 	$(TARGET_NLS_DEPENDENCIES)
 
 SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
-SYSTEMD_PROVIDES = libudev udev
+SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
 	-Dcreate-log-dirs=false \
@@ -1052,3 +1055,5 @@ HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
 
 $(eval $(meson-package))
 $(eval $(host-meson-package))
+
+include package/systemd/systemd-libudev/systemd-libudev.mk
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
