Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB39C5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098FA605EE;
	Tue, 11 Aug 2026 19:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulFif35V5tbx; Tue, 11 Aug 2026 19:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3847D606E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786475143;
	bh=KXl/O1eflmUGTeOc0mwDg0GW13clE1KZmXEeq0r2I6U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DRbEOvEPFB4LkYRic+aO/gw5wo8X0uOfMN8XvFH15H/Bx1y5CJzykwF5IQOJooreS
	 S96sDrgc2Z+gBbKTN6VWCxZsXpxfW4RW0JU1wewBSoIQUJog8gveNAhmDG0dSsEQYR
	 1iQdNTHkLuABtJo2Dud0JSyEE248Xm65GDPYlqdV6ASH8z7riyCLDkI18IMyFqN6oN
	 1W/ZtrtMwuFflae82wBtTbdfrOXdvYADNkakGS36ySg/KSyG4TzRag6KKDKc8XXP4t
	 7MTQ8d9c9fTSzf3T8rt0r1Ny1P5FuNms0z9JktK4sx0PUCJBIdiZgQwVcLCBYyKuyy
	 tRj50wrVCirkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3847D606E9;
	Tue, 11 Aug 2026 19:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 376531F41
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C42B660858
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 18:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywkSEVp8JQWx for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 18:58:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62FAB60823
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62FAB60823
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62FAB60823
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 18:58:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0529.dip0.t-ipconnect.de [91.58.5.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87B5FA4C4B28;
 Tue, 11 Aug 2026 20:19:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40316)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wtr4Q-000000000qy-0MF2;
 Tue, 11 Aug 2026 18:19:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Gregory Dymarek <gregd72002@gmail.com>
Date: Tue, 11 Aug 2026 20:19:25 +0200
Message-ID: <20260811181925.3513940-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811181925.3513940-1-bernd@kuhls.net>
References: <20260811181925.3513940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786472366;
 bh=MTd3NIQR1bNp4zJg2f/KI/o680fF/B+lKwbkk6s1dLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XAB0Tg51dexme8UpVFpQboK9Ujj1y1PzXUygFjbeVlMEtvTjDcuSiwW1F+kdyV+j+
 BhDDsHydmTyGolE1RNxt5m+E+Smwcvs4hr6J+V+yIMV5n6OURqp1gdo7ULq51eCMJ7
 cGCJwTJlwLUo+obe3XxpRrnqvB2BAY3Uf1YXLHv3/Pdm+7pMJYyS8AuGZGCnolbjK/
 7iHZuLj/O7hd8xotLN9PhrALlYp/PioooUDpn2rxC+s882mNjL0aCjcVDOg8Kxlsdt
 08LHdnLGi++gafUviBcKTKAVIp0LCC4TTCAxz6O4mqVYc6bQ1TATS1mQPxbMnuqBGL
 LT9fwHka6YYjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XAB0Tg51
Subject: [Buildroot] [PATCH 3/3] package/freeswitch: security bump version
 to 1.11.2
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

https://github.com/signalwire/freeswitch/releases/tag/v1.11.2

"This is an important release containing extensive security hardening
 across the core, mod_rtmp, mod_xml_rpc and mod_sofia, alongside the new
 interface allowlist, stricter DTLS/STUN validation for media sessions,
 and a modernized build system. We strongly encourage all users to
 upgrade to v1.11.2 as soon as possible."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed
https://gitlab.com/bkuhls/buildroot/-/commits/4ab1f97382d4894033fb4fb8a254cf1c5212b714

with the exception of bootlin-aarch64-glibc-old:
https://gitlab.com/bkuhls/buildroot/-/jobs/15838687672

  ./.libs/libfreeswitch.so: undefined reference to `getentropy'

Freeswitch added the usage of getentropy in version 1.11.0:
https://github.com/signalwire/freeswitch/commit/7f9dd270b492907ddd063be18003e18719bdb80b

getentropy was added in glibc 2.25
https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=ec15dde7613306cfa574149f61ea38ab3fbba76d;hb=db0242e3023436757bbc7c488a779e6e3343db04#l116

causing a build error with bootlin-aarch64-glibc-old which is based on
glibc 2.24. I found no way to disable freeswitch for this toolchain.

 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index ffddee806a..1ae30ebc3a 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.1.-release.tar.xz.sha256
-sha256  ed4e6ecc6a6ee0bcbc068f33cf3e5d1b83d7ad26c3a98feaebb1b2ab22d5adf4  freeswitch-1.11.1.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.2.-release.tar.xz.sha256
+sha256  1a460e28a0309bf2e29397f0dc7cebecaa579c9f19efa9a301dfc6bf5015d17e  freeswitch-1.11.2.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index cec9b30660..39af6214bf 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.11.1
+FREESWITCH_VERSION = 1.11.2
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
