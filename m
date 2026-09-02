Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C91C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E4F240A3C;
	Wed,  2 Sep 2026 13:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csntyQB0uxrX; Wed,  2 Sep 2026 13:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355035;
	bh=48OU6F4Vf3CD73+0QuyRnoyc/7IJPJ75i4wN75zTLmk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m4+bKbZzoxP6nn0d0+h0cYfRbwtZlFeVwc5N+Dm6TjeXAT0yuxez3IADqddTDjXGz
	 mLi3FMIuk4xG8u52T89d+PVcJJu7DypstO5UCffpu+hqlGMAhIHZ4OPzBe8dHj0cmL
	 xT37m+PPkGzYGlyqXQlZyYUdHQF4+in28N4OwJ/o+ekunijQQhPpellJguhtl6g0qt
	 Xma0A76mv5mca9szDsKqMVBsksiLhFOP/iFlHvLrLxkloRJCYx9nW2Q2BNKRKOmozi
	 43PYIDi9PrN2mZ68+Yx39xPzTopvxNSnETfgV8rA1BQuih8ttp/9hEvCfVgwMXahMK
	 Rz95fFg2e+1eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02AE440A4C;
	Wed,  2 Sep 2026 13:17:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B242230
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C0204005A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11YRSp-Yut7o for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F4264004D
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-482e2fdf5abso550968f8f.2
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355024; x=1788959824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=quScRAhI9dlgiMTv3kl6tfv84vVuqZ5B14Nmp+9sXug=;
 b=SJbWNpotrAIbsCme9MC4Vux9y0dmIS5uSGNyz7YhTjtQXSFmRGY1jXL0xSZf3TSR/Z
 jZR4+6/X7Du/cTOIpggoYlPie6G3vXzKOR1NmhCGtsNOV0QSJpffALxuz1SX4lRQ8WXE
 whrjfu9OZbhjQ8I30MMY451BLbpEX8CtJWa59I/d0dNeqYETCDjCo/oLvWTVPmD802MS
 /mECFTBzcMTzifyhQaswWVt+v6y0wWx+lD+lliABwcJC6pEbxa6SADi7xueQ6P/cUyWl
 TMCqHcD7H+/T+q8P17Hvwa4mfb/Z+yJYQDnMj3Uc43EIUjT2YBfYRUtFXodlACfdnIdJ
 +Zdg==
X-Gm-Message-State: AFuF++kld9b0ML+dtNe612qrOD1/Ic2+RvwOKxzEzKjYhngqmWxMAqXd
 FEP70mRE5XAkYXryfKm/AupT+W6jxq67o6d8rNvBAdk3oO/69a2XzVDuqOLApB1lHX0Gyf5ipKl
 pYPZYz8w=
X-Gm-Gg: AYBFou0O7NuFKhHUUjnqYsLPzumW8KkTjAG1oqf/XqJZ1Bm3dc67raE9vspkoZa5wx/
 yRGfBAbzdxD3k5EdXx7aJTj2+WTaPjXcW+eNChr+MKYZpjT+WCMk3uOGWQp0VR1SLwewCt/BS1B
 dgSREFMmyFwlO4ar69xG8fysO4RhgSgE0fFlS90mQgQ2emPUpZwJUYuMOgYFMivA6f/VMRmcJrn
 vpHYsH0cIC1gOOXIMNGKgE7gApT+rwxL5LZyJeV/ERfLWjsyIYufa/ewTB7Ny+EHnnnPH7lxNAQ
 GxqmTrsO18xyqPlY7pSBWFmsoEvxLwDlGY8Ws0IHBLIL+Sh/Gib8Xxfj6LTqOFLTPZlVp1Rgcky
 93xHtZChwQoDOsBpBhkWopPflsvIWfxF9T8gHdci6+kz4tkDYi0//c3eMD4d+2NO8kFPti2Du2u
 gk0Yzu2aLC+PHiPe2AY7n2zp+PSPGj/DZuNkczUYXoh8m6Udf93WEWQJ/WoulvXoMLH2TT8Yy9d
 umM
X-Received: by 2002:a05:6000:4b02:b0:482:f528:be4 with SMTP id
 ffacd0b85a97d-48488f20a04mr10322313f8f.16.1788355023828; 
 Wed, 02 Sep 2026 06:17:03 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:03 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:31 +0200
Message-ID: <20260902131640.379588-7-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 06/15] package/clamav: add
 patch for CVE-2026-20214
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...av-fix-fsg-section-loop-underflow-51.patch | 40 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 package/clamav/0005-libclamav-fix-fsg-section-loop-underflow-51.patch

diff --git a/package/clamav/0005-libclamav-fix-fsg-section-loop-underflow-51.patch b/package/clamav/0005-libclamav-fix-fsg-section-loop-underflow-51.patch
new file mode 100644
index 0000000000..e7561b47cd
--- /dev/null
+++ b/package/clamav/0005-libclamav-fix-fsg-section-loop-underflow-51.patch
@@ -0,0 +1,40 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Wed, 17 Jun 2026 09:25:13 -0400
+Subject: Libclamav: fix FSG section loop underflow (#51)
+
+A malformed FSG sample can leave the recovered section count at
+zero in the v1.31 unpacker path. The code then allocates space for
+one section entry but initializes recovered RVAs with a loop bound
+that underflows, causing an out-of-bounds write past the end of the
+sections array.
+
+Fix the loop bound by iterating while t is strictly less than the
+section count. This preserves the intended behavior for valid
+nonzero counts and correctly performs zero iterations when no
+original sections were recovered.
+
+Credit: Trail of Bits, in collaboration with Anthropic
+
+CLAM-2966
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/042bc35d0a89d6658de30ebc8494b3532e73dcc8
+CVE: CVE-2026-20214
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/pe.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libclamav/pe.c b/libclamav/pe.c
+index 23f4c4ae0d..c894ec7ca8 100644
+--- a/libclamav/pe.c
++++ b/libclamav/pe.c
+@@ -3753,7 +3753,7 @@ int cli_scanpe(cli_ctx *ctx)
+         }
+ 
+         sections[0].rva = newedi;
+-        for (t = 0; t <= (uint32_t)sectcnt - 1; t++)
++        for (t = 0; t < (uint32_t)sectcnt; t++)
+             sections[t + 1].rva = (((support[t * 2] | (support[t * 2 + 1] << 8)) - 2) << 12) - EC32(peinfo->pe_opt.opt32.ImageBase);
+ 
+         if (!peinfo->sections[i + 1].rsz || !(src = fmap_need_off_once(map, peinfo->sections[i + 1].raw, ssize))) {
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 4eb1840c84..f6a5e0edf4 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -36,6 +36,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20213
 # 0004-libclamav-enforce-installshield-extraction-limits-55.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20216
 
+# 0005-libclamav-fix-fsg-section-loop-underflow-51.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20214
+
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
