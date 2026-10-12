Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E70CA9ED2
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9D0B80AE6;
	Mon, 12 Oct 2026 10:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWfHE1ckdjcC; Mon, 12 Oct 2026 10:22:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EFF49808D1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791800536;
	b=lPcsU6NSM5PmUiye0oB6EkPf1kCpvQK2Jc7jdRKEeoc286KS/7SGalxJzF/MIRLcH+eD
	 Ah0R1cqoKyctnXq5M7cpFN40ZRNwln0RUWf27UM813XMDhMl8VZARAIzqXF8M1f1LFQBP
	 2shDabSPJvHu2nrofKfag9qrCDSRQtyz6sEegKJ3cpeS1aP1fv/y2MGNLlAtHgIMyi7LB
	 gqWjH3o0567tEdgrVmpPCc68Qa+RoOKQp9TedH/l+pvKnTA4nQLZCLLILRk/U3/wElmrC
	 QpQP4/CNVXAm4Kxep5Ay0HvUMBwXzcv18YHeFtuvdPmhuPZH6HyH89zf9gl5Pq3U53w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791800536;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=viX0ZSvfL7/qc+/1m3gwotstLzpk9elYA2SJ+z+wjXM=;
	b=VdC35lGslfwa2AunagP3U4XQuOAdUjkcr/1mEVctSVYkgME5LZXymoHEtRepif5r9oTq
	 vlT8Gq2Yr2QvdKPH1SOl6YD8b9Udgpv/iFQAtZVmLKL2fGoDV6S6hNHmI390SSW/XgsXh
	 wmfXLcm2qA6/iVg1qRQZzB0Ri5Pn1AY64ZFHtgS8comVDwxulKne26lzlXV6jIebVWfpG
	 Jj16UPwAgs6tX9n4wEXzwgHRHJOrtRi2lk+EtbLGJLwsrEzP+LVaDykffa9l3JPaxUiMg
	 5ibc85BJM+SisVzkL00oOzmXdjlGWoL8hIGJkrSaiV2VA4h8F2dwArbRzdH4Qf3NVcw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791800536;
	bh=viX0ZSvfL7/qc+/1m3gwotstLzpk9elYA2SJ+z+wjXM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Usn1Hw+JRIwtTjVYoZSak6LMrzQh0S05KNITeoDhKQLTE20UqqkxIoBdAA9RFNzC5
	 8bH5HzhAJTkBeJgStfRperEuB9Nev3Je5u8fcvX9KOxpYWpglAxDXVbdv46XiVIPbT
	 Se6kYtkr3d6RYX0o4rAcrHs0Spowud0nVu2uW4ocSw6OG99bsAE9NGms9hhiPW4pu9
	 wprBx6L7N9dmmwS212nPmxJIrX/eoK0kQCTPD1EeRuCh/I5pFwvHsn4ZAukx2WXArx
	 Cq3O3XXiet6A/wp5tAO+djQagt/h6V1wMSFTX33iqmiupkxs4DW4NPr59Q1UyN9r6d
	 hw7ayHNnMo0oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFF49808D1;
	Mon, 12 Oct 2026 10:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2B4A75
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D499E40597
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNtvmaRFbkXf for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 312464058C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791800534;
 b=Cvkt626TeFM2XlhADEYqndoYfRe+TKz6oyanYX0C2s5uXr6b1GtWTn4Zruyuc3CFst4P
 H0WlqKaDu7zhU0I7Dg9GatKK4S2Lyd/grw4LZRtGsn8ayA8IHUF/yC1zYaxRXGM0tC/Q4
 kw4V1WHO5YrBy4IpwJSMio3Vps6kDY8JdXZ6wvlaNsAm3ra4l4hfPWMphqhi2jHhH1RUD
 PrikSxTv9YPL6I5DuTRF6iGeqnaHwJAhlAx6pTlLSwPl/GRMr313VR5Qda+o8gGVQMGk9
 xrKX7wB+D/9QDKZetTmOnQsoBzx0x+Jj18EOUGqvBPupy0mZqyEkUETtb18WbOti5NQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791800534;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qxU8rz45wJSe0R6B60mSsiLoQUCj2VlsYsOVqZ6cYXc=;
 b=JRJnQOvNCIbvuNn225ZfCHbVpl2nE/JCSWI9uQC7RyC+wVqdHXCbqVTlrM3oYjvACsws
 mo2zt8nNDTqCcQXLVl52hRUy7CZDzhNYQUJyJak/xY4ygFcuxozib+XI/n8VaZvtY0N/6
 97IV0E3BUEQw+HkBOcok5+ObBXqTFHuwT/SnwGNBSQ5JPJ/La2Z5sEPMKpFMGQbfqMR/i
 olhL/KgXsxq4wiJnZB8t2DvjnSNQg9XQ07OI+lDDunARiilEu28Cw2uF6nkdoEkWnJ6JO
 GJajrVO9bTG3eYvASpMUym0LodH7TFpkKQ/i5aTDhrgep/tRBaFTZNFUbBtsWmGkenA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 312464058C
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DA3993491; Mon, 12 Oct 2026 10:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Oct 2026 10:54:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42d7900bbc70051be9843b3b642d21c0dc0e6921
X-Git-Newrev: bf9b13a7f5bac6bcbbcbecc3f2cef830804e1c0d
X-Patchwork-Hint: ignore
Message-Id: <20261012102055.0DA3993491@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6: add QT6_QT_CONF_FIXUP hook
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf9b13a7f5bac6bcbbcbecc3f2cef830804e1c0d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With per-package directories, qt.conf is generated at qt6base install
time and holds the paths of the qt6base per-package host directory.
Add a hook to regenerate it with the paths of the package being built,
as QT5_QT_CONF_FIXUP does for Qt5. The qmake infrastructure will use it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt6/qt6.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 13482c33cc..f039ccef30 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -22,5 +22,11 @@ define QT6_INSTALL_QT_CONF
 		$(QT6BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
 endef
 
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define QT6_QT_CONF_FIXUP
+	$(QT6_INSTALL_QT_CONF)
+endef
+endif
+
 # Variable for other Qt applications to use
 QT6_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
