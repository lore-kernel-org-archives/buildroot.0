Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4E9C19F2B
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 13:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F23C540AD9;
	Fri, 29 Jul 2022 13:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F23C540AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXpKNujEYhVq; Fri, 29 Jul 2022 13:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12EE8404B4;
	Fri, 29 Jul 2022 13:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12EE8404B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 597081BF2C6
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 13:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3449E404B4
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 13:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3449E404B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AWQ0Dv9dF6Oo for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 13:27:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5935B40364
 for <buildroot@uclibc.org>; Fri, 29 Jul 2022 13:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5935B40364
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 978E58641F; Fri, 29 Jul 2022 13:13:27 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 29 Jul 2022 13:27:18 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas.petazzoni@bootlin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14926-163-S0UIET0vrA@https.bugs.busybox.net/>
In-Reply-To: <bug-14926-163@https.bugs.busybox.net/>
References: <bug-14926-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14926] package/nodejs: build for host fails with
 GTEST errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14926

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
I am afraid the problem is not between 2022.02.1 and 2022.02.3: I can reproduce
your issue on 2022.02.1. I.e the following defconfig fails for me (I have
disabled ccache and BR2_REPRODUCIBLE just to exclude these as a possible source
of issue)

BR2_x86_64=y
BR2_x86_nehalem=y
# BR2_PIC_PIE is not set
BR2_SSP_NONE=y
BR2_RELRO_NONE=y
BR2_FORTIFY_SOURCE_NONE=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_5_4=y
BR2_GCC_VERSION_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_HOST_GDB_TUI=y
BR2_GDB_VERSION_9_2=y
BR2_TARGET_GENERIC_HOSTNAME="dcu"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_ROOT_PASSWD="qwert1234"
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
BR2_TARGET_TZ_INFO=y
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL=y
BR2_PACKAGE_GST1_PLUGINS_GOOD=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_JPEG=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTP=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTPMANAGER=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_UDP=y
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV=y
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS=y
BR2_PACKAGE_GST1_LIBAV=y
BR2_PACKAGE_GST1_VAAPI=y
BR2_PACKAGE_GST1_VAAPI_ENCODERS=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_STRESS=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_LIBVA_UTILS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_CONCURRENT=y
BR2_PACKAGE_QT5BASE_PSQL=y
BR2_PACKAGE_QT5BASE_LINUXFB=y
BR2_PACKAGE_QT5BASE_HARFBUZZ=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5SVG=y
BR2_PACKAGE_QT5WEBENGINE=y
# BR2_PACKAGE_EUDEV_ENABLE_HWDB is not set
BR2_PACKAGE_LIBARCHIVE=y
BR2_PACKAGE_MINIZIP=y
BR2_PACKAGE_SNAPPY=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_POSTGRESQL_FULL=y
BR2_PACKAGE_POSTGIS=y
BR2_PACKAGE_LCMS2=y
BR2_PACKAGE_LIBVA_INTEL_DRIVER=y
BR2_PACKAGE_WEBP_MUX=y
BR2_PACKAGE_LIBINPUT=y
BR2_PACKAGE_TSLIB=y
BR2_PACKAGE_JSONCPP=y
BR2_PACKAGE_LIBJSON=y
BR2_PACKAGE_LIBXSLT=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_LIBMICROHTTPD=y
BR2_PACKAGE_LIBNL=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_GTEST=y
BR2_PACKAGE_GTEST_GMOCK=y
BR2_PACKAGE_LIBARGTABLE2=y
BR2_PACKAGE_LIBEVENT=y
BR2_PACKAGE_SHAPELIB=y
BR2_PACKAGE_PCRE_32=y
BR2_PACKAGE_RE2=y
BR2_PACKAGE_BLUEZ5_UTILS=y
BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=y
BR2_PACKAGE_CAN_UTILS=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_GESFTPSERVER=y
BR2_PACKAGE_HTOP=y
BR2_PACKAGE_UTIL_LINUX_UUIDD=y
BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
BR2_PACKAGE_HOST_NODEJS=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
