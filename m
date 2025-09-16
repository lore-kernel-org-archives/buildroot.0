Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10B0CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B3436117C;
	Tue, 16 Sep 2025 20:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgR4eKBUxVjP; Tue, 16 Sep 2025 20:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD37E61180
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD37E61180;
	Tue, 16 Sep 2025 20:27:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 266B5199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 188D141D59
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QmJ2-8vs-X7 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3049E418D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3049E418D4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3049E418D4
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ea7af25f42so1986690f8f.0
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054458; x=1758659258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBVQLhNRySnaKPMm/JhLhwEc60Fe+vEp7LG7B2BG+TY=;
 b=tOWUBw7Wdv/H/yaZSNtFSob7Ec8BtF4Kk0laVrJp+ttHDeEUC+hOzWFr+ZHfemlG7f
 kvLbiKzoItvqLtEgfkHTwjv6mFV3T2DSDJaa8jEA8sOxanC4SNNeJEdOpj6ByROXsTy0
 EmSEIiM4fHvVo20OPohrnKqBT7Qn6Sbv6jimT7hII+6pWG/oqtF2pYy7YjOubaS+P2AC
 FLg24qPf+W4+f8wUN6K60e+vCv+hVfxqy26cQIx6I6TxLfz6puZTObPp6hOWwULyEtvj
 xH4Wsr4Y9Jv2evMB45igE3s6yh/Klr+fc3QQgXFDCln1rPOEXgWpQJf/Ztb/cgMZKRkW
 2FVw==
X-Gm-Message-State: AOJu0YxQQzrx8t7w0bSzOO5YMfKy8pn1dMEZmrl2VjE7nFeoplq2qGEA
 Eua/HXxq9cr/FMftM2/fAj710ZulOtjeRVqkBnu3X3k26iMuh9WEaoxDBGOifDm30KuWvjQl6Xm
 CAh6YfcI=
X-Gm-Gg: ASbGncsVndwOrfr+msaj+6E6A5TEdJzRBbiZsDcXUMjXgEMB7zid5YMlbyNx9075qUQ
 57QSL9A/qYOpnV55igih2Yrtgz/U9pwCbW/HmF/Rd7FLpxpXCkik0toP9BxTY6xi6gafzTOGLE9
 LZaBM2WiLruiU0AGS9Z1EhcUSr5QaNWlTtT7R4JyeZ9NkrWJF37Eknf/4GdVrOuEAloqXTb55eY
 GnAtzWX9SLsAgNLYx1w8lBmQO/B5P7oTcOgPRPabrFiph88zijiqMAeJ2JatjHHpV0jYGpmzKgK
 XjTAk50IdPDjy/rCLtAq6/3nBt3KqByf4piHbakfAqkMfMt/QEhjxX1KVHjzazCTWq0i+ryLoPt
 G43bO/Iy6huajHOQ=
X-Google-Smtp-Source: AGHT+IHunJfor9aF3spv0Qyz6w2ohrrBji66V0EwBFVnLY1FicxtZPnoeNmCBUEI86qFzR0/RlDxkQ==
X-Received: by 2002:a05:6000:2891:b0:3d1:8d1e:8e9 with SMTP id
 ffacd0b85a97d-3e765a130a2mr12393608f8f.32.1758054457935; 
 Tue, 16 Sep 2025 13:27:37 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:25 +0200
Message-ID: <20250916202735.1121872-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054458; x=1758659258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBVQLhNRySnaKPMm/JhLhwEc60Fe+vEp7LG7B2BG+TY=;
 b=gijxXbsEKjltaHSnzQygQBwzLhmWr1scdeC6EXwvB5VlIjCd5bi1kyfGiskj1Osn8G
 MFxgvxyMSF6bwTAuoaBfFGrjWuRBftLuNCNGhFjs4zBmPyKPPvgdgTex0npEu44A+pyY
 9rvD+mkHL7TJg3ARcS6VhiJylKtK0DTdkZ2d7NdEhYNYqR6RCYNQvW5LOAJsrmVAhPHr
 YNe/55SUzTftiXE70ebpnNWY+AdXkZqKtCxKbsgUSgPOrPn6uU4bBY1b6ptkbfjRLi4K
 muUv+hO0HpngIN4cvm+21Oc1u6amt//JSEtqDvI7LhvUlTsf+2lxRmeI2bLGOPqxHCO9
 UeFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gijxXbsE
Subject: [Buildroot] [PATCH 02/12] package/boinc: fix deprecated CPE
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
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'rom_walton:boinc' has been deprecated in favour of
'universityofcalifornia:boinc_client'.

See https://nvd.nist.gov/products/cpe/detail/DAC161C5-2154-44BF-916A-EACB524E8B8F

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/boinc/boinc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 6b76e5f530..421c8a1455 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -10,7 +10,8 @@ BOINC_SITE = \
 	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
 BOINC_LICENSE = LGPL-3.0+
 BOINC_LICENSE_FILES = COPYING COPYING.LESSER
-BOINC_CPE_ID_VENDOR = rom_walton
+BOINC_CPE_ID_VENDOR = universityofcalifornia
+BOINC_CPE_ID_PRODUCT = boinc_client
 BOINC_SELINUX_MODULES = boinc
 BOINC_DEPENDENCIES = host-pkgconf libcurl openssl
 BOINC_AUTORECONF = YES
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
