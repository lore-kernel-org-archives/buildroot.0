Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC44C31D97
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 12:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A724F408EF;
	Thu,  4 Jul 2024 12:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W01m5w94Et5d; Thu,  4 Jul 2024 12:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59B45408F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59B45408F3;
	Thu,  4 Jul 2024 12:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6EFC1BF321
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0DE684715
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehiOrmvQ_OZN for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 12:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69DED84717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69DED84717
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69DED84717
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 12:35:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a725282b926so68607166b.0
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 05:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720096512; x=1720701312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DpgECeOZ+uFXPxQSv5RK2hVolZ5cvjbSGL0mTGuKYZU=;
 b=p43Naf/QWbmUids1+8VsB17/w+KY6cBh8WTiT7xmx2IDklQv0wYDqMxkQpWpPR2xVY
 IEVUVNNYPhpkksTz3gXG3uhrru0srLHR5gmlNGJgqWD/QgTzJ2gGWt+jtCnMICJb/ftO
 pLkuXYetKhMi9rWUi42jLd7tB64e5HISk3P/HOgshawzPePjXzYk/R7RSBOOER6BzULz
 ZzX5A8TbPx4yPTy3rMuXsPg/uPQdjSRl05f1ImhLJbwvqAgL9RoTQgYRbmRgTFHXobok
 iPVZabdxpugwcv5OjGnmR8nD+lBoMuHLmj4NBfFtLHgsX3LrvlxA5ZVbaA0j0NPAoVQ/
 zDmw==
X-Gm-Message-State: AOJu0YyRZWNitSwyXJDCSXsjl9UTDTkcMnCnJh4Rso87wvUM/Udq8WA0
 AHV59JqUnpLc6RzhwiK+bnTq+I1wzHWkopGKzMyboL3gyR9YmP4dE6+FeA==
X-Google-Smtp-Source: AGHT+IEXuvYw3CnAEExEsyKW1Q6WntQ1ChIkKvRPTSOOWhAOaJ9XsLszWWhPJzCCoQlL8pRiEVF9uA==
X-Received: by 2002:a17:906:4089:b0:a72:b2a4:e1fd with SMTP id
 a640c23a62f3a-a77ba4d0498mr89473366b.45.1720096512033; 
 Thu, 04 Jul 2024 05:35:12 -0700 (PDT)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77bd30d04asm40845366b.143.2024.07.04.05.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 05:35:11 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Thu,  4 Jul 2024 14:34:50 +0200
Message-Id: <20240704123452.3535612-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720096512; x=1720701312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DpgECeOZ+uFXPxQSv5RK2hVolZ5cvjbSGL0mTGuKYZU=;
 b=cltc4oFyGoNsfncXRRU6iePqiqmX7t1CXdw20n1GG2QxRzcphoqcHyEin8zb/EusEi
 HtxhJr+tc5mbFz/F/rH4jQYZtQpEk4f7uc3svX5+ke4mba4L6tzZ6wu24bJ/75Lhp/SM
 aG72P9fPSPV9ehhN3qjWfJlfVJ7OQliSzpnx8ZUxyRFbVYBXWyiVAAf4xrgO0ha/3/fj
 +iS9Js/jGRhgAzqVYeF0Gz0U+qvgpWMRVNBZ9xoSjVWBtZt2/NsLE0p+14GJ4prOv8fO
 sdQf9dL2xM8jzcifHv1SOS27pgn6dn5yKVFzuNDfq7AA4RMsUWAlUfkRO6jO9cjJB0sy
 T3DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cltc4oFy
Subject: [Buildroot] [PATCH 0/3] package/ccache: bump version
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---- 8< ----
/tmp/ccmQFw5y.s: Assembler messages:
/tmp/ccmQFw5y.s:89386: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:89400: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:89464: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:89518: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:89525: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:123938: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:123953: Error: unsupported instruction `vmovdqu'
make[4]: *** [src/third_party/blake3/CMakeFiles/blake3.dir/build.make:160: src/third_party/blake3/CMakeFiles/blake3.dir/blake3_avx512.c.o] Error 1
make[3]: *** [CMakeFiles/Makefile2:406: src/third_party/blake3/CMakeFiles/blake3.dir/all] Error 2
---- 8< ----

To solve the problem above I started bumping the ccache package to
4.10.1. While doing this I observed the problem that ccache tries to
download xxhash by its own and fails.

---- 8< ----
-- Downloading...
   dst='/srv/storage/hthiery/buildroot-2/output/build/host-ccache-4.10.1/_deps/xxhash-subbuild/xxhash-populate-prefix/src/v0.8.2.tar.gz'
   timeout='none'
   inactivity timeout='none'
-- Using src='https://github.com/Cyan4973/xxhash/archive/refs/tags/v0.8.2.tar.gz'
CMake Error at xxhash-subbuild/xxhash-populate-prefix/src/xxhash-populate-stamp/download-xxhash-populate.cmake:170 (message):
  Each download failed!

    error: downloading 'https://github.com/Cyan4973/xxhash/archive/refs/tags/v0.8.2.tar.gz' failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported or disabled in libcurl
  Closing connection
          --- LOG END ---
---- 8< ----

So I added support for the host package of xxhash and added this to
the ccache dependencies.

In addition the bundled blake3 version seems not to build correctly on
all machines. See the first error about 'unsupported instruction'.
Therefore the new host package for blake3 is introduced.


v2:
    - change subject (fixed naming from ccmake to ccache)

v3:
    - fix legal-info for ccache and blake3

Heiko Thiery (3):
  package/blake3: add new host package
  package/xxhash: add host support
  package/ccache: bump version to 4.10.1

 package/blake3/blake3.hash |  6 ++++++
 package/blake3/blake3.mk   | 22 ++++++++++++++++++++++
 package/ccache/ccache.hash |  2 +-
 package/ccache/ccache.mk   | 16 ++++++++--------
 package/pkg-generic.mk     |  2 +-
 package/xxhash/xxhash.mk   | 18 ++++++++++++++++++
 6 files changed, 56 insertions(+), 10 deletions(-)
 create mode 100644 package/blake3/blake3.hash
 create mode 100644 package/blake3/blake3.mk

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
