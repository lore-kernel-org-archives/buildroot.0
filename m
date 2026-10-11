Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693A8CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 16:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92FEE40620;
	Sun, 11 Oct 2026 16:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJkC-LCHwH1T; Sun, 11 Oct 2026 16:21:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9B76B40613
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791735716;
	b=ZysKJxvCdxQzCPfNSD81+xAAkJj6XH4sP66SVT09N3bTGItzTWtSjSAJwMDMfzdbPPmV
	 fg3iVx791RJyQIVJepGP6Aw9/hUazhwPe4OlTARh9Oc3iUu/B06Sm4/92iM3jKqIByUHY
	 l+n1EBSXu2Wog3YLL2dTBI5rgvHyrjnA01Q0amVxdnMEWqIxYocRgvz+vNDOzjXHrKeJy
	 hNCDje00NIXywxOkm2NVk8yBv3mojlJdlJiGAyYKkMw/whocZYCUV0kOj/bcnCySdvboz
	 6ASjqQqJv7tvKriNMGkABLbLsgrBhYktk9JEmXJFSsvW6kvGiHgn8wuucuIZ8lIosWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791735716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=SYIQu0NcRoLjQVbVGKwueGBXI9vmWVARx4XyzQENn0c=;
	b=rVzWEogYYeJL9vEHhs+9/ZYrqu2ZZVufWOzzDKSOnqgeir5flhX4BWt1x6KueCpBKlWq
	 VFFpBR+oW36QFZPHJj3frys/PIZ+xh/K9iUDjg8rsIisF8aQU+gdBMf3Ft0eL8hihdmrN
	 tFGG3IDgSP95oKlbuTOBgoYEZV0NBZmR88FJ5hT0FKnXCVF4puDc5rrbVBaJ2M05/9dwZ
	 XU1wPWOMIGUnRYbMiInWDVp2Sc4foH85WHPR12qX7DqFnvaJYG4z4dbqXddKjekizXIph
	 6wWSpKTDVROvy3cGYajhMKtLR+rN0Yu47v9LgIa7UVz99GfPYfoVyW/IDicdUOqqyHw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791735716;
	bh=SYIQu0NcRoLjQVbVGKwueGBXI9vmWVARx4XyzQENn0c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mHXG5smfF9ddEcjxSc9mF7/PV2uvoy8jazHmPX9xwioDgxIFYRDB07Th+EBBwxpWQ
	 C/5t6jiIIzhROdqOeyXAU4ihJBE3C3KNDaRN2TgxoYC6vIgj4v+y/Ff0cNmvPDuHXJ
	 47fvnpYudkEVKjvfOHNpYHx3zvXlipb3qTSGDPC8C1HPTbSwabcMbI3Dld65wPy5u3
	 Fo71RC1b321B3Sh+etyZa5VEjjlk2T3HGTYeqC1n26mrPp1D+77EMPRTJYszcCbtOk
	 UWzb9rv6oeFnbYT/+EkKLvzrPK7ANizPU0M/Kqg6C72/7kg+zyQfq5owwnBX8aDtGR
	 wIAfagrNmBHjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B76B40613;
	Sun, 11 Oct 2026 16:21:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 552AB2E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 16:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44BC840061
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 16:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8ki7KIpIBRs for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 16:21:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4CBB34002B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791735713;
 b=YN2abtpQCCK5W6jWWCvVyIYgy2e7ZgOGiWBgWy/zxvQQKj7PxfJCZHsJd+DwS/+d28EH
 MlVw+9wpWEGIaDfibzr+FXcoQBrpm/NmJX4Gts1yke5eWf8S8vpbHdOzNCi8OlhjubxK0
 sIxl2FoGatdebKs4y9u6su7FPM/b1ZjhpRmH5qin7xDd3XjT6eJQG5Lom3anidiE2cE0J
 fmMM3kno91g/PaY0ECVM82ZwJd7BiNpe148O8sAZN1789p9dFljvCE6IokuZPDEkxRlEf
 wmU8LuElahRR2LEFIp6uwGkb5Ni6WLwCOoy641XaTJPPn7c000nAKJVytRlWIIZAFpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791735713;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vJ5hWf8hsGu4JrGACgDiwa3K+wg0dWByXpJseycGbqg=;
 b=klWZ3mBTOSzDhaN1ZuP+6TEaHgI2ZUYEWLmZ126qxb21jmiPlUdRWGxbY3Y5liPwouNk
 Jlh5c624JMuhqMz6/rzL6v37t09FBFXlf3TnhZ+TuWeGq70VG7qMi1VWOtjqdBxWM03f6
 YKN9IjkTrwAVU2vOBq8OAkFEAALdCEOW+r+8CvL5H17bNJfmNUaEwwVeF/Xv+HZEAzczN
 dmKqqnOHtp9LgfzLC9UNh1gAf0PLOD/QS2A4wwKufAJTMbezPwkfN9dunWj6icfbznqQI
 /PRd6y6Rbn35ERuD74EGoWWb/ypiumWXota698A09VcH89kAG3NZO2QqBBNMHMwBF2w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CBB34002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 16:21:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8D3594EB4; Sun, 11 Oct 2026 16:20:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 18:20:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60f60962a6c60fff37d5b754a6331e8b85ebda77
X-Git-Newrev: 6d7636eb72822d244ddd994af61461910d1155b4
X-Patchwork-Hint: ignore
Message-Id: <20261011162033.D8D3594EB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ifenslave: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d7636eb72822d244ddd994af61461910d1155b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

ifenslave has not received any recent update, has no Buildroot DEVELOPER
and its upstream NEWS [1] states the following:

  This version of the ifenslave package no longer provides /sbin/ifenslave. The
  /sbin/ip command from the iproute2 package supports creating bonding masters
  and enslaving other interfaces to it.

Its feature is available either in iproute or in Busybox, so we can
simply remove it from Buildroot.

[1] https://salsa.debian.org/debian/ifenslave/-/blob/main/debian/NEWS

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                 |  7 +++++++
 package/Config.in                |  1 -
 package/busybox/busybox.mk       |  1 -
 package/ifenslave/Config.in      |  7 -------
 package/ifenslave/ifenslave.hash |  5 -----
 package/ifenslave/ifenslave.mk   | 19 -------------------
 6 files changed, 7 insertions(+), 33 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 97824f701f..db320ea981 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_IFENSLAVE
+	bool "ifenslave"
+	select BR2_LEGACY
+	help
+	  ifenslave has been removed. Its feature is otherwise
+	  available from iproute2 or as a Busybox applet
+
 config BR2_PACKAGE_SZIP
 	bool "szip has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index ec29cc9459..2a85456034 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2501,7 +2501,6 @@ endif
 	source "package/iana-assignments/Config.in"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
-	source "package/ifenslave/Config.in"
 	source "package/ifmetric/Config.in"
 	source "package/ifplugd/Config.in"
 	source "package/iftop/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 855d553360..7bb40ee298 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -53,7 +53,6 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GREP),grep) \
 	$(if $(BR2_PACKAGE_GZIP),gzip) \
 	$(if $(BR2_PACKAGE_I2C_TOOLS),i2c-tools) \
-	$(if $(BR2_PACKAGE_IFENSLAVE),ifenslave) \
 	$(if $(BR2_PACKAGE_IFPLUGD),ifplugd) \
 	$(if $(BR2_PACKAGE_IFUPDOWN),ifupdown) \
 	$(if $(BR2_PACKAGE_IPCALC),ipcalc) \
diff --git a/package/ifenslave/Config.in b/package/ifenslave/Config.in
deleted file mode 100644
index d28e0f7c29..0000000000
--- a/package/ifenslave/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_IFENSLAVE
-	bool "ifenslave"
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	help
-	  Configure network interfaces for parallel routing (bonding)
-
-	  https://salsa.debian.org/debian/ifenslave
diff --git a/package/ifenslave/ifenslave.hash b/package/ifenslave/ifenslave.hash
deleted file mode 100644
index 825f2d6f2a..0000000000
--- a/package/ifenslave/ifenslave.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave/ifenslave_2.9.dsc
-sha1  a17e88fa298ef337e872c8aa5d7a390921239d1a  ifenslave_2.9.tar.xz
-sha256  e5666c0b61347bd06f2394c16eca6895fcb5e5cc83d0a1c596a975274de5a3c9  ifenslave_2.9.tar.xz
-# Locally computed
-sha256  299e00f3afc0e6ea0685340df73ad444e58e6fe0229989ba0983f5f33e275c41  debian/copyright
diff --git a/package/ifenslave/ifenslave.mk b/package/ifenslave/ifenslave.mk
deleted file mode 100644
index b51aa72051..0000000000
--- a/package/ifenslave/ifenslave.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# ifenslave
-#
-################################################################################
-
-IFENSLAVE_VERSION = 2.9
-IFENSLAVE_SOURCE = ifenslave_$(IFENSLAVE_VERSION).tar.xz
-IFENSLAVE_SITE = http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave
-IFENSLAVE_LICENSE = GPL-3.0+
-IFENSLAVE_LICENSE_FILES = debian/copyright
-
-# shell script, so nothing to build
-
-define IFENSLAVE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/ifenslave $(TARGET_DIR)/sbin/ifenslave
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
