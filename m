Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212A6C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 14:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E3C081307;
	Sat, 14 Jan 2023 14:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E3C081307
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56sHvwDZdqgP; Sat, 14 Jan 2023 14:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E232B812FE;
	Sat, 14 Jan 2023 14:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E232B812FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96CFD1BF316
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 14:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 728D140105
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 14:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 728D140105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzGTZeviS1fx for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 14:48:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 634CA400C4
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 634CA400C4
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 14:48:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z5so22468739wrt.6
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 06:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pw/AFNZbYp9A2i65BHLF7TrQCpswB4kWJCr9bpQkZdo=;
 b=sDIUn0Cyej8XZFLW6arTHPyG9y05AIQoDmP8iSKLBI77H2Wz7RmjFLv4c6N6Tokryu
 KeiRJKMEjpxUD4eHl6SW0YVuDfUErUYaGbyTGKKFXqXlAltDFNhd2uFuIBj2Laxhxnn6
 QIWBciwXFMdodjTp1mf1HQbt5hS9NCQUeyS2bTYRtJsORAxR4hiP1tKSPS0xbbyLQrjW
 rQ1HsbEmA+zn43ucWTAZedVP+ohmIhyoM2GAD0AQJbxafhXt5Cg4M+WZcXI2GYF7HmBB
 UaLpF2T3D4eEqnIIBmB4QQcZ2atza8ffczkDPto+NuYYzbp7oGA0R7hLe6AEvKKikJAi
 ER5w==
X-Gm-Message-State: AFqh2kp3LxCK+k92+CB38OPdNSLstMigKV4mq3EJrKwG6p71hrjF1IVX
 z761Cyk4Bdm/XBNn/ksaJNe6uVp1+Fk=
X-Google-Smtp-Source: AMrXdXv4PS0si6jGc0VCgD439BQBpbU1cMNIWKkdirybPx8LLx2umsOed6QVgdngY5dIaghNcytsgg==
X-Received: by 2002:adf:ee11:0:b0:2bc:839c:134d with SMTP id
 y17-20020adfee11000000b002bc839c134dmr13538300wrn.4.1673707734484; 
 Sat, 14 Jan 2023 06:48:54 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d6b8a000000b002425787c5easm21582059wrx.96.2023.01.14.06.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 06:48:53 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 15:48:53 +0100
Message-Id: <20230114144853.192664-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=pw/AFNZbYp9A2i65BHLF7TrQCpswB4kWJCr9bpQkZdo=;
 b=b10lVwDhiqMoC1Z2BvAkgDCAhASKSiXxlbryMEZoYuDl6Du/Uu4e9bAGWdTO/pTipm
 nvfRVb9JKgIS+Rcvy0Exk2sPz6h3M3ixKp+KHFoJTYKNkwuNgLHH49FVIEZgq1r7C9Ly
 2gXyCzCiUCnMBYQlgllgb5jJn66k8xnKCePpBn6IujsliOp63hYKBQMZdSRBx3rD98H1
 HKJFWWmdiplj91Km/QVdyYcHMoBV5c1I7zys7NVVhqbRl6+dPzfHQ+5nxQWzjdxni5D3
 ePD17jIXd2uwAYsy8KQHET7AE8v7f5Bi0d1kijSCLn20IUd+z0jACBStS2zOFY7q/y25
 TogQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b10lVwDh
Subject: [Buildroot] [PATCH] support/download: fix concurrent cargo vendor
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Moritz Bitsch <moritz@h6t.eu>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8450b7691870 (package/pkg-cargo: move CARGO_HOME into DL_DIR)
allowed for a shared cargo cache of crates. Internally, cargo is
supposed to lock themselves when accessing that cache, and that commit
even had some research in that area, pointing at [0] for complaints
about too-coarse the lock, so it was deemed safe to have a shared cargo
home.

However, in practice, the locking as implemented buy cargo, fails to
properly protect the concurrent access to the crates cache, with random
failures that manifest themselves like so:

        Blocking waiting for file lock on package cache
        Blocking waiting for file lock on package cache
     Downloading crates ...
    error: failed to sync
    Caused by:
      failed to download packages
    Caused by:
      failed to download `autocfg v1.1.0`
    Caused by:
      unable to get packages from source
    Caused by:
      failed to unpack package `autocfg v1.1.0`
    Caused by:
      failed to unpack entry at `autocfg-1.1.0/src/tests.rs`
    Caused by:
      No such file or directory (os error 2) while canonicalizing [...]

with the last few errors sometime being:

    Caused by:
      failed to parse manifest at `[...]/aho-corasick-0.7.18/Cargo.toml`
    Caused by:
      can't find library `aho_corasick`, rename file to `src/lib.rs` or specify lib.path

So, as we do not systematically use our own cargo build (we can use a
pre-built one with host-rust-bin), we can't patch cargo (even if we knew
what to do!).

Instead, we implement a lock ourselves, by wrapping the call to "cargo
vendor" with a flock(1) on cargo home.

Note: the download wrapper is already flock-ed, but it is a per-package
lock, so it does not prevent different packages from being downloaded in
parallel; if those packages need cargo vendoring, thayt wil not be
protected bu the flock on the dl wrapper. So we really do need a flock
on cargo home.

[0] https://github.com/rust-lang/cargo/issues/6930

Fixes: 8450b769187087751f83cbefcf0a88f70d9da670

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Moritz Bitsch <moritz@h6t.eu>
---
 support/download/cargo-post-process | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 21a6be8dbe..aea2d8da7a 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -26,6 +26,8 @@ pushd "${base_name}" > /dev/null
 
 # Create the local .cargo/config with vendor info
 mkdir -p .cargo/
+mkdir -p "${CARGO_HOME}"
+flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
     --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
     --locked VENDOR \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
