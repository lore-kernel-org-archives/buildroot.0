Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A9EC77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1B0D410E7;
	Mon, 24 Apr 2023 20:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1B0D410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rqjRyePcYrOd; Mon, 24 Apr 2023 20:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A86410E8;
	Mon, 24 Apr 2023 20:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42A86410E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24EDA1BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB45760C0F
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB45760C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JaqEXpbfLkDp for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0998F60AA5
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0998F60AA5
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:18 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63d2ba63dddso4067149b3a.2
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367918; x=1684959918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8DMsues7sAGZMheyHty/kKefSYfWNmopJ+rb7cOaq58=;
 b=LrmdMFUx4fXdS7+oDrV8INrrfOXgNfD96D47tYDMfu92U/UXbJJdCFpdOECPLaz2Li
 RLrrcoErt1OIzwrN4pQK/KO2JwmT7pYZGYGvv1gfjL/U33XXtLb84spiJ/62oq7jcOB+
 l0CR4GBNFx29WKq0cY3/6wX4TrIhx6r8Jfy5b9igGfKwvQhYsxz9Kk9PVoNS4peJax2z
 QRnN1IrLR2cdRvhcCF82KSmb4KhxInt9+8PWNExBNiZ17iOaTDEooiob1QwfWNrV/Vaa
 5kgfFnDEaceHOPO1YMn+PXhy2M1XQHsyPx9JRKOYhpyb/S095ECzvrSmSm19uULOaefg
 8NKQ==
X-Gm-Message-State: AAQBX9combnS08Vm/pr88gb7bPGq78GsPiSrIBep6YFk+5TRUTNOzD52
 GPawjgYox2o2GPvaiVocxUq+/ja7/jbxgA==
X-Google-Smtp-Source: AKy350aAr0l36eIqGU7kUu8xKfvGZcnL+brWMbJAOTwyscjaGDk+RkMmHpn5oEETvD+STCB8st9lnQ==
X-Received: by 2002:a05:6a20:1441:b0:f3:67da:9db5 with SMTP id
 a1-20020a056a20144100b000f367da9db5mr9213241pzi.38.1682367917416; 
 Mon, 24 Apr 2023 13:25:17 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:16 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:01 -0700
Message-Id: <20230424202514.1546092-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367918; x=1684959918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8DMsues7sAGZMheyHty/kKefSYfWNmopJ+rb7cOaq58=;
 b=I7J+cNJQVAW0uUGGI3bwNKxZ9J3PtHtbJn5M3ALZIcR18Gh2MhEDkVF15jntd0u7Pq
 PiNduVhweFr0VXmH6Xb6//IxCGCPW+IgUvuyAc3Vq6t6t2CvSBAlL86RChnWBrdqSQho
 hn4keTy4uL2zZy+9IvuhYPIbQjrGeS331Wo28IBJyW/4nvHONmC+l3G4j9uH7jRZS57A
 sUwJVZsllZl3jHk/9JILSd28XEBGnoqfJOeDNXGWJ++qTMfsDB3pGA2QqJGWTgwEmqd9
 zlQlMIIYrITAukaEPNNJGCaUb8IJGKd3MiGnQHh5jC4F3+jlSHkBV0aq4aTpkxcY8p2M
 7j1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=I7J+cNJQ
Subject: [Buildroot] [PATCH 00/13] Selinux: bump to 3.5
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

Tested on Fedora 38. Both with pc_efi and aarch-virt configs.

Adam Duskett (13):
  package/libglib2/0003-disable-building-docs.patch
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
 30 files changed, 158 insertions(+), 71 deletions(-)
 create mode 100644 package/libglib2/0003-disable-building-docs.patch
 create mode 100644 package/selinux-python/0001-fix-ausearch-path.patch

-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
