Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D657CCD5BB1
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 17:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB58D82751;
	Sun, 24 May 2026 17:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fH-n-coO870L; Sun, 24 May 2026 17:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D53E7828A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779643159;
	bh=DabTvBR8ST47R0GRx87PWAbIoW0Wj6QxpiBdZYLXng0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KaOh80Iqckv/8XDgrAwRR8ZTFHo8m+NWqzYhGjEWCPFyyW6r+ZROxlUyXPPRcLrmb
	 A9+wOd/wfnjoOySdFiNwrOfXqtBddOYQsiwYh7IOsAVvbpvy/LRBjpRJ/s0tMkbCer
	 nzcTweLIQdbi7mVfiW5aqE1cnfiIxs46yS2ub1AMlHAPUabo6EkmyCYWjsMe6ooXwY
	 lXwFeJcQ33lMYu+HwB5kpzDYmURlHTf0SuriV48pkd2ILJZaMi6aUvm3Uf+5Zx/FQq
	 iofdc/B3TXVh0wAu9JDgqxfB5RMTEBzsVBwEjdwoRawG0qhDosH3kV4lMJH2CizlRf
	 +uj98N3jIYFmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D53E7828A5;
	Sun, 24 May 2026 17:19:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 142E1263
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDB7D40449
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UN5Bb8yBxZK3 for <buildroot@buildroot.org>;
 Sun, 24 May 2026 17:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 839B640413
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 839B640413
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 839B640413
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:19:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beef.dip0.t-ipconnect.de [84.161.190.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8025A4C0EEA
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:19:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51100)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRCTo-000000001nS-3qDD
 for buildroot@buildroot.org; Sun, 24 May 2026 17:19:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 19:19:13 +0200
Message-ID: <20260524171913.3231905-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779643153;
 bh=riwvUmwhd6fXD9PUhUlh8h6012fRGQn83TGzES3YWjQ=;
 h=From:To:Subject:Date:From;
 b=DcXGp/IJG2oe4rVOer+tJTtMavge+tMVoFdIu9fKJ2YE+8NtWB1pHL7igYF4Fl35d
 9XrWlwoPhXDxn4Kf0iYG2jeLEQ820ojn+eLCLg1oPA7WmjJD+TJFCF4qQhatLa3WqR
 hyS0E/sqgQln6LCtEnG4JKyTsQ1gGI2BmLP3cQavlFAVSmlt9RD7/h8cl/8hWyc5B8
 1a+WH+SvDDxBS5jD1jALHXjRZkjEWyqXeryTEKT1qJ8+Nkh7vcbXZJYrdDy35bj9OQ
 QLFskMONVCZEpldQyqhVRDoRefZASOHHMuYv6Bsi9SG+1b7BOdqJmqsSqBY7yNJSUP
 OCzsF/l8VkesA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=DcXGp/IJ
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-nv: bump
 version to 2.1.24
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

https://lists.x.org/archives/xorg-announce/2026-April/003694.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash  | 6 +++---
 .../x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
index 4154efb612..f51e039c37 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-March/003489.html
-sha256  c68dbda431f3d47000606f8173b977b811c76ba9dda1a5d2e3ee122bbbb98aca  xf86-video-nv-2.1.23.tar.xz
-sha512  ce09f37bd29bbe588a8788d643240c9b0324654ea37b8e7f0f127494999f24b3048ca0c7ea91b33ef94efd12b570bfb73c8a5e20bf63749b01cbdc5669136b9e  xf86-video-nv-2.1.23.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003694.html
+sha256  2fb667de9d10bfa7ecddbb951f93020a2c0e42757b000a3d6f400bd54845df23  xf86-video-nv-2.1.24.tar.xz
+sha512  38e866f44f6233508f40002013e98fbc7f4e090a44b89a7116342aacc4cdc390a54a5a3d34c821150130386e47f2203c678e44861a1631f2e406f98aaa7c42de  xf86-video-nv-2.1.24.tar.xz
 # Locally calculated
 sha256  10d10e1ec37594d481c3de8dda22a40b731ebd43be7ccd462baaa7394738a9f3  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index cec2101d3c..fb021ae20e 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.23
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.24
 XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_NV_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
