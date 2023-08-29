Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E76C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 12:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3474540869;
	Tue, 29 Aug 2023 12:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3474540869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrLSynca5T4f; Tue, 29 Aug 2023 12:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D987740873;
	Tue, 29 Aug 2023 12:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D987740873
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE70F1BF228
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 12:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B73CF60774
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 12:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B73CF60774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zaNSjZLR0hzZ for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 12:09:37 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B462C60742
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 12:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B462C60742
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso3441285f8f.0
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 05:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693310975; x=1693915775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o10nIMJ2GunAtQ9UK8MC3t1cd5N1AFX7005X7Nld4xo=;
 b=Zf96GOUsc6TK82oIZZTg90gGPawXP85cBpHmuD+hIenMzRPIb0gkm+9YWrRcJ+83uN
 +Jl02B4P0SFKYBmxuOg2tQALHEjomv045haDlaXJk5Qzns6f5t8qsGAFCTGc+kJV8MjR
 Wy2Ol9CdyHUiOsB6Dk8PXEwjRIe6tRZVOU0g0WgpRdayUN1pVUgznlNy+/tC58+CdWSW
 HRVYmSW0bqgSUTHWzTP6fvlOroNf6QmeBGf5EPzgquSjrPjHrxmv3v4v1ACPnTlgbpmq
 XGu5jG/WUcxxXGqMqry571WXq1rUXIdEVlXuqMW8NsB2QbqecOfZFlwpbx4niPbwQQqY
 1y6w==
X-Gm-Message-State: AOJu0YwjbozlJaIsVx+VJJCQDFEV4wgE6hbvHpumy/s7oQRZs0r2/qjv
 KIJoyPTMmXeSP5UQdvv8OsFpMCJNJbA=
X-Google-Smtp-Source: AGHT+IHZPOodcKVDv0YNmF4xgs+9kd9GViZb0bAVC5QBrqUrnFz7VKFQE+MMcRBqDJGZwvFG6QE3LQ==
X-Received: by 2002:a05:6000:18d:b0:317:e04c:6791 with SMTP id
 p13-20020a056000018d00b00317e04c6791mr20568587wrx.62.1693310974567; 
 Tue, 29 Aug 2023 05:09:34 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:12c4:970b:7d89:ea5e])
 by smtp.gmail.com with ESMTPSA id
 d10-20020adff2ca000000b0031c5e9c2ed7sm13552668wrp.92.2023.08.29.05.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 05:09:34 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 14:09:33 +0200
Message-Id: <20230829120933.335227-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693310975; x=1693915775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=o10nIMJ2GunAtQ9UK8MC3t1cd5N1AFX7005X7Nld4xo=;
 b=XN+SEoijFRYnfqYHrmD4o9D650oNSNd8zF81IpLedM0JPuPLUb6f9LGqndeRd0sWyz
 dV9b39JtP3jH1dmVHggMcleSNzcR/eGR8MpGTBSqq2cEMoJeGMCfS1k5TA5N686lRI4e
 NUHSpV1A8fJJNeNZrTSKMkAj8hZDPaGV1DK2tVUYy1633bJaK3hoZKkMQuU5t6c+rqA9
 V7yaGAiWCoL2sXsjKuXyX9bruOsVgHlghLI0pd/4qUfTDddlynptHdwU6l8a411Cd2N5
 eTFef3eOcsDXFDydxzxcLTnOVuGrzFZ/QR7ZdzPlEWb/u9ZX+zqmpssulGThpxyiM0Tx
 p3aA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XN+SEoij
Subject: [Buildroot] [PATCH] package/pcm-tools: fix github-download
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
Cc: Woody Douglass <wdouglass@carnegierobotics.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The pcm-tools package contains a version.h with git attributes:

    $ cat version.h
    #define PCM_VERSION " ($Format:%ci ID=%h$)"

    $ man 5 gitattributes
       Creating an archive
         export-subst
           If the attribute export-subst is set for a file then Git
           will expand several placeholders when adding this file to
           an archive. The expansion depends on the availability of
           a commit ID, i.e., if git-archive(1) has been given a tree
           instead of a commit or a tag then no replacement will be
           done. The placeholders are the same as those for the option
           --pretty=format: of git-log(1), except that they need to be
           wrapped like this: $Format:PLACEHOLDERS$ in the file. E.g.
           the string $Format:%H$ will be replaced by the commit hash.

So, the archive generated by github has changed since we updated
pcm-tools in 2021-12-08 with commit d1d93d488c76 (package/pcm-tools:
bump to version 202110). The downlad was still OK in 2022-01-04 [0]
but has been failing at least since 202-08-25 [1].

Since the archive is generated on the github side, there is not much we
can do to fix this up.

We switch over to using git to do the download, and we generate the
archive localy, which we know is reproducible.

We fix the version.h so that it contains the same string as the backup
tarball we host on s.b.o.

There are three other files in pcm-tools that have git attributes, to
exclude them from the generated archive, all pertaining to CI/CD stuff:
    .cirrus.yml export-ignore
    .gitlab-ci.yml export-ignore
    .travis.yml export-ignore

We don't remove them, because they have no impact on the build, and they
are anyway already present in the archive by the time we could act on it
anyway...

[0] http://autobuild.buildroot.org/results/127/1276a3d49c8848039f034e7f03632df365097e94/
[1] http://autobuild.buildroot.org/results/8bb/8bbf9c36af332bbf5e7c1abcbb594a0b231ef97e/

Reported-by: Woody Douglass <wdouglass@carnegierobotics.com>
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pcm-tools/pcm-tools.hash |  2 +-
 package/pcm-tools/pcm-tools.mk   | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
index 1853dcebb5..cfa3faeff7 100644
--- a/package/pcm-tools/pcm-tools.hash
+++ b/package/pcm-tools/pcm-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aa48ab1473720aeb7837b67bfc612100f484748720a8b8034daff00419709057  pcm-tools-202110.tar.gz
+sha256  29416f83d1de95594d225f63af34f8f074ee4822010ce2e05b1fabc66933472a  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br1.tar.gz
 sha256  0f476c77009f982dcc4bdff41e692ddd456a9862908e99f2ae3d57296decc649  LICENSE
diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index d676df57f9..c530492696 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -4,8 +4,12 @@
 #
 ################################################################################
 
-PCM_TOOLS_VERSION = 202110
-PCM_TOOLS_SITE = $(call github,opcm,pcm,$(PCM_TOOLS_VERSION))
+# Don't use the github helper, as pcm-tools uses git attributes that are
+# replaced when gnerating the archive.
+# 93fc9193a70e2f1f054be554c48f4a4791be5032 is the hash of the 202110 tag.
+PCM_TOOLS_VERSION = 93fc9193a70e2f1f054be554c48f4a4791be5032
+PCM_TOOLS_SITE = https://github.com/opcm/pcm
+PCM_TOOLS_SITE_METHOD = git
 PCM_TOOLS_LICENSE = BSD-3-Clause
 PCM_TOOLS_LICENSE_FILES = LICENSE
 
@@ -13,6 +17,14 @@ PCM_TOOLS_EXE_FILES = \
 	pcm-core pcm-iio pcm-lspci pcm-memory pcm-msr pcm-numa \
 	pcm-pcicfg pcm-pcie pcm-power pcm-sensor pcm-tsx pcm
 
+# version.h contains git attributes; replace them with the previously-known
+# value.
+define PCM_TOOLS_FIXUP_VERSION_H
+	$(SED) 's/\$$Format:%ci ID=%h\$$/2021-10-25 16:07:54 +0200 ID=93fc9193/' \
+		$(@D)/version.h
+endef
+PCM_TOOLS_POST_EXTRACT_HOOKS += PCM_TOOLS_FIXUP_VERSION_H
+
 define PCM_TOOLS_BUILD_CMDS
 	touch $(@D)/daemon-binaries
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
