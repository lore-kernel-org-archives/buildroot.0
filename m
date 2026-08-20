Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B4AC5DF87
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 11:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 380936076A;
	Thu, 20 Aug 2026 11:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LQ25E6UhT4i; Thu, 20 Aug 2026 11:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787226858;
	bh=D8GaKF/JfywbzJ1V4hkHVqq2w9s1a5Ivhla/+ktREhY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sUVcL2YhuvemQLG0zCH92OL7yvHuyAodkQDYXkX0feq6Ge2XRzP3yo09NgdOdQPXC
	 MhEGDBbTVDzGrgr8+wLSLYFXcJX9prjSC6mA4fe4YqGfgfIeZSJ3ZSbvb1mPWizqEY
	 BlNX957hVJ9XpknfLvYcKJJRM1tzoNXrFmkYAIFANDcgmnqSkt9sQTQKOtHSodSZUk
	 WR1FE/9uXD2K2y51Ih0lb/C7ypBDMhfdvnaLZnG6reRBTvK1gVn/bQqRB3emJJTjn+
	 yLaxlMHEZ5SjnUPwdivViXsgS9PZ2LaAZ09dF9FoWHhosJ039srXgJ65wg3bMiIzwk
	 qy4HxR8Vz/d4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0886E60769;
	Thu, 20 Aug 2026 11:54:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 442741460
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 11:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35EDB40292
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 11:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKQHvgEP04rF for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 11:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=VgzRoRUy
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02B7D400A1
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 11:54:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so1424385f8f.1
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 04:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787226852; x=1787831652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=H6TcwPRUD7jtX0f5O0BYiDKSuSvufEm/c7WVE8B3NM8=;
 b=VgzRoRUyUJyiPO0kqdrUgicYy1dsY+ENzGeGpghif1rwibinduGrs4pb6JtBmVP8Or
 aS9J7c9RG2VHm43Vr6CFr7MlblB1yY2QPQeadhWcfoBO6TO1ZZJOmcG7bkaAQMwjF2o4
 Rh+09lGDyEEOhyYmds7jKfFXXUizTPjhWE8IzdO0yuO9QdejHZn5IEqQIpfFoBK2m8K3
 +u0gmMQva2bigAYW56uyEgCREzBFRbrarbyV+EeDUm7E6v2Hg857Z+XQGGvkR/EZhtQb
 pJuUdHju636nHY1yoLcO2PxCTghfj1pI8m+QBEeitNuYzX3B8xMPwXNZcCNIkp7TYIDt
 jMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787226852; x=1787831652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H6TcwPRUD7jtX0f5O0BYiDKSuSvufEm/c7WVE8B3NM8=;
 b=klpdJ1rsVCvzM1AojyvE554nGJr8toRhrFHQQ302fFilNE262WgO3dXzEK2JxXpEUR
 Jld0xKQDdIg22BHdAP2usff1ADeN2R0tcYpuRhZTraLqhZCk9XCbjesIgd1KDPpUERpd
 +ZtFYOw18f5NznqnBEowmwOM9TgurAFbZoi8DYYdtp1kiMugY6Aglt3RCrd42YYE5470
 k9gnpwlXqqmrN6nDN3yAdJtOQcMZ1GORHtztIVcjkAEwc+Fv3j2HrHFLmp0S/UrKK8nC
 WkAUNNmrHUL1k2LOeCC0DKyAlDON9j2pdjLWO6ETQoIZKc+B+vL1lNVLH8cdZeKYhxms
 PkRw==
X-Gm-Message-State: AOJu0YzxD1Mk9DTJNAKc8GGmT4Ct3POBIzuTJWGssXa8fn4TxOk3Lr9P
 Y8Nmw9xwNKizQdGLeqJcoXOX3ggCmjMLXKj9YPW0RoC/f9M57TKyrtVWULrE+Q==
X-Gm-Gg: AR+sD12sq1+T2rXsj9Ao9pmH37TqjmAMyLpjg3WspAVF6nGj21DyE5I0/sxlhS8pLop
 Xv11RtbicWGpZF2EjsYiNCYpNxwwgWc1L6MOvSLBH7iT4hxBcY2xL7DVl5Dvg9yHjlMQe/O/MXX
 FSP5KudVawm2sOGbY5+fljY+5aN2AJV7lb+70zD8yhwAlKAdpY7Uh0Rpzy1NWnL2Gty/kCLIqon
 O/c/W7gGt5RA8/T8CzSZsnqE4JAVZKz6FG8rAWBxnTx6RPfkkCdIUQJboIkgTh6U09f74MGlE8q
 biB/Fk73cyIjwLweZvqpLqQN7QfYgXLl9QAVdWby1YI97bhw7y4nBxIvcCltwhFmptv4UZGRJRY
 vP9HywhZWNLoup5CkgaMyezrVM838Kus6q/K0aWnrbqC/gMYY0czpmTXA1Z4AuKEGR6teH43oBg
 AM3qrdlLM8EWK8eZNWlxYSbL3WI03lo996NMgEpFhM67wboteGMtC2JncHGVq6A7ii0hOE2B513
 fgir67ZpWaWXTHp3zehyiyfxKbtvH1QqAo3VsqsoZExzAIYt8tlSCUclx67iljRzEG0AEe7CYpm
 1LbZT4m40hYpoYKkZanssnd/PgX1vSkd/G9/R3Lh8Bc9XlQOreZPAQ==
X-Received: by 2002:a05:600c:6091:b0:499:8aff:59b6 with SMTP id
 5b1f17b1804b1-499aa1ead50mr249816785e9.14.1787226851400; 
 Thu, 20 Aug 2026 04:54:11 -0700 (PDT)
Received: from KORLIN40066.barco.com (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-499b642865dsm344235e9.10.2026.08.20.04.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 04:54:10 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Thu, 20 Aug 2026 13:54:08 +0200
Message-ID: <20260820115408.3943622-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: fix
 automake-1.18 command not found
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The tarball published on
https://xorg.freedesktop.org/archive/individual/xserver/ ships a
pre-generated build system produced with automake 1.18. Buildroot only
provides automake 1.16, so the shipped Makefile.in files are unusable and
the build fails when they are regenerated:

```
 cd ../../../.. && /bin/bash /home/thomas/buildroot/output/build/xserver_xorg-server-21.1.23/missing automake-1.18 --foreign hw/xfree86/drivers/modesetting/Makefile
/home/thomas/buildroot/output/build/xserver_xorg-server-21.1.23/missing: line 85: automake-1.18: command not found
WARNING: 'automake-1.18' is missing on your system.
```

Enable AUTORECONF so the build system is regenerated with the automake
version available in Buildroot.

Regenerating the build system additionally requires the font-util
autoconf macros, hence the extra dependency:

```
configure.ac:52: error: must install font-util 1.1 or later before running autoconf/autogen
```

This commit can be reverted once Buildroot bumps automake to >= 1.18.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index cecbb821aea..efb849a9b02 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -41,6 +41,10 @@ XSERVER_XORG_SERVER_DEPENDENCIES = \
 	mcookie \
 	host-pkgconf
 
+# automake-1.18: command not found, font-util needed for autoconf/autogen
+XSERVER_XORG_SERVER_AUTORECONF = YES
+XSERVER_XORG_SERVER_DEPENDENCIES += xfont_font-util
+
 # We force -O2 regardless of the optimization level chosen by the
 # user, as the X.org server is known to trigger some compiler bugs at
 # -Os on several architectures.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
