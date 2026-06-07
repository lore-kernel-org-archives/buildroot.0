Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE716CD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 13:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B0A7429B4;
	Sun,  7 Jun 2026 13:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F95q-k8c3kx6; Sun,  7 Jun 2026 13:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2814242950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780837348;
	bh=/EzQ28zq+6kUps9vURDhWN6G2ZQtqGydsFWXA53kzi0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HGaoeuCpw8KaO1n0qAAzzl5ZdcjBLQCrIFQv5LDHYUtg+UCCamek2T0fhsTmGAyeS
	 WX2FR8LaWZRdXs1Zgtng+S2OIdDjNghdULtV96sQN8P9W7kFCGmHDrGDfxOJQ3efD/
	 0UeSuj0RP/UIga9AMgfEHUo/fX3r4jln62/3DNbNOLW8TfYBEa8vXUlKQnWwqYDRaW
	 nEauOnNEv1wfRu5DSKvpuUMdD2HAfT/4VJvrAnO2vi3PH6qJx3JReORYsTX9WvJUfc
	 2w/1mcpbtXEoHqtUM1D2Y9oKuW+5QSH9t/2Mq2AkPUK3GiJzarnUrFPLcANfG7UHPv
	 YdMSHEpGLsOfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2814242950;
	Sun,  7 Jun 2026 13:02:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7793B345
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D68841E96
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kq3QuPNC5U6 for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 13:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3513040343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3513040343
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3513040343
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 416B43EB90;
 Sun,  7 Jun 2026 13:02:20 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Sun,  7 Jun 2026 15:02:11 +0200
Message-Id: <20260607130219.1350128-1-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTF6ZuMkpEt+Alv83M7SSgieYFOUd0bcSr+5BSYrpGi2zjRvGX7AG3gWEt4kA9GLoIQohjRMdIZrK5kIRe2Fq9BFWs2+vt/Hsl3qhiwoGlmrH1WhyKdBTu/tCo2Xk5HFlbhoKCJlY5TqQd10v6lk5/7a+aAyxh0+AWG8yhXSQXxA7kwg5f1fsBdy54QEUzX5Wwow43SbqFbDlXehp91TjqJe6uvaPq+reh0eE+GP4YYBAMByZVVxKNtQne8A3H3XfRwt/Om5SGG2rvEdPMg6aG7pxPnNMS/JJvGm2HxfVtJMk34w9z4/rjGplfP5z+KhZQm4rG4TZ/IoFWF4mVtgOnHdfOIBEgvPej9/8wLB4j+bntI+4gtxr1gTiJsrpTK82HEGIO8Y/N2Mb9ZLXWmIPIe/sqc9lJ6ImjhTnTosagbj+DyKEcy+g0Fs7QhwHtWtxsWJosQD7ligQJamL/Cz00t6/mFCP/X6xTxOzZSjr88QFq0OSrKh2G9fzsDvqXEjwsqDyOJ0a2fxvMQN5oTH9xHR7Ki1Hx34af/0uyRmNcJ2eT4klZV2Ni7RXRlE3LUoeaLtArfEg4M0u4NBp+zbqc+YCzzyFnc15WGWzP4a/dJpQaaPjdJTLc9q7zCck0GwFg6Vk6SKt+k+K51SmqrhwguuYz/UyTd+Bms9Qw/yk+ORrw
X-GND-State: clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780837341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Us8t1FauUvqIbk+278vxWfPaaWKhxrf/HPXRTgCjbXc=;
 b=Iuek3nHfIWCOUiyUmltsNH5V3zfBbRnv4Tm3exiw6TMQSOGuCepkfVJtrUcG6BGD0LlYbI
 0Rhf+L681fTYs1m4OIevOh0xPMinnprVw/K6vgDY6UYGzwEYao1HKb8FipSBTszxpqZrv+
 uTK0BWBeOlGeFSxQe4WtAOGuPn7HM4jJkZ/UQBLMl255uf3E6j1JXfwbcyZmq+y1P9PsTM
 b6oyP+3au/ULfLJr/oNa6n7ty3wI3k5Fb99CLz83uqicDfUSt87UiJikd5o8vgPSpyLfKF
 JwYDBQBIeXt58yr+/XXBcSrmbOFa8FfY0ioI6tQWNOuiGy4ASBa+x1WolaL20w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=Iuek3nHf
Subject: [Buildroot] [PATCH v2 0/8] Add ColdFire MCF5441x (m68k) support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds support for the NXP ColdFire MCF5441x family (m68k/cf:
MMU, V4e core, no hardware FPU, no atomic builtins) on top of uClibc-ng.

v2 is smaller and better justified after the v1 review (thanks Thomas
and Baruch). The per-patch changelogs are under each patch.

Main changes since v1:
 - Dropped libopenssl, ntp and the nginx block: no real defect, the
   existing logic already handles ColdFire.
 - Makefile.in: keep only -mlong-jump-table-offsets; the scheduler
   flags were dropped (they triggered the dropbear ICE).
 - New pkg-meson.mk patch: restrict the b_staticpic workaround to the
   5208 (GCC PR 101971), instead of the whole ColdFire family.
 - gcc/gmp/gdb: commit messages reworded to the real root cause.
 - libglib2 reduced to the ColdFire build fixes (-mxgot and static
   libstdc++/libgcc).

Two independent patches were split out of v1 and sent separately
(mawk awk symlink, libglib2 host sysprof).

Build-tested from scratch for cf5441x (V4e, uClibc-ng, gcc 14.3.0) and
run on MCF54418 hardware. All changes are guarded by BR2_m68k_cf, so no
impact on other m68k variants or architectures.

Jean-Michel Hautbois (8):
  arch/Config.in.m68k: add ColdFire MCF5441x support
  package/pkg-meson.mk: restrict ColdFire b_staticpic workaround to 5208
  package/gcc: force --with-arch=cf on m68k MCF5441x
  package/Makefile.in: use 32-bit jump table offsets on m68k ColdFire
  package/gmp: disable C++ bindings on m68k ColdFire
  package/gdb: link libstdc++ and libgcc statically on m68k ColdFire
  package/dropbear: disable ML-KEM768 on m68k
  package/libglib2: add m68k ColdFire support

 arch/Config.in.m68k          |  7 +++++++
 package/Makefile.in          |  2 ++
 package/dropbear/dropbear.mk |  7 +++++++
 package/gcc/gcc.mk           |  4 ++++
 package/gdb/gdb.mk           |  7 +++++++
 package/gmp/gmp.mk           |  7 ++++++-
 package/libglib2/libglib2.mk | 15 +++++++++++++++
 package/pkg-meson.mk         |  2 +-
 toolchain/Config.in          | 10 ++++++++++
 9 files changed, 59 insertions(+), 2 deletions(-)

-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
