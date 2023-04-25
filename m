Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213ADC77B73
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB24861477;
	Tue, 25 Apr 2023 17:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB24861477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pCbHDK6XeB7M; Tue, 25 Apr 2023 17:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C16BB6145E;
	Tue, 25 Apr 2023 17:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C16BB6145E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4261BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62CF161458
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62CF161458
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FBjcEK6rAxb for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:14:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A6E861121
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A6E861121
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:14:59 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-63b87d23729so4883501b3a.0
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442898; x=1685034898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SBWgY81lI0bw+wHRbCiT+g5HM+ktNqlTwSL7ChLY8JU=;
 b=CnHsQ9ktR2qvZoOe5rKBW+9ItdkYQQxqc8o/ZXRed/7SZ/5lVMWHSPm75nd0TbRXCu
 OgwQ7PpDHvcecydI1waEI2ogp3hpMVfiEacf4BpdkIpbEXseMcyMPvYbkVIAR3Zl0Jl+
 SMwHZRM9WpWhp5yiOibn2w2ahnlc2MMEsw/RzYHwQyo9yHxrC5gm8rDE6xpD5SS8i6mw
 QRwgsUeD7Hx+bozuZ/05i3pLNoex9dUgYxdPc9D7o7oUYZbS4RrdbD/RYwinMz567f6t
 VtHIuKeFp6A9Xl55Kgsvvi4hgqsWrHvgPpMVORsHpBl+8oCSoiMmApsEa1S0tN0q2JzO
 V0/w==
X-Gm-Message-State: AAQBX9czsLbdnMpAZUMnLuLhZJAPWhpcZf2GWOFKJY3g1OvRY6ueY+xx
 6jeyuTFTK/PESgvFpzT7wXyGCsI3uWKlKw==
X-Google-Smtp-Source: AKy350aA8WXSISnLUr09VgxlQyBKFsDHdfiprokymEvT2jLNBMHx5yj1CMtyaVjxnxIQo0CmH6ZFcQ==
X-Received: by 2002:a05:6a00:148e:b0:63b:6911:8928 with SMTP id
 v14-20020a056a00148e00b0063b69118928mr24638490pfu.3.1682442898281; 
 Tue, 25 Apr 2023 10:14:58 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:14:57 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:41 -0700
Message-Id: <20230425171454.48802-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442898; x=1685034898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SBWgY81lI0bw+wHRbCiT+g5HM+ktNqlTwSL7ChLY8JU=;
 b=BvYtBUTcriuy6WWBTFqje8+dmIYG55fjbTMDfAMIIQmP8VvEdiXzA2CYvOitHilA59
 ZBrDqVdBZ81ksS6Ywq1ue0QyhJVct+DFnLMthpO+waPCm1PWnati+XwsNcsVCanxyyIq
 NvvdImq6IzwkU079JBCPvIxUj40Y/R/yAzpm8H0V3DlpnQo3D/Lacfdz+HSL8KTCC894
 ktJPlwa08byQZ03CbWjuyMAqAyoX638UYQtnKTdjpA9XDOb7DN7Wg2iaCFfEnG+0ETXU
 t7kv0/jRGNFgAUkWfFeK/uSluliWwcOj35hicLgd/jAk35QB353rAO1lDT9fx5h+K0XN
 59BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BvYtBUTc
Subject: [Buildroot] [PATCH v2 00/13] Selinux: bump to 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's been quite some time since anyone updated the SELinux packages (mainly me!)

Most of the changes are straight forward:
  - Update the package to 3.5
  - Change the license file from COPYING to LICENSE.
    (The COPYING file has been renamed to LICENSE.)

Some notes for specific packages:
  - Audit now installs ausearch to /usr/sbin (or we do?) As such, a small patch
    for selinux-python is necessary to change the patch for ausearch from /sbin
    to /usr/sbin

  - libselinux now requires host-pip to install the python modules.
    Surprisingly, host-pip3 cross-compiles the modules without issue and just
    worked. I should buy a lottery ticket!

  - I found out that if you have rst2html5 on the host, the glib meson package
    tries to use it to generate documents, which causes a failure on installing
    to the target. Luckily we don't want the documents so the fix is to simply
    remove the docs/ subdirectroy from meson.build. This patch is tiny and won't
    be a headache to maintain.
    
  - A small upstream patch needs to be added to refpolicy to ensure refpolicy
    builds without dbus selected.

Tested on Fedora 38. Both with pc_efi and aarch-virt configs.

Other tests ran and passed:

tests.init.test_systemd_selinux.TestSELinuxSystemdExt4
tests.init.test_systemd_selinux.TestSELinuxSystemdSquashfs
tests.core.test_selinux.TestSELinuxCustomGit
tests.core.test_selinux.TestSELinuxExtraModules
tests.core.test_selinux.TestSELinuxExtraModulesDirs
tests.core.test_selinux.TestSELinuxPackage

Changes v1 -> v2:
  - Added refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
  
Adam Duskett (13):
  package/libglib2/0003-disable-building-docs.patch: new patch
  package/python-pip: add host variant
  package/libsepol: bump to version 3.5
  package/libsemanage: bump to version 3.5
  package/libselinux: bump to version 3.5
  package/policycoreutils: bump to version 3.5
  package/checkpolicy: bump to version 3.5
  package/restorecond: bump to version 3.5
  package/semodule-utils: bump to version 3.5
  package/audit: bump to version 3.1
  package/selinux-python: bump to version 3.5
  package/setools: bump to version 4.4.2
  package/refpolicy: bump to version 2.20221101

 package/audit/audit.hash                      |  2 +-
 package/audit/audit.mk                        |  2 +-
 package/checkpolicy/checkpolicy.hash          |  4 +-
 package/checkpolicy/checkpolicy.mk            |  4 +-
 .../libglib2/0003-disable-building-docs.patch | 38 ++++++++++++++
 package/libselinux/0001-fix-musl-build.patch  |  4 +-
 ...T-and-rely-on-the-installed-file-nam.patch |  8 +--
 package/libselinux/Config.in                  |  1 +
 package/libselinux/libselinux.hash            |  2 +-
 package/libselinux/libselinux.mk              | 16 ++++--
 package/libsemanage/libsemanage.hash          |  4 +-
 package/libsemanage/libsemanage.mk            |  4 +-
 package/libsepol/libsepol.hash                |  4 +-
 package/libsepol/libsepol.mk                  |  4 +-
 ...-all-paths-that-use-an-absolute-path.patch |  2 +-
 package/policycoreutils/policycoreutils.hash  |  4 +-
 package/policycoreutils/policycoreutils.mk    |  4 +-
 package/python-pip/python-pip.mk              |  1 +
 ...ount-dbus-interface-must-be-optional.patch | 33 ++++++++++++
 package/refpolicy/refpolicy.hash              |  2 +-
 package/refpolicy/refpolicy.mk                |  2 +-
 package/restorecond/restorecond.hash          |  4 +-
 package/restorecond/restorecond.mk            |  4 +-
 .../0001-fix-ausearch-path.patch              | 37 ++++++++++++++
 package/selinux-python/selinux-python.hash    |  4 +-
 package/selinux-python/selinux-python.mk      |  4 +-
 package/semodule-utils/semodule-utils.hash    |  4 +-
 package/semodule-utils/semodule-utils.mk      |  4 +-
 ...e-setools.InfoFlowAnalysis-and-setoo.patch | 50 +++++++++----------
 package/setools/setools.hash                  |  4 +-
 package/setools/setools.mk                    |  2 +-
 31 files changed, 191 insertions(+), 71 deletions(-)
 create mode 100644 package/libglib2/0003-disable-building-docs.patch
 create mode 100644 package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
 create mode 100644 package/selinux-python/0001-fix-ausearch-path.patch

-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
