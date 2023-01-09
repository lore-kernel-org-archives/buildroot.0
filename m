Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80F2C678D5
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 16:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C90F408D5;
	Mon,  9 Jan 2023 16:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C90F408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KO3wNuSXg4tT; Mon,  9 Jan 2023 16:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DF5E408E8;
	Mon,  9 Jan 2023 16:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DF5E408E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E55671BF290
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 16:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0D8060A8C
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 16:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0D8060A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ywD7krzeamtF for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 16:30:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B921607BC
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B921607BC
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 16:30:20 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso9505816wms.5
 for <buildroot@buildroot.org>; Mon, 09 Jan 2023 08:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Og+xknjxSTfw66wVJiklCUDSbXQ3shpU2H2hThi60yg=;
 b=2av1jirqmGzFqJMeFnrU8k2rORNQ8Hnk46XYo12+DlMIG59HanzoTOU51jPxp/htjF
 xGaoVhLQufvPHkyP924sMneckoFOamPfeJUAQ4OwPzGvFYG7NcKrPWnqMgizi8gbPj6e
 C/A/C27RvmnZWN8hA0zoEWJm4IN1xHC71NM+WRgG/KqPWFG3taa/JIAe0eicpebGRv3K
 piAw+08VrHayZgFlvl22dSNjKLiOCRfoFHg0vrRbT8KvF6+q/O0TLGx4PzB6s0LTEB6P
 DCYGwGmdV+v7b/mlxKGLAjtZNpWI23U3k2tqQjb3upBoejPUQzcoiy2+iJDHqtRzEhB3
 UGfA==
X-Gm-Message-State: AFqh2koaUolmvpXe3UMKJoyBZTTjgnzfzEP6cz+Jdj/jS24Vec+V5uSD
 4gzpYRC0KnSD9/dDgDs5PhulI7dZGwA=
X-Google-Smtp-Source: AMrXdXsbgRzTZMQkbOBpmlVPi5rbtMhWPK2cVWkdvwdC4i4erLRT9Msrg3dxw08Sq2pq/L8uJiLgYA==
X-Received: by 2002:a05:600c:4f11:b0:3d9:ee01:ae5b with SMTP id
 l17-20020a05600c4f1100b003d9ee01ae5bmr3757822wmq.12.1673281818585; 
 Mon, 09 Jan 2023 08:30:18 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003d23928b654sm18453546wms.11.2023.01.09.08.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 08:30:18 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 17:30:17 +0100
Message-Id: <20230109163017.1260911-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Og+xknjxSTfw66wVJiklCUDSbXQ3shpU2H2hThi60yg=;
 b=TZTB5T0PNc1KVf2VPXEhQbugDEo6HgkS6xo81D6G+3olw1nvdpJw75MVaMcn09BDE/
 MJYXp7Jo4VBiHBJ/jHJFldh/z6IRkRVNVpsgP7cloMGfiok3loPTTKvS1gQsp7gcM0J1
 hQU1phX/7QDLli82yJ+5+subIQGXi8bdsBP28Hqc8EpzZTgIxdkXg7AScIVM5jXDHqX7
 38kzvFrZr0PHjp9pUT6nca/aSWhJGqybJ2OgKQwMB8RiR9Vw9kx+9NdLCzhckJI7+wnc
 yuvQoPwvwE7/moWZRQkoptcUBSnzF2xu9YTUhU8zjUEbQc96vBgMZCk0IY0SiLzQh9+X
 +94w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TZTB5T0P
Subject: [Buildroot] [PATCH] support/download: fix cargo vendoring
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Simon Richter <simon.richter@ptwdosimetry.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit de4cf253752d (package/{rust, rust-bin}: bump to version 1.66.0)
forgot, despite the big comment above the version strings, to confirm
that the vendoring was still working.

Previously, we were adding the vendoring equivalence manually, but in
commit 04154a651729 (support/download/cargo-post-process: cargo output
for vendor config), we switched to using the output of "vargo vendor"
(on stdout) to support caxses were the vendoring equivalence would be
more complex (e.g. when using crates not hosted on crates.io).

With rust until and including 1.65.0, "cargo vendor" would output (for
crates.io crates) the same output as our manual fixups, except it was
preceded by an empty line. So, to avoid recompting all our hashes, we
added a tweak to strip away the leading empty line in 04154a651729.

But rust 1.66.0 includes [0] which changes the output (on stdout) of
"cargo vendor", where the first empty line is no longer emitted.

This means that our tweak for rust 1.65.0 now strips out an important
part of the cargo vendor output, which renders the archives invalid, and
thus generates different archives, which fail to validate against our
hashes.

Fix this by doing what the comment in the post-process helper states,
and just keep the whole output of "cargo vendor", byt just removing the
"tail --lines=+2". Since that comment is no longer meaningful, we drop
it too.

Now, all our 6 cargo-based packages can be vendored again, without
changing our hashes, but most importantly, with valid archives.

Still, we keep the comment above the versions strings, in the hope that
a future bumper will notice and be more careful at validating the
vendoring.

[0] https://github.com/rust-lang/cargo/pull/11273

Fixes:
    http://autobuild.buildroot.org/results/bea/beac7674bbc9fd2f8777b5861f65afee9c485753/  (bat)
    http://autobuild.buildroot.org/results/d1e/d1ec1ebbde115628a4b8b9099544347242a97c1c/  (dust)
    http://autobuild.buildroot.org/results/f96/f968be895be9ca98b314fdd688ef8d3bdf4e5dfb/  (hyerfine)
    http://autobuild.buildroot.org/results/a0c/a0cdb6cc9493f5248d98f98b13da854e12adc2be/  (ripgrep)
    ... and so many others...

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Simon Richter <simon.richter@ptwdosimetry.com>
---
 support/download/cargo-post-process | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 186e9eb69b..21a6be8dbe 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -25,25 +25,11 @@ post_process_unpack "${base_name}" "${output}"
 pushd "${base_name}" > /dev/null
 
 # Create the local .cargo/config with vendor info
-#
-# The first line of the output to stdout is empty.
-# So skip it to have the file start with the vendoring
-# configuration (`tail --lines=+2`).
-#
-# NOTE:
-#   There is  a patch for cargo to remove the first empty line:
-#   See: https://github.com/rust-lang/cargo/pull/11273
-#
-#   The patch already landed in +nightly and will end up
-#   in +stable soon.
-#
-# ->  When updating rust/cargo, the call to `tail` must be removed.
-#
 mkdir -p .cargo/
 cargo vendor \
     --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
     --locked VENDOR \
-    | tail --lines=+2 | tee .cargo/config
+    | tee .cargo/config
 
 popd > /dev/null
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
