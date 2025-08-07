Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AC4C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F019440553;
	Thu,  7 Aug 2025 18:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z91aejHeg2cm; Thu,  7 Aug 2025 18:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABC8840589
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABC8840589;
	Thu,  7 Aug 2025 18:25:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FA4A10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6405A80E57
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xK4enhHpq43 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8192A80E19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8192A80E19
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8192A80E19
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b782cca9a0so760164f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591084; x=1755195884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SUkptzVJXWtxvTkUOSvNVLXj145KT29ucGBb1QPTCFQ=;
 b=gywBV3acERCegg+WASQ+6lcJqpbSY583Qfz5yfs7P9ysbjc1lV8+sIhaAL9Q250s5s
 UuZiaJqeZrhTAOeXWjW+Ji19cpLFsGCSWT1zd3TrfM1+4enrBoKANyAk17T6nrPhzovW
 XPZxZKxkAcnwHwmsFKuYpBEUdTIU8ZcZMXF+8RHpN0uP5jejMkKxDopbPTFUv+QbttIh
 tpZX6vI6vlHflp5RBWMLsGEARxvUQxp7Kr2svf3dHrE4ZX+8LMIfr/bcOvb7Se9iFQ/b
 dpOOixe1ectSZOmRuP1bshR8LALTzNkFG5zH559YuEIL0s1+D6D+gfJid4qZHrx9ZpWI
 6Y2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXbvQQGWn0jS9h/xofhtWgFKkTzyzVCG11B1unHLSVtIxGroRE9w5Am1ESxl9s1cPKeE+n/vKftw4=@buildroot.org
X-Gm-Message-State: AOJu0YzA5BPonvpsgPzM6x0S07R6cl4buZAkiMDWMXcQe3lsENXncKdf
 MA4PlESs8p4JxHwRBWfCcoK3QB3HQIVFjpR7AN1L2IjqkyGlnxJv958qKyiOmeSOLw0=
X-Gm-Gg: ASbGncuJix7wi5/7PTX7PCMuDMRDt1GZmvtsIIYUqMSreVdMEZN9emQKafpCSvQ0VWn
 HpRfshsAVpxSrc2IvDRnxAfO/x4l/t2Pe1Xxq0UeCFF1X2QFA4Aqmq8Dw368LGCYXskDH338InX
 rxzysV/ESjXaE2EqTtI5BianknoNw9RiAbQ49NUiSTnyStlfMzzHbWydXsij/l5XAbMuR6u6T/C
 mLCgiLwwH02it1Zb+s8BXyMGkiqSF87bE264wxvAyTHNOwtmdJlxMLC0SsgSeidPwBsWUQRR7qY
 ZXyTtbIRVAaynQCoEIrcGvSgCJX6PG0/F340etdpwQ0WiT0vMiVsIifQs230o1fnRX8M4KC4IhI
 U21+ncQhTJwlc6A==
X-Google-Smtp-Source: AGHT+IEMA56tK5X9D9Hn1YD1ZmgaTyhXLIeqclbAmw/6Gth6nFcxbIgHPQavS16HmIqRQNIrQl02Dg==
X-Received: by 2002:a05:6000:1acf:b0:3b7:889e:2b2b with SMTP id
 ffacd0b85a97d-3b900b55feemr195120f8f.47.1754591084483; 
 Thu, 07 Aug 2025 11:24:44 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c47c516sm27859223f8f.62.2025.08.07.11.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:44 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:43 +0200
Message-ID: <20250807182443.726170-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728212614.37531-1-petr.vorel@gmail.com>
References: <20250728212614.37531-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591084; x=1755195884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUkptzVJXWtxvTkUOSvNVLXj145KT29ucGBb1QPTCFQ=;
 b=ZoPzi+g2H1I0OtafF/odTE0bphO0gFxE3vR79Trvt+AOvAosO35sBib3NKZGLMSNwt
 ldnO5s1bePU5oazwanmemmUtK/9f9J7Tg6704DnLSr7Xlffb3HXco1QSicPzk61FRPvg
 FpoEwB4ScU6GUSU2velKL5P370Z8TgbkNkLLoFbpAesS7S4BxcAvGnsF6EZUsNq2GhUr
 UHcrIOGX0UpPimprLhE3hKVqW32Cl1ot2OB/SFcqOzVlnn94Idv1KjCZuMI+pQT7itoy
 aqM9ngT/wAEwgeb89UPglwBy6ka5XARCyE50L/KdRS3v3/8GnGnnf0KmsbJ4gmRX4Ti/
 Dbgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZoPzi+g2
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: Fix uclibc-ng
 build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Backport upstream fix.
> 
> Fixes:
> https://autobuild.buildroot.org/results/f3e/f3e03b9a1a69988d6497f36c9d64a37a66e9ad20/
> https://autobuild.buildroot.org/results/856/856365f467efc449faee1951250e63d8d4442bbc/
> https://autobuild.buildroot.org/results/2ac/2ac08cecd6a505f1bac1a673efc280b3a8dcb23a/
> https://autobuild.buildroot.org/results/59b/59b3ad33667b7e87c81e49dd434d5f494e189e0d/
> https://autobuild.buildroot.org/results/b1a/b1a36f9971c97300670d8d772ace11e5fedceaaa/
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../0003-tlibio-Detect-aio.h-support.patch    | 342 ++++++++++++++++++
>  1 file changed, 342 insertions(+)
>  create mode 100644 package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch
> 
> diff --git a/package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch b/package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch
> new file mode 100644
> index 0000000000..442e2fd96b
> --- /dev/null
> +++ b/package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch
> @@ -0,0 +1,342 @@
> +From 91e6272febf95e19a8300695dfc2089569adf9d8 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <petr.vorel@gmail.com>
> +Date: Sun, 27 Jul 2025 22:54:54 +0200
> +Subject: [PATCH] tlibio: Detect <aio.h> support
> +
> +Some libc (i.e. uclibc-ng or uclibc) does not implement <aio.h>.
> +Requiring it for the core LTP library breaks build of these libc.
> +Restore unintentional removal in fed3e3ee63.
> +
> +Changes:
> +* Fix for all libc without <aio.h> support: previous check
> +  'defined(__linux__) && !defined(__UCLIBC__)' was uclibc-ng specific
> +  (and check for __linux__ was not needed anyway). All of these used
> +  prior fed3e3ee63 is replaced just by HAVE_AIO_H.
> +* Comment out also if block first and last 'line if (...) {' and '}' if
> +  the block would be empty anyway.
> +* Further join preprocessor checks as code prior fed3e3ee63 contained
> +  code compiled for old unixes (e.g. sgi), which fed3e3ee63 removed.
> +* Remove nested preprocessors checks in code which is already checked
> +  (i.e. lio_wait4asyncio()).
> +* Fix wrong #endif comments.
> +* Add further cleanup of old unixes.
> +
> +I also wonder if #else part of struct lio_info_type Lio_info1[]
> +should be really defined for code without <aio.h>.
> +
> +Fixes: fed3e3ee63 ("lib/tlibio: Get rid of support for old UNIXes")
> +Fixes: https://autobuild.buildroot.org/results/f3e/f3e03b9a1a69988d6497f36c9d64a37a66e9ad20/
> +Fixes: https://autobuild.buildroot.org/results/856/856365f467efc449faee1951250e63d8d4442bbc/
> +Fixes: https://autobuild.buildroot.org/results/2ac/2ac08cecd6a505f1bac1a673efc280b3a8dcb23a/
> +Fixes: https://autobuild.buildroot.org/results/59b/59b3ad33667b7e87c81e49dd434d5f494e189e0d/
> +Fixes: https://autobuild.buildroot.org/results/b1a/b1a36f9971c97300670d8d772ace11e5fedceaaa/
> +Reviewed-by: Li Wang <liwang@redhat.com>
> +Acked-by: Cyril Hrubis <chrubis@suse.cz>
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +Upstream: https://github.com/linux-test-project/ltp/commit/91e6272febf95e19a8300695dfc2089569adf9d8
> +---
> + configure.ac |  1 +
> + lib/tlibio.c | 52 +++++++++++++++++++++++++++++++++++++++++++---------
> + 2 files changed, 44 insertions(+), 9 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 8ec37639c1..12025be51c 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -48,6 +48,7 @@ AC_CHECK_DECLS([PR_CAPBSET_DROP, PR_CAPBSET_READ],,,[#include <sys/prctl.h>])
> + AC_CHECK_DECLS([SEM_STAT_ANY],,,[#include <sys/sem.h>])
> + 
> + AC_CHECK_HEADERS_ONCE([ \
> ++    aio.h \
> +     asm/ldt.h \
> +     asm/prctl.h \
> +     cpuid.h \
> +diff --git a/lib/tlibio.c b/lib/tlibio.c
> +index b877393df2..70e0c6f7d2 100644
> +--- a/lib/tlibio.c
> ++++ b/lib/tlibio.c
> +@@ -88,7 +88,9 @@
> + #include <stdint.h>
> + #include <sys/uio.h>		/* readv(2)/writev(2) */
> + #include <string.h>
> +-#include <aio.h>
> ++#ifdef HAVE_AIO_H
> ++# include <aio.h>
> ++#endif
> + #include <stdlib.h>		/* atoi, abs */
> + 
> + #include "tlibio.h"		/* defines LIO* macros */
> +@@ -108,7 +110,7 @@ struct lio_info_type Lio_info1[] = {
> + 	{"b", LIO_IO_ASYNC | LIO_WAIT_SIGPAUSE, "async i/o using pause"},
> + 	{"a", LIO_IO_ASYNC | LIO_WAIT_RECALL,
> + 	 "async i/o using recall/aio_suspend"},
> +-#if defined(sgi) || (defined(__linux__) && !defined(__UCLIBC__))
> ++#ifdef HAVE_AIO_H
> + 	{"r",
> + 	 LIO_RANDOM | LIO_IO_TYPES | LIO_WAIT_TYPES,
> + 	 "random sync i/o types and wait methods"},
> +@@ -159,7 +161,7 @@ char Lio_SysCall[PATH_MAX];	/* string containing last i/o system call */
> + 
> + static volatile int Received_signal = 0;	/* number of signals received */
> + static volatile int Rec_signal;
> +-#if defined(sgi) || (defined(__linux__) && !defined(__UCLIBC__))
> ++#ifdef HAVE_AIO_H
> + static volatile int Received_callback = 0;	/* number of callbacks received */
> + static volatile int Rec_callback;
> + #endif
> +@@ -399,7 +401,7 @@ static void lio_async_signal_handler(int sig)
> + 	return;
> + }
> + 
> +-#if defined(sgi) || (defined(__linux__) && !defined(__UCLIBC__))
> ++#ifdef HAVE_AIO_H
> + /***********************************************************************
> +  * This is an internal callback handler.
> +  * If the handler is called, it will increment the Received_callback
> +@@ -417,7 +419,7 @@ static void lio_async_callback_handler(union sigval sigval)
> + 
> + 	return;
> + }
> +-#endif /* sgi */
> ++#endif
> + 
> + /***********************************************************************
> +  * lio_random_methods
> +@@ -515,9 +517,11 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 	int omethod = method;
> + 	int listio_cmd;		/* Holds the listio/lio_listio cmd */
> + 	struct iovec iov;	/* iovec for writev(2) */
> ++#ifdef HAVE_AIO_H
> + 	struct aiocb aiocbp;	/* POSIX aio control block */
> + 	struct aiocb *aiolist[1];	/* list of aio control blocks for lio_listio */
> + 	off64_t poffset;	/* pwrite(2) offset */
> ++#endif
> + 
> + 	/*
> + 	 * If LIO_RANDOM bit specified, get new method randomly.
> +@@ -536,12 +540,15 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 		*errmsg = Errormsg;
> + 
> + 	Rec_signal = Received_signal;	/* get the current number of signals received */
> ++#ifdef HAVE_AIO_H
> + 	Rec_callback = Received_callback;	/* get the current number of callbacks received */
> ++#endif
> + 
> + 	memset(&iov, 0x00, sizeof(struct iovec));
> + 	iov.iov_base = buffer;
> + 	iov.iov_len = size;
> + 
> ++#ifdef HAVE_AIO_H
> + 	memset(&aiocbp, 0x00, sizeof(struct aiocb));
> + 
> + 	aiocbp.aio_fildes = fd;
> +@@ -589,6 +596,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 
> + 	poffset = (off64_t) ret;
> + 	aiocbp.aio_offset = ret;
> ++#endif
> + 
> + 	/*
> + 	 * If the LIO_USE_SIGNAL bit is not set, only use the signal
> +@@ -597,9 +605,9 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 	 * the signal.
> + 	 */
> + 	if (sig && !(method & LIO_USE_SIGNAL) && !(method & LIO_WAIT_SIGTYPES)) {
> +-
> + 		sig = 0;	/* ignore signal parameter */
> + 	}
> ++#ifdef HAVE_AIO_H
> + 	if (sig && (method & LIO_WAIT_CBTYPES))
> + 		sig = 0;	/* ignore signal parameter */
> + 
> +@@ -626,6 +634,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 		aiocbp.aio_sigevent.sigev_notify_attributes =
> + 		    (void *)(uintptr_t) size;
> + 	}
> ++#endif
> + 
> + 	/*
> + 	 * Determine the system call that will be called and produce
> +@@ -684,6 +693,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 	}
> + 
> + 	else if (method & LIO_IO_ASYNC) {
> ++#ifdef HAVE_AIO_H
> + 		sprintf(Lio_SysCall,
> + 			"aio_write(fildes=%d, buf, nbytes=%d, signo=%d)", fd,
> + 			size, sig);
> +@@ -705,9 +715,11 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 				sigrelse(sig);
> + 			return -errno;
> + 		}
> ++#endif
> + 	}
> + 	/* LIO_IO_ASYNC */
> + 	else if (method & LIO_IO_SLISTIO) {
> ++#ifdef HAVE_AIO_H
> + 		aiocbp.aio_lio_opcode = LIO_WRITE;
> + 		listio_cmd = LIO_WAIT;
> + 		io_type = "lio_listio(3) sync write";
> +@@ -739,9 +751,11 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 
> + 		ret = lio_check_asyncio(io_type, size, &aiocbp, method);
> + 		return ret;
> ++#endif
> + 	}
> + 	/* LIO_IO_SLISTIO */
> + 	else if (method & LIO_IO_ALISTIO) {
> ++#ifdef HAVE_AIO_H
> + 		aiocbp.aio_lio_opcode = LIO_WRITE;
> + 		listio_cmd = LIO_NOWAIT;
> + 		io_type = "lio_listio(3) async write";
> +@@ -766,6 +780,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 				sigrelse(sig);
> + 			return -errno;
> + 		}
> ++#endif
> + 	}
> + 	/* LIO_IO_ALISTIO */
> + 	else if (method & LIO_IO_SYNCV) {
> +@@ -796,6 +811,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 
> + 		return ret;
> + 	}			/* LIO_IO_SYNCV */
> ++#ifdef HAVE_AIO_H
> + 	else if (method & LIO_IO_SYNCP) {
> + 		io_type = "pwrite(2)";
> + 
> +@@ -827,6 +843,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 
> + 		return ret;
> + 	}			/* LIO_IO_SYNCP */
> ++#endif
> + 	else {
> + 		printf("DEBUG %s/%d: No I/O method chosen\n", __FILE__,
> + 		       __LINE__);
> +@@ -836,7 +853,9 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 	/*
> + 	 * wait for async io to complete.
> + 	 */
> ++#ifdef HAVE_AIO_H
> + 	ret = lio_wait4asyncio(method, fd, &aiocbp);
> ++#endif
> + 
> + 	/*
> + 	 * If there was an error waiting for async i/o to complete,
> +@@ -862,7 +881,9 @@ int lio_write_buffer(int fd,		/* open file descriptor */
> + 	 * have been updated but the actual i/o size if returned.
> + 	 */
> + 
> ++#ifdef HAVE_AIO_H
> + 	ret = lio_check_asyncio(io_type, size, &aiocbp, method);
> ++#endif
> + 
> + 	return ret;
> + }				/* end of lio_write_buffer */
> +@@ -924,9 +945,11 @@ int lio_read_buffer(int fd,	/* open file descriptor */
> + 	int listio_cmd;		/* Holds the listio/lio_listio cmd */
> + 	int omethod = method;
> + 	struct iovec iov;	/* iovec for readv(2) */
> ++#ifdef HAVE_AIO_H
> + 	struct aiocb aiocbp;	/* POSIX aio control block */
> + 	struct aiocb *aiolist[1];	/* list of aio control blocks for lio_listio */
> + 	off64_t poffset;	/* pread(2) offset */
> ++#endif
> + 
> + 	/*
> + 	 * If LIO_RANDOM bit specified, get new method randomly.
> +@@ -945,12 +968,15 @@ int lio_read_buffer(int fd,	/* open file descriptor */
> + 		*errmsg = Errormsg;
> + 
> + 	Rec_signal = Received_signal;	/* get the current number of signals received */
> ++#ifdef HAVE_AIO_H
> + 	Rec_callback = Received_callback;	/* get the current number of callbacks received */
> ++#endif
> + 
> + 	memset(&iov, 0x00, sizeof(struct iovec));
> + 	iov.iov_base = buffer;
> + 	iov.iov_len = size;
> + 
> ++#ifdef HAVE_AIO_H
> + 	memset(&aiocbp, 0x00, sizeof(struct aiocb));
> + 
> + 	aiocbp.aio_fildes = fd;
> +@@ -998,6 +1024,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
> + 	}
> + 	poffset = (off64_t) ret;
> + 	aiocbp.aio_offset = ret;
> ++#endif
> + 
> + 	/*
> + 	 * If the LIO_USE_SIGNAL bit is not set, only use the signal
> +@@ -1010,6 +1037,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
> + 		sig = 0;	/* ignore signal parameter */
> + 	}
> + 
> ++#ifdef HAVE_AIO_H
> + 	if (sig && (method & LIO_WAIT_CBTYPES))
> + 		sig = 0;	/* ignore signal parameter */
> + 
> +@@ -1020,7 +1048,6 @@ int lio_read_buffer(int fd,	/* open file descriptor */
> + 	 * old signal handler will not be restored.
> + 	 *** restoring the signal handler could be added ***
> + 	 */
> +-
> + 	if (sig && (method & LIO_WAIT_SIGTYPES)) {
> + 		aiocbp.aio_sigevent.sigev_notify = SIGEV_SIGNAL;
> + 		aiocbp.aio_sigevent.sigev_signo = sig;
> +@@ -1035,6 +1062,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
> + 		aiocbp.aio_sigevent.sigev_notify_attributes =
> + 		    (void *)(uintptr_t) size;
> + 	}
> ++#endif
> + 
> + 	/*
> + 	 * Determine the system call that will be called and produce
> +@@ -1093,6 +1121,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
> + 			wait4sync_io(fd, 1);
> + 		}
> + 
> ++#ifdef HAVE_AIO_H
> + 	} else if (method & LIO_IO_ASYNC) {
> + 		sprintf(Lio_SysCall,
> + 			"aio_read(fildes=%d, buf, nbytes=%d, signo=%d)", fd,
> +@@ -1236,7 +1265,8 @@ int lio_read_buffer(int fd,	/* open file descriptor */
> + 			     __FILE__, __LINE__, ret);
> + 
> + 		return ret;
> +-	}			/* LIO_IO_SYNCP */
> ++#endif
> ++	}
> + 
> + 	else {
> + 		printf("DEBUG %s/%d: No I/O method chosen\n", __FILE__,
> +@@ -1248,7 +1278,9 @@ int lio_read_buffer(int fd,	/* open file descriptor */
> + 	 * wait for async io to complete.
> + 	 * Note: Sync io should have returned prior to getting here.
> + 	 */
> ++#ifdef HAVE_AIO_H
> + 	ret = lio_wait4asyncio(method, fd, &aiocbp);
> ++#endif
> + 
> + 	/*
> + 	 * If there was an error waiting for async i/o to complete,
> +@@ -1274,12 +1306,14 @@ int lio_read_buffer(int fd,	/* open file descriptor */
> + 	 * have been updated but the actual i/o size if returned.
> + 	 */
> + 
> ++#ifdef HAVE_AIO_H
> + 	ret = lio_check_asyncio(io_type, size, &aiocbp, method);
> ++#endif
> + 
> + 	return ret;
> + }				/* end of lio_read_buffer */
> + 
> +-#if !defined(__sun) && !defined(__hpux) && !defined(_AIX)
> ++#ifdef HAVE_AIO_H
> + /***********************************************************************
> +  * This function will check that async io was successful.
> +  * It can also be used to check sync listio since it uses the
> +-- 
> +2.50.0
> +
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
