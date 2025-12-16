Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A982DD609A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 15:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B51F80B21;
	Tue, 16 Dec 2025 15:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIX6Sza2gK6Z; Tue, 16 Dec 2025 15:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DF7C80B23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765898387;
	bh=H0cGP21jjMvlcyuX/qXLseg0xdahAD17zsdJkijsczE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=MjoC8mOPa4rn7RnGV2SnYfKovOGUAiycL+eZ77/xtBmGb8oEm90M4nUtMet0BY+Ac
	 7Ty3ir9CaJ78HAQGk7oiHzBSwZycF38XVFg1ICKUG69GEHbtnKCxwu65wlG549OOKe
	 +hXSRh3FjyOHCfgXLM+PeLFfkQKmDNeQcFdAJT4cUZ/8QMnuH0x9KiPmF26LRGMoe0
	 AluFQdhLXmSF6OYW3P5Zi6a2A6/UjDqYUceXFtmdheBMhuPoqgTn81/sV+C8J+Hkzt
	 fRx6b2EZf+MkHJywHnI5qq8ZSAagDpEmNaWCTa2dcLmVNACyXQ3fh/ZsHNGT0vpDT6
	 LXb4eLRC9OSKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DF7C80B23;
	Tue, 16 Dec 2025 15:19:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 410F7372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32BD54051F
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRiFLs7Evl7M for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 15:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B1B840071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B1B840071
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B1B840071
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:19:45 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso6622504a12.2
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 07:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765898382; x=1766503182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjB7NlVNyPeA+smA6hBqA+fidsBLsK7Odn5zweg5kWI=;
 b=WSCm/75uWOfBEWDa8ML6+OiZlgAKXyzqx56xmdBzmfknjU5nV7qXGk2jOVVN1DcXXZ
 Spu7psmpAkXMjr3fiTZtVmgbHJCUSByg2oSNMtFPc7IxWes4CTAuazWeRK4pUdt8VeDC
 F3BkLQcx2slDKHH34aKHZ8h4649ZjcPx7HOaTeyoydZzw3kvPXEDq5XDZoRNYV3OollJ
 MRqW6oqGlM1aum6GjG00BG1tSt0fwS89izEf8tI49l8REhUoWGrKkpxr6mSE42whEruj
 vuXiIMrGINfvQ0J8isZLyNjZpZ3+PJ8xqgRMl9q94D5qHZpaVyY1rNwb+FLtQSZeR0ZS
 bpag==
X-Gm-Message-State: AOJu0Yxzfkv5BOtnUu+CChzl0TbJa4ak/3653071fR2TofHgGUXCH/Pz
 oHgD8Hewg7EUMGov16ouOAFXsQEOftG/AjWyqamTRA2BaS0flKwasShaPAh5sQ==
X-Gm-Gg: AY/fxX6IuKEhsm9xqBceFPtpz61lmXDXbxrk+72RFVgaeAzDnBXmLmpOMw3NurWStaI
 u8MmvegX6HJ6P1FvWC4/lX8j/P6qB7P6JAceOTrLJNUWp2qBiWszpyCE/dun/J8lDSvgQhXRQ1W
 RCRa/dNOzAZhfew7ehdgmbQXex0ZgucJXX+G6OpTZuZAoIqXKFkkYkBUZcKZlY85Du0e/17SrVt
 VvLswFqbpdSDXdjYwQPIntKCZimqzsDzUsImcUquS9sztthaUdHpBGGaqzBScoBnomuAoraMbSw
 CzCM4CKKFkdmay8tvpDH8P5WG/DvDtbeKoO1mgut24KY2LIdhwYxgH6/Y+BMf6mM8E4jAfWwpNp
 yPrkP15DRPisckG/4/6XsC6ow/kpkP5LTOFoUhxmhBXaDh08tU47GrSduDYMfblc8s/t36dFbHC
 f6OLJUWJkoe3i23vfsNxbYG7Hh/HbDjH/VkGQZXf+FLJx+qSvE6Pbm/GoX8/d299RQeIM=
X-Google-Smtp-Source: AGHT+IHiypBDG2c7FxCIQZDhYu9hMrnZcNXVsrVzhVbLNbQVmEgquIc1mZZXq7+/848wUPaiEuD4Zg==
X-Received: by 2002:a05:6402:13c2:b0:649:3ec5:55a3 with SMTP id
 4fb4d7f45d1cf-6499b16caadmr14890600a12.5.1765898382240; 
 Tue, 16 Dec 2025 07:19:42 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-649820f76f3sm16231849a12.20.2025.12.16.07.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 07:19:41 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 16:19:39 +0100
Message-Id: <20251216151939.3188611-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1765898382; x=1766503182; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SjB7NlVNyPeA+smA6hBqA+fidsBLsK7Odn5zweg5kWI=;
 b=VhcxVzsiR9rfBGGaBStc9yDObAodpMmxhTg2eXMuyrpO97qspz49bIg2QJKyCIASPB
 b4THts7Teqx880mL4I1/DIxP1R7u0PcpzvkL4D1S/P2XfmW63TbpjesRUDcuxCCDJ2sx
 cwbnk2vs8jeG8PiaKDluOKdgEWONHpH9GjxkaQkxvQE1h1jobrvnjb+SA5pdD05SOsCi
 /Xhq0fqqJDgRwZvFDZBZRCqi8FcWp2SxIvkCSVf+cRF7gTsGJjXrHOsIhy5nNt2grt21
 ZDTjzt4XV7tDWf96o1MJ34fTd0HV3ggU8omOR89PQm3RfzTa0wIR1j2oO52gwoxLOKA6
 XAOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VhcxVzsi
Subject: [Buildroot] [PATCH v2] package/cmocka: disable documentation
 building
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

cmocka tries to find the Doxygen binary by default and if successful,
it tries to download style sheets and breaks with the following message:

CMake Error at
doxygen-awesome-css-subbuild/doxygen-awesome-css-populate-prefix/src/doxygen-awesome-css-populate-stamp/download-doxygen-awesome-css-populate.cmake:163
(message):
  Each download failed!

    error: downloading
'https://github.com/jothepro/doxygen-awesome-css/archive/refs/tags/v2.4.1.tar.gz'
failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported

closing connection #-1

Disable the Doxygen package search entirely.

Fixes:
https://autobuild.buildroot.org/results/e6a04cee8bc3028bd8a1a535c2852e60f362c4ba/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - disable package search entirely instead of a patch adding a BUILD_DOC option

 package/cmocka/cmocka.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index 0ee18e2931..b2d489b7f7 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -10,7 +10,7 @@ CMOCKA_SITE = https://cmocka.org/files/2.0
 CMOCKA_LICENSE = Apache-2.0
 CMOCKA_LICENSE_FILES = LICENSE
 CMOCKA_INSTALL_STAGING = YES
-CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF
+CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=TRUE
 
 # cmocka only supports out of source builds
 CMOCKA_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
