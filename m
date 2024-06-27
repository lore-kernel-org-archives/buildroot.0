Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB33C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 19:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E20BC60E93;
	Thu, 27 Jun 2024 19:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uus8Atrj_ny; Thu, 27 Jun 2024 19:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0809D60E85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0809D60E85;
	Thu, 27 Jun 2024 19:33:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 719111BF3D9
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 19:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FBD384181
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 19:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skxv-TSDQRcw for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 19:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBFB880F40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBFB880F40
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBFB880F40
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 19:33:40 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sMusC-008G4x-Of; Thu, 27 Jun 2024 21:33:36 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 3979db77;
 Thu, 27 Jun 2024 19:33:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 22:33:28 +0300
Message-ID: <20240627193335.4069574-1-aperez@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240208095531.99049-1-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KT+AI0WfijeqKnHhCBqnqBYMPpOuaGi5xSxBzYoqPI0=; b=EKLeERK/nru8jn2Def7g0M3XXg
 LkYCw5wrftPl5z8ia+AEGwJd+aTH+2Tb8CbYz0lYxMHVd3n0OtVN9l3OIAZRnoS44Fg4UJJBPo3BX
 LQxJRMQDdAGAp4UpE4LVHM+wJWEsgcS9s9zLruQB6lmx33bXO1zxzP5XuybCT3qdZIFWmZh2kKCGN
 4ayXx67SCKn8W4UvnJhAbScj8Rw17fY9DPdxJ9AJh8FDxpHuWk9Si0RU0N42lNp7ocic8B4u5Hndz
 sxxgBMIbzvSw3RCR6fD2WQjmyxH7SCast/lh1zty2Xny7wl2GlnTS41zmpiEQU3UEVNUWbBT/Agdb
 0SboL2Vg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=EKLeERK/
Subject: [Buildroot] [PATCH v2 0/4] Add support for the WPE WebKit RDK
 backend
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,

Here's a v2 re-spin after a rebase and adding one additional fixup =)

This patch series allows using the RDK backend for WPE WebKit. Currently the
main use case is to run WPEWebKit on RaspberryPi boards using on Dispmanx via
the rpi-userland EGL/GLES libraries.

In order to allow using the new wpebackend-rdk package I needed to un-hardcode
usage of wpebackend-fdo, in two places:

 - The cog package may be built without wpebackend-fdo, passing an empty
   list of platform plug-ins. It has built-in support to load "simple"
   WPE backends like wpebackend-rdk. This was done by adding a config
   option for the headless plug-in, instead of always building it, and
   adjusting dependencies.

 - The wpewebkit package does not need wpebackend-fdo at all during the
   build. It only needs a backend installed at run time. This means it is
   enough to make wpewebkit have a "depends on" on any of the backends,
   to make sure they will be in the build, but none needs to be listed in
   WPEWEBKIT_DEPENDENCIES. Also, libdrm is not strictly needed and only
   used if selected by some other means.

I have tested this making builds based on raspberrypi3_defconfig, adding
rpi-userland and then picking wpebackend-rdk + wpewebkit + cog.

Adrian Perez de Castro (4):
  package/wpebackend-rdk: new package
  package/cog: depend on wpebackend-fdo only if needed
  package/wpewebkit: do not depend on wpebackend-fdo
  package/wpewebkit: disable libdrm usage when not available

 package/Config.in                          |  1 +
 package/cog/Config.in                      | 28 ++++++++++-
 package/cog/cog.mk                         | 13 +++--
 package/wpebackend-rdk/Config.in           | 57 ++++++++++++++++++++++
 package/wpebackend-rdk/wpebackend-rdk.hash |  5 ++
 package/wpebackend-rdk/wpebackend-rdk.mk   | 43 ++++++++++++++++
 package/wpewebkit/Config.in                |  9 ++--
 package/wpewebkit/wpewebkit.mk             |  9 +++-
 8 files changed, 154 insertions(+), 11 deletions(-)
 create mode 100644 package/wpebackend-rdk/Config.in
 create mode 100644 package/wpebackend-rdk/wpebackend-rdk.hash
 create mode 100644 package/wpebackend-rdk/wpebackend-rdk.mk

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
