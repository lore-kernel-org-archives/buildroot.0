Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB3DE7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 20:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1ED981D35;
	Wed,  4 Dec 2024 20:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLXYgdHdySuN; Wed,  4 Dec 2024 20:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CED41820B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CED41820B0;
	Wed,  4 Dec 2024 20:48:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C3381DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EED87607B8
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pio35Ez-fpUK for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 20:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C52A16085E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C52A16085E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C52A16085E
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:48:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9C7BE240003;
 Wed,  4 Dec 2024 20:48:08 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Dec 2024 21:47:59 +0100
Message-ID: <20241204204806.159596-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1733345288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+MJJuX4Jdgx3jliD9UX4oYE3hM2O7ptc+d0mSFbrnUQ=;
 b=P1a24z04ynJbmMEIeOp49gqXPHh0YbP/mqW1UBndL0eZzP6xLBXUPdipOdSRth2o1D9bCh
 B94MaOFrDADVybHNxr4z257/ZwC1CkkevpE7zCuNS/GNcwNa+8y4WvI9D/wvYx0z1qjjAU
 7fPSE9WwUiWOsAZmFzsSYXsg8X+CmHDVRed8IsOPNpj1G0LTtU0mzY09ykTl0fdqZqV21N
 RpH0cFqnY0H8ekKecrwPjI4gDUtyFDt+VOzh2x39je00TdcN1eje90Ftn5nZYoaD6YKofY
 8M5bqPQSh8hwUj9KTZljIzSgRbOMp19srL6JWRsc/V+VuxYqY3jBwugQsJLpuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P1a24z04
Subject: [Buildroot] [PATCH 0/3] Fix two android-tools build issues
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

The android-tools has been causing failures in the autobuilders pretty
much every day for the past few months, so it was about time to fix
those issues.

This patch series fixes the two most prominent issues:

- An issue related to u64 definition on powerpc64/mips64, which has
  been occurring in the autobuilders since at least Feb 2021. This
  patch should be backported to 2024.02.x.

- An issue related to GCC 14.x. Since the support of GCC 14.x is not
  in 2024.02.x, this second fix is not strictly needed in 2024.02.x,
  but also shouldn't be harmful.

A preparation patch converting the existing patch stack to be
applicable with "git am" is proposed, as it was needed to preserve my
sanity while working on the patch series.

Thomas Petazzoni (3):
  package/android-tools: convert all patches to Git-formatted patches
  package/android-tools: fix build issue on mips64 and powerpc64
  package/android-tools: fix b64_pton() issue with GCC >= 14.x

 .checkpackageignore                           |  9 +-
 ...-Fix-makefiles-for-out-of-tree-build.patch |  7 +-
 ...0002-Fix-adbd-for-non-Ubuntu-systems.patch |  9 +-
 ...0003-Adjust-base64-function-handling.patch | 96 +++++++++++++++++++
 .../0003-Fix-build-issue-with-uclibc.patch    | 36 -------
 .../0004-Fix-build-issue-with-musl.patch      | 25 +++--
 ...efiles-use-pkgconf-to-get-libs-deps.patch} | 47 +++++----
 ...006-Fix-build-on-big-endian-systems.patch} | 20 +++-
 ...clude-cdefs.h-wherever-it-is-needed.patch} | 18 ++--
 ...smacros.h-to-compile-with-glibc-2.28.patch | 42 --------
 ...minor-major-build-failure-due-to-gli.patch | 59 ++++++++++++
 ...les-for-out-of-tree-ext4_utils-build.patch |  4 +-
 ...atch-for-openssl-1.1.0-compatibility.patch |  4 +-
 ...stboot.c-reorder-functions-to-avoid-.patch |  4 +-
 ...parse_read.c-add-missing-output_file.patch |  4 +-
 ...s-make_ext4fs_main.c-disable-Android.patch |  4 +-
 ...014-core-adbd-adb.c-open-code-capset.patch |  4 +-
 ...b.c-include-correct-header-for-prctl.patch |  4 +-
 ...s-make_ext4fs.c-define-__SANE_USERSP.patch | 68 +++++++++++++
 19 files changed, 320 insertions(+), 144 deletions(-)
 create mode 100644 package/android-tools/0003-Adjust-base64-function-handling.patch
 delete mode 100644 package/android-tools/0003-Fix-build-issue-with-uclibc.patch
 rename package/android-tools/{0005-Use-pkgconf-to-get-libs-deps.patch => 0005-makefiles-use-pkgconf-to-get-libs-deps.patch} (57%)
 rename package/android-tools/{0006-fix-big-endian-build.patch => 0006-Fix-build-on-big-endian-systems.patch} (75%)
 rename package/android-tools/{0007-include-cdefs-h-when-needed.patch => 0007-Include-cdefs.h-wherever-it-is-needed.patch} (71%)
 delete mode 100644 package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
 create mode 100644 package/android-tools/0008-usb_linux.c-fix-minor-major-build-failure-due-to-gli.patch
 create mode 100644 package/android-tools/0016-extras-ext4_utils-make_ext4fs.c-define-__SANE_USERSP.patch

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
