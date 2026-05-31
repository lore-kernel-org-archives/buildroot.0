Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F58CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 15:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A625580B00;
	Sun, 31 May 2026 15:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7s0AhHG90de; Sun, 31 May 2026 15:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B43E88506F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780241787;
	bh=D4AnMAtoM8FvaOXRvmDBmMuhrsUL7A8LNMD1xvLMzUQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=F4upR7l8x7ghgMD7qwQJOwgYTUFv+vne9KIaLSzhdd+nTMOEYzIcRDWLMORw+mE3l
	 ScLsJEWCY3NLl+uiyaAb7m/R4WF1KtizzxB8I1F8n8xrR0qI9B9+tJlIVU9Jo3nWn+
	 DuiSWQ5lynd0wIZwUgZxR41WKDN6VTmymkFjpFbYQ5jPFYp6Xh0leKT51Q1jDKhiuC
	 i1wxGGWs3856pzdSqQF7l/VJhZkIcKgQ7eHfUXlp/zD76Y5/NUuRvREYeCGmGVZhaw
	 suJkuNrZIfWikwgDOV3ECh5upNxYJjR5+5Bvb1sFq7Ys5ac1EfCQUsT4mlPkhmv6Lm
	 hMKlsq9cfJAqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B43E88506F;
	Sun, 31 May 2026 15:36:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1BD1F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E195240183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdOSXkH1OcPZ for <buildroot@buildroot.org>;
 Sun, 31 May 2026 15:36:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4689405D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4689405D8
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4689405D8
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4909def6a21so10115545e9.3
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241778; x=1780846578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r22t5U6VlGMfpI97mQNyV+WPFxezGKO0Hk3MSQSUyM8=;
 b=S9U+zyBjWTzWN2Em1Ku9OFxDGvAlriVSF21XRLM/1BXr7ikjI1WDzuwNZcTh+A8g/j
 mKpsTTpyr0HiWVooK+gplO5gNsWjw2egICWb1qQDRWx7TRI3dF4S0dkHC+5lsPAl2aU3
 96xbvKDT+L3Vjy3ozlFKDTzrcunLsVexm3dfMy5fVuTSy+SoOf5OXvRwUFAR2aRVYDDZ
 SA1E2BGgMmVlJ0ZgoDd6OIH1BmmDpxRRSSesYs5YQEaURYwSSbhXWfp1CuI87xY0VsIc
 l4wvlU9IZa5ytBXzMzvzpHaxGwnNOjOJVa+oYl3rcPyNA9edRdg5MM/82MRAHPwrim5i
 7Pyw==
X-Gm-Message-State: AOJu0YxiRfbnHLFUL1WudpmMJmSer5w2ZqKFwBC73zQ/beiWVRpVQkct
 ThiMl2oltdF477N7nDoean2GiP86tJLaGfHFEIDoc57vRmJ43ZF1eDQnWe9C5zxQJQ0cTQRh6CB
 rbAkOs/w=
X-Gm-Gg: Acq92OFs3f+roVmZSovEFgqcE7BCjrNOu2ioF5kOtUctD81o00rb1WxqsLG/7+Iu1jB
 yz6BjPs+C+B0OvDyh0d0ntqqiRbEa55nJmUWI9QhBhd1ZwwrMV5oo3ygeSchgvZ4CeY1i5j1ZoH
 aTnb+Izf5B7AG8Vah4elibIc3M3+w8+Wnw/BwONEvdwk1roNpFcGMAl5dRmijs3xPO7VtPbqH5R
 J6wpjvIENad0uvkIPmW4w3YxU2698FWRuhe3dVOEJzVQqSnC9lP7jLXjBVhZHC+sR539YLgLqpm
 /63+C0LjQx20kIlqzts8UtDKUQ+h+JFjWpGjMElf1EhgsyEc2Bsn/rBN2odx2XkL4ezDG8K+SZj
 vDtlPu2snAw8Is/nU9AcJ3Us6qNiUP0lOyUdN3J0vXodnBEFx5GccUl0pOb5zn/q5SYI4lOHDjY
 xSzzxXTFN6Muzncg1muKPzCSFTVdDhZFEEkvMBzHzVOlSMMYnE/XDqBYfm+PPpKTe7HHY5yVEvO
 WC1CuFN/k14O5rdRJP8++eeyAb2vz1nZHq4Le475qs=
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id
 5b1f17b1804b1-490a293b7c1mr105072145e9.27.1780241777967; 
 Sun, 31 May 2026 08:36:17 -0700 (PDT)
Received: from dragon.localdomain
 (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr. [92.154.108.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6575csm278098585e9.4.2026.05.31.08.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:36:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 17:35:47 +0200
Message-ID: <20260531153557.2375580-4-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531153557.2375580-1-titouan.christophe@mind.be>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780241778; x=1780846578; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r22t5U6VlGMfpI97mQNyV+WPFxezGKO0Hk3MSQSUyM8=;
 b=WC6kGauiP4cfLyPf091nYrc2Wx/rDIjq2w0tdo4Y0tiHhG4lqVfZj5MVi1o2oNyuaY
 9xALfR04cspbHffkw/MMyvwaekP79ysCTucRafv7lshzXRtOKUEtH2nhH+6K9KI/a9fc
 iyFWeVQJOTs8E3aCIWFlYMLCrDXn+IzFej4pDdh0wvoxcr//ePv6Ssvf5viaac0wKc3O
 ucZklbfOjPBVHScQgPsGl+tol0c9UtzwopoGhefgRoHTOhWRbVNzcpA95ovDMIreKYcP
 ryevLlcVNZjBcNoSmbTUfzbkDvfp1B75cNK5BuGlT8tRRA55wXt1QVr6xMD9ZRifPcxw
 //Pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WC6kGaui
Subject: [Buildroot] [PATCH v4 3/9] Config.in: do not expand TOPDIR,
 BASE_DIR and CONFIG_DIR
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: yann.morin@orange.com, ps.report@gmx.net, thomas.petazzoni@bootlin.com,
 petr.vorel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Seiderer <ps.report@gmx.net>

- escape TOPDIR, BASE_DIR and CONFIG_DIR usage to force to not exapnd at
  configure time (but at make time), needed for upcoming kconfig update
  (see upstream commit [1])

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 0bfe6d1ab5..59d01b0776 100644
--- a/Config.in
+++ b/Config.in
@@ -241,7 +241,7 @@ config BR2_DEFCONFIG
 
 config BR2_DL_DIR
 	string "Download dir"
-	default "$(TOPDIR)/dl"
+	default "\$(TOPDIR)/dl"
 	help
 	  Directory to store all the source files that we need to fetch.
 	  If the Linux shell environment has defined the BR2_DL_DIR
@@ -255,7 +255,7 @@ config BR2_DL_DIR
 
 config BR2_HOST_DIR
 	string "Host dir"
-	default "$(BASE_DIR)/host"
+	default "\$(BASE_DIR)/host"
 	help
 	  Directory to store all the binary files that are built for the
 	  host. This includes the cross compilation toolchain when
@@ -713,7 +713,7 @@ endchoice
 
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
-	default "$(CONFIG_DIR)/local.mk"
+	default "\$(CONFIG_DIR)/local.mk"
 	help
 	  A package override file is a short makefile that contains
 	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR, which
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
