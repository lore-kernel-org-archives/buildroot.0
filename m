Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E92AC61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C0880BCC;
	Wed, 26 Aug 2026 12:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eT-unaiIzc2K; Wed, 26 Aug 2026 12:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747815;
	bh=sskFpXj5ZXVdMLYyHWei+c67Bi4f7EeHlIl550t0rUI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=X6rGYuxNR0iAtI5uuVA8+ju+lVfstEgLHazkckVt3SKvRHpcNwZTpg/Z456weq9+q
	 DdHCl2e6jdXtnPzlcJ6pGli9GY/rHyqBAyRZxQvhyF6IRnlmwumQtQ5KKchk7IWOBo
	 lgSL+VyHtXUVr/A+j8Sz5Vqx86xqaDUBw8JmdvCit44tLo5vUy/C3DfMLJElD4P4+2
	 P6fFsdCuaHmm49g9u4WNlcsjAiK/GxZHrc2Y7ZF2COlKWHcgscr3YKqYtGYVXZZRzp
	 2Mqf+6+M/szmIxsjAUrWneSg49k9/0bbSGQSpWopjpAfZO0HaFiTeshNE1yeLe3eKJ
	 VsWfP0xr8ZDTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7440E80BB7;
	Wed, 26 Aug 2026 12:36:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2CF0396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C465040555
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmnNCs2W50UZ for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0BB540550
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:50 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6a41191c9a9so1110743a12.3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747809; x=1788352609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RtLEeY5cDL5t3ziBSRvrLjywaOVf1OlVDMdi7l0y04s=;
 b=lgfK/WEu3OJ2mIz7gPMbrl4RHF0vUgc+i577aeMjBjKaQkM2jrm6emCmctu0d5qv3X
 ClmWof8qrq50JXmIPMgmXasJ61naDsXDOl6lCjx4b4zOnS14aS0usRZ/kWgISlM8EZh+
 1UJS7FnYsR/pWieCNrIvQLGXraJwQkAk/ZFrPuaJV7rpEQiU8i+4s7SvM0y51Rh0uQBj
 bYTImJoRrInhG/J68wLuJhKz3PYi3SE2v57aSNr8j6moHPNkKImTXo4yopGoeiVDbdT7
 EiXQ4D5Vtg7VlrAwUpVsw9w7GTehZAC5U4dQRSlrae+IdZtpAkGyHgpi+iqLtneVHDXG
 qWeA==
X-Gm-Message-State: AFuF++mvJ5EIrrXr7uzoPEwQ7H40CfwSG4AKfAclp8TU8UseAoX9F682
 nAJMj9nHjkDm/1CPGf2s5ziats8RCRYNvXycGp0UJMBfgVNyO8PDAEan5GNiBslEN2UHPm5zvok
 wXCkTsoM=
X-Gm-Gg: AR+sD111Z09pXeazoG2leJlFWeBCtrR7Dsf0bbF2Zu0E0KwAH7W1Hn3PlpypQpf0f3l
 7pJ2ibZJ+KIzjaIsi5dtI6cE7cQYwrXVz2hxmvQ7MZxnUgrA9Ybo+Hx1BN865JfsmOesrlBYKmS
 PpI7QknaQYLiRvqD0aXf5sxoNhIK9rm29M1/xEV2sWYdjltUuIKEfOZ62q4TrL8JqWB3k4dbeAq
 bTR13d1s+RBaEiSLfPSe3ipsT+hpTqJzS4517RFy3wIMVIC+dRp1e3CBZqLlkEMYnFRS1Lsxb0/
 nH1npA24tc/6N6vMb6Cf/mxhk5vwwGmAxjXlYvxG2iWUk52N+pbh2KQe5xS2OH3bC6o7qwLUN2t
 +Y0uuIrkNCuoLPK9gSlknlEWHgRn5mMlzacD0YO0odhuIoIvFmOwaKqAnLvfbkDGcv+uqETIMaF
 gEKvtOwbTVMZcjkl+R0nUUfdoqWwxhd9Kb32gfdIiu9lYwBQ0PsiRT/nKQbkpHYA+cUOyN5b6y1
 rw4
X-Received: by 2002:a05:6402:3245:b0:698:c13e:179a with SMTP id
 4fb4d7f45d1cf-6a5df653615mr8098988a12.10.1787747808616; 
 Wed, 26 Aug 2026 05:36:48 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:48 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:21 +0200
Message-ID: <20260826123637.410258-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 00/16] package/clamav: update to
 upstream LTS
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

Titouan Christophe (16):
  package/clamav: bump to v1.4.3
  package/clamav: add patch for CVE-2026-20031
  package/clamav: add patch for RUSTSEC-2026-0007/CVE-2026-25541 in
    bundled dependency
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
 ...pendency-to-resolve-a-security-issue.patch |   30 +
 ...ix-pespin-cleanup-bitmap-tracking-47.patch |   46 +
 ...ack-triggered-rebuild-pe-overflow-49.patch |   90 +
 ...e-installshield-extraction-limits-55.patch |  126 +
 ...av-fix-fsg-section-loop-underflow-51.patch |   40 +
 ...rser-robustness-and-scan-coverage-63.patch | 1503 +++
 ...v-fix-7z-substream-count-overflow-53.patch |   40 +
 ...9-fix-32-bit-dmg-mish-size-checks-65.patch |  136 +
 ...rantine-actions-against-toctou-races.patch | 8117 +++++++++++++++++
 ...-partition-name-conversion-index-103.patch |   37 +
 ...in-rebuilt-section-size-overflow-101.patch |  224 +
 ...guard-pdf-hex-string-newline-skip-98.patch |   36 +
 ...-harden-mach-o-section-validation-96.patch |  149 +
 ...xar-limits-against-inflated-toc-size.patch |  277 +
 package/clamav/clamav.hash                    |    5 +-
 package/clamav/clamav.mk                      |   45 +-
 17 files changed, 11138 insertions(+), 3 deletions(-)
 create mode 100644 package/clamav/0001-fix-possible-panic-when-scanning-some-html-files.patch
 create mode 100644 package/clamav/0002-upgrade-rust-dependency-to-resolve-a-security-issue.patch
 create mode 100644 package/clamav/0003-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
 create mode 100644 package/clamav/0004-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
 create mode 100644 package/clamav/0005-libclamav-enforce-installshield-extraction-limits-55.patch
 create mode 100644 package/clamav/0006-libclamav-fix-fsg-section-loop-underflow-51.patch
 create mode 100644 package/clamav/0007-fix-alz-parser-robustness-and-scan-coverage-63.patch
 create mode 100644 package/clamav/0008-libclamav-fix-7z-substream-count-overflow-53.patch
 create mode 100644 package/clamav/0009-fix-32-bit-dmg-mish-size-checks-65.patch
 create mode 100644 package/clamav/0010-harden-quarantine-actions-against-toctou-races.patch
 create mode 100644 package/clamav/0011-libclamav-fix-gpt-partition-name-conversion-index-103.patch
 create mode 100644 package/clamav/0012-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
 create mode 100644 package/clamav/0013-libclamav-guard-pdf-hex-string-newline-skip-98.patch
 create mode 100644 package/clamav/0014-libclamav-harden-mach-o-section-validation-96.patch
 create mode 100644 package/clamav/0015-libclamav-enforce-xar-limits-against-inflated-toc-size.patch

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
