Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50903C44506
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 00:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C57CB406A0;
	Sun, 12 Jul 2026 00:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5rNiAQkzzq6; Sun, 12 Jul 2026 00:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6E8D406AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783815047;
	bh=WRDbqw2zcPhkgWpFAeWRHQc37O6FVAPnEJmFfLA4+eE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DHgeeeQd/J8x+Guv+VMbKdHNbvBm/jBGxZ3GQcwoPogiwIz+2bIhXbBLE7OAKxV85
	 vuYwvYjLskQDIJj60pXe9PtsuzgKkxjVu7p6Rb03i6pxvC0TxyP5FjYRHbWaxgSo9p
	 uEX0X2zCK6fu/lTJRA2epXqjvoI36DD4UIYMkpcFhlGhnKyI799eFf0GLWI+8H5dRY
	 h3HpTVgwLURUHtenqpP4E7pbSSrH5ji2c5WBO2QAnzdNPDJ8oo9zP/+Yr/kfujITYT
	 vdMU3YJbDpptfwTJSqoIBy4Dl+PegggUA7v5gyxkMOuGOjlm1To4lUsTUbh5PJ/gJH
	 Tcz0HDnA/1bgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E8D406AE;
	Sun, 12 Jul 2026 00:10:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1DF42EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 00:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7B49819D5
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 00:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQTj5zD1G4Kx for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 00:10:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C492817AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C492817AB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C492817AB
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 00:10:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGRA-1wRabB0Gvu-00XKuw; Sun, 12
 Jul 2026 02:10:39 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 12 Jul 2026 02:10:12 +0200
Message-ID: <20260712001013.101890-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:sXyUkITVaF9407lHR9pf3ZUyy5Wbxf6R3HtXQN2iFAz3yaA6tqU
 rx/uBhSfhHrw6fhBwF5+brnOfwoXGEo7SG4l4/4P9VkLIZZOrIrF/3Do8JONKaWs7+wooQf
 jZ30kt3MP1lkOb43AekE37kQzgZR7PHh9lScU/M1SuzImsvmQzZYeGASRqYwIYPjUlOm0jf
 5qccPOzNa4CjmPsl743ng==
UI-OutboundReport: notjunk:1;M01:P0:q9ae70zA+FI=;mrMN7zqEdZwFO8p0MyWYNu6NaZp
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783815039; x=1784419839; i=fiona.klute@gmx.de;
 bh=pM57nEbbxndYBUZ7878ph8akfE7oP+8oKLx7jfztaIU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=c3B9xo1KnX9xeh0guQ1DzVeOIEeOIm/xWhVMEz54zqaaHKEkuZMBFrDGwyXpqRlw
 W7OzeVQaYnRQUltPcG2aPiqXD9Qobjd76K6f+0Hmyv+BIpW4ATe5/PVKzF+hb0iU5
 KOgcVW/MxfMKghJUl3oW2p0td5TBPfH/Z/yjJQYiO1HM3IU1yawEHxiv/fQj4NVXA
 WC9jsCuzGlNycvPq23IFPrAqjR8labXza2jzUh1i6akezCY2uyD/hl+HIy6esRXgG
 rwpV2LQORhFSYaAWPueRigZkC44b7CHH/iw24f9hvv4c6KF2R9FcGvcboZlo71h/V
 tG9Ee8W1RcQeHkt/Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=c3B9xo1K
Subject: [Buildroot] [PATCH 1/2] package/fakeroot: bump to version 2.1.4
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

The source archive does not contain a pre-build configure script any
more, so enable autoreconf. Fakeroot also contains an experimental
Meson build definition since 2.1.

Since v6.10.1 btrfs-progs uses nftw() [1], which package/fakeroot did
not support before v2.0 [2]. This update allows updating btrfs-progs
past v6.10 without breaking build of btrfs rootfs images.

Upstream changes:
https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.2...upstream%2F2.1.4

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit?id=c6464d3f99ed1dabceff1168eabb207492c37624
[2] https://salsa.debian.org/clint/fakeroot/-/commit/3502c515c73ee02e7f557e6a3bfc1af675dd3d34

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I mentioned the Meson build definition for completeness, switching the
package to it should wait until it's no longer experimental.

 package/fakeroot/fakeroot.hash | 6 +++---
 package/fakeroot/fakeroot.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 82a6214380..0c330b7792 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
-sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3  fakeroot_1.37.2.orig.tar.gz
-sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
+# From https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot/fakeroot_2.1.4-1.dsc
+sha1  9d55e62a34612316058166f7c528d9fc2f30c719  fakeroot_2.1.4.orig.tar.xz
+sha256  0822bd5a9f0cf19d2ba0546b88b0432d4d3d9917db62c57b74044ccadba06e49  fakeroot_2.1.4.orig.tar.xz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 12d7f1c4a1..216c62bc52 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.37.2
-FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
+FAKEROOT_VERSION = 2.1.4
+FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.xz
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
@@ -18,4 +18,6 @@ HOST_FAKEROOT_CONF_ENV = \
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
+FAKEROOT_AUTORECONF = YES
+
 $(eval $(host-autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
