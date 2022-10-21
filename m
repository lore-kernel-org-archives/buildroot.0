Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05567C38A2D
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 22:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A322409D6;
	Fri, 21 Oct 2022 22:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A322409D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVH6qwVd0D2M; Fri, 21 Oct 2022 22:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52E90409C1;
	Fri, 21 Oct 2022 22:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52E90409C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA8041BF94D
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3329842BB
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3329842BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2S7ttSHZWXO for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 22:24:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834EE842B8
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 834EE842B8
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 22:24:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j7so7135896wrr.3
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 15:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQrUnKOWb4LbklfRZyrIqsXENsiSXkwdh6joSgpZ1D8=;
 b=oBosYRPS4WmGoNEo9/auEut7I3X+N3tJRQKGc3raU/HnxNdP7ZZUmlqTW2syISQPHU
 /5DSNg5lWF92/AGZ+IJZaudpb6gQJZlGJbA9NJ/muYurNuhnmvnUxjnkoDgQaVyapiOx
 LwqMWW8+NiSfLkMOlAQqJkx16ME2G+B5pR+eVNvHknKc/jVrm7FYpb4s9lMH1HjsPNOn
 fghbZH5eFQIEzU651nFbM2yvxwE7/to37GKcuyB+Eq+jmNvN7AA8A1lPnISefGK9Sc45
 ArTbL225M8wMViQ5/AZBZrNgiGIIhZ8FHCHMNdSRMwvchXfjGX1me+8JixMBpzMXlF1I
 BFqA==
X-Gm-Message-State: ACrzQf3WS243NNGMa6Lo03wDVM/DxU6ucf2jnQdLgAZ6cyzW2nhB/cEd
 aTS7bXPNWKhD0U1Kvhcdt02DgfEnPvo=
X-Google-Smtp-Source: AMsMyM6c3bfV4CDZCcDnKBKa9RWaMi+4lD032KCJ8mFGbEQA4JfJxrjLWG/Oo23UkG8qH4qsT0myXA==
X-Received: by 2002:adf:df8b:0:b0:230:5212:d364 with SMTP id
 z11-20020adfdf8b000000b002305212d364mr13301769wrl.124.1666391055224; 
 Fri, 21 Oct 2022 15:24:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bv20-20020a0560001f1400b00231a5fa1ae2sm19633767wrb.20.2022.10.21.15.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 15:24:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 00:24:12 +0200
Message-Id: <20221021222412.109567-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zQrUnKOWb4LbklfRZyrIqsXENsiSXkwdh6joSgpZ1D8=;
 b=K1E6WOhYhq/VC/heWwddTLtzrbV7KFKioJsf1zEYy6MuegSdTZOIDiaohyt+UEvefX
 EhCOw02CVkd7PmAI+xwwWMlKBR+fimaOkzV4fRfGdWIALX2x5HHsMYDHd1YzwpTuIQmD
 omLly5WxAfwsdtkhaLsf37xPGJVK1fzF24zi2PPFCXdyTD/trXPqzAeUjCy1Lp4yhQmk
 292OdrqKeNAre1f08kOrIpj/hPz1/bjAPMWSR4TQb+xsy22/LcX2K8AuI1VxYoiy8701
 8zm1AYvr/5kAhVpQNx58/9OCmhByKs8ZWP9WWVDdeY9CQX+LkKhKt7v9k5ui7rUlrE01
 7oag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K1E6WOhY
Subject: [Buildroot] [PATCH 1/1] package/irssi: bump to version 1.4.2
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
Cc: Rodrigo Rebello <rprebello@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use offical tarball link (from https://irssi.org/download)

https://irssi.org/2022/07/17/irssi-1.4.2-released/
https://irssi.org/2022/06/12/irssi-1.4.1-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index 05555250a7..ecd339d83d 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  a647bfefed14d2221fa77b6edac594934dc672c4a560417b1abcbbc6b88d769f  irssi-1.2.3.tar.xz
+sha256  79a4765d2dfe153c440a1775b074d5d0682b96814c7cf92325b5e15ce50e26a8  irssi-1.4.2.tar.xz
 # Locally calculated
 sha256  a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index da71622a04..c2d02289ad 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.2.3
+IRSSI_VERSION = 1.4.2
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
-# Do not use the github helper here. The generated tarball is *NOT* the
-# same as the one uploaded by upstream for the release.
-IRSSI_SITE = https://github.com/irssi/irssi/releases/download/$(IRSSI_VERSION)
+IRSSI_SITE = https://codeberg.org/irssi/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPL-2.0+
 IRSSI_LICENSE_FILES = COPYING
 IRSSI_CPE_ID_VENDOR = irssi
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
