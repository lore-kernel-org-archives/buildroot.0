Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB85AC5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 06:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53E4360625;
	Mon, 24 Aug 2026 06:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQWIxGa2-BJZ; Mon, 24 Aug 2026 06:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787553536;
	bh=EJddFW3pJRcj73/XUXfRSWtXTzip2aRl1sdB5BAvaFk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RVYeETzIt4PCGcoQ9+8vE55EfXIUIkwqE6he9CjUCD2j+td4xS1we2sARojc7T7Hp
	 hSB3871LfnRjrhSzsZBBgcco6szQyXXO6N6NmZWpJyvJ6+ssIB7ySiqI7mqtK9T4KS
	 DMSEy0k2S/ILc+fRzH2SixSw9qL993P+ZCYJ9nYEUI0KfEqFLHvSnI0RVh263oIwI3
	 WKaCF7oL4cclYcb+0UQyBdPzqOgTgOn70aaXcspuvSbNaaawrDOzlmuyFRY5kyJkoh
	 YZlBwukFHyw3oUEhX6acwLvcm8PNgPq2dG4bzaapgQpIBD2zNHL5/CtK9LsKkX1g/3
	 AIY+aIR8K5IHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 133CE60624;
	Mon, 24 Aug 2026 06:38:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F49B386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A9AD80B5C
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RH0qVweskFaa for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 06:38:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MPfQSg2W
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 374DE80B5F
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:52 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c2055f5a993so345502866b.2
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1787553531; x=1788158331;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aj5AQUmKN8uDLIH8Ju3LsTAI1iFg9MZ7v0Mos97dY0A=;
 b=MPfQSg2WNRi7D7qB5FBXusiKCBWkDuFHHDBbzzjacFvYNGAYjZSZyCMha08W3GUgVd
 0e8AtoTNTU6Dd5QhrGaNwDs24POyYZQJ1OOfKsiXK8PnTOW5wT3V+4nKvyysVtAMNQXj
 YAt8rUGHnddPZQHWWx0a/GfNVSq52i7Jjun3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787553531; x=1788158331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aj5AQUmKN8uDLIH8Ju3LsTAI1iFg9MZ7v0Mos97dY0A=;
 b=E7DMJ8G2ncNk6RgJQqP72V+VhDaCJNuGhjVEDytxj+ihEAmkDjVEYbO377krpuveHQ
 M02n/ltgZ2qQgD1GoYQw1L4+pbMECwGyyMzE03IzFD7UBXIrJcZ+L1l2L31DINj8zqkN
 EueKnyTrNdD+Ya7ah9N+qkvevI7cmmt4tlLCXtR6E0v5Nb508PIlrY2WKcEgqhrWqQUv
 OkvdtS+wrN1EF5Z05b6byLitpuMv4m30iK1WDE2kwvVphEhDzYcDnxFzsaMmKDrEBjAE
 6iX8OUtcOxc1tuOT6jnHMqG9I0BfAfqO5IpRdcr6wdyZHSQmI/ukndLXsSGi7b5V7ui3
 azCw==
X-Gm-Message-State: AFuF++nzkadQK7qWYtLzp4eNowBYdSLuF2xD9IvY0ErVM0bkLFUF6L4M
 1CBEQ5neGRJDa50URHvmMvNnjec0kbPEnaq1sPv825Ik2jupxcIcyM9TtNamKNBGErncQSnDmH4
 ZlXSBCH8=
X-Gm-Gg: AR+sD135RfuxjhUHfB6/gwqFWgyTVmxSZDZ+tDelJ38yQWMeD/g/SD6EvQBON5BU2t+
 2aOIqhz75MgyWJ+KAN9GRskIOq6cXZspgYnunikUc7JAqEg7O66RsHuQ3So8TbarKkRiuRez+ep
 Xm/oDY4HVcvorN2ddUHL+FyORob8TOvmHxDGh4hbbfbNqzIvUndldq54dAZPfIgU4glKmfcCjA7
 KlkrEK3URO2lX0jqjTi0B2WGkknRhHqGsbfIdS/8pzBTv/O4ngMXHLhcTj466gr+aKq6aJLSvr3
 RmijVxnJ2CgFvmMUeyyrkYt5+rCCFowehfj5cqMmNeV6VoFi8SwlzsTR36LjA1eC4cq4+uU9Zlu
 /MPYgKOy9SoE1+VgDBT6KThu1LFLfr4biG4QUqmuwFi9rlFq3hi+Ssn9Bd0PcNAz3Ec++6D9xZ7
 /+2a+bIKiuOfb+RFBQVWSW0BHzKNzkkR7ceEZGdvC/cpUZoAJSJP0Arn4fYtgouuZIptAWnGN1Q
 wRpsMFvzX2BcNtX0yswvaMQ+D1sr7inTf6pvch3aK0uYxEEsPOAF+fHNLfBj61tu3PVCYzldd8U
 8rSkPevvvFNICWAwUFv43dkxkPA+uTbSOMRpJlmbTwjD/6UdCcOgWCVH88JRqg==
X-Received: by 2002:a17:907:d08c:b0:c16:8931:245c with SMTP id
 a640c23a62f3a-c246a72fdcdmr2824365066b.21.1787553530718; 
 Sun, 23 Aug 2026 23:38:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249685ef7bsm1226186766b.52.2026.08.23.23.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 23:38:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Fischer <mf@go-sys.de>
Date: Mon, 24 Aug 2026 08:38:39 +0200
Message-ID: <20260824063843.839745-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
References: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 2/6] package/sdl3: disable m68k builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SDL_alignment_test has a static assertion to ensure that its size is
2 * sizeof(void *), as SDL relies on this layout for its ABI.

Testing the SDL3 package by running:

  $ utils/test-pkg -p sdl3 -T bootlin-m68k-68040-uclibc

raised the following error:

  In file included from src/libm/k_sin.c:1:
  include/SDL3/SDL_stdinc.h:230:42: error: static assertion failed: "sizeof(SDL_alignment_test) == (2 * sizeof(void *))"
    230 | #define SDL_COMPILE_TIME_ASSERT(name, x) _Static_assert(x, #x)
        |                                          ^~~~~~~~~~~~~~
  include/SDL3/SDL_stdinc.h:1187:1: note: in expansion of macro 'SDL_COMPILE_TIME_ASSERT'
   1187 | SDL_COMPILE_TIME_ASSERT(struct_alignment, sizeof(SDL_alignment_test) == (2 * sizeof(void *)));

Since the m68k ABI results in a different structure size, disable m68k
builds.

Fixes: 2dd13e328f11 ("package/sdl3: new package")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/sdl3/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/sdl3/Config.in b/package/sdl3/Config.in
index 7bce4ceaba9c..f5ba8b6a016b 100644
--- a/package/sdl3/Config.in
+++ b/package/sdl3/Config.in
@@ -1,5 +1,12 @@
+config BR2_PACKAGE_SDL3_ARCH_SUPPORTS
+	bool
+	default y
+	# Invalid size of the SDL_alignment_test struct on m68k
+	depends on !BR2_m68k
+
 config BR2_PACKAGE_SDL3
 	bool "sdl3"
+	depends on BR2_PACKAGE_SDL3_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -78,4 +85,5 @@ comment "OpenGL ES support needs an OpenGL ES provider"
 endif
 
 comment "sdl3 needs a toolchain w/ dynamic library, threads, wchar"
+	depends on BR2_PACKAGE_SDL3_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
