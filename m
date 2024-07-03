Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8C6C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3858C40372;
	Wed,  3 Jul 2024 14:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nt89OAuwv3QG; Wed,  3 Jul 2024 14:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E09440825
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E09440825;
	Wed,  3 Jul 2024 14:01:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4E711BF302
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90F13403C7
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bu-1jB8HlDN8 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 14:01:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05C6F40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05C6F40130
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05C6F40130
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 14:01:04 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a72459d8d6aso565018166b.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 07:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720015262; x=1720620062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bEzeuKEH23iJ6DEO0WIDBOb1UCtTqzlPwNAFfjHBltk=;
 b=F0h83N10m9Ger13AM2kJG0hJ76pCl4vApMmdSbR/8AVmo5EUM1EG/tbY7PIaH8HOCG
 3IgAXL4m0xGfHJgfa4sBpHpJj87sco+xK7ISxJJgnmfrmEqnPzJY5cpEMUB+QViweOLf
 /TJlrrabYzGRClXZMbFt1zVdK99/9G+XpkIJRpXKpCEJyPgw1eHTX3K6pNLI4xnDh8iF
 ypCTUoV3pG8qFXgi+APi/LXpVG6wrxvpolyuF+cnyiwg/W92uaJ5QaZ/BmIyZLhFuBDW
 zSs6D5UjsW1PjHtjXrn9mcG9JBCk+ZA5iOy+vpAz4BjBf0o2kxSfMDWKylpvP13X/KCh
 bj5A==
X-Gm-Message-State: AOJu0YwA81KypNfExnZcj+R3URX4pS8GgUoMlXb6/k4wRbjCgJNlX5q4
 +KlmslJl5waZwktRSYT9XIlZWV5kNc0Vxz6QiP26ipCGWXOFcpadwYZitA==
X-Google-Smtp-Source: AGHT+IFnlOQCs0f7nHQwr8yffbv9jxd96BNqxkJsx+GQockggm+dt3u5hq/yJFhFSsUH7x1A0hIqUA==
X-Received: by 2002:a17:906:a091:b0:a6f:49eb:31a5 with SMTP id
 a640c23a62f3a-a75144b67a4mr590606266b.77.1720015262079; 
 Wed, 03 Jul 2024 07:01:02 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a752008272esm314671766b.175.2024.07.03.07.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:01:01 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Wed,  3 Jul 2024 16:00:52 +0200
Message-Id: <20240703140054.3224869-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720015262; x=1720620062; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bEzeuKEH23iJ6DEO0WIDBOb1UCtTqzlPwNAFfjHBltk=;
 b=Hz6veAwDFQWpEL739CUQLKr2ppZpPIAj8hiGuXmSDwmvxay4pBG8V/hPfqV8Rev+0f
 qCxhWW057E7sBPtNk5/BwmEeB1Jqs07jcJ47r6zShqr097bKOvfZTJjpbRUXwhRRauVp
 nZPPQ28Xjx+j9IBYDMQ54WRjEdgq5wjo+xNGnjQVjccDNO2sKAeaK74HHv9cGdzUwvgy
 MzDFFSO/P70P5dEm48A6xgs+dWkY0HykOmeBO7D0aRP2fv4BIN7ZbzZhA6F4cjyrdqf7
 LNtHrcJkqf+Lp3hvRApyTvKRdnNsQa1X5Mel8a5s5yR3Vc+SzD4Ma5cIXTgMcjdzdm7u
 Hz5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hz6veAwD
Subject: [Buildroot] [PATCH 0/3] package/ccmake: bump version
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
