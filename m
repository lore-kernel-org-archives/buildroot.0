Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D85BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:56:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5013360FC2
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5013360FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ABC4607C3;
	Sat, 11 Sep 2021 12:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZKHVa8lBFMp; Sat, 11 Sep 2021 12:56:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E57607BD;
	Sat, 11 Sep 2021 12:56:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0765B1BF31A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAF8E607BD
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMhkYr6WgbH8 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 12:56:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AB5A60757
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:56:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3B14A88F3E; Sat, 11 Sep 2021 12:54:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 14:56:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ec9542415c92584fe0b986feea6326375bd63b6
X-Git-Newrev: 6409ea4c220275f76a705df5678b8340a386e553
X-Patchwork-Hint: ignore
Message-Id: <20210911125458.3B14A88F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: alsa needs seq
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6409ea4c220275f76a705df5678b8340a386e553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsa unconditionally uses seq since version 0.2.90 and
https://github.com/PipeWire/pipewire/commit/818fb9e904a3ea43ba313994e404f1b63833c548
which will result in the following build failure since commit
a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:

In file included from ../spa/plugins/alsa/alsa-seq-bridge.c:44:
../spa/plugins/alsa/alsa-seq.h:71:2: error: unknown type name 'snd_seq_addr_t'
   71 |  snd_seq_addr_t addr;
      |  ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/65e3a9185b3b84ad78cd05f788f741b8734d2bbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pipewire/pipewire.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 2317398088..aee0191894 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -52,7 +52,7 @@ endif
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=enabled
 PIPEWIRE_DEPENDENCIES += alsa-lib
-ifeq ($(BR2_PACKAGE_ALSA_LIB_UCM)$(BR2_PACKAGE_HAS_UDEV),yy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_UCM)$(BR2_PACKAGE_HAS_UDEV),yyy)
 PIPEWIRE_CONF_OPTS += -Dalsa=enabled
 else
 PIPEWIRE_CONF_OPTS += -Dalsa=disabled
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
