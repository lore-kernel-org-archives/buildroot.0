Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FC4C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 07:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7C02408D2;
	Fri, 26 Jul 2024 07:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60fdccws__HK; Fri, 26 Jul 2024 07:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE1E40940
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE1E40940;
	Fri, 26 Jul 2024 07:38:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F34D1BF311
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9856C40150
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jxeRy54bGWi for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 07:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99F5140018
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99F5140018
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 07:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E6398750D; Fri, 26 Jul 2024 07:38:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 09:36:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5c1ead57e93b32c900b58f4fd22259313fc5c0d
X-Git-Newrev: 8ef2bb44379e4763682199ad2ecfd23d51cbacc0
X-Patchwork-Hint: ignore
Message-Id: <20240726073809.7E6398750D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: fix build on microblaze
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ef2bb44379e4763682199ad2ecfd23d51cbacc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on microblaze:

dwelf_elf_begin.c:62:1: error: symver is only supported on ELF platforms
   62 | OLD_VERSION (dwelf_elf_begin, ELFUTILS_0.175)
      | ^~~~~~~~~~~
dwelf_elf_begin.c:62:1: error: symver is only supported on ELF platforms

Fixes:
 - http://autobuild.buildroot.org/results/5ca2aa5c76415690ad4a85837ba47e7bcfbdbcbc

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elfutils/elfutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 4d8cc43342..8738af7751 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -45,6 +45,10 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
+ifeq ($(BR2_microblaze),y)
+ELFUTILS_CONF_OPTS += --disable-symbol-versioning
+endif
+
 # disable for now, needs "distro" support
 ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
 HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
