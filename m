Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B35ACA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B955D60656;
	Sat, 10 Oct 2026 09:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzfuF_7D0T8q; Sat, 10 Oct 2026 09:21:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E45360A3E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624116;
	b=q6J5HdIX+wnHV+Fr1EWD1+j6cz2q8NgSzAANArQCjUJUSWZhkzGvkqqEGLM2SAOGwJYW
	 SaUoPbc5wBYrn/UsnuhoCtPI3WxADGWbtg/33XyD6PvrJ18vy+uzjMvyG0wDcl4u0ow6c
	 4OnivVvHZHduj06sBXHDHJluaQqrhrcUjT6UinQ+Z7dqwIn4blWrv/7V0YdFFhwLs/x7I
	 wUHYWdke1MiA302zuTh4ehYW5sU2kCiCDl4W3F5qqZ0rp3aoXh5Hk3YAhvgcpVBDkO5tz
	 rbFsyz4+pwN8gekp8edoBaZ1ZygxmdVXB3e/jjQnjp77374TPPg68rqRMH1/u+9V8oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=23Gqcq1aQTgUBPm9UDaHbsv5COWLNc9I1f87g3SBijU=;
	b=Z/hSxSVJ9WVntlAhjSPY70BFUdCvY6qiPW71yGIpUoQtA4Z51rnYU21s+7BeKjKowUh5
	 /IilAlnu5LZeKoWvoTJAl+LMEj98JFIV52iPJCLtjtjA7TN+H5YCIweaExn7qxcYt2qJV
	 Mk5Zg5ARkV3dM5D9A21M8M2NKQR0/UtU3buNnpKe3dsY+uDeFcCD/LbIlnszG3S/rOI6o
	 zEbZB26VzZ4C20IXLGpcU7U4IWYv6F6PxFAAOHhqNYmzsPaCU7Hq2Cnf3BQ/EoflIPgs4
	 /QOF+ylAlMlSxv0WkdMJqYaFe/9lpFFVjdX4Kn88Iy3hg5Qcov0ADzpTg7wX4mjCd8w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624116;
	bh=23Gqcq1aQTgUBPm9UDaHbsv5COWLNc9I1f87g3SBijU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=syMa8kg8RZDlzLhvPOsdgGPj90nFkgFFjmainy4NyPD7e+3aTqq5Hl8DOOiL+kV66
	 eX1Et33WyeGPpO+zV3vCBbWgq4Kka1nIQ+HaRUQ6u5H3/z+fiSE9fiAAnSiRFepOTD
	 jTzT0NZ5XFHGK0QGZhA4haFO1bah51H/a0J3JioUf06VA/VAQB6Xo2Z+hFYyCujymA
	 fbV/RM57lC6oI+5GY9KL6Xss2kZWBKNcEUwLY5O+WIO37zSylEiFAMh+NacpPp8+Gf
	 JJ54BYsn2iGzR2uBN7TaTguW/gvmTTTfRlcgTLAG8+YLBZ5vsBN2XEhdQdbVK7nzs9
	 quEKe5Me3ytzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E45360A3E;
	Sat, 10 Oct 2026 09:21:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D06B75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 441A74093F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6G0LxLCO-2EL for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8266640935
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=DNDBPV/inLfbxl/3C8lWmejMMqwWFyK/YueyR+SFKL3doPKU8Yf9J4WlYUL+HGnrgxSd
 Ym699ywNsqb9c6rC9bmq1q44eED/BL8trX28L3NP/CLoYl9YfBwmozwJyccsUVeMY/5Wb
 jzstEbLTTyEcbTsj5Of0tP3A6rR6SJL2t64J0tb9MckGAktN9nIJgck8nKFcee6DiY/RD
 5Ea0Cc7ouvJyhTpUQYQIUvcxs+a6q4JRPm4PazujkH8FPArD/oboGuO/Usc3XpITjFdEj
 LRkS8OKpZhbf52moeFg2BgVsYYkGBenjkORnzlSuG4oCXYr1ODWZ1zhk3wv8oMwwLww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=b5Z8/WbPnsbqtisOz+170ezJHq74X47DQN2UOXDVMC8=;
 b=A9zbhNacSvLJgCclnXmdzpSGOUQbpzYPqeEo++MYJlJnT5Ltbm5rEsvoO7AY6hrRqL4s
 tuDRny1nc9gD9bmToB88XbPjTWWTyTnyavKgfo2HBxHhLL/IBzx7CnGPy2WyYb0HV7UPt
 i4o+SXYTzp1abgaQX/VOGeCcrNSL5MMB0O9dkPtRz2iy0++crLtGJI3P9MGOE9ukhahof
 DP6Poib5sIP8lKSejN8VHyR/lIVYPHl/dLUxj0PuU6P8QMj2f/P8eWT98V9hFL0F6+Mbh
 snet3evKlA404PCgoatndd6X6rXluoj/0mNKURh2tTp0ER2d71vdj7Q1NlzPGJ4iGvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8266640935
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C9338F0B8; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:26:40 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 999368b2a7b254532f4011dde548f7e7dfd6cbfa
X-Git-Newrev: 2ea8cf9afbe9796d5c046ea5b969340b389ea320
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.6C9338F0B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] linux: fix pahole
 discovery when BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0880753873185227022=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0880753873185227022==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ea8cf9afbe9796d5c046ea5b969340b389ea320
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Around Linux 5.11, upstream started introducing checks that execute
"pahole --version" for feature discovery (e.g. [1]).

However, when building with BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE Buildroot
only lists host-pahole in LINUX_DEPENDENCIES, so it isn't available for
the configure step when using BR2_PER_PACKAGE_DIRECTORIES. This results
in the host pahole being used (resulting in host-dependent behavior), or
no pahole being detected at all when the build host doesn't have it
(which will then disable Kconfig options that require it).

Fix this by adding host-pahole to LINUX_KCONFIG_DEPENDENCIES.

A similar issue occurs when running "make linux-menuconfig" and friends
because PATH deliberately gets stripped when pkg-kconfig.mk builds
x_CONFIGURATOR_MAKE_ENV. Explicitly pass the pahole path to fix this.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=5f9ae91f7c0dbbc4195e2a6c8eedcaeb5b9e4cbb

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c9c2b71e6db0bc9c16747b341439e8bb21bb7d8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3599a10b50..cd80904113 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -125,6 +125,7 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
 LINUX_DEPENDENCIES += host-pahole
+LINUX_KCONFIG_DEPENDENCIES += host-pahole
 else
 define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
 	$(Q)if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
@@ -387,6 +388,9 @@ LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # therefore host-ccache would be ready, we use HOSTCC_NOCCACHE for
 # consistency with other kconfig packages.
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC_NOCCACHE)"
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
+LINUX_KCONFIG_OPTS += PAHOLE="$(HOST_DIR)/bin/pahole"
+endif
 
 # If no package has yet set it, set it from the Kconfig option
 LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)

--===============0880753873185227022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0880753873185227022==--
