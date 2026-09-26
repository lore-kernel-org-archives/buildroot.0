Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2805FC98338
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 13:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABFF040A60;
	Sat, 26 Sep 2026 13:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGKJ-yjI_B9H; Sat, 26 Sep 2026 13:37:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9DB9740A61
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790429822;
	b=nREAORvXy/GSGSp+9FfA0emaYeP5WTAjjUdwDmAdMiUA1qfMdjih0ko/bRITKRQETYal
	 7QKz1tj3V61mKHbyDcA8Rvaxwr362aQEGYcqtr//yM9YlwWP8UW6/W8/wFB/gFh2cafQ7
	 u1lJE+v82bD60EIjcU1sVTgMteiHtpNIBq6sVkT5HwfIKOqLOQuCjWTxThRnyCHgPr9fg
	 G4i7d9HrC3KmfULTPnsurrfWzuesHbraBfFztO2FXj42Tr20xzLMD3qE6K+I5FR6qhVH9
	 qJFb4V5aSBVSI65WdzFtqbrPdY9A+myPC4+Iw2Oqk1O68drwE8pqLEYHKsVgmtflZXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790429822;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Yy0y0QKTDxkfdS3XyNJk6Xmuv8QGZQFtBxEUjv/fN+o=;
	b=KR2SR0/NiBMTT8iztXZOLn85hPSwaWVqUSHAZePEdYWhSf0x+3rU+eYrwvTIXG1r/x7d
	 og1bvm80rz1/ZzkJ21ERnmFsd60JbGtZ3yJYSLBoXYb9bRbxMBPMSwIgytxDUKzTXhmvC
	 fxKt8/KljUHUVdVDRlt1V4DdwlYr5ihzxX9UgxZi7VVaSaBX4zUhEEHX1J5N5tMBnrgnH
	 8bGKuqpS713RQSfXC4TcEd/xJE05/MlXbwgxf5WeJvFmVZlwChMFjF/V9hWg87Th4bIoy
	 +6m50Ef0qxml3tXgG92h0xnpAnBi4GB65HVCy+BV93/YGrfDSwlGoOr/bP5IORIFjxg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790429822;
	bh=Yy0y0QKTDxkfdS3XyNJk6Xmuv8QGZQFtBxEUjv/fN+o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=JDZT/VwV48TKCfiyV8Du+JXONqVHV1OnHO81ZjDKO5DfCzmtgfxoIgMQkhZQhSJD1
	 a4kbJvPpQeQSBiE4SjT0I4K3vaWhcqxEgindNN3aqOn+G9s89DYOIawa5cpOAFn45n
	 R+6Vas0C2aRCEkToUBzQwVBhZBqhB2YZSaV01QzP2E+92xpZ++LYRjubIXHbpMsu35
	 ZcoCnQ5Nbk8O5sfqU2S8d2+9t3iSZEKlkFPx2ZiOKJBdwMF51My/f1+aosXqrH8EcV
	 +nMaiObc+P9WmqFbWIlmoj1xTqBHroEJ0IF89qP8rZn732xqTytBcWw92Tl/3OYDgP
	 Xlr+9fgauQZbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB9740A61;
	Sat, 26 Sep 2026 13:37:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B22DB335
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 13:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A34E981248
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 13:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNCwVzuALLC3 for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 13:36:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3EB7681246
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790429819;
 b=KwYNzo1LvAbkoZ3mfPB3ch3I6PHfD0rykT2vgyLm1OSrMKR8UPw0NMuGweZAwN140KGZ
 INDvZrRyZe2ID6BQxtzyoq15fylYrykrEZusAI1N7Tpg/vANf6DJivgAkbzZha2TbM/o5
 LKGaed8vWiqwxpwFaXwKeooerXzIweSsWvKZbvJYsoSxSNcsVA0s8jqJyX3S3REqIaCDe
 S6Kz+7Rx35Gg/yQdWA0C/xKL5Qr5o/UefXz2b8bVu5ysxIm92swQLSwajmFvOnkUWmeIL
 ZGcWdJvI5ppSn1ioNH7BjyNJxV7TIeL+pao1TGDykurK6zLWKSoayGVVzr63zSIpoAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790429819;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=HUYDm8TOB6kR7J8B3S8U8iQUxTCGLjE+lnkmhIVsMjg=;
 b=kzJOgr8uUqh276MYd1XYzTBHz1tm5IGAU1FFZFLAs1UZRhHVrqAS6pvltXXrVXrtJ/VT
 yOWXHUmdPhgtOoprrd1m4I0YIeLDuGfAu0z3MNr+HkzTRdrZgabz+QQvxdKr84E6jDIXG
 FLPUqD2VGs++5vkgkHYBeZaGLoLrirt0/tXx7WM9j1rvnmYBdtTVOBoAyMDWIYuX/bCF1
 eIiFyEMKMwU679LM1tba0ZVXxWtUQhzSnI8Q69yDo3Gb0n0Mvv+F5DJDOXxtnmF/ZXKPy
 D8vF6Qf8pedPi34raRDccp447NHK6gv699zWqX+M6L3Ecpv2tZZmQ/2yJZPDGWvHHWw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=B+xv2oec; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::f;
 helo=mail-ed2-x0f.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ed2-x0f.google.com (mail-ed2-x0f.google.com
 [IPv6:2a00:1450:4864:33::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EB7681246
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 13:36:58 +0000 (UTC)
Received: by mail-ed2-x0f.google.com with SMTP id
 4fb4d7f45d1cf-6aa1d00daaaso2991768a12.1
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 06:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790429817; x=1791034617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HUYDm8TOB6kR7J8B3S8U8iQUxTCGLjE+lnkmhIVsMjg=;
 b=z5qGjdFxR7QmNkQIWtgi49UZomlwAMSh1jG964NVZPZsLzscS4QGS6NvCk/3hDZGp8
 Oo6nvW/R7Hh1htwAqZw64MQOj+Zsr7RLBvjpd4HN347aXt6loAV88I1kl9ITbfsmnVTR
 aimalxEn4NXgGxU9zRYfTTBDDyLo5eQCB8P7Nut+hQh6YvJ09tHKlC0x1iZokQ+MbVVv
 69RDjkfNhab8Zvli9gVxzHt8UFIt7TDRN+VK9tcgWwyX6MnuqGO/uD3iqiuL1gSQI0+7
 RRbwOpy9c2deGOzl+NAzjYImRRP0zyxZutEJw9YH2U/9976SY+8H0DqGcEd7bRhFJxMv
 kBhw==
X-Gm-Message-State: AFuF++l10wb1WCKmyNmYgetuFVI29N4Qq55otAuGHdZHunRM/mVl7+XG
 vCfwOhFxIQG+7ChOM6WIh2ZwpiyosvRtJrxfBVdDjAhIfG/b82qIcKwD0owNJQ==
X-Gm-Gg: AYBFou3v4gWtEJpTZymlpDPc3XcB738Oc2u42Hc9kkkWC74sV1kuFVpuQBaF0AXGESI
 LTI5qcs6XTtXdRdcfjxKWJWkm7IKlWMMy1YZpgeQEGcCz+jlMXeLaEzOhZZMAOpwev9kY0s2kU9
 8Dx3kR4VRYRSb7lsLHFBkbEa/yu+joI+YkOTV0zPArgLasu1Vknogst6U1tF/O0+EI6aBMzkDHl
 NjLywUZcAljNmVYun1h3Na4QpCzk172h0QHiYQfSbkNqpyZzzTLGwF736rfV6KrnstrMUw4vKmh
 sqBpqdVeBaZSOEv0QgIaEla8HK2ZojK7uCaJ/Td6U6sIaWuGTk2y0dlNWZHvWezA5Y9OfYdJiGv
 5rrsraP4NywnqopdNemTztn5b5VQPRIsLyxtUdmqQ5ota2AG2k6Gj7BRZhqS6YqjtAz9J1wWP+s
 3nT9HGhvBBBnDv2PzTdAidEG/eklQi9I3X54ZLgEtOnlTf9DEq8mvaZUG1fh376VZheAcKtNP/u
 MSTs6iATrg3fmZ5T6aNan/f24C84AMY9+LElqo1uMv2To53lRMLhA==
X-Received: by 2002:a05:6402:1f04:b0:6a9:dc6a:689c with SMTP id
 4fb4d7f45d1cf-6aac8f54606mr7606743a12.22.1790429816350; 
 Sat, 26 Sep 2026 06:36:56 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aae5e106c7sm2211780a12.29.2026.09.26.06.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 06:36:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 26 Sep 2026 15:36:54 +0200
Message-Id: <20260926133654.2836794-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libmicrohttpd: fix build without thread
 support
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an upstream-submitted patch that moves connection_get_wait() out
of the threads-only region, as MHD_get_timeout64() calls it
unconditionally. Without it the build fails with
--with-threads=none:

daemon.c:4524:18: error: implicit declaration of function 'connection_get_wait' [-Wimplicit-function-declaration]

Fixes:
https://autobuild.buildroot.org/results/10f33829552059264104623353a9ec1584b08e4f

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...t-thread-support-connection_get_wait.patch | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch

diff --git a/package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch b/package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch
new file mode 100644
index 0000000000..d7f93f57f3
--- /dev/null
+++ b/package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch
@@ -0,0 +1,145 @@
+From b9da2097d719dbd125849f2e344d0a7d80b56da6 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 26 Sep 2026 12:08:52 +0200
+Subject: [PATCH] fix build without thread support: connection_get_wait() must
+ be unconditional
+
+connection_get_wait() was defined inside the
+"#if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)"
+region, but MHD_get_timeout64(), which is compiled unconditionally,
+calls it.  When MHD is configured with --with-threads=none the
+definition is not compiled and the build fails:
+
+  daemon.c: In function 'MHD_get_timeout64':
+  daemon.c:4524:18: error: implicit declaration of function
+    'connection_get_wait' [-Wimplicit-function-declaration]
+
+Move the function above the threads-only region.  Pure code motion,
+no functional change; the two thread-only call sites in
+thread_main_handle_connection() still follow the definition.
+
+Found while cross-compiling for a Buildroot mips64el/uClibc toolchain
+without thread support (--with-threads=none).
+
+Upstream: https://lists.gnu.org/archive/html/libmicrohttpd/2026-08/msg00002.html
+Assisted-by: Claude:claude-opus-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/microhttpd/daemon.c | 97 +++++++++++++++++++++--------------------
+ 1 file changed, 49 insertions(+), 48 deletions(-)
+
+diff --git a/src/microhttpd/daemon.c b/src/microhttpd/daemon.c
+index b42d4ee..081d9a6 100644
+--- a/src/microhttpd/daemon.c
++++ b/src/microhttpd/daemon.c
+@@ -1847,6 +1847,55 @@ process_urh (struct MHD_UpgradeResponseHandle *urh)
+ 
+ #endif /* HTTPS_SUPPORT  && UPGRADE_SUPPORT */
+ 
++
++/**
++ * Get maximum wait period for the connection (the amount of time left before
++ * connection time out)
++ * @param c the connection to check
++ * @return the maximum number of millisecond before the connection must be
++ *         processed again.
++ */
++static uint64_t
++connection_get_wait (struct MHD_Connection *c)
++{
++  const uint64_t now = MHD_monotonic_msec_counter ();
++  const uint64_t since_actv = now - c->last_activity;
++  const uint64_t timeout = c->connection_timeout_ms;
++  uint64_t mseconds_left;
++
++  mhd_assert (0 != timeout);
++  /* Keep the next lines in sync with #connection_check_timedout() to avoid
++   * undesired side-effects like busy-waiting. */
++  if (timeout < since_actv)
++  {
++    if (UINT64_MAX / 2 < since_actv)
++    {
++      const uint64_t jump_back = c->last_activity - now;
++      /* Very unlikely that it is more than quarter-million years pause.
++       * More likely that system clock jumps back. */
++      if (5000 >= jump_back)
++      { /* Jump back is less than 5 seconds, try to recover. */
++        return 100; /* Set wait time to 0.1 seconds */
++      }
++      /* Too large jump back */
++    }
++    return 0; /* Connection has timed out */
++  }
++  else if (since_actv == timeout)
++  {
++    /* Exact match for timeout and time from last activity.
++     * Maybe this is just a precise match or this happens because the timer
++     * resolution is too low.
++     * Set wait time to 0.1 seconds to avoid busy-waiting with low
++     * timer resolution as connection is not timed-out yet. */
++    return 100;
++  }
++  mseconds_left = timeout - since_actv;
++
++  return mseconds_left;
++}
++
++
+ #if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)
+ #ifdef UPGRADE_SUPPORT
+ /**
+@@ -2009,54 +2058,6 @@ thread_main_connection_upgrade (struct MHD_Connection *con)
+ #endif /* UPGRADE_SUPPORT */
+ 
+ 
+-/**
+- * Get maximum wait period for the connection (the amount of time left before
+- * connection time out)
+- * @param c the connection to check
+- * @return the maximum number of millisecond before the connection must be
+- *         processed again.
+- */
+-static uint64_t
+-connection_get_wait (struct MHD_Connection *c)
+-{
+-  const uint64_t now = MHD_monotonic_msec_counter ();
+-  const uint64_t since_actv = now - c->last_activity;
+-  const uint64_t timeout = c->connection_timeout_ms;
+-  uint64_t mseconds_left;
+-
+-  mhd_assert (0 != timeout);
+-  /* Keep the next lines in sync with #connection_check_timedout() to avoid
+-   * undesired side-effects like busy-waiting. */
+-  if (timeout < since_actv)
+-  {
+-    if (UINT64_MAX / 2 < since_actv)
+-    {
+-      const uint64_t jump_back = c->last_activity - now;
+-      /* Very unlikely that it is more than quarter-million years pause.
+-       * More likely that system clock jumps back. */
+-      if (5000 >= jump_back)
+-      { /* Jump back is less than 5 seconds, try to recover. */
+-        return 100; /* Set wait time to 0.1 seconds */
+-      }
+-      /* Too large jump back */
+-    }
+-    return 0; /* Connection has timed out */
+-  }
+-  else if (since_actv == timeout)
+-  {
+-    /* Exact match for timeout and time from last activity.
+-     * Maybe this is just a precise match or this happens because the timer
+-     * resolution is too low.
+-     * Set wait time to 0.1 seconds to avoid busy-waiting with low
+-     * timer resolution as connection is not timed-out yet. */
+-    return 100;
+-  }
+-  mseconds_left = timeout - since_actv;
+-
+-  return mseconds_left;
+-}
+-
+-
+ /**
+  * Complete the resume of a connection that has its own thread.
+  *
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
