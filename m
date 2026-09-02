Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5DEC624D9
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BFE80989;
	Wed,  2 Sep 2026 13:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwfKzKyVqfzj; Wed,  2 Sep 2026 13:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355034;
	bh=f+k6dJSI6xIJOsNHGYpZZPiem7Ks4xo56aA9i120750=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VgMcQs09jlXA3ynl6iXDrahMnXJm8Wa+IG8Y4ga0saJQfhSD0VeL9CxUACqKJ/ARV
	 4Z30i3ZknXLrnZlapL7QwKXw4tNlyOU2EgPSt8pUSkTfhdz4fdEUgDCyRdLjzo0CqH
	 qiAaaw7w8y41V5EfbYOrgV+UPbxc2Elyq4U1PQ9q88SAf9QkJag7FouW+pB+X1Zs95
	 yART3smVnmNzDf84xpFc5z5zxvhUHGgBfNYfWD6jTIlKxrAxz8BYDIo4vG6fIiabDf
	 3UOjJAnBSVtiAL/Rk1nOmx98DCd0EY6ae9cWg/tBbfGkBEWjA2isNC2O0vnerNBgsW
	 C3LHWITZRsGuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE2908098C;
	Wed,  2 Sep 2026 13:17:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52540230
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42BA260648
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8L1qnVjgSpU for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BCE9606F1
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-482fc2b44a7so1081784f8f.2
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355024; x=1788959824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9CwRORy2ZlJatIxJa/jiFK9dh3MQRQUEVjb1pCMs47I=;
 b=IxKkWwLIMYgeHq0IkT9gEribAThWsosfuOvxSV7Ib3gy/dxg5E+Pz5w4EMDruL+zdp
 SIr7J+yMufOv3/Tz/09NxMylWWKzx8bneq8rSifue/m5gTisXTWSgk1ymN9NwZ72iFI1
 +N15O6EoOjlwgbnq+rlJNdgEzIzWdf6HyFBf1fmZWJXFFIG36cL5u9Yqq2gRB9/tcgWr
 UOXPT+r1M9spqX7AOShHVmNNnCceWT56LB0MA3qW/Xye1MJlGSZO/SDxmudCN7UmXAkM
 b62KSYVTX1+rHgPRhbngxxCdgGkcCa4Oyfa9N38QNmkdi266a+m5Fe8wTO8bZfMtKBLU
 jHQQ==
X-Gm-Message-State: AFuF++kUgVtTfn44nn15kz911K5opkrG6IKwNcL6rLtLqLOu4rJVaCqw
 FMYjt8pnyOAbTjy2+vTVBt2UPyvfHGD7Pa/IkG6HkIHhSr02O7W+6qaMZ6cLw35E7C92EWocn0U
 y+SVq5Qk=
X-Gm-Gg: AYBFou2b+83ecFcbjzaLENRAkp14CMn+ESYK7hpOvsHPjSqjYdXRsbPRDEZ3BwCIkdG
 qyFI55SX2sSy1ZPKAPZyVkR1RgQx25OfBQIaMcmzIfDuZeD9KvmdluR7BlIl/RcwNa4vkqDvkJ3
 s0rZXH++JjWEtQqDz2ZcNE3u9gNya/VUtXE8XxqUX/G+dDyo2P5/7hZlVuuxDOBiLMHMd1SJnR8
 toO4QEW6mc0mWEQxJ1ezYEoWIZuYDiy1owqC09JYGuVlWYIUTCmnNh7CQ1KtNLzinW1IYaIZSw8
 LiPadRje3XkCQuPaeHx9xc8UNnXNLJ1IcT7tlewsFsHEHMnk+gi49vOpvo3u2AnYlN88c6eGqe3
 42rKxOIf7TzPdSof59GGYlLU3+lax5qCyATjxkjFXteeLpiIIme0s2mdG4+pljU8dLdEK9VT5Xr
 GOUxQ3IiYcuaupPbSm00LHWzK1ztKD7RswH9dKYwviYE47cpWFULkqKlFdIlqYcYmV6hb/KZfOB
 LEmgBKKuQdBbjc=
X-Received: by 2002:a05:6000:2486:b0:484:453a:8889 with SMTP id
 ffacd0b85a97d-48488f1d9f0mr7695247f8f.22.1788355020151; 
 Wed, 02 Sep 2026 06:17:00 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:16:59 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:25 +0200
Message-ID: <20260902131640.379588-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 00/15] package/clamav: update
 to upstream LTS
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

As indicated on ClamAV End of Life policy webpage [1], the 1.0 series is the
previous LTS (and therefore unmaintained). The ClamAV 1.4 series is the current
LTS version, maintained for 3 years. The latest release being ClamAV 1.4.6.

However, there is a breaking build-system change in ClamAV 1.4.4 [2]:
    "The minimum Rust version for ClamAV 1.4.4 is now 1.87.0."

Unfortunately, Buildroot LTS 2025.02.x is still on Rust v1.82, and therefore
building ClamAV>=1.4.4 fails because of missing features for Rust.

Consequently, this series:
- Bump ClamAV to the latest LTS version that can be built with Buildroot
  2025.02.x, which is ClamAV 1.4.3
- Backport security fixes from ClamAV 1.4.4, 1.4.5 and 1.4.6

[1] https://docs.clamav.net/faq/faq-eol.html
[2] https://github.com/Cisco-Talos/clamav/releases/tag/clamav-1.4.4

---
Changes v1-v2:
  - Removed patch 03/16 from series v1 which didn't work properly
---

Titouan Christophe (15):
  package/clamav: bump to v1.4.3
  package/clamav: add patch for CVE-2026-20031
  package/clamav: add patch for CVE-2026-20217
  package/clamav: add patch for CVE-2026-20213
  package/clamav: add patch for CVE-2026-20216
  package/clamav: add patch for CVE-2026-20214
  package/clamav: add patch for CVE-2026-20243
  package/clamav: add patch for CVE-2026-20215
  package/clamav: add patch for CVE-2026-20244
  package/clamav: add hardening patch for TOCTOU issue in quarantine
    actions
  package/clamav: add patch for CVE-2026-20345
  package/clamav: add patch for CVE-2026-20339
  package/clamav: add patch for CVE-2026-20346
  package/clamav: add patch for CVE-2026-20347
  package/clamav: add patch for CVE-2026-20348

 ...-panic-when-scanning-some-html-files.patch |  240 +
 ...ix-pespin-cleanup-bitmap-tracking-47.patch |   46 +
 ...ack-triggered-rebuild-pe-overflow-49.patch |   90 +
 ...e-installshield-extraction-limits-55.patch |  126 +
 ...av-fix-fsg-section-loop-underflow-51.patch |   40 +
 ...rser-robustness-and-scan-coverage-63.patch | 1503 +++
 ...v-fix-7z-substream-count-overflow-53.patch |   40 +
 ...8-fix-32-bit-dmg-mish-size-checks-65.patch |  136 +
 ...rantine-actions-against-toctou-races.patch | 8117 +++++++++++++++++
 ...-partition-name-conversion-index-103.patch |   37 +
 ...in-rebuilt-section-size-overflow-101.patch |  224 +
 ...guard-pdf-hex-string-newline-skip-98.patch |   36 +
 ...-harden-mach-o-section-validation-96.patch |  149 +
 ...xar-limits-against-inflated-toc-size.patch |  277 +
 package/clamav/clamav.hash                    |    5 +-
 package/clamav/clamav.mk                      |   42 +-
 16 files changed, 11105 insertions(+), 3 deletions(-)
 create mode 100644 package/clamav/0001-fix-possible-panic-when-scanning-some-html-files.patch
 create mode 100644 package/clamav/0002-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
 create mode 100644 package/clamav/0003-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
 create mode 100644 package/clamav/0004-libclamav-enforce-installshield-extraction-limits-55.patch
 create mode 100644 package/clamav/0005-libclamav-fix-fsg-section-loop-underflow-51.patch
 create mode 100644 package/clamav/0006-fix-alz-parser-robustness-and-scan-coverage-63.patch
 create mode 100644 package/clamav/0007-libclamav-fix-7z-substream-count-overflow-53.patch
 create mode 100644 package/clamav/0008-fix-32-bit-dmg-mish-size-checks-65.patch
 create mode 100644 package/clamav/0009-harden-quarantine-actions-against-toctou-races.patch
 create mode 100644 package/clamav/0010-libclamav-fix-gpt-partition-name-conversion-index-103.patch
 create mode 100644 package/clamav/0011-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
 create mode 100644 package/clamav/0012-libclamav-guard-pdf-hex-string-newline-skip-98.patch
 create mode 100644 package/clamav/0013-libclamav-harden-mach-o-section-validation-96.patch
 create mode 100644 package/clamav/0014-libclamav-enforce-xar-limits-against-inflated-toc-size.patch

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
