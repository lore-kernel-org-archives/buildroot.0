Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB444C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 23:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AF4481A47;
	Sun, 19 Feb 2023 23:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AF4481A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dB4NxidWapr9; Sun, 19 Feb 2023 23:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B92D818C9;
	Sun, 19 Feb 2023 23:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B92D818C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C24B1BF2FB
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 23:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21A564161D
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 23:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21A564161D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hd198q4cOxpq for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 23:23:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2CDC410E6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2CDC410E6
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 23:23:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 ay15-20020a05600c1e0f00b003e206711347so1012708wmb.0
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 15:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G233fZfpzehz3it0pIlTqVPnAGBJaUaTntzcPX6N1Vk=;
 b=rG+kpkDtn/VC0+0uQ+xrgaryxH447ebneFB04m+/7SoTVvDJEBArEik69/nmTvF5CU
 eSt8JcV1hDXxoQqhGRgHx7BAQe/cynwttzw1TCUAvsL8MfXgSSsbLp2q0LeKcr1omQww
 obsSfHhLMeJCOHrNB+2uIcDA7h3l4oi8NLfRW2jL4WJj9+gxM9CMQPcfzDZLzvW0KGp/
 X0v3pkqg4aJMpOBdaGiBu6ZOJ/Q1GLpC35ckiUAJ8+3+ucWW/OjIenEeKJ4aK5K9hQB2
 UYOcGDo6IGPfawQyxrntlA3RDpeg7Dd4+i/735qQ4zUVrDA4LYz01VpXFhUT928AkNp4
 JPOA==
X-Gm-Message-State: AO0yUKVWO0r4Mdpg/EROjaKP83Fv0AbbxEmCBwuNJUDSQA8MCFCmesEG
 kEcR59KurQ0wNFsDv8mY9g7sgrcl8GA=
X-Google-Smtp-Source: AK7set/6Lhk/fU7fs9gacvRGYr9j0N+Ww0t+dESs/GKhh02x50sCOF9Ct/xfU/vPv4M3pR6N+owArg==
X-Received: by 2002:a05:600c:168a:b0:3e2:1f00:bd02 with SMTP id
 k10-20020a05600c168a00b003e21f00bd02mr6848745wmn.5.1676848993218; 
 Sun, 19 Feb 2023 15:23:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c00c800b003e2243cfe15sm8994531wmm.39.2023.02.19.15.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 15:23:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 00:23:01 +0100
Message-Id: <20230219232301.1795196-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G233fZfpzehz3it0pIlTqVPnAGBJaUaTntzcPX6N1Vk=;
 b=TenTqpH91hTvqOtkt/1lsBMG1FZ43NtD5FpBnOgCDR717Pqre8RNOWTwLWxhSybkwp
 SUaS8JW/cC/4AqlMPdYhbeY0nPwL+LHv5O+JcMFzaQG5UwIzas6UGztMr58tQTKWHo0O
 dLge6rH2Ta9b1b4Ws+nmZZCQo8FJI142Krgh9cCHEGUgDNVQCDkNCqCip/X+8kIu0/My
 YVpVxajNxgjVdZOih5fJHs+Sd1gsGnh8G8Rf54fL1NntGP00Mcr1L8PKUfOS8Xqe5N6f
 +nyuMr8NTNfrgHfMeFC44V4y4oN33hfM25N3AJeiYXE1wqtoC8l5UnOYMy0eQqx/civQ
 /0dQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TenTqpH9
Subject: [Buildroot] [PATCH 1/1] package/tmux: fix BR2_SHARED_STATIC_LIBS
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tmux uses custom --enable-static option, instead of standard libtool
directive resulting in the following build failure with systemd or
utf8proc raised since commits
1f618aa388535181c281c85e2b5264532de4ef0f and
e279599d255a79c08ef20b97b96eb248689d52a9:

checking for utf8proc.h... yes
checking for library containing utf8proc_charwidth... no
configure: error: "utf8proc not found"

In file included from tmux.h:34,
                 from alerts.c:23:
compat.h:379:18: error: conflicting types for 'forkpty'; have 'pid_t(int *, char *, struct termios *, struct winsize *)' {aka 'int(int *, char *, struct termios *, struct winsize *)'}
  379 | pid_t            forkpty(int *, char *, struct termios *, struct winsize *);
      |                  ^~~~~~~

Link to (closed) upstream issue:
https://github.com/tmux/tmux/issues/3290

Fixes:
 - http://autobuild.buildroot.org/results/6e8523d8d514bf6d8fc3377d05e5edbe7fc2d5bb
 - http://autobuild.buildroot.org/results/cba06f3bb6d9be25e91f56c390a70ddf9904832e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tmux/tmux.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 47ee9b16ca..af06c8570b 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -25,6 +25,12 @@ else
 TMUX_CONF_OPTS += --disable-utf8proc
 endif
 
+# tmux uses custom --enable-static option, instead of standard libtool
+# directive resulting in a build failure with systemd or utf8proc
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+TMUX_CONF_OPTS += --disable-static
+endif
+
 # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define TMUX_ADD_TMUX_TO_SHELLS
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
