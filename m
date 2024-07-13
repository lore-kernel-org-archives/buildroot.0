Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D30C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB0A80EB0;
	Sat, 13 Jul 2024 12:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIpnnyB1gN8f; Sat, 13 Jul 2024 12:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD03880EF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD03880EF5;
	Sat, 13 Jul 2024 12:24:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50A6B1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D03E400A4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOhUAWUheYML for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C35A400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C35A400DD
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C35A400DD
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:23:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-595850e7e11so3517767a12.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720873427; x=1721478227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pPdMUjQCEvOa+5RVPFYOm/tWZKSDv79MBsSeZJXtKLQ=;
 b=uvtvM/A3Ey2C6tjHorR9DKP7xRGdf23KE1METFHxnrT4Bm828Wuvc+CWA4AMNoLjhc
 W7qefb6yRT+gyROmfahUX/RWE7/psrxorQGKsp25Imrh84w5CB55ymXvQ1obbng+UmSS
 jQy5fRjE4X8anLqaiqGR5z04Jc/gooLvDp9RBB2cmH3R6TPEY+ESSWsvB2orMiJmp9YW
 0STXO9c7BdW2FH7su6MtHyicqQiRo/LysSd2XZ236GC8as2CwcQ8N3O4Z6/y9jqlSiit
 vb34jzZPcrhCJOuk5MOrfINBeWsru76QqsO2EmhIBCA2QcUYjjH40wpJeUBV47kELPl7
 CTGQ==
X-Gm-Message-State: AOJu0Yz2CSiU4EWsKLdjnrVVecyOgypS6AIXZBGB2voubsb4LtR1cWQt
 QmjdMdAmZ9QH1EnN2tXH1+XiDT/y+UK52eR0KC4tPLDhwaxgSg1hEJDg3A==
X-Google-Smtp-Source: AGHT+IFf5yH8dNqdY60rI/06X/kTQce7Z0PwbeqT6YCulO6dK9FOO74LMFdErOthFm32gvPJIHsA5Q==
X-Received: by 2002:a05:6402:51d3:b0:582:7c35:8736 with SMTP id
 4fb4d7f45d1cf-594b9ee1106mr11790439a12.12.1720873426536; 
 Sat, 13 Jul 2024 05:23:46 -0700 (PDT)
Received: from hthiery.fritz.box (ip5f5ba0e6.dynamic.kabel-deutschland.de.
 [95.91.160.230]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b26f621b8sm700586a12.85.2024.07.13.05.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 05:23:45 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org,
	Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jul 2024 14:23:28 +0200
Message-Id: <20240713122331.298786-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720873427; x=1721478227; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pPdMUjQCEvOa+5RVPFYOm/tWZKSDv79MBsSeZJXtKLQ=;
 b=XzK9yQY5qth9Ze+Qg292c+Pq1C13x2JjjGXPUVF42iMsCyWunyS9x7N0W+TuW1OGS2
 9O2Fhk3Enf3AVr0+DqQQnbHC7ic/Ag3wXDUdW2Ctpw3YPxvIaWtmNGx1/gx2kq81n7Ok
 SEoh7tJ0keQhBkVc1ueTwdnCcmYqXC4ai7aGBsxiHUQVhsnBLHCxCBdxn6SclljiKAc2
 H0M7PrNW6YiN/x2UUKaMlSsFnN3ORJxuvPW8iJsnV0mEEh3qYJTH4dxoyPQhqzhVTkFx
 N6HXSAHci4YYZuXjgkmgkcG+8LnzeSdRa94xugoTVDPqWTErStj5wWZ6xmWoshHxCI0F
 ZDPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XzK9yQY5
Subject: [Buildroot] [PATCH 0/4] package/ccache: bump version
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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

v4
    - requested changes by Arnout, see history of patches for details

Heiko Thiery (4):
  package/blake3: add new host package
  package/xxhash: add host support
  package/ccache: bump version to 4.10.1
  package/pkg-generic.mk: add variable to skip ccache dependency

 DEVELOPERS                   |  1 +
 package/blake3/blake3.hash   |  3 +++
 package/blake3/blake3.mk     | 22 ++++++++++++++++++++++
 package/ccache/ccache.hash   |  4 ++--
 package/ccache/ccache.mk     | 31 +++++++++++++++++++++----------
 package/cmake/cmake.mk       |  3 +++
 package/fakedate/fakedate.mk |  3 +++
 package/hiredis/hiredis.mk   |  3 +++
 package/lzip/lzip.mk         |  3 +++
 package/pkg-generic.mk       | 13 +++++++------
 package/pkgconf/pkgconf.mk   |  3 +++
 package/skeleton/skeleton.mk |  3 +++
 package/tar/tar.mk           |  3 +++
 package/xxhash/xxhash.mk     | 16 ++++++++++++++++
 package/xz/xz.mk             |  3 +++
 package/zstd/zstd.mk         |  3 +++
 16 files changed, 99 insertions(+), 18 deletions(-)
 create mode 100644 package/blake3/blake3.hash
 create mode 100644 package/blake3/blake3.mk

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
