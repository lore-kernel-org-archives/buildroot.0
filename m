Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB3C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 06:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D945640364;
	Thu,  4 Jul 2024 06:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZV0nxR_MQOx; Thu,  4 Jul 2024 06:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8057340412
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8057340412;
	Thu,  4 Jul 2024 06:43:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A719F1BF391
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 940D940412
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vAWw1IQjfYi for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 06:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E6E040364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E6E040364
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E6E040364
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 06:43:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57d06101d76so311211a12.3
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 23:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720075414; x=1720680214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VHbyNZ27QTnxboi9F3SyCgYC7AlRZFyw+1sVwv0OQfQ=;
 b=IVY1umc6SlfGoNJ9UTGIaQ1Ohj3fGwKPFej/6/PTVee0l7Udk8mYMRsfy+hHd6Nbcl
 BG886PkIOSDAtY2oCQPPPvLV/BQHbS17Tw0W7ZDkb7X4zRb3HSEFm1li1buJtcfH7cd4
 mStJZqScG3Gj4kEZRk1u4ntnMxhByktYqaVQmLA6SctbuLIcxofKgmlBFZPiXd3XdJrH
 eIu0AitQhG+2BFY0/0pFfh9NSAz6mrg9SQncJRe05LOLtVLLF2XwNinTFXSy1/PezEjq
 W5mm1/Qurp/+w7soXziPWPR4r4/6QPaVAHX64IqSB8qqMHceR9ikyShlVaG18vez0fNt
 GKpw==
X-Gm-Message-State: AOJu0YzOE/185iKEo3JMe9n0DDM1dP6Nv8wsM7TlBvhpF/o0hJtUrLM0
 QEyPosoMZJ/hn0RwxJsm1T2QIB3BSNE4+ypHigtif4TlwbNWvz+hJMD12A==
X-Google-Smtp-Source: AGHT+IHk6enB4bO2aU9Uha9NNexrOrzFv1H/w1IZUJIj9UPIQWXuBIQdpTv4ZkKA2mNUvGqgiwjKCg==
X-Received: by 2002:a05:6402:2353:b0:58d:c542:2500 with SMTP id
 4fb4d7f45d1cf-58e5955663dmr575086a12.10.1720075413647; 
 Wed, 03 Jul 2024 23:43:33 -0700 (PDT)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324dfaasm8252620a12.32.2024.07.03.23.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 23:43:33 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Thu,  4 Jul 2024 08:43:20 +0200
Message-Id: <20240704064322.3242095-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720075414; x=1720680214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VHbyNZ27QTnxboi9F3SyCgYC7AlRZFyw+1sVwv0OQfQ=;
 b=CgMn0YrzK0AnNd6M4Rd4aZ3YXkeE788wyqPprTzbvrs6dYZItHQ7znIwdrBYZeLOlP
 e2esiZssOgGjqI4hxNUPh7D0BYCkefC03eKikCntTAfofXhUYqumNFa5dSdIXmfBYc+P
 IpwRQWss26H4hO5TefWIrf2Ehdf64b67P3SRUvRikLFwkMpV6BkSUiZjMu2CXBAcSCLG
 BlMNQKGDb7Yuw/iL6YD9AVUMinx27xhdbp0/uuP0q0JJg8fWVw0JiClPwd8okTJ9y00i
 PuYt9mifKIfVTLQwDUySFtFIm07OZQQ4/Pj4BAm7PMW7KPR58LtH4PnnFSlyL2RP6LLR
 boZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CgMn0Yrz
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
