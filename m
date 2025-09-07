Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CDBCA1017
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 13:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B4BA60BE6;
	Sun,  7 Sep 2025 13:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAktTiBpOY4D; Sun,  7 Sep 2025 13:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A232560D7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A232560D7A;
	Sun,  7 Sep 2025 13:37:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E0049E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B7E860D7A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4e2fN9BjOLJ for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 13:37:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D8C860BE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D8C860BE6
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D8C860BE6
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5A9AC4E40C48
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1B8CF6061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3333F102F286D; 
 Sun,  7 Sep 2025 15:37:23 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Sep 2025 15:37:11 +0200
Message-ID: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757252243; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=V5D1q8J655H0NcT7qpk/Ho/PnP+oEUFB++6Pp8Mzh/Q=;
 b=1ULiFsZPQfBodkOLSHa7Jr++bqVCza6wGoCfRTCCIQ/Td0JR4gfKRN0M517ErZG0WInuRK
 By/pS1JjrQxHX3DnqJUVcdlTPZ1S1DMBa9UEnJhuQigKeZQobhCz0jRsvjNeXwoN7DMuwz
 LH6ZwjNrht6Zn6KtJacKdElSKqkV5GqApYN3ELW85lwqTzPe7CYvH7rp5MwyydDezwrkTq
 qEJN5Yh2PD1uCccDvE40XR/VmC13ByrngJe0e+MSS+R7cDI+RdFO/1a8PNWArwHGSw3QOK
 oHye1E0RaH4NO38W02ku3D7FZ0wFQLmnap4TKLLIUxrUppYIF5fi5gyl3SV6WQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1ULiFsZP
Subject: [Buildroot] [PATCH 0/6] Remove linphone and related packages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Since we bumped mbedtls to version 3.x in commit
3481a9643fc7223e400ed877f08ade34d44e6b78, linphone cannot build. More
specifically, its dependency bctoolbox no longer builds, making it
impossible for linphone to build.

Newer versions of bctoolbox have mbedtls 3.x support, but it requires
a different threading model than the one we build medtls with, and you
can only build mbedtls with one threading model as a time.

Additionnally, bctoolbox and all other linphone-specific dependencies
are no longer maintained upstream as standalone projects: they have
been bundled into linphone itself.

Also, linphone does not have a maintainer in our DEVELOPERS file, and
the person who was maintaining bctoolbox, Fabrice Fontaine, is no
longer active in the Buildroot community.

Therefore, let's drop linphone and the related packages. It will
always be time for someone to revive this package and submit a more
recent version.

Thomas

Thomas Petazzoni (6):
  package/linphone: remove package
  package/belle-sip: remove package
  package/belr: remove package
  package/mediastreamer: remove package
  package/ortp: remove package
  package/bctoolbox: remove package

 .checkpackageignore                           |   4 -
 Config.in.legacy                              |  48 +++++
 DEVELOPERS                                    |   2 -
 package/Config.in                             |   6 -
 ...1-Fix-Libs.private-flags-for-mbedtls.patch |  37 ----
 package/bctoolbox/Config.in                   |  19 --
 package/bctoolbox/bctoolbox.hash              |   3 -
 package/bctoolbox/bctoolbox.mk                |  42 ----
 package/belle-sip/Config.in                   |  22 ---
 package/belle-sip/belle-sip.hash              |   3 -
 package/belle-sip/belle-sip.mk                |  40 ----
 package/belr/Config.in                        |  19 --
 package/belr/belr.hash                        |   3 -
 package/belr/belr.mk                          |  25 ---
 ...re-paths-paths.cpp-fix-powerpc-build.patch |  35 ----
 package/linphone/Config.in                    |  41 ----
 package/linphone/linphone.hash                |   4 -
 package/linphone/linphone.mk                  |  42 ----
 ...-nowebcam.c-fix-build-without-ffmpeg.patch |  55 ------
 ...FER_PADDING_SIZE-to-determine-paddin.patch |  46 -----
 package/mediastreamer/Config.in               |  28 ---
 package/mediastreamer/mediastreamer.hash      |   3 -
 package/mediastreamer/mediastreamer.mk        | 179 ------------------
 package/ortp/Config.in                        |  16 --
 package/ortp/ortp.hash                        |   3 -
 package/ortp/ortp.mk                          |  25 ---
 26 files changed, 48 insertions(+), 702 deletions(-)
 delete mode 100644 package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch
 delete mode 100644 package/bctoolbox/Config.in
 delete mode 100644 package/bctoolbox/bctoolbox.hash
 delete mode 100644 package/bctoolbox/bctoolbox.mk
 delete mode 100644 package/belle-sip/Config.in
 delete mode 100644 package/belle-sip/belle-sip.hash
 delete mode 100644 package/belle-sip/belle-sip.mk
 delete mode 100644 package/belr/Config.in
 delete mode 100644 package/belr/belr.hash
 delete mode 100644 package/belr/belr.mk
 delete mode 100644 package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch
 delete mode 100644 package/linphone/Config.in
 delete mode 100644 package/linphone/linphone.hash
 delete mode 100644 package/linphone/linphone.mk
 delete mode 100644 package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
 delete mode 100644 package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
 delete mode 100644 package/mediastreamer/Config.in
 delete mode 100644 package/mediastreamer/mediastreamer.hash
 delete mode 100644 package/mediastreamer/mediastreamer.mk
 delete mode 100644 package/ortp/Config.in
 delete mode 100644 package/ortp/ortp.hash
 delete mode 100644 package/ortp/ortp.mk

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
