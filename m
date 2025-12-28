Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2089D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C374A406C2;
	Sun, 28 Dec 2025 18:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHvtS10kdbCd; Sun, 28 Dec 2025 18:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E9640686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948217;
	bh=3kkt75XuUfrCOgfiIx+bmDy/SaGuKR9lFPRC3FD8iE8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gt7mS35TlmQH9PRB1aaVfEs5txu6ndiNAa6Us36fgqKAVrIEerDKbtoU/nW6AmySH
	 jtshAQjKIrIHdyd9HSNE1oEVjjjZNz6I5zE6gt/9ugvcSPX29aWBSyge6IKicp+rkT
	 4rbNLLuyLqkaxI3uIN5gXvTCeWjWj+wP76L58k6wdpTXlzk7SqMKpqUKd/m9rhiiIs
	 i7UU2qZEX4KlRkbx2emIenNH3veZlkLg46rR696H04MRjzcJbx1koquIzA1uONNhki
	 pG9E23fQGRml9jzEQTKmzhlBew5/5E/V7DGhPpZjgnbMVxVJ5IkSKyfuhK4F7bCsd9
	 7+8keytp6UK6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08E9640686;
	Sun, 28 Dec 2025 18:56:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10511B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AADEC405C3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uubDHySig9XY for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:56:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE87140566
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE87140566
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE87140566
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so45389095e9.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766948206; x=1767553006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fONZSWABvT/Xrz1dvHNX6ZsCbYQyLM69aW+NS7cEHG0=;
 b=Tr3aDzOiad7HOo1brl4SUgIR9YGy1WsxVgRJYXFwxksjBe3aTRMfEuzSExg2PR7wro
 eGue3VrV5dOOTsxtOJdNBjI3RzZK/hrPVf1hQRsw3BAenPNsrib9k4ecWJOhRacuwVXF
 z9H2rIMLMK6SI/ykXQiCaPKdkMiveBoYrbsCiqgSaQ3Ee6ziUsl4LCCagKOyi94EfgF+
 uxswY+EOufr7PaHthUBTzqHVeL+1n6Sm/0QtX/8jvSaivwl60euL3xenQr7vE7CBbkOO
 eBYH3mD8Ve0LbCeZYkBU068J4OszLosTs4gELYfYoHrKcUtOaZOaDrX9VibRQ8XmIwhF
 LZjw==
X-Gm-Message-State: AOJu0Yw9O692/xFV/5O4lffW/w3LzC5/znY7RdDlrX2e/WWfUjIYSXkn
 pKtbbinaM+Hhs7i5wu3hp+1s2SGEEhJOjk7QLhujiEjIigr4qebG6w4R4MQWAMn4MebrJe6vo5q
 tQs753bs=
X-Gm-Gg: AY/fxX7zvnCTboMfHja0pAyK2ngsrYNHvM7V3Vsuxqn51BWlCvcg7E4oDOK176CsHRZ
 gzW9Qmx65vqSs8lycmdi2a9C2BwhNLqfpijjphwDqkpN218H7UlMTIZzyzy65rKIBL3SgdBfRFb
 FZOwWYDhaTyxvcCqlCsfMNw1VNAlbnMZMYB4bGOO/wuHAIJvz+aRknQEXPoYy4KXMlprYRCJ96I
 LQxZW64MDv4hNFLl4bBv2syq2N/rDI1iiB66kYlICd7FdAYQIT1nwbc/o5Uv/qQAlTlcI2MDKSW
 ic+INK3uElFP8lKzdSIW3lpVHfpbWHEj64MlAhdn962l5XCxNg/w8j2dsWPOuAe8j5w6QYutYND
 fNxUhZP6mxZDxteNQJKgqHc5L28ajDmmeh08xFbweVl0mDdWA/Ths9X/aWWqNVRFAFCv6ghHPj+
 zMxfWMQX5n8tB0wMViFKUDh9aeHt1WS7w79aH+R3yM+XGXYehDwjHBHv4xpBSyoRkYcQ0yCH2N
X-Google-Smtp-Source: AGHT+IHOqhemPBGX8kTXw52fEm8u9E02FPSaV2a8ZEjAuD2baxw5Ub7H5vA1w5NhrJ+gjCQ2JPIUHQ==
X-Received: by 2002:a05:600c:5248:b0:47a:8154:33e3 with SMTP id
 5b1f17b1804b1-47d1958958dmr313532275e9.28.1766948205671; 
 Sun, 28 Dec 2025 10:56:45 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm24426954f8f.6.2025.12.28.10.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:56:45 -0800 (PST)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Karoly Kasza <kaszak@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 19:56:35 +0100
Message-ID: <20251228185637.58072-10-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-1-thomas.perale@mind.be>
References: <20251228185637.58072-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766948206; x=1767553006; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fONZSWABvT/Xrz1dvHNX6ZsCbYQyLM69aW+NS7cEHG0=;
 b=GhheQjdU2kXwpZJqEYe7R4/2f5laVM+Mm1nOBAVEFmt1Jn99k7yB/ftrEVW1cHL6Sa
 WfVo/FoYG80tRtN7aIJNZF+ayzVeBKSkIZDTOPVGMasyV3hUQrsP+KztCDwIJI2otRpO
 cvEnjj5cDOVx2nQ4F8oWlFIcvKw8whMN0ZHTNON8I1W+BCL76NxvpTbE4U0x+GCv7Mpg
 vbfGIeAcHbXGivJq7+DzxZQUSq0M+IMZ4J28bTmj4PyUrb6MZOA2jw8hXpETNCMHIg0f
 poZ1Ssy1dviXBj7J4PnW2W7OcKpIrZNtiq0rNK6Fw8Fi+odgaMWaJIsx1Y/XIgTX5MWa
 1N4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GhheQjdU
Subject: [Buildroot] [PATCH 10/10] package/openvmtools: add CVE trailer in
 patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch fixes the information to the patch header to have a single
vulnerability per line.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libsoup/0014-CVE-2025-32911.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libsoup/0014-CVE-2025-32911.patch b/package/libsoup/0014-CVE-2025-32911.patch
index 102acb4af3..2421e85201 100644
--- a/package/libsoup/0014-CVE-2025-32911.patch
+++ b/package/libsoup/0014-CVE-2025-32911.patch
@@ -3,7 +3,8 @@ From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 30 Apr 2025 14:59:55 +0800
 Subject: [PATCH] CVE-2025-32911
 
-CVE: CVE-2025-32911 CVE-2025-32913
+CVE: CVE-2025-32911
+CVE: CVE-2025-32913
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
 
 Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
