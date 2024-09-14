Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D59C021A6
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BD7412FB;
	Sat, 14 Sep 2024 16:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZq2yX2OxuKy; Sat, 14 Sep 2024 16:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C832D412FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C832D412FF;
	Sat, 14 Sep 2024 16:44:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 400381BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F2E8840C3
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1aSPTzkPu6A for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:44:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFDB4840C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFDB4840C2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFDB4840C2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:44:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 098C9C0003;
 Sat, 14 Sep 2024 16:44:34 +0000 (UTC)
Date: Sat, 14 Sep 2024 18:44:33 +0200
To: Ben Hutchings via buildroot <buildroot@buildroot.org>
Message-ID: <20240914184433.061122ac@windsurf>
In-Reply-To: <20240411145559.1183064-2-ben.hutchings@mind.be>
References: <20240411145559.1183064-1-ben.hutchings@mind.be>
 <20240411145559.1183064-2-ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726332275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DL1q6BXiUuiKhyElTdTTCamcmEdgcrfGiUitx/b8Dhg=;
 b=grgjZxZPC79vOUm3cOLFjb+RMvQIB+cW2B5gJTHMXl3+Jsm5aPn8U6hFp8Hx//cfYk+tXr
 clprwebtETBb89+zKDYvPnv1CK6SUhOKHPKw8u7onN/glH6xmKy/Ka7w+A6b3vh988hB+Y
 aLYWvwx0VNk5oc5R0clJeW3Dc5IyKiDu2iCYEVan5oxtqMzVOote7pm9wOqrlKUI+Fw+hW
 hLbpbKJD8SxcWRqoJKlqm2cRE5Z4omHcKMKZviN9XHE6NHBDI27q2I3eCCM0/DkHXsYf7Z
 cK5aKBwis+vNvfRbTWBN/7lk+sHtEPtFucf91ifKt+t8RLk7Azr2yzMLtuP9Qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=grgjZxZP
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6base: Restore DirectFB
 support
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
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ben,

On Thu, 11 Apr 2024 16:55:59 +0200
Ben Hutchings via buildroot <buildroot@buildroot.org> wrote:

> Apply a patch from upstream to make Qt 6 support DirectFB again.
> 
> Implement a config option for this, similar to what we do for Qt 5.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  package/qt6/qt6base/Config.in                 |   8 +
>  .../qt6base-directfb-Fix-compilation.patch    | 288 ++++++++++++++++++
>  package/qt6/qt6base/qt6base.mk                |   7 +
>  3 files changed, 303 insertions(+)
>  create mode 100644 package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch

I applied this, dropped the qt6base-directfb-Fix-compilation.patch
patch as we have a newer version of Qt6 that includes this fix, and
tried a build, but it fails with:

CMake Error at cmake/QtTargetHelpers.cmake:171 (target_link_libraries):
  Target "QDirectFbIntegrationPlugin" links to:

    EGL::EGL

  but the target was not found.  Possible reasons include:

    * There is a typo in the target name.
    * A find_package call is missing for an IMPORTED target.
    * An ALIAS target is missing.

Call Stack (most recent call first):
  cmake/QtPluginHelpers.cmake:348 (qt_internal_extend_target)
  src/plugins/platforms/directfb/CMakeLists.txt:11 (qt_internal_add_plugin)

so it looks like Qt6 expects EGL when the DirectFB backend is enabled?
Not sure it makes sense.

This defconfig fails to build:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_DIRECTFB=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_DIRECTFB=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
