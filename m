Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA53C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 16:13:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50E9611C3
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 16:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C50E9611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F5F0400C5;
	Tue, 28 Sep 2021 16:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RTn-nCJGm1wC; Tue, 28 Sep 2021 16:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A210040270;
	Tue, 28 Sep 2021 16:13:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6CB1BF386
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 16:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 283C380C3C
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 16:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBDapGALIQ25 for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 16:13:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A06E780E1B
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 16:13:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E196D8D41A; Tue, 28 Sep 2021 16:10:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 17:46:12 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: aca81799780bc1c686e34b0dbd1371f09bad0080
X-Git-Newrev: a2c6fcc5001f77184a8773e6d8c6e3f351afd183
X-Patchwork-Hint: ignore
Message-Id: <20210928161048.E196D8D41A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/openjdk: fully
 switch to Github, commonalise version scheme
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2c6fcc5001f77184a8773e6d8c6e3f351afd183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit 057e27029c98 (package/openjdk{, -bin}: bump latest to version
16.0.1+9) partially switched over to using the Github repository (which
is the new official publication channel for OpenJDK).

However, only the JDK16 was switched, because of concerns about a change
in the hash of Github-generated archives for the JDK11, due to a missing
Hg-related file on Github.

But as Arnout put it:
    There's a trivial workaround: drop OPENJDK_SOURCE = .... That way,
    the tarball name becomes openjdk-... instead of jdk-... and it's a
    different file.

There is indeed no good reason to force a non-default filename for the
archive, so we do drop it.

As a consequence, we can fully switch over to Github for openjdk, using
the new version scheme. Of course the hash changes, but it is a new
file, so that's OK.

The filename for the JDK16 changes, but the content does not change, so
the hash does not change.

For consistency, the version scheme is also applied to openjdk-bin. Even
though it was already using Github, using that new version scheme also
allows to commonalise the variables too. The archives are the exact
same: no change in filename or content, so no hash to fixup.

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
cc: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 750fb4ec3efde059a148f647c67412beac52cf4b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk-bin/openjdk-bin.mk | 14 +++++---------
 package/openjdk/openjdk.hash       |  4 ++--
 package/openjdk/openjdk.mk         | 14 ++++----------
 3 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index e63278be76..b48155dc28 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -7,18 +7,14 @@
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 16
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_9
+else
+HOST_OPENJDK_BIN_VERSION_MAJOR = 11
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.11_9
+endif
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
-else
-# NOTE! When bumping the 11 version, be sure to switch to github,
-# *and* commonalise the _VERSION, _SOURCE, and _SITE variables, above
-HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.11
-HOST_OPENJDK_BIN_VERSION_MINOR = 9
-HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
-HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
-HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
-endif
+
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index f96c638d40..ba6c4385e7 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3b3aca61fe2834322e51636d99bcd09c4abba7d8a2cde231dbcbcbdedf829baf  jdk-16.0.1+9.tar.gz
-sha256  c8b9d92028f6e46d94bde65ebce3b593fdcc0d1ca1fa00482f38815ed37c92a1  jdk-11.0.11+9.tar.gz
+sha256  3b3aca61fe2834322e51636d99bcd09c4abba7d8a2cde231dbcbcbdedf829baf  openjdk-16.0.1+9.tar.gz
+sha256  55841c01dbe6606e0d5f88045fb2da02632ce3a2d9d9b25d030a06eadeee0f62  openjdk-11.0.11+9.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index ec5b23314b..cbb975ca25 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -7,18 +7,12 @@
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
 OPENJDK_VERSION_MAJOR = 16
 OPENJDK_VERSION_MINOR = 0.1+9
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
-OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
-OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 else
-# NOTE! When bumping the 11 version, be sure to switch to github,
-# *and* commonalise the _VERSION, _SOURCE, and _SITE variables, above
-OPENJDK_VERSION_MAJOR = 11.0.11
-OPENJDK_VERSION_MINOR = 9
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
-OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
-OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk11u/archive
+OPENJDK_VERSION_MAJOR = 11
+OPENJDK_VERSION_MINOR = 0.11+9
 endif
+OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
+OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
