Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBF0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:20:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D64AC61244
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D64AC61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7E0760784;
	Sun, 12 Sep 2021 20:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmlvn1D8LdXS; Sun, 12 Sep 2021 20:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194D36073C;
	Sun, 12 Sep 2021 20:20:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 787871BF404
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A575818A7
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7IYi0tzgReI for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:16:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C4BE8188D
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8A6AE8A4C4; Sun, 12 Sep 2021 20:14:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 21:42:08 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: e0ba7acb5020bdc0ebf89a106f263b3124e6f13a
X-Git-Newrev: 5c8f90820f1b6c75292352abff998ced45ab3ccf
X-Patchwork-Hint: ignore
Message-Id: <20210912201458.8A6AE8A4C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/pipewire: alsa
 needs seq
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c8f90820f1b6c75292352abff998ced45ab3ccf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
(cherry picked from commit 6409ea4c220275f76a705df5678b8340a386e553)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
