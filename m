Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C20CDB479
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 12:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74DEA41047;
	Thu, 25 Jun 2026 12:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-So7YpBdirM; Thu, 25 Jun 2026 12:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB9041028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782390898;
	bh=pENcJmoYKJ3xdeqSVr7SasJHTKHfz03NXsinlmyAAIE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lH0wnDlMfaC8rAdnp2diKh6Xp7548bOz5qu10X4ip92f9RreBcm1KcL89XO+LnmF/
	 6rqU5Z+8H4z3G614xbEZ5uKFqL6qMzpZeeFR7sE46uFg5KBdEQxvj+YFwZA7ufE8+p
	 ch5cZB419Tras9HKTdb/g4556JZcOs0bii3rla5qTwSDhTq1FZ0x641CIoxC4Sl1w6
	 4crLYivAeaxq6YzgAOMG7n2qn/plDap2dvWikHRHqcB1DOcpSJ1pY3nVhl+LEpQ40t
	 8/7FVBA9AxxqsX5s+bOO6EKXvBALGRS5ujYAJHo2mtuhGzzmrfH/bDG5YEgFs7Z1Rd
	 ybcKMogOfMS+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB9041028;
	Thu, 25 Jun 2026 12:34:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AF2F254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 12:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7099F82301
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 12:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CtyYz-22X0j2 for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 12:34:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A90682282
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A90682282
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A90682282
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 12:34:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c07a6527453so411328866b.0
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 05:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782390894; x=1782995694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxkRhQ8dvn4Ap9qON3xgExwBLhs17PkiYex9nx+O3mA=;
 b=kyq4xgtYahiZJ+PFWHIGif5b/hYFhaL93xn7cGRfBk9mLwjyj8a1UXLDGoR2Z1JSBg
 OQzbw32KKzO46vX1hZPoR4kxNEXGc0ciWrvXaXZhywuUQ4FKUjIlH4I4xtoEPNteNj2P
 vbAZVM+fe5q7TU6v+4Vo3zh6bWM2XS1MhDn0LS52v58WSY3EY0kehQHNK/8XQQ32jYLM
 0JH9wHUNlSkY36mXVDzm2Lt3YW5K6epqm8NEBE/BPVZA6eJv1YDZAan+4O/N6iNtc6Zb
 cd2Mru5pNugJoWqoGwAk44GiVOlbaVJMwVwrHI1l/U8Q4E3AIE9QI0SOLH7W1Xsm2KPE
 A39Q==
X-Gm-Message-State: AOJu0Yz/LF+lQwSKyKLZXTzZco+592l2E+iHgLhMlj/TTN5i5nkTd6g7
 8fMqKrNgg4PypDjn9uyI3YJJbUBaEDEi3Hu+CE5/LTVx/LkPhkba7douZwjfAnIYmjnBHDEKzq4
 KhxvXHAo=
X-Gm-Gg: AfdE7ck7/878SSoYy7FzrjGGn5oB7lwxoqtqMD9hZJSDJwQh+soRScI+Z/+yTbUYgDs
 IqMeBdxFvC7zSc5Zb9pxudCADu/mXb7R7RFFYMF2crU2Z7sE/S4NGesCK7wa0mPJMVZ1B1eGd4i
 nUun/m9pwzkBMS3x7T7E42jySRMqP0Vvja19QQqrjtGmOL2Fl1hDmiv958Q34TBX4Hqj0Sk36J+
 X7dLjQJDJ8vXI6yv68vOngPDv99qfbtoyHGMNMZTwEeg3ZiHtMbj8Ps+zYUJownTVl5RBOT2ksg
 6InB+JsW4MTy2D9Zs0DiB+0Bf4VucHWw7gKPifITd1S1lQMNXfaYZMluiVi5fdV3CsQsRIJgeZF
 4FnLKl9DNlotc9mt79tYKCyAxQcBD717YQWoPXCAuZHt5HwpQFHDdrldQULxfvswMiFEEoz88G4
 k1h3GLUdtAmzNHVQobyAz2Cx5JwPD1ZBqlEyBGdFpDK/Qge9HODWjd0B/L57PBKqw5+w6xJ68Mf
 KFiR79HwTv8Jr6KgCIAcYS61QDdtkIy3Myf
X-Received: by 2002:a17:907:968c:b0:c12:3f6:f644 with SMTP id
 a640c23a62f3a-c1205f178b3mr160248066b.36.1782390894020; 
 Thu, 25 Jun 2026 05:34:54 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.20])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c11fbffcb40sm171017866b.63.2026.06.25.05.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 05:34:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 25 Jun 2026 14:34:47 +0200
Message-ID: <20260625123447.61478-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1782390894; x=1782995694;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hxkRhQ8dvn4Ap9qON3xgExwBLhs17PkiYex9nx+O3mA=;
 b=NH0kLwxfFrhjns6ubhEgRC+T4ba8nvredsxV/jYF9v3T8P9uDK1Ns9HgkS0ttHxQj7
 A5H5n9oFIwBNOR0ECFC/JhKOC289CalARH9Aw4i1TCuE1WvfXgwpf/i2os+7V7Vf0y9L
 Cicj4WoNpD0whxUHnjnP5+nEiaAwPf7REh32Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=NH0kLwxf
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.4.0
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index e78cf1f1886d..70456a4fb278 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  029230b29c3745924ea850c7046efd1db74b863fdfead8b1aaba3bdd5b0cf895  armadillo-15.2.7.tar.xz
+sha256  f781e9d935db7e8b9a64c58b6a817354d38a1769e179b477364f5e6414953f6c  armadillo-15.4.0.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 756a3fa8ab65..b806b0f1d1b7 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.7
+ARMADILLO_VERSION = 15.4.0
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
