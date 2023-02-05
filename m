Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D34C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 13:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80AB54012F;
	Sun,  5 Feb 2023 13:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80AB54012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkwqnbgtDAy2; Sun,  5 Feb 2023 13:23:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D27EA40137;
	Sun,  5 Feb 2023 13:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D27EA40137
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEF081BF334
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 13:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8C5A81E1E
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 13:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8C5A81E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lM9a_8_Rq1ZF for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 13:23:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C40EC8149B
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C40EC8149B
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 13:23:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a2so7951433wrd.6
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 05:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V6PKD6YMpxHLUdAJDUgNzJ0SOQ0zauTgGBl1lvIoWkg=;
 b=dDHxPbEuXHFyV9A9MwpdO0kdn5fXbqhyPp2edC4wL6mWkcDRV07PjyMPiNkC0pk1xg
 qGAw9h3vVhafS5r3pFYt5dsVjyetemI403CXfwpSpwwnoGM6VoQERcKn8A2SzUjvpvc1
 7bdfPpJ/68AWIZuySucIwOxI9/OBNl9wX6Cpf4Eex5a9KOr8X0H6lWCYewDCxvCOFopF
 4B5ZRCX5c6a6PC8TWJJ1KRHqCz69CbRUXXUk04l0XtuxXUUtMMALN5Zgtv+I4o5EyuEs
 dBvouekQbqW4BQwCnNtH6chpQ54Tvu08VnGW/7waEX8GXfGe3Rq++ruDGiuDKKjkPy2j
 YQUg==
X-Gm-Message-State: AO0yUKWyPrkiFy38nWYP/Tehjts9XZXguRAmUhXxFRyHjB0Z4TX8Bpon
 CsnjYcYJ/XSAOhD+RTDZghmLdGPHo20=
X-Google-Smtp-Source: AK7set+FZ2jJc/juMh+KYO87kZKV6U57/7AwF+QhdVFOUjjxQFQqmFyh2eBsLut+45mjug6Kxg5yjw==
X-Received: by 2002:a05:6000:15ce:b0:2bf:d17c:608a with SMTP id
 y14-20020a05600015ce00b002bfd17c608amr20391806wry.58.1675603393642; 
 Sun, 05 Feb 2023 05:23:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600002c200b002bde537721dsm6677810wry.20.2023.02.05.05.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 05:23:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 14:23:07 +0100
Message-Id: <20230205132307.41753-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V6PKD6YMpxHLUdAJDUgNzJ0SOQ0zauTgGBl1lvIoWkg=;
 b=Iy6/h7GW8D15HKcF3lgAYmg2nm5Ld7VwUnB+25Zq3dL3XeBkl4Yq/bMerwiWmhPv0+
 7GwhhmP/OvL0b2iVtbkpryh8AB4kck8VXtSgQIAB0NM1S5RostVSimD6AyLgaNaxMHzb
 MGiJ2+ciJeIX787ObYlOn03LI3RKGPM5LhFXT5swTVMOzL45OcHdHa+QsBIaE7wMvRJs
 EYzKMttQ5u9QeK+wgMxMfPvquStvtPKXdSxJ5VpR/ZvjxAicZQkXzG3h8nm5pjEq8Pml
 Nokf2J+VOcn64xs6XE5xYVUzi9JwELT0kfP3EoJZRTkU8q4msfM+PV7McJvOJ91WVQAR
 u16w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Iy6/h7GW
Subject: [Buildroot] [PATCH 1/1] package/tmux: add utf8proc optional
 dependency
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

utf8proc is an optional dependency since version 2.3 and
https://github.com/tmux/tmux/commit/6c94774b70f72952c4c512e4aa59a207ca1c34f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tmux/tmux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 281b7d8ee6..b1c0af1a83 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -11,6 +11,13 @@ TMUX_LICENSE_FILES = COPYING
 TMUX_CPE_ID_VENDOR = tmux_project
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
+ifeq ($(BR2_PACKAGE_UTF8PROC),y)
+TMUX_DEPENDENCIES += utf8proc
+TMUX_CONF_OPTS += --enable-utf8proc
+else
+TMUX_CONF_OPTS += --disable-utf8proc
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
