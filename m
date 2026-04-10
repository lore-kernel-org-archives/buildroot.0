Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C4F45A0F
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 22:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A2640B98;
	Fri, 10 Apr 2026 22:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCNKeeJq-8FD; Fri, 10 Apr 2026 22:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E66B040B9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775860951;
	bh=EPXsmTbnAAfPcHy0YfM6iSHNxMg/jtrYK8PF59O9Vwo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Vg9rMR16snd+C+qljtW47GZp8t1fC1ip+bdEXa3nTZB3x+IDPEeLrDYD5okWfaRIx
	 UTgKqZZ2IR0hrTO4E9T0yd2lRY8fQYpOBiET1T0VltBEoDOFGXTCx/jwH+QytcqJ1i
	 KXDbwwhU69WILyNItPTnVi0lwNvJwzPFtr1evbz9d7Y4pMkhJBjo3pK8LtvrwXsry3
	 7M+v8k8OY97UJ9r7ckE7UMVlfI8Xn6fx7ejMRQIYRceSQTJ9DeOCwCffEqkOU4/pSH
	 vJhxPbd9zJhfIr7g+so5tmrl0Ad0ogQp/lp6RRQ6MlyOFYKNzkmXnSFg2UYKum3wws
	 wss9Gn0hb7UHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E66B040B9B;
	Fri, 10 Apr 2026 22:42:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3637A194
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3433040B98
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVDQGK2rX4bI for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 22:42:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=nicolas.serafini@flyability.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0CCC40B96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CCC40B96
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0CCC40B96
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43cf5fbacc9so1212054f8f.1
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 15:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775860945; x=1776465745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N4y1ZfYHebQc/QJBiyhMZYqOZThVJe2s//TwXBw2i8Y=;
 b=jq5MPvopRLCZxbqRwP3uaH2yA1kJPm2rAFs9tHTAm86Alj8KgKh1o1AxF8g067js6s
 /mES7J4+vJkTnHjaeJ4gdyTLf3mWFW3y671x1BuMqqX2xgLv0Ud7Rq7P7yYTxWz36wcq
 hH4H7pEjk0aUiw3Vy/bMSKzsANuBbHvfjzx1uZidn5bZt9whPOISXbZnkL6sSSuIvpKL
 23Y/KwpIB4Tzhmpnpcf9EQd7qQqWDqlydZ+uI8Qz8fBb4/ARffIf2tGeIrqBJqkxrofc
 zhrFE/PAIWKmDE+b1dMcW+iAH1rphd735S1W1SrHBm3CeZI2zqj5Q/Evx2hPuTvcOsB/
 4rsw==
X-Gm-Message-State: AOJu0YwUyvLjQks1hnsu/XtDa/M3yE5tAMXxc0i7nfgA6nGZwO6eomd6
 oJ0ZHSYRXbUEuBSaepN21ao2O6J7X0FG/CzgRrYYM82HywPa7dbLrj4lJoXRzEWIQ8UM0H7Q+JO
 Z15Cbmrfv5w==
X-Gm-Gg: AeBDiesH/qGqyX+ihufjO7/bYGCU+LCof3DZktSi42ncxmxxbp0uciirBthG6V2jxzA
 4MdvNB28KEJ15A6NL/hReJegQ3Ip8hWtOpumW5huLkrdT3IoT/Yl6BIPkCj0ofq6++SCidLxSnM
 2Da4oxNQGuIqesz048neLq5RyWNAqWrBA7uqc6kyId2rVD0eu8+9Rjn8zUVJWDl3U+doEMVNxpA
 mLL27sATMEXPvQePFw9hyDgUJ6cCewwcd9iIrRnqxFF7hBMmmTNmPHWUlZvkXCHgvYPqMhgW4cr
 m+8OAep5Il7HremRqphi6yLa11VkR9K3fcu3G5Xt4Iru/WEvkuIKRQT6giRxVQ3EC77DMpjd4G/
 nmr8kkxhDgDLVgE8u3aMn+dxKLktAV89HVcTnSlcjRBvZ8gQ35qrJhEhOe4bVjsp74tvHwDDpt5
 MwH+n06Gx/Ph7wRHSYP0vHAR4pdGw4L8zHxP7pjU38JQ7mlvkyjeRDHvJaFWDblA==
X-Received: by 2002:a05:6000:1ac8:b0:43d:1de8:80b1 with SMTP id
 ffacd0b85a97d-43d6497b664mr6924419f8f.21.1775860945425; 
 Fri, 10 Apr 2026 15:42:25 -0700 (PDT)
Received: from nse-t16 (adsl-84-227-54-58.adslplus.ch. [84.227.54.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50015sm11668479f8f.27.2026.04.10.15.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 15:42:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 11 Apr 2026 00:42:17 +0200
Message-ID: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flyability.com; s=google; t=1775860945; x=1776465745; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N4y1ZfYHebQc/QJBiyhMZYqOZThVJe2s//TwXBw2i8Y=;
 b=LxXvETzNGjQBK26b9MFkLHdCJFsHMMq0GsXc5EyKcVSqMwcXYCVb/f0rfqXbekw77Q
 8SFU223bMcE5L6BTTcERM1Ja6G/7ZMAH3Xlwi7NdVtLojXNrGqWa3ybiHyrQjpvfKAJu
 iNMNvgN1DyrQKsBg+06gPrjJmhzlMZVksdcu8H7s1SQvIXKybJ9NZENUXq4sOvKtHFwa
 HEW58j1s4Kp5jhxDmJ+mH/pTADj8lFMVk9EYr4z5QOA8C5hif3XjjmEjwPvbQc4i//J2
 nOeFHK8WClodyvAsKk3qyIGEkIOV0u5Y8NgcDXWaqlBvT0Z/IEZiE1TCEawtvU72NBFX
 Mg3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=flyability.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=flyability.com header.i=@flyability.com
 header.a=rsa-sha256 header.s=google header.b=LxXvETzN
Subject: [Buildroot] [PATCH 0/4] package/rust: bump to 1.94.1 and fix
 bootstrap
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
From: Nicolas Serafini via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas Serafini <nicolas.serafini@flyability.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Simon Richter <simon@sinic.eu>,
 David Pierret <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Bernd Kuhls <bernd@kuhls.net>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 Julien Olivain <ju.o@free.fr>, Torben Voltmer <mail@t-voltmer.net>,
 Nicolas Serafini <nicolas.serafini@flyability.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Alexander Shirokov <shirokovalexs@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Apologies for the resend, my previous submission bounced as I was
not subscribed to the mailing list with this email address.

Rust remained at version 1.88.0 because, starting from version
1.89.0, the bootstrap process was redesigned, and attempting to
bootstrap host-rust from source resulted in the following errors:

error[E0463]: can't find crate for `std`
error[E0463]: can't find crate for `core`

Several attempts to bump Rust were submitted but none were merged:
  - Bernd Kuhls, bump to 1.92.0 (Dec 2025)
    https://patchwork.ozlabs.org/project/buildroot/patch/20251218222527.3861751-1-bernd@kuhls.net/
  - Simon Richter, bump to 1.93.1 (Feb 2026)
    https://patchwork.ozlabs.org/project/buildroot/patch/20260226073135.64960-1-simon@sinic.eu/

This series bump Rust to 1.94.1 and fixes the bootstrap issue:
  [1/4] Bump Rust from 1.88.0 to 1.94.1
  [2/4] Fix the bootstrap build for Rust >= 1.89.0: set
        local-rebuild = true in config.toml and replace the broken
        relative symlinks in host-rust-bin with hardlink copies.
  [3/4] Bump the cargo vendor suffix from -cargo4 to -cargo5 and
        update SHA256 hashes for all 34 affected packages, as the
        vendored content changed following the Rust bump.
  [4/4] Add riscv64gc-unknown-linux-musl target support, rebased
        from Mariusz Bialonczyk's earlier patch (Oct 2025) and
        also part of the patch series for the bump to 1.92.0:
        https://patchwork.ozlabs.org/project/buildroot/patch/20251028045833.2792350-1-manio@skyboo.net/
        https://patchwork.ozlabs.org/project/buildroot/patch/20251218222527.3861751-3-bernd@kuhls.net/

Tested with:
utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder tests.package.test_rust

Nicolas Serafini (4):
  package/rust: bump version to 1.94.1
  package/rust{,-bin}: fix bootstrap build for Rust >= 1.89.0
  package: update cargo suffix to -cargo5 and fix hashes
  rust: add support for riscv64gc-unknown-linux-musl target

 package/aardvark-dns/aardvark-dns.hash        |   2 +-
 package/aichat/aichat.hash                    |   2 +-
 package/bat/bat.hash                          |   2 +-
 package/broot/broot.hash                      |   2 +-
 package/dust/dust.hash                        |   2 +-
 package/espflash/espflash.hash                |   2 +-
 package/eza/eza.hash                          |   2 +-
 package/fd/fd.hash                            |   2 +-
 package/hyperfine/hyperfine.hash              |   2 +-
 package/kibi/kibi.hash                        |   2 +-
 package/kmon/kmon.hash                        |   2 +-
 package/libzenoh-c/libzenoh-c.hash            |   2 +-
 package/netavark/netavark.hash                |   2 +-
 package/nushell/nushell.hash                  |   2 +-
 package/parsec-tool/parsec-tool.hash          |   2 +-
 package/parsec/parsec.hash                    |   2 +-
 package/pkg-download.mk                       |   2 +-
 package/procs/procs.hash                      |   2 +-
 package/python-bcrypt/python-bcrypt.hash      |   2 +-
 .../python-cryptography.hash                  |   2 +-
 package/python-logbook/python-logbook.hash    |   2 +-
 package/python-maturin/python-maturin.hash    |   2 +-
 package/python-orjson/python-orjson.hash      |   2 +-
 .../python-pydantic-core.hash                 |   2 +-
 package/python-rpds-py/python-rpds-py.hash    |   2 +-
 package/python-rtoml/python-rtoml.hash        |   2 +-
 package/python-selenium/python-selenium.hash  |   2 +-
 package/ripgrep/ripgrep.hash                  |   2 +-
 package/rust-bin/rust-bin.hash                | 130 +++++++++---------
 package/rust-bin/rust-bin.mk                  |   6 +-
 package/rust-bindgen/rust-bindgen.hash        |   2 +-
 package/rust/rust.hash                        |   4 +-
 package/rust/rust.mk                          |   3 +-
 package/rustc/Config.in.host                  |   5 +
 package/sentry-cli/sentry-cli.hash            |   2 +-
 package/tbtools/tbtools.hash                  |   2 +-
 package/tealdeer/tealdeer.hash                |   2 +-
 package/uefisettings/uefisettings.hash        |   2 +-
 package/zellij/zellij.hash                    |   2 +-
 package/zoxide/zoxide.hash                    |   2 +-
 utils/update-rust                             |   1 +
 41 files changed, 114 insertions(+), 105 deletions(-)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
