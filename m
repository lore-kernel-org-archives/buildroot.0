Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAFDCD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 15:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65DB440F04;
	Tue, 12 May 2026 15:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udWReBNBf0a6; Tue, 12 May 2026 15:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA6440E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778598225;
	bh=ref5TS/NfWrZ0ZnLVVh+W5lYHUBa1A5j5c8uoK4+RmI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pMa519oQ0ULA0fvWF1Vq0IwCwnvazDMxXsL9FHkSsY1mJdmb/hMFFu4/wzuvt6sDl
	 l9makBcGRwiV8HoFTOVAMzgdsuuAlzGZnTq49htKVyvGbtWG2O8Qc6IYB29jZtjO6r
	 j97V3fNtcDlYztJggqcKZ9mFX2dVXUbfCcl2ZJ80r92/v6fnsu6Nz4yZhHtCVluVJz
	 HeK6SYusyKOp8Q+cC8FLXf5WU2xNEpnVMt2dUJZGJ+6YhkB9QxKX62b19tfINtWwJu
	 pwZM4QEXoyrWcleOMgAjUgrPn+DNGicpPx3yY44Vx4JBvVNUFl18V5p/eD5tAdR7W4
	 XhEAcn+LI9bmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA6440E97;
	Tue, 12 May 2026 15:03:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 214CF398
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12A9540E97
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbNiFq-4tln8 for <buildroot@buildroot.org>;
 Tue, 12 May 2026 15:03:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CABB640E96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CABB640E96
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CABB640E96
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:03:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 711BAA4C061C;
 Tue, 12 May 2026 17:03:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57944)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMody-000000006Sm-0Rt5;
 Tue, 12 May 2026 15:03:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 17:03:34 +0200
Message-ID: <20260512150334.508969-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778598214;
 bh=/CQ9IOs1lfG5dJERlforr3XM5rLSohQ7Sd/YMJjgfFQ=;
 h=From:To:Cc:Subject:Date:From;
 b=B6cfT1e3xTTtdX7gxCCcHQscblbapko4LSeudzMxemNA6Mkhx5fo5Ki5dMDz1Wprz
 iq3HEHcVShQGqozHSdkXv+dEoOFF0NLNBCMV1zImLbI6URDjAEN0ep3g0q4XKbXe8+
 +4un+/b8BUXkV7qH8Kl+mhjfO5h8RF0jKtzn4TO3JawEFNlHHezHt8O/FO5stqmoUM
 kOGkGQ4ODNZm1VWwYgBClHBu2ScvJ51ViP3XbSafxiIL9OH+GelwEsMDE71/nL78Fl
 MalIlHKOV9cALevc5ddLiwg1Ft25fSnx1YBbKyHQhFbytLTDG9UDTZrPGqKngDip7h
 KoQzv2J0bfYHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=B6cfT1e3
Subject: [Buildroot] [PATCH/next 1/1] package/libxmlb: bump version to 0.3.26
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

https://github.com/hughsie/libxmlb/blob/0.3.26/NEWS

Switched to xz tarball and tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxmlb/libxmlb.hash | 3 ++-
 package/libxmlb/libxmlb.mk   | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libxmlb/libxmlb.hash b/package/libxmlb/libxmlb.hash
index 0f91486a03..5a202ebfbf 100644
--- a/package/libxmlb/libxmlb.hash
+++ b/package/libxmlb/libxmlb.hash
@@ -1,3 +1,4 @@
+# From https://github.com/hughsie/libxmlb/releases/tag/0.3.26
+sha256  a18bc447fff0dd0d76a2e6cd4a603b4712047c027f9bbbdc31ebc25f0e2c1ed9  libxmlb-0.3.26.tar.xz
 # Locally computed:
-sha256  7050a3e43c4e1f53020cfbdfcb6fd5dc664c6c240faceb5ae3c8830423918262  libxmlb-0.3.19.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libxmlb/libxmlb.mk b/package/libxmlb/libxmlb.mk
index 1d5d339e4f..34e7233f4b 100644
--- a/package/libxmlb/libxmlb.mk
+++ b/package/libxmlb/libxmlb.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBXMLB_VERSION = 0.3.19
-LIBXMLB_SITE = $(call github,hughsie,libxmlb,$(LIBXMLB_VERSION))
+LIBXMLB_VERSION = 0.3.26
+LIBXMLB_SITE = https://github.com/hughsie/libxmlb/releases/download/$(LIBXMLB_VERSION)
+LIBXMLB_SOURCE = libxmlb-$(LIBXMLB_VERSION).tar.xz
 LIBXMLB_LICENSE = LGPL-2.1+
 LIBXMLB_LICENSE_FILES = LICENSE
 LIBXMLB_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
