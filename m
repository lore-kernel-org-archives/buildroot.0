Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF846C61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78CF3407F6;
	Thu, 27 Aug 2026 19:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mc1tVw9pV33d; Thu, 27 Aug 2026 19:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787857226;
	bh=fkhweke5j6G/GoySJ8VnITK6e/4oqmg4ORXctb5FoDg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rYtBO3N2demT+nhAC1mhUV653FKlFxR9uHD2yZ6Lj7QbxCfVp06qscvMB0IrR7wS+
	 HI+J7wL8PwIYRBDcSajhsbXbniqFldwA9b1i94ImguyLOORWNwDrNQ+rH8vAHWj1M5
	 NzT7eYEPI0uhBWbeFP7XG4biQa/Y7GeonJ8IHJ3ol1FshAVlB/Frrsl0BurIYsfeqe
	 Bt/HG4GJtoKucSlLNPcZmDNZy7GBzqyOrY95fC2HO8LqfC501ov0OkVKZh6BGuRM+O
	 4XSIzUF1eKZx+Ay9LFJybrPG3u03gm37U5PQf2zNLl5VCVUC8I6JK0NEfOHtcs3H4K
	 rDod+BV9OvnbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6404080D;
	Thu, 27 Aug 2026 19:00:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B06F75
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82EB780EB9
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5d5K--LR_DXm for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=EcGJ5H2+
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43A0A80EC3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:21 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-4864ebb6268so285583b6e.3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787857220; x=1788462020; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hOyACi/pTZTn9mLH3s3nCYlHfck2/z7IPLvc4VG45j0=;
 b=EcGJ5H2+JfMmKB/kGM08cHczX5gbFa/1iJrs/bCWIE90ap9NWYb7v6JvTQONv8YBY4
 BaH1pl53K6cEaqslxvDWqmNxvgioXBeaeFLx5Rx5N/1l7+JVu8ccHPhz6bOU1dpfyNXq
 1cjOo/vTcIjYKk2jtjjJltwdes/UEUCy7pxwPzgznSVZiUYNgmn7KjK+0r/wOWRM8qNN
 lrL5CeKc9nDwD6Z5rGFndEzeb1Te2sHlsbyHFaVUI+PMYensjthoOFEYZMuVoc6WbEEL
 +j02PZo6lkGjsVAoJLbewVhTSLz+LVVd1ERnlUkpjiWsqbVJqGre9YihrQCRAsG3ZDzE
 q0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787857220; x=1788462020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hOyACi/pTZTn9mLH3s3nCYlHfck2/z7IPLvc4VG45j0=;
 b=OnHAg7f+j1JgHZnDJpRalh5B0qzQbiHZ3yYNgZSq/3nRBImjfmYhBMTltqlPM24jAx
 is2ERYtrZJ2c6Sol6/RpslgZOMiGajQmdcjp7vYzR1cL01/cfQXGsMaQpmGN8F2pdeNE
 O7yGOFZlLjjRKc/ooBX/SoQUbxfrXfW310DG9ywtm+W5EL5HBKs1nWY/aqXe/xTe+BAv
 scrSh4Vdekspau/6tR6Qel5jQlXLQKsWuSCYREuyeHCS5x2omsS+TIf5OUAH4Y/ENlNa
 77o772lGFFcfH5p5AGvt47WfPnzNDO6gulMstgrrtds7q0bMWtQgmViZQv+oKeSrbEtG
 2o8w==
X-Gm-Message-State: AFuF++mJYY+aSBR96nEqQ+UtHQVgyKQaejlTR5eScFFpxrm8vpwOt1HM
 hbe4b8ZUTIdugTIOSyyXIlk7BXSxecDr2MT+WvGUtJ9pQ5391tHhyxT68jCWrTPw
X-Gm-Gg: AR+sD12487ySvlTvgU70d3sViQFovzSC9tNRPuuW/i01bXT7U0tRo7SaboDxVSiHZSS
 SiDeo1Tlg1h6r4lUoQMVY6NqKJ1tdX42T/VB3zJslEO5jlWUcYfdB2lI5mTrj5CsxezNmZNHwrI
 TloUG7C3Vbr3L1d3wonLabnkriSnikx8sUoaBEbX+Ff1IQb64HJpkXE0K89TOzajNSB/Bp3Vzib
 YUNpgzeotRtEOjN7OtxSmtQ9JjHyE1rAe5x6JGyVH+bjj7JHjvkaH4a1vsVIPnSXJqS34ljoOkY
 QeQMagCnidpcn4FIZBK16AylYWMUM4RwDy+zIp8IWjDcFtlOT2IHIesj/H+z7U/bYI1eRzIom78
 bPx5hhD2vmVkSuewmRBqawBomo/Dy4c8+ySpXYYwl6Ow5Z6cDjU3JBjznDvO5Q2yX/IC34hG38r
 D6p7xquPpBXUylGfuWEk0UhkuOavppSm/szzoCSvsgR/SbZy18fgYU8Vul/mQ2D8YXANs0drwUE
 M0dfilWontPnUfpp85VpNJs8DfP3MVdZL7AFZ5RNrmwY/OyMQF3p+wGmT/I5dGpjA==
X-Received: by 2002:a05:6808:2204:b0:490:315d:e0d5 with SMTP id
 5614622812f47-4b39826c2bcmr961439b6e.16.1787857217192; 
 Thu, 27 Aug 2026 12:00:17 -0700 (PDT)
Received: from 4769c4e2f3e3.nos.boeing.com
 (138-28-90-168.fttx.imoncommunications.net. [138.28.90.168])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b3984e0d40sm263428b6e.9.2026.08.27.12.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 12:00:16 -0700 (PDT)
From: matt@thewebers.ws
To: buildroot@buildroot.org
Cc: "Matthew Weber" <matthew.l.weber3@boeing.com>,
 Clayton Shotwell <clayton.shotwell@boeing.com>
Date: Thu, 27 Aug 2026 18:59:50 +0000
Message-Id: <20260827185951.3180679-3-matt@thewebers.ws>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827185951.3180679-1-matt@thewebers.ws>
References: <20260827185951.3180679-1-matt@thewebers.ws>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/libc-test: add POSIX functional
 test extensions
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

From: "Matthew Weber" <matthew.l.weber3@boeing.com>

Add patch 0002 which provides additional functional test coverage
for POSIX APIs including:
- pthread attributes and operations
- POSIX timers (create, delete, gettime, settime, getoverrun)
- POSIX message queues
- Scheduler (priority min/max, rr_get_interval, yield)
- Time functions (clock_getres, clock_nanosleep, gmtime_r, etc.)
- Process (execve, posix_spawnattr_setflags)

These tests exercise musl's implementation of scheduling and IPC
APIs that are not covered by the upstream test suite.

Signed-off-by: Matthew Weber <matthew.l.weber3@boeing.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@boeing.com>
---
 .../0002-add-posix-functional-tests.patch     | 6798 +++++++++++++++++
 1 file changed, 6798 insertions(+)
 create mode 100644 package/libc-test/0002-add-posix-functional-tests.patch

diff --git a/package/libc-test/0002-add-posix-functional-tests.patch b/package/libc-test/0002-add-posix-functional-tests.patch
new file mode 100644
index 0000000000..402a7811cf
--- /dev/null
+++ b/package/libc-test/0002-add-posix-functional-tests.patch
@@ -0,0 +1,6798 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Matthew Weber <matthew.l.weber3@boeing.com>
+Date: Tue, 22 Jul 2026 00:00:00 +0000
+Subject: [PATCH] add POSIX functional tests for pthread, timer, mq, sched APIs
+
+Add comprehensive functional test coverage for POSIX APIs including:
+- pthread attributes (init, destroy, get/set for scope, stacksize,
+  schedparam, schedpolicy, guardsize, detachstate, inheritsched, stack)
+- pthread operations (self, sigmask, testcancel, mutex_trylock,
+  mutexattr, getcpuclockid)
+- POSIX timers (create, delete, gettime, settime, getoverrun)
+- POSIX message queues (open, close, unlink, send, receive, notify,
+  getattr, setattr, timedsend, timedreceive)
+- Scheduler (get_priority_min, get_priority_max, rr_get_interval, yield)
+- Time functions (clock_getres, clock_nanosleep, asctime_r, ctime_r,
+  gmtime_r, localtime_r, difftime, times, tzset)
+- Process (execve, posix_spawnattr_setflags)
+- Shared utility header (utils.h) with thread safety and buffer
+  overflow test helpers
+
+Upstream: https://marc.info/?l=musl&m=178593914174006&w=2
+Signed-off-by: Matthew Weber <matthew.l.weber3@boeing.com>
+---
+diff --git a/src/common/utils.h b/src/common/utils.h
+new file mode 100644
+index 0000000..9af9c9a
+--- /dev/null
++++ b/src/common/utils.h
+@@ -0,0 +1,101 @@
++#ifndef UTILS_H
++
++#define UTILS_H
++
++#include "test.h"
++#include <pthread.h>
++#include <stdlib.h>
++#include <sys/wait.h>
++
++/*
++ *In this code, we are usig a busy loop to simulate a CPU-intensive task that
++ *consumes processing time, specifically to measure the system time (stime)
++ *during its execution.
++ *
++ *By using the 'getpid()' function inside a 'for' loop, we create a controlled,
++ *predictable CPU workload that forces userspace and kernel interaction. This
++ *allows us to measure the system time (stime) and user time (utime).
++ *
++ *A 'while' loop could also be used to create this busy loop. However, a
++ *'for' loop is preferred here because with a 'for' loop, there's less
++ *risk of accidentally creating an infinite loop due to missed condition.
++ *
++ *'sleep()' function is not suitable as it does not create any CPU load for
++ *the stime to tick.
++ */
++
++static inline void __attribute__((unused)) create_and_join_threads(
++    const int num_threads, pthread_attr_t *attr_data,
++    void *(*thread_func)(void *), void *thread_data, size_t data_size)
++{
++	pthread_t threads[num_threads];
++
++	// create threads and pass the data
++	for (int i = 0; i < num_threads; ++i) {
++		void *arg =
++		    thread_data ? (void *)((char *)thread_data + i * data_size) : NULL;
++		pthread_attr_t *thread_attr = attr_data ? &attr_data[i] : NULL;
++		int rc = pthread_create(&threads[i], thread_attr, thread_func, arg);
++		if (rc != 0) {
++			t_error("pthread_create thread_safety_function error: %d\n", rc);
++		}
++	}
++
++	// wait for all the threads to complete
++	for (int i = 0; i < num_threads; ++i) {
++		pthread_join(threads[i], NULL);
++	}
++}
++
++/*
++ *This function is designed to create and manage multiple threads using a
++ *contiguous array of data, such as an array of structures. Each thread
++ *receives its own chunk of data form the array based on its index.
++ *
++ *Parameters:
++ *
++ *int num_threads: The number of threads to be created.
++ *void* (*thread_func)(void*): A pointer to the function that each thread
++ *      will execute. This function should accept a void* argument, which will
++ *      be the data passed to each thread.
++ *void* thread_data: A pointer to the contiguous block of data. Each thread
++ *      will be passed a different part of this block based on its index.
++ *      size_t data_size: The size (in bytes) of each individual element in the
++ *      thread_data array. This is used to calculate the offcset for each
++ *      thread's data.
++ *pthread_attr_t* attr_data: (Optional) An array of pthread_attr_t structures,
++ *      allowing the caller to specify custom attributes (such as stack size)
++ *      for each thread. If NULL, default thread attributes are used.
++ */
++
++static inline void __attribute__((unused)) test_buffer_overflow(
++    int (*run_buffer_overflow)(void))
++{
++	if (run_buffer_overflow == NULL) {
++		t_error(
++		    "run_buffer_overflow is NULL, expected a valid function pointer\n");
++		return;
++	}
++
++	pid_t child_pid = fork();
++
++	if (child_pid == -1) {
++		t_error("test_buffer_overflow fork failed\n");
++	}
++
++	if (child_pid == 0) {
++		exit(run_buffer_overflow());
++	} else {
++		int status = 0;
++		waitpid(child_pid, &status, 0);
++
++		if ((WIFSIGNALED(status) && (WTERMSIG(status) != SIGSEGV)) ||
++		    WEXITSTATUS(status) == 1) {
++			t_error("Expected child to return an error due to buffer "
++			        "overflow, instead child exited with %d\n",
++			        WEXITSTATUS(status));
++		}
++	}
++}
++
++#endif
+diff --git a/src/functional/asctime_r.c b/src/functional/asctime_r.c
+new file mode 100644
+index 0000000..0b32892
+--- /dev/null
++++ b/src/functional/asctime_r.c
+@@ -0,0 +1,117 @@
++/*
++ * asctime_r test
++ */
++#include "test.h"
++#include "utils.h"
++#include <pthread.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/wait.h>
++#include <time.h>
++#include <unistd.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TBUFSIZE 100
++#define MAX_THREADS 10
++
++// ISO C defines the tm_year member of the tm struct as 'years after 1900'
++// The nearest value to overflow is 10000 - 1900 = 8100.
++#define OVERFLOW_YEAR (10000 - 1900)
++
++static int run_buffer_overflow(void)
++{
++	struct tm date_time;
++	memset(&date_time, 0, sizeof(date_time));
++
++	// tm_year is formatted with %d in asctime_r, and writing a 5 digit year
++	// will cause the buffer to overflow
++	date_time.tm_year = OVERFLOW_YEAR;
++
++	char time_buffer[TBUFSIZE] = {0};
++
++	// musl implementation will expect the function to crash, others will return
++	// NULL
++	const char *result = asctime_r(&date_time, time_buffer);
++	return result == NULL ? 0 : 1;
++}
++
++static void *get_asctime(void *args)
++{
++	struct tm date_time = {0};
++	date_time.tm_year = *(int *)args;
++
++	char result_buffer[TBUFSIZE] = {0};
++	const char *result_date = asctime_r(&date_time, result_buffer);
++
++	if (result_date == NULL) {
++		t_error("asctime_r returned NULL, expected a populated buffer\n");
++		return 0;
++	}
++
++	const int year_offset = 20;
++	const int expected_year = 1900 + date_time.tm_year;
++	const int result_year = atoi(&result_date[year_offset]);
++
++	TEST(result_year == expected_year, "Expected year to be %d, got %d\n",
++	     expected_year, result_year);
++
++	return 0;
++}
++
++static void test_thread_safety(void)
++{
++	int asctime_years[MAX_THREADS] = {0};
++
++	for (int year = 0; year < MAX_THREADS; ++year) {
++		asctime_years[year] = year;
++	}
++
++	create_and_join_threads(MAX_THREADS, NULL, get_asctime, asctime_years,
++	                        sizeof(*asctime_years));
++}
++
++static void test_datetime_format(void)
++{
++	const struct tm date_time = {
++	    .tm_sec = 0,    // Seconds after the minute
++	    .tm_min = 7,    // Minutes after the hour
++	    .tm_hour = 10,  // Hours since midnight
++	    .tm_mday = 4,   // Day of the month
++	    .tm_mon = 6,    // Months since January
++	    .tm_year = 97,  // Years since 1990
++	    .tm_wday = 5,   // Days since Sunday
++	    .tm_yday = 184, // Days since January 1
++	    .tm_isdst = 0,  // Daylight savings
++	};
++
++	char time_buffer[TBUFSIZE] = {0};
++	const char *result_date = asctime_r(&date_time, time_buffer);
++
++	if (result_date == NULL) {
++		t_error("asctime_r returned NULL, expected a populated buffer\n");
++		return;
++	}
++
++	TEST(result_date == time_buffer,
++	     "asctime_r returned the pointer %p, not the supplied buffer %p\n",
++	     result_date, time_buffer);
++
++	/* Using strcmp instead of strncmp, as asctime_r should always return a 26
++	 * byte string. strcmp will check if the returned string is over length
++	 * (indicating a buffer overflow), and fail the test, whereas strncmp would
++	 * just check the 26 bytes.
++	 */
++	const char *expected_date = "Fri Jul  4 10:07:00 1997\n";
++	TEST(!strcmp(expected_date, result_date), "Date %s does not match %s\n",
++	     result_date, expected_date);
++}
++
++int main(void)
++{
++	test_datetime_format();
++	test_thread_safety();
++	test_buffer_overflow(run_buffer_overflow);
++
++	return t_status;
++}
+diff --git a/src/functional/clock_getres.c b/src/functional/clock_getres.c
+new file mode 100644
+index 0000000..5407b41
+--- /dev/null
++++ b/src/functional/clock_getres.c
+@@ -0,0 +1,76 @@
++/*
++ * clock_getres unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <stdio.h>
++#include <string.h>
++#include <time.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void test_coarse_resolution(clockid_t clock_id,
++                                   struct timespec *const original_timespec)
++{
++	// Test both the realtime and monotonic coarse clocks
++	clockid_t coarse_clock_id = clock_id == CLOCK_REALTIME
++	                                ? CLOCK_REALTIME_COARSE
++	                                : CLOCK_MONOTONIC_COARSE;
++
++	struct timespec coarse_timespec = {0, 0};
++	TEST(clock_getres(coarse_clock_id, &coarse_timespec) == 0,
++	     "clock_getres failed with clock id %d\n", coarse_clock_id);
++
++	TEST(coarse_timespec.tv_nsec >= original_timespec->tv_nsec,
++	     "Coarse time shouldn't be more precise than non-coarse clock time\n");
++}
++
++static void test_clock_resolution(clockid_t clock_id)
++{
++	struct timespec ts = {0, 0};
++
++	TEST(clock_getres(clock_id, &ts) == 0,
++	     "clock_getres failed with clock id %d\n", clock_id);
++
++	if (clock_id == CLOCK_REALTIME || clock_id == CLOCK_MONOTONIC) {
++		test_coarse_resolution(clock_id, &ts);
++
++		/* POSIX specifies that the maximum allowable resolution for CLOCK_REALTIME
++		 * and CLOCK_MONOTONIC is 20ms (1/50 of a second)
++		 */
++		TEST(ts.tv_sec == 0, "Resolution is too large: %d seconds\n",
++		     ts.tv_sec);
++		TEST(ts.tv_nsec <= 20000000, "Resolution greater than 20ms: %d\n",
++		     ts.tv_nsec);
++	}
++}
++
++static void test_clocks(void)
++{
++	// Coarse clocks are tested in the test_clock_resolution function
++	clockid_t clocks_to_test[] = {
++	    CLOCK_REALTIME, CLOCK_MONOTONIC,          CLOCK_MONOTONIC_RAW,
++	    CLOCK_BOOTTIME, CLOCK_PROCESS_CPUTIME_ID, CLOCK_THREAD_CPUTIME_ID};
++
++	const size_t number_of_tests =
++	    sizeof(clocks_to_test) / sizeof(*clocks_to_test);
++	for (int clock = 0; clock < number_of_tests; ++clock) {
++		test_clock_resolution(clocks_to_test[clock]);
++	}
++}
++
++int main(void)
++{
++	// Test the available clocks
++	test_clocks();
++
++	// Test passing NULL into timespec argument
++	TEST(clock_getres(CLOCK_MONOTONIC, NULL) == 0,
++	     "Error when passing in NULL timespec\n");
++
++	// Test passing an invalid clock
++	clock_getres(-1, NULL);
++	TEST(errno == EINVAL, "Expected EINVAL, got %s\n", strerror(errno));
++
++	return t_status;
++}
+diff --git a/src/functional/clock_nanosleep.c b/src/functional/clock_nanosleep.c
+new file mode 100644
+index 0000000..071000a
+--- /dev/null
++++ b/src/functional/clock_nanosleep.c
+@@ -0,0 +1,133 @@
++/*
++ * clock_nanosleep unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <signal.h>
++#include <string.h>
++#include <time.h>
++
++#define MAX_NSEC 1000000000
++#define SLEEP_NANO 500000
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void dummy_signal_handler(int signum) {}
++
++static void test_time_elapsed(void)
++{
++	// get start time
++	struct timespec time1;
++	if (clock_gettime(CLOCK_MONOTONIC, &time1) == -1) {
++		t_error("clock_gettime() failed. Errno: %s\n", strerror(errno));
++		return;
++	}
++
++	struct timespec ts = {0, SLEEP_NANO};
++	TEST(clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, &ts) == 0,
++	     "clock_nanosleep failed with clock id %d\n", CLOCK_MONOTONIC);
++
++	// get finish time
++	struct timespec time2;
++	if (clock_gettime(CLOCK_MONOTONIC, &time2) == -1) {
++		t_error("clock_gettime() failed. Errno: %s\n", strerror(errno));
++		return;
++	}
++
++	// calculate elapsed time
++	time_t elapsed = time2.tv_sec > time1.tv_sec
++	                     ? time2.tv_nsec + (MAX_NSEC - time1.tv_nsec)
++	                     : time2.tv_nsec - time1.tv_nsec;
++
++	TEST(elapsed >= SLEEP_NANO,
++	     "Elapsed time test failed: expected >= %d "
++	     "nanoseconds, got %ld nanoseconds.\n",
++	     SLEEP_NANO, elapsed);
++}
++
++static void test_invalid_inputs(void)
++{
++	struct timespec ts = {1, 0};
++
++	// check EINVAL is returned when tv_nsec is too big
++	ts.tv_nsec = MAX_NSEC;
++	int retval = clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, NULL);
++	TEST(retval == EINVAL,
++	     "Oversized tv_nsec test failed: Expected %s, got %s\n",
++	     strerror(EINVAL), strerror(retval));
++
++	// check EINVAL is returned when tv_nsec is too small
++	ts.tv_nsec = -1;
++	retval = clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, NULL);
++	TEST(retval == EINVAL,
++	     "Undersized tv_nsec test failed: Expected %s, got %s\n",
++	     strerror(EINVAL), strerror(retval));
++
++	// check EINVAL is returned when given CPU_time clock of calling thread
++	retval = clock_nanosleep(CLOCK_THREAD_CPUTIME_ID, 0, &ts, NULL);
++	TEST(retval == EINVAL,
++	     "Calling threads cpu clock id test failed: Expected %s, got %s\n",
++	     strerror(EINVAL), strerror(retval));
++
++	const int unknown_clock = 123;
++
++	// check EINVAL is returned when given unknown clock
++	retval = clock_nanosleep(unknown_clock, 0, &ts, NULL);
++	TEST(retval == EINVAL,
++	     "Unknown clock id test failed: Expected %s, got %s\n",
++	     strerror(EINVAL), strerror(retval));
++
++	// check ENOTSUP is returned when given an unsupported clock
++	retval = clock_nanosleep(CLOCK_MONOTONIC_COARSE, 0, &ts, NULL);
++	TEST(retval == ENOTSUP,
++	     "Unsupported clock test failed. Expected %s, got %s\n",
++	     strerror(ENOTSUP), strerror(retval));
++}
++
++static void test_interupted_sleep()
++{
++	// check EINTR is returned when sleep is interupted by a signal handler
++	struct sigaction sa;
++	memset(&sa, 0, sizeof(sa));
++	sa.sa_handler = dummy_signal_handler;
++	sigaction(SIGALRM, &sa, NULL);
++
++	timer_t timerid = NULL;
++	if (timer_create(CLOCK_MONOTONIC, NULL, &timerid) == -1) {
++		t_error("timer_create() failed. Errno: %s\n", strerror(errno));
++		return;
++	}
++
++	struct itimerspec its = {
++	    .it_value.tv_sec = 0,
++	    .it_value.tv_nsec = SLEEP_NANO,
++	};
++	if (timer_settime(timerid, 0, &its, NULL) == -1) {
++		t_error("timer_settime() failed. Errno: %s\n", strerror(errno));
++		timer_delete(timerid);
++		return;
++	}
++
++	struct timespec ts = {2, 0};
++	struct timespec rmtp = {0, 0};
++	int retval = clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, &rmtp);
++
++	TEST(retval == EINTR, "Interupted sleep test failed: Expected %s, got %s\n",
++	     strerror(EINTR), strerror(retval));
++
++	// check that the remaining unslept time is returned into rmtp
++	TEST(rmtp.tv_sec > 0 || rmtp.tv_nsec > 0,
++	     "rmtp test failed: Expected value > 0, got rmpt.tv_sec = %lu, "
++	     "rmtp.tv_nsec = %lu\n",
++	     rmtp.tv_sec, rmtp.tv_nsec);
++
++	timer_delete(timerid);
++}
++
++int main(void)
++{
++	test_time_elapsed();
++	test_invalid_inputs();
++	test_interupted_sleep();
++	return t_status;
++}
+diff --git a/src/functional/ctime_r.c b/src/functional/ctime_r.c
+new file mode 100644
+index 0000000..8aa8c9f
+--- /dev/null
++++ b/src/functional/ctime_r.c
+@@ -0,0 +1,388 @@
++/*
++ * ctime_r unit test
++ */
++
++#include "test.h"
++#include "utils.h"
++#include <errno.h>
++#include <limits.h>
++#include <pthread.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/types.h>
++#include <sys/wait.h>
++#include <time.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TBUFSIZE 100
++#define NUM_THREADS 10
++#define NUM_REENTRANTS 1000
++#define SECONDS_IN_A_DAY 86400
++
++// ctime would return a time string like "Thu Jan  1 00:00:00 1970\n"
++#define CTIME_STR_LEN 25                  // length of the ctime_r return string
++#define CTIME_BUF_LEN (CTIME_STR_LEN + 1) // buffer size for returned string
++#define CTIME_CHR_LEN 3 // Day and month only first 3 chars in the time string
++#define CTIME_MON_IND (CTIME_CHR_LEN + 1) // Month index + ' '
++#define CTIME_DOM_IND \
++	(CTIME_MON_IND + CTIME_CHR_LEN + 1) // Day of month index + ' '
++#define CTIME_DOM_LEN 2                 // Day of Month 2 chars
++#define CTIME_TIM_IND (CTIME_DOM_IND + CTIME_DOM_LEN + 1) // Time index + ' '
++#define CTIME_TIM_HH_IND (CTIME_TIM_IND)                  // Time HH index
++#define CTIME_TIM_HH_LEN 2                                // HH takes 2 chars
++#define CTIME_TIM_MM_IND \
++	(CTIME_TIM_HH_IND + CTIME_TIM_HH_LEN + 1) // Time HH index
++#define CTIME_TIM_MM_LEN 2                    // MM takes 2 chars
++#define CTIME_TIM_SS_IND \
++	(CTIME_TIM_MM_IND + CTIME_TIM_MM_LEN + 1) // Time HH index
++#define CTIME_TIM_LEN 8                       // HH:MM:SS takes 28 chars
++#define CTIME_YER_IND (CTIME_TIM_IND + CTIME_TIM_LEN + 1) // Year index
++#define CTIME_YER_LEN 4                                   // YYYY takes 4 chars
++#define CTIME_NUM_MONTHS 12                               // number of Months
++#define CTIME_NUM_DAYS 7                                  // number of Days
++
++// ISO C defines the tm_year member of the tm struct as 'years after 1900'
++// The nearest value to overflow is 10000 - 1900 = 8100.
++#define OVERFLOW_YEAR \
++	(10000 - 1900) // Network Time Protocol epoch is 1900-01-01
++
++struct result {
++	pthread_t thread_id;
++	char time_str[CTIME_BUF_LEN];
++	time_t rawtime;
++	int status;
++	int index;
++};
++
++static int check_date_digit(char c)
++{
++	return ((c >= '0' && c <= '9') || c == ' ');
++}
++
++static int check_time_digit(char c)
++{
++	return ((c >= '0' && c <= '9') || c == ' ' || c == ':');
++}
++
++static void validate_ctime_r_output_for_valid_day(const char *time_str)
++{
++	TEST(time_str != NULL, "time_str is not valid\n");
++
++	int valid_day = -1;
++	// Check day of the week
++	const char *valid_days[] = {"Sun", "Mon", "Tue", "Wed",
++	                            "Thu", "Fri", "Sat"};
++
++	for (int i = 0; i < CTIME_NUM_DAYS; ++i) {
++		if (strncmp(time_str, valid_days[i], CTIME_CHR_LEN) == 0) {
++			valid_day = 0;
++			break;
++		}
++	}
++
++	TEST(valid_day == 0, "Valid day was not found in the string: %s\n",
++	     time_str);
++
++	return;
++}
++
++static void validate_ctime_r_output_for_valid_month(const char *time_str)
++{
++	TEST(time_str != NULL, "time_str is not valid\n");
++
++	int valid_month = -1;
++	const char *valid_months[] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun",
++	                              "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
++
++	// Check month
++	for (int i = 0; i < CTIME_NUM_MONTHS; ++i) {
++		if (strncmp(time_str + CTIME_MON_IND, valid_months[i], CTIME_CHR_LEN) ==
++		    0) {
++			valid_month = 0;
++			break;
++		}
++	}
++	TEST(valid_month == 0, "Valid month was not found in the string: %s\n",
++	     time_str);
++
++	return;
++}
++
++static void validate_ctime_r_output_for_valid_dom(const char *time_str)
++{
++	TEST(time_str != NULL, "time_str is not valid\n");
++
++	// Check day of the month (DD), should be 2 chars
++	int valid_dom = 0;
++	for (int i = 0; i < CTIME_DOM_LEN; ++i) {
++		if (check_date_digit(time_str[CTIME_DOM_IND + i]) == 0) {
++			valid_dom = -1;
++			break;
++		}
++	}
++	TEST(valid_dom == 0,
++	     "Valid day of the month was not found in the string: %s\n", time_str);
++
++	return;
++}
++
++static void validate_ctime_r_output_for_valid_time(const char *time_str)
++{
++	TEST(time_str != NULL, "time_str is not valid\n");
++
++	// Check time (HH:MM:SS), should be 8 chars
++	int valid_time = 0;
++	for (int i = 0; i < CTIME_TIM_LEN; ++i) {
++		if (check_time_digit(time_str[CTIME_TIM_IND + i]) == 0) {
++			valid_time = -1;
++			break;
++		}
++	}
++	TEST(valid_time == 0, "Valid time was not found in the string: %s\n",
++	     time_str);
++
++	TEST(time_str[CTIME_TIM_HH_IND + CTIME_TIM_HH_LEN] == ':',
++	     "Valid time format ':' was not found in the string: %s\n", time_str);
++
++	TEST(time_str[CTIME_TIM_MM_IND + CTIME_TIM_MM_LEN] == ':',
++	     "Valid time format ':' was not found in the string: %s\n", time_str);
++
++	return;
++}
++
++static void validate_ctime_r_output_for_valid_year(const char *time_str)
++{
++	TEST(time_str != NULL, "time_str is not valid\n");
++
++	// Check year YYYY, should be 4 chars
++	int valid_year = 0;
++	for (int i = 0; i < CTIME_YER_LEN; ++i) {
++		if (check_date_digit(time_str[CTIME_YER_IND + i]) == 0) {
++			valid_year = -1;
++			break;
++		}
++	}
++	TEST(valid_year == 0, "Valid year was not found in the string: %s\n",
++	     time_str);
++
++	return;
++}
++
++static void validate_ctime_r_output(const char *time_str)
++{
++	TEST(time_str != NULL, "time_str is not valid\n");
++
++	// Check the length of the string and new line char
++	TEST(strlen(time_str) == CTIME_STR_LEN,
++	     "Expected strlen: %d, but got: %d\n", CTIME_STR_LEN, strlen(time_str));
++	// Check the  new line char at the end of the string
++	TEST(time_str[CTIME_STR_LEN - 1] == '\n',
++	     "Expected char: %d, but got: %d\n", '\n', time_str[CTIME_STR_LEN - 1]);
++
++	validate_ctime_r_output_for_valid_day(time_str);
++
++	validate_ctime_r_output_for_valid_month(time_str);
++
++	validate_ctime_r_output_for_valid_dom(time_str);
++
++	validate_ctime_r_output_for_valid_time(time_str);
++
++	validate_ctime_r_output_for_valid_year(time_str);
++
++	return;
++}
++
++static int compare_ctime_r_output(const char *actual, const char *expected)
++{
++	if (actual == NULL || expected == NULL) {
++		return -1;
++	}
++
++	// Check the length of the string and new line char
++	if (strlen(actual) != CTIME_STR_LEN || actual[CTIME_STR_LEN - 1] != '\n') {
++		return -1;
++	}
++
++	if (strlen(expected) != CTIME_STR_LEN ||
++	    expected[CTIME_STR_LEN - 1] != '\n') {
++		return -1;
++	}
++
++	if (strncmp(actual, expected, CTIME_STR_LEN) != 0) {
++		return -1;
++	}
++
++	return 0;
++}
++
++static void reentrant_call(int depth, time_t *rawtime, void *buffer)
++{
++	if (depth <= 0)
++		return;
++
++	for (int i = 0; i < depth; ++i) {
++		errno = 0;
++		char *result = ctime_r(rawtime, (char *)buffer);
++		TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++	}
++	return;
++}
++
++// Thread function for testing ctime_r in a multiple-threaded context
++static void *thread_safety_function(void *arg)
++{
++	struct result *res = (struct result *)arg;
++
++	res->rawtime += (time_t)(res->index * SECONDS_IN_A_DAY);
++	reentrant_call(NUM_REENTRANTS, &res->rawtime, res->time_str);
++
++	res->thread_id = pthread_self();
++	res->status = 0;
++	return NULL;
++}
++
++// Function to test ctime_r thread safety
++static void test_ctime_r_thread_safety_and_reentrancy(struct result results[])
++{
++	// Read the current time once before creating the threads
++	time_t basetime = time(NULL);
++
++	// Initialize thread data
++	for (int i = 0; i < NUM_THREADS; ++i) {
++		results[i].index = i;
++		results[i].status = -1;
++		results[i].rawtime = basetime;
++	}
++	// Create threads
++	create_and_join_threads(NUM_THREADS, NULL, thread_safety_function, results,
++	                        sizeof(struct result));
++
++	char expected_time_str[CTIME_BUF_LEN] = {0};
++	char *result = NULL;
++
++	// Validate the results after all threads have finished
++	for (int i = 0; i < NUM_THREADS; ++i) {
++		TEST(results[i].status == 0,
++		     "Thread safety function failed to execute correctly for "
++		     "Thread_id: %d\n",
++		     results[i].thread_id);
++
++		if (results[i].status == 0) {
++			// Verify that the ctime_r returns a 24-character string +'\n'+'\0'
++			validate_ctime_r_output(results[i].time_str);
++
++			errno = 0; // reset the errno before calling localtime_r
++			result = ctime_r(&results[i].rawtime, expected_time_str);
++			TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++
++			// Verify that the actual values match the expected values
++			TEST(compare_ctime_r_output(results[i].time_str,
++			                            expected_time_str) == 0,
++			     "actual values did not match the expected values\n");
++		}
++	}
++	return;
++}
++
++static void test_ctime_r(void)
++{
++	time_t rawtime = 0;
++	char buffer[CTIME_BUF_LEN] = {
++	    0}; // ctime_r requires a buffer of at least 26 bytes
++
++	// Test case 1: Valid time_t input (current time)
++	time(&rawtime);
++	char *result = ctime_r(&rawtime, buffer);
++	TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++	validate_ctime_r_output(buffer);
++
++	// Test case 2: Edge case (time_t value of 0, the Unix epoch)
++	rawtime = 0;
++	result = ctime_r(&rawtime, buffer);
++	TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++	validate_ctime_r_output(buffer);
++	TEST(strncmp(buffer, "Thu Jan  1 00:00:00 1970\n", CTIME_STR_LEN) == 0 &&
++	         errno == 0,
++	     "Returned string did not match the Unix epoch time. Error: %s\n",
++	     strerror(errno)); // exact string for Unix epoch
++
++	// Test case 3: Out-of-range time_t value (far future date)
++	rawtime = INT_MAX; // This is the upper bound for a time_t value
++	result = ctime_r(&rawtime, buffer);
++	TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++	validate_ctime_r_output(buffer);
++
++	// Test case 4: Far past date (time_t minimum value)
++	rawtime = INT_MIN; // Minimum time_t value
++	result = ctime_r(&rawtime, buffer);
++	TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++	validate_ctime_r_output(buffer);
++
++#if 0
++	// These tests are turned off for the moment due to ctime_r
++	// not handling invalid arguments gracefully
++	// Test case 5: Invalid time_t pointer (NULL)
++	result = ctime_r(NULL, buffer);
++	TEST(result == NULL && errno == 0, "%s\n", strerror(errno));
++	validate_ctime_r_output(buffer);
++
++	// Test case 6: Invalid buffer pointer (NULL)
++	time(&rawtime);
++	result = ctime_r(&rawtime, NULL);
++	TEST(result == NULL && errno == 0, "%s\n", strerror(errno));
++	validate_ctime_r_output(buffer);
++
++	// Test case 7: Both time_t and buffer pointer are NULL
++	result = ctime_r(NULL, NULL);
++	TEST(result == NULL && errno == 0, "%s\n", strerror(errno));
++	validate_ctime_r_output(buffer);
++#endif
++
++	// Test case 8: Test for year overflow (EOVERFLOW)
++	errno = 0;
++	rawtime = (time_t)LONG_MAX; // Assuming this causes overflow
++	result = ctime_r(&rawtime, buffer);
++	TEST(result == NULL && errno == EOVERFLOW, "%s\n", strerror(errno));
++
++	// Test case 9: Test for year overflow (EOVERFLOW)
++	errno = 0;
++	rawtime = (time_t)LONG_MIN; // Assuming this causes overflow
++	result = ctime_r(&rawtime, buffer);
++	TEST(result == NULL && errno == EOVERFLOW, "%s\n", strerror(errno));
++
++	return;
++}
++
++static int test_ctime_r_buffer_overflow(void)
++{
++	struct tm timeinfo;
++	memset(&timeinfo, 0, sizeof(timeinfo));
++	// tm_year is formatted with %d in asctime_r, and writing a 5 digit year
++	// will cause the buffer to overflow
++	timeinfo.tm_year = OVERFLOW_YEAR;
++
++	time_t seconds = mktime(&timeinfo);
++	char buffer[CTIME_BUF_LEN] = {
++	    0}; // ctime_r requires a buffer of at least 26 bytes
++
++	const char *result = NULL;
++	if (seconds != -1) {
++		// mktime() returns a day shorter than 10000 years when converting
++		// 'tm_year = OVERFLOW_YEAR' to seconds
++		seconds += SECONDS_IN_A_DAY;
++		// musl implementation will expect the function to crash, others will
++		// return NULL
++		result = ctime_r(&seconds, buffer);
++	}
++	return (result == NULL ? 0 : 1);
++}
++
++int main(void)
++{
++	struct result results[NUM_THREADS];
++	test_ctime_r();
++	test_ctime_r_thread_safety_and_reentrancy(results);
++	test_buffer_overflow(test_ctime_r_buffer_overflow);
++	return t_status;
++}
+diff --git a/src/functional/difftime.c b/src/functional/difftime.c
+new file mode 100644
+index 0000000..fb060fb
+--- /dev/null
++++ b/src/functional/difftime.c
+@@ -0,0 +1,99 @@
++/*
++ * difftime unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <limits.h> // for LONG_MIN nad LONG_MAX
++#include <pthread.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <time.h>
++
++#define SECONDS_IN_A_MINUTE 60
++#define MINUTES_IN_AN_HOUR 60
++#define HOURS_IN_A_DAY 24
++#define DAYS_IN_A_WEEK 7
++#define DAYS_IN_A_MONTH 30 // aproximated to 30
++#define DAYS_IN_A_YEAR 365 // approximated to 365
++#define SECONDS_IN_AN_HOUR (time_t)(MINUTES_IN_AN_HOUR * SECONDS_IN_A_MINUTE)
++#define SECONDS_IN_A_DAY (time_t)(HOURS_IN_A_DAY * SECONDS_IN_AN_HOUR)
++#define SECONDS_IN_A_WEEK (time_t)(DAYS_IN_A_WEEK * SECONDS_IN_A_DAY)
++#define SECONDS_IN_A_MONTH (time_t)(DAYS_IN_A_MONTH * SECONDS_IN_A_DAY)
++#define SECONDS_IN_A_YEAR (time_t)(DAYS_IN_A_YEAR * SECONDS_IN_A_DAY)
++#define SECONDS_IN_10_YEARS (time_t)(10 * SECONDS_IN_A_YEAR)
++#define SECONDS_IN_100_YEARS (time_t)(100 * SECONDS_IN_A_YEAR)
++
++//if c evaluates to 0, execute t_error with the specified error message
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++struct time_intervals {
++	char *description;
++	time_t seconds;
++};
++
++static void test_difftime_helper(double result, double expected)
++{
++	TEST(result == expected,
++	     "difftime() test failed, expected %.0f (seconds), got  %.0f "
++	     "(seconds)\n",
++	     expected, result);
++}
++
++static void test_positive_difftime(time_t reference_time,
++                                   struct time_intervals interval)
++{
++	time_t later_time = reference_time + interval.seconds;
++	double result = difftime(later_time, reference_time);
++	test_difftime_helper(result, (double)interval.seconds);
++}
++
++static void test_negative_difftime(time_t reference_time,
++                                   struct time_intervals interval)
++{
++	time_t earlier_time = reference_time - interval.seconds;
++	double result = difftime(earlier_time, reference_time);
++	test_difftime_helper(result, (double)((-1) * interval.seconds));
++}
++
++static void test_difftime(void)
++{
++	// Array of time intervals to test (both positive and zero)
++	struct time_intervals intervals[] = {
++	    {"0 time difference (same time)", 0},
++	    {"1 second", 1},
++	    {"1 minute", SECONDS_IN_A_MINUTE},
++	    {"1 hour", SECONDS_IN_AN_HOUR},
++	    {"1 day", SECONDS_IN_A_DAY},
++	    {"1 week", SECONDS_IN_A_WEEK},
++	    {"1 month", SECONDS_IN_A_MONTH},
++	    {"1 year", SECONDS_IN_A_YEAR},
++	    {"10 year", SECONDS_IN_10_YEARS},
++	    {"100 year", SECONDS_IN_100_YEARS},
++	    {"LONG_MAX", LONG_MAX}, // edge case: large pos time
++	    {"LONG_MIN", LONG_MIN}, // edge case: large neg time
++	};
++
++	// Get the current time as the reference point
++	time_t current_time = time(NULL);
++	if (current_time == (time_t)-1 || errno != 0) {
++		t_error("time() did not work correctly, Errno: %s\n", strerror(errno));
++		return;
++	}
++
++	// loop through the time intervals for positive and negative time differences
++	int LOOP_LEN = sizeof(intervals) / sizeof(intervals[0]);
++	for (int i = 0; i < LOOP_LEN; ++i) {
++
++		test_positive_difftime(current_time, intervals[i]);
++
++		test_negative_difftime(current_time, intervals[i]);
++	}
++	return;
++}
++
++int main(void)
++{
++	test_difftime();
++	return t_status;
++}
+diff --git a/src/functional/execve.c b/src/functional/execve.c
+new file mode 100644
+index 0000000..d8a0055
+--- /dev/null
++++ b/src/functional/execve.c
+@@ -0,0 +1,271 @@
++/*
++ * execve unit test
++ *
++ * Note: The following POSIX errors is not testing:
++ * - The new process image file has appropriate privileges and has a recognized
++ *   executable binary format, but the system does not support execution of a
++ *   file with this format (set errno to EINVAL). This is not tested as it is
++ *   system dependent.
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <limits.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/stat.h>
++#include <sys/wait.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TESTE(c, ...) (!(c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TESTFILE "testfile"
++#define DIR_NAME "testdir/"
++#define NON_EXEC_PERM 0666
++#define EXEC_PERM 0777
++#define NON_SEARCH_PERM 0444
++
++static void file_creator_helper(int valid, char *filename, mode_t perm)
++{
++	FILE *file = fopen(filename, "w");
++	TESTE(file == NULL, "fopen() failed with errno: %s\n", strerror(errno));
++
++	// writes shebang to file to make it a valid process image
++	if (valid) {
++		TESTE(fprintf(file, "#!/bin/bash\n") < 0,
++		      "fprintf() failed with errno: %s\n", strerror(errno));
++	}
++
++	TESTE(chmod(filename, perm) == -1, "chmod() failed with errno: %s\n",
++	      strerror(errno));
++
++	TESTE(fclose(file) == EOF, "fclose() failed with errno: %s\n",
++	      strerror(errno));
++}
++
++static void test_non_existent_file(void)
++{
++	char *argv[] = {TESTFILE, NULL};
++	char *envp[] = {NULL};
++	int retval = execve(argv[0], argv, envp);
++
++	TEST(
++	    retval == -1 && errno == ENOENT,
++	    "Failed to set errno to ENOENT when given non-existant path. Returned  "
++	    "%d, errno: %s\n",
++	    retval, strerror(errno));
++}
++
++static void test_non_executable_file(void)
++{
++	file_creator_helper(1, TESTFILE, NON_EXEC_PERM);
++
++	char *argv[] = {TESTFILE, NULL};
++	char *envp[] = {NULL};
++
++	int retval = execve(argv[0], argv, envp);
++
++	TEST(retval == -1 && errno == EACCES,
++	     "Failed to set errno to EACCES when given non-executable file. "
++	     "Returned  "
++	     "%d, errno: %s\n",
++	     retval, strerror(errno));
++
++	remove(TESTFILE);
++}
++
++static void test_non_regular_file(void)
++{
++	// path to dir rather than file
++	TESTE(mkdir(DIR_NAME, EXEC_PERM) == -1, "mkdir() failed with errno: %s\n",
++	      strerror(errno));
++
++	char *argv[] = {DIR_NAME, NULL};
++	char *envp[] = {NULL};
++
++	int retval = execve(argv[0], argv, envp);
++
++	TEST(retval == -1 && errno == EACCES,
++	     "Failed to set errno to EACCES when given path to non-regular file. "
++	     "Returned  "
++	     "%d, errno: %s\n",
++	     retval, strerror(errno));
++
++	rmdir(DIR_NAME);
++}
++
++static void test_oversized_arg_list(void)
++{
++	file_creator_helper(1, TESTFILE, EXEC_PERM);
++
++	// place argv on heap to avoid stack space restrictions
++	char **argv = NULL;
++	argv = malloc((ARG_MAX + 1) * sizeof(char *));
++	if (argv == NULL) {
++		t_error("malloc() failed with errno %s\n", strerror(errno));
++	}
++
++	// Fill the allocated memory
++	for (int i = 0; i < ARG_MAX; ++i) {
++		argv[i] = TESTFILE;
++	}
++
++	char *envp[] = {NULL};
++
++	int retval = execve(argv[0], argv, envp);
++	TEST(retval == -1 && errno == E2BIG,
++	     "Failed to set errno to E2BIG when given path to oversized argument "
++	     "list. "
++	     "Returned  "
++	     "%d, errno: %s\n",
++	     retval, strerror(errno));
++
++	remove(TESTFILE);
++	free(argv);
++}
++
++static void test_search_permission_denied(void)
++{
++	TESTE(mkdir(DIR_NAME, NON_SEARCH_PERM) == -1,
++	      "mkdir() failed with errno: %s\n", strerror(errno));
++
++	char *argv[] = {DIR_NAME, NULL};
++	char *envp[] = {NULL};
++
++	int retval = execve(argv[0], argv, envp);
++
++	TEST(retval == -1 && errno == EACCES,
++	     "Failed to set errno to EACCES when search permission is denied for a "
++	     "directory in the new process image file's path. "
++	     "Returned  "
++	     "%d, errno: %s\n",
++	     retval, strerror(errno));
++
++	rmdir(DIR_NAME);
++}
++
++static void test_symlink_loop(void)
++{
++	TESTE(symlink("link2", "link1") == -1, "symlink() failed with errno: %s\n",
++	      strerror(errno));
++	TESTE(symlink("link1", "link2") == -1, "symlink() failed with errno: %s\n",
++	      strerror(errno));
++
++	char *argv[] = {"link1", NULL};
++	char *envp[] = {NULL};
++
++	int retval = execve(argv[0], argv, envp);
++	TEST(retval == -1 && errno == ELOOP,
++	     "Failed to set errno to ELOOP when symbolic link loop exists in path. "
++	     "Returned %d, errno: %s\n",
++	     retval, strerror(errno));
++
++	unlink("link1");
++	unlink("link2");
++}
++
++static void test_oversized_path_name(void)
++{
++	char *path = NULL;
++	path = malloc((NAME_MAX + 2) * sizeof(char));
++	if (path == NULL) {
++		t_error("malloc() failed with errno %s\n", strerror(errno));
++	}
++
++	memset(path, 'a', NAME_MAX + 1);
++	path[NAME_MAX + 1] = '\0';
++
++	char *argv[] = {path, NULL};
++	char *envp[] = {NULL};
++
++	int retval = execve(argv[0], argv, envp);
++	TEST(retval == -1 && errno == ENAMETOOLONG,
++	     "Failed to set errno to ENAMETOOLONG when path string is greater than "
++	     "NAME_MAX."
++	     "Returned %d, errno: %s\n",
++	     retval, strerror(errno));
++
++	free(path);
++}
++
++static void test_not_a_directory(void)
++{
++	char *filename = "file";
++	file_creator_helper(1, filename, EXEC_PERM);
++
++	char *argv[] = {"file/", NULL};
++	char *envp[] = {NULL};
++
++	int retval = execve(argv[0], argv, envp);
++	TEST(retval == -1 && errno == ENOTDIR,
++	     "Failed to set errno to ENOTDIR when path prefix is an existing file "
++	     "that "
++	     "is not a directory or a symbolic link to a directory."
++	     "Returned %d, errno: %s\n",
++	     retval, strerror(errno));
++
++	remove(filename);
++}
++
++static void test_unrecognised_format(void)
++{
++	file_creator_helper(0, TESTFILE, EXEC_PERM);
++
++	char *argv[] = {TESTFILE, NULL};
++	char *envp[] = {NULL};
++
++	int retval = execve(argv[0], argv, envp);
++	TEST(retval == -1 && errno == ENOEXEC,
++	     "Failed to set errno to ENOEXEC when file permissions are appropriate "
++	     "but "
++	     "format of file is unrecognized."
++	     "Returned %d, errno: %s\n",
++	     retval, strerror(errno));
++
++	remove(TESTFILE);
++}
++
++static void test_success(void)
++{
++	file_creator_helper(1, TESTFILE, EXEC_PERM);
++
++	pid_t pid = fork();
++
++	if (pid == -1) {
++		t_error("fork() failed with errno %s\n", strerror(errno));
++	} else if (pid == 0) {
++		// child
++		char *argv[] = {TESTFILE, NULL};
++		char *envp[] = {NULL};
++		int retval = execve(argv[0], argv, envp);
++
++		// if this is reached, execve failed
++		t_error("execve failed with status %d. Errno: %s\n", retval,
++		        strerror(errno));
++
++		exit(EXIT_FAILURE);
++	} else {
++		// parent
++		int status = -1;
++		waitpid((pid_t)-1, &status, 0);
++
++		TEST(status == 0, "execve() failed. Child process return %d\n",
++		     status && 0377);
++	}
++	remove(TESTFILE);
++}
++
++int main(void)
++{
++	test_non_existent_file();
++	test_non_executable_file();
++	test_non_regular_file();
++	test_oversized_arg_list();
++	test_search_permission_denied();
++	test_symlink_loop();
++	test_oversized_path_name();
++	test_not_a_directory();
++	test_unrecognised_format();
++	test_success();
++	return t_status;
++}
+diff --git a/src/functional/gmtime_r.c b/src/functional/gmtime_r.c
+new file mode 100644
+index 0000000..172318e
+--- /dev/null
++++ b/src/functional/gmtime_r.c
+@@ -0,0 +1,171 @@
++/*
++ * gmtime_r.c unit test
++ */
++#include "test.h"
++#include "utils.h"
++#include <errno.h>
++#include <limits.h>
++#include <pthread.h>
++#include <string.h>
++#include <time.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++// Compare the values of two tm structures for equality
++#define TM_COMPARE(x, y) \
++	(((x) == (y)) || t_error("Expected " #x " %d to equal " #y " %d\n", x, y))
++
++#define TM_BOUNDS(lower, x, upper) \
++	((((x) <= (upper)) && ((x) >= (lower))) || \
++	 t_error("Expected %d to be less than upper bound %d, and greater than " \
++	         "lower bound %d", \
++	         x, upper, lower))
++
++#define TM(ss, mm, hh, md, mo, yr, wd, yd, dst) \
++	(struct tm) \
++	{ \
++		.tm_sec = (ss), .tm_min = (mm), .tm_hour = (hh), .tm_mday = (md), \
++		.tm_mon = (mo), .tm_year = (yr), .tm_wday = (wd), .tm_yday = (yd), \
++		.tm_isdst = (dst) \
++	}
++
++#define MAX_THREADS 59
++#define MAX_ITERATIONS 100
++
++// 00:00:00 UTC, 1st January 1970
++#define TM_EPOCH TM(0, 0, 0, 1, 0, 70, 4, 0, 0)
++
++// 3:14:07 UTC, 19th January 2038
++#define TM_Y2038_1S TM(7, 14, 3, 19, 0, 138, 2, 18, 0)
++
++// 3:14:08 UTC, 19th January 2038
++#define TM_Y2038 TM(8, 14, 3, 19, 0, 138, 2, 18, 0)
++
++// Leap year 29th Feb 2024
++#define TM_LEAPYEAR TM(0, 0, 0, 29, 1, 124, 4, 59, 0)
++
++static void compare_tm_structs(const struct tm *tm1, const struct tm *tm2)
++{
++	TM_COMPARE(tm1->tm_sec, tm2->tm_sec);
++	TM_COMPARE(tm1->tm_min, tm2->tm_min);
++	TM_COMPARE(tm1->tm_hour, tm2->tm_hour);
++	TM_COMPARE(tm1->tm_mday, tm2->tm_mday);
++	TM_COMPARE(tm1->tm_mon, tm2->tm_mon);
++	TM_COMPARE(tm1->tm_year, tm2->tm_year);
++	TM_COMPARE(tm1->tm_wday, tm2->tm_wday);
++	TM_COMPARE(tm1->tm_yday, tm2->tm_yday);
++	TM_COMPARE(tm1->tm_isdst, tm2->tm_isdst);
++}
++
++static void test_tm_bounds(const struct tm *tm)
++{
++	// See ISO C99 Section 7.23.1 for more information
++	// 60 to account for leap seconds on certain systems
++	TM_BOUNDS(0, tm->tm_sec, 60);
++	TM_BOUNDS(0, tm->tm_min, 59);
++	TM_BOUNDS(0, tm->tm_hour, 23);
++	TM_BOUNDS(1, tm->tm_mday, 31);
++	TM_BOUNDS(0, tm->tm_mon, 11);
++	TM_BOUNDS(0, tm->tm_wday, 6);
++	TM_BOUNDS(0, tm->tm_yday, 365);
++}
++
++static void test_tm(time_t time, const struct tm *expected,
++                    int overflow_expected)
++{
++	struct tm gmt;
++	struct tm *result = gmtime_r(&time, &gmt);
++
++	if (overflow_expected) {
++		TEST(result == NULL, "gmtime_r expected NULL return, got %p", result);
++		TEST(errno == EOVERFLOW, "gmtime_r expected overflow, got %s",
++		     strerror(errno));
++	} else {
++		TEST(&gmt == result,
++		     "gmtime_r returned the pointer %p, not the supplied stucture %p\n",
++		     result, gmt);
++
++		compare_tm_structs(result, expected);
++	}
++}
++
++static void *get_gmtime(void *arguments)
++{
++	const time_t thread_time = *(time_t *)arguments;
++
++	for (int i = 0; i < MAX_ITERATIONS; ++i) {
++		struct tm tm = {0};
++		struct tm *result = gmtime_r((time_t *)&thread_time, &tm);
++
++		if (result == NULL) {
++			t_error("gmtime_r returned NULL, expected populated tm struct");
++			continue;
++		}
++
++		struct tm expected = TM_EPOCH;
++		expected.tm_sec = (int)thread_time;
++		compare_tm_structs(result, &expected);
++	}
++
++	return 0;
++}
++
++static void test_gmtime_concurrency(void)
++{
++	time_t gmtimes[MAX_THREADS] = {0};
++	for (unsigned index = 0; index < MAX_THREADS; ++index) {
++		gmtimes[index] = index;
++	}
++
++	create_and_join_threads(MAX_THREADS, NULL, get_gmtime, gmtimes,
++	                        sizeof(*gmtimes));
++}
++
++static void test_current_time(void)
++{
++	const time_t current_time = time(NULL);
++	struct tm current_tm = {0};
++	const struct tm *result = gmtime_r(&current_time, &current_tm);
++
++	if (result == NULL) {
++		t_error("gmtime_r returned NULL, expected populated tm struct");
++		return;
++	}
++
++	test_tm_bounds(result);
++}
++
++static void test_gmt_times(void)
++{
++	// Test the UNIX epoch
++	const time_t epoch = 0LL;
++	test_tm(epoch, &TM_EPOCH, 0);
++
++	// Test one second before 2038
++	const time_t before_2038 = INT_MAX;
++	test_tm(before_2038, &TM_Y2038_1S, 0);
++
++	// 32 bit time architectures can overflow
++	const int can_overflow = (time_t)LLONG_MAX != LLONG_MAX;
++
++	// Test the year 2038 problem
++	const time_t overflow_2038 = (long long)INT_MAX + 1;
++	test_tm(overflow_2038, &TM_Y2038, can_overflow);
++
++	// Test a complete overflow
++	const time_t overflow = LLONG_MAX;
++	test_tm(overflow, &TM_Y2038, 1);
++
++	// Test February 29th 2024
++	const time_t leap_year = 1709164800;
++	test_tm(leap_year, &TM_LEAPYEAR, 0);
++}
++
++int main(void)
++{
++	test_gmt_times();
++	test_current_time();
++	test_gmtime_concurrency();
++
++	return t_status;
++}
+diff --git a/src/functional/localtime_r.c b/src/functional/localtime_r.c
+new file mode 100644
+index 0000000..05e149c
+--- /dev/null
++++ b/src/functional/localtime_r.c
+@@ -0,0 +1,222 @@
++/*
++ * localtime_r unit test
++ */
++
++#include "test.h"
++#include "utils.h"
++#include <errno.h>
++#include <limits.h>
++#include <pthread.h>
++#include <stdio.h>
++#include <string.h>
++#include <time.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define NUM_THREADS 100
++#define NUM_REENTRANTS 100
++#define SECONDS_IN_A_DAY 86400
++
++// Structure to hold results for the thread safety test
++struct result {
++	pthread_t thread_id;
++	struct tm timeinfo;
++	time_t rawtime;
++	int status;
++	int index;
++};
++
++// Function to verify that the struct tm fields are within expected ranges
++static void validate_tm_fields(const struct tm *timeinfo)
++{
++	TEST(timeinfo->tm_year >= 70,
++	     "Years since 1900, should be atleast 70 (1970+).\n");
++	TEST(timeinfo->tm_mon >= 0 && timeinfo->tm_mon < 12,
++	     "Months range 0-11.\n"); // Months range 0-11
++	TEST(timeinfo->tm_mday > 0 && timeinfo->tm_mday <= 31,
++	     "Days of the month range 1-31.\n"); // Days of the month
++	TEST(timeinfo->tm_hour >= 0 && timeinfo->tm_hour < 24,
++	     "Hours within range.\n"); // Hours within range
++	TEST(timeinfo->tm_min >= 0 && timeinfo->tm_min < 60,
++	     "Minutes within range.\n"); // Minutes within range
++	TEST(timeinfo->tm_sec >= 0 && timeinfo->tm_sec < 60,
++	     "Seconds within range.\n"); // Seconds within range
++
++	return;
++}
++
++// Function to verify that the struct tm fields are as expected
++static void compare_tm_fields(const struct tm *actual,
++                              const struct tm *expected)
++{
++	TEST(actual->tm_year == expected->tm_year, "Years did not match.\n");
++	TEST(actual->tm_mon == expected->tm_mon,
++	     "Months did not match.\n"); // Months range 0-11
++	TEST(actual->tm_mday == expected->tm_mday,
++	     "Days of the month did not match.\n"); // Days of the month
++	TEST(actual->tm_hour == expected->tm_hour,
++	     "Hours did not match.\n"); // Hours within range
++	TEST(actual->tm_min == expected->tm_min,
++	     "Minutes did not match.\n"); // Minutes within range
++	TEST(actual->tm_sec == expected->tm_sec,
++	     "Seconds did not match.\n"); // Seconds within range
++
++	// Check the Daylight Saving Time flag (tm_isdst)
++	TEST((actual->tm_isdst == expected->tm_isdst),
++	     "Daylight Saving Time flag did not match.\n");
++	return;
++}
++
++void reentrant_call(int depth, time_t *rawtime, void *buffer)
++{
++	if (depth <= 0)
++		return;
++
++	for (int i = 0; i < depth; ++i) {
++		errno = 0;
++		// Call localtime_r and store the result
++		struct tm *result = localtime_r(rawtime, (struct tm *)buffer);
++		TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++	}
++	return;
++}
++
++// Function for each thread to execute on the thread safety test
++static void *thread_safety_function(void *arg)
++{
++	struct result *res = (struct result *)arg;
++
++	errno = 0; // reset the errno before calling localtime_r
++	// Call localtime_r and store the result
++	res->rawtime += (time_t)(res->index * SECONDS_IN_A_DAY);
++	reentrant_call(NUM_REENTRANTS, &res->rawtime, (void *)&res->timeinfo);
++
++	res->thread_id = pthread_self();
++	res->status = 0;
++	return NULL;
++}
++
++// Function to test localtime_r in a multi threaded context
++static void test_localtime_r_thread_safety_and_reentrancy(
++    struct result results[])
++{
++	// Read the current time once before creating the threads
++	time_t basetime = time(NULL);
++
++	// create threads
++	for (int i = 0; i < NUM_THREADS; ++i) {
++		results[i].index = i;
++		results[i].status = -1;
++		results[i].rawtime = basetime;
++	}
++
++	create_and_join_threads(NUM_THREADS, NULL, thread_safety_function, results,
++	                        sizeof(struct result));
++
++	struct tm expected_timeinfo;
++	struct tm *result = NULL;
++
++	// Validate the results after all threads have finished
++	for (int i = 0; i < NUM_THREADS; ++i) {
++		TEST(results[i].status == 0,
++		     "Thread safety function failed to execute correctly for "
++		     "Thread_id: %d\n",
++		     results[i].thread_id);
++
++		if (results[i].status == 0) {
++			// Verify that the struct tm fields are within expected ranges
++			validate_tm_fields(&results[i].timeinfo);
++
++			errno = 0; // reset the errno before calling localtime_r
++			result = localtime_r(&results[i].rawtime, &expected_timeinfo);
++			TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++			// Verify that the actual values match the expected values
++			compare_tm_fields(&results[i].timeinfo, &expected_timeinfo);
++		}
++	}
++	return;
++}
++
++static void test_localtime_r(void)
++{
++	struct tm timeinfo;
++
++	// Test case 1: Valid time_t inputs
++	// Get the current time as time_t
++	time_t rawtime = time(NULL);
++
++	// Convert time_t to local time representation using localtime_r
++	struct tm *result = localtime_r(&rawtime, &timeinfo);
++
++	// Verify that the result is not NULL
++	TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++
++	// Verify that the struct tm fields are within expected ranges
++	validate_tm_fields(&timeinfo);
++
++#if 0
++	// FIXME: Test cases 2 to 4 are commented out because the localtime_r function
++	// currently segfaults when attempting to write to a NULL pointer.
++	// This is an area that could be reworked in the future to handle NULL
++	// parameters gracefully.
++
++	// Test case 2: Invalid time_t input (NULL pointer)
++	result = localtime_r(NULL, &timeinfo);
++	// Verify the result is NULL and errno is set
++	TEST(result == NULL && errno == 0, "%s\n", strerror(errno));
++
++	// Test case 3: Invalid struct tm pointer (NULL pointer)
++	result = localtime_r(&rawtime, NULL);
++	// Verify that the result is NULL and errno is set
++	TEST(result == NULL && errno == 0, "%s\n", strerror(errno));
++
++	// Test case 4: Invalid time_t and Invalid struct tm pointer (NULL pointers)
++	result = localtime_r(NULL, NULL);
++	// Verify that the result is NULL and errno is set
++	TEST(result == NULL && errno == 0, "%s\n", strerror(errno));
++#endif
++
++	// Test case 5: Edge case (time_t value of 0, the Unix epoch)
++	rawtime = 0;
++	result = localtime_r(&rawtime, &timeinfo);
++	// Verify that the result is not NULL
++	TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++
++	// Verify that the result is not NULL and fields are within expected ranges
++	TEST(timeinfo.tm_year == 70 && errno == 0,
++	     "Years since 1900, should be 70 (1970). Error: %s\n",
++	     strerror(errno)); // 1970
++	TEST(timeinfo.tm_mon == 0 && errno == 0,
++	     "Months should be January. Error: %s\n",
++	     strerror(errno)); // January
++	TEST(timeinfo.tm_mday == 1 && errno == 0,
++	     "Month day should be 1st. Error: %s\n", strerror(errno)); // 1st
++	validate_tm_fields(&timeinfo);
++
++	// Test case 6: time_t max 32-bit value (far future date)
++	rawtime = INT_MAX;
++	result = localtime_r(&rawtime, &timeinfo);
++	// Verify that the result is not NULL
++	TEST(result != NULL && errno == 0, "%s\n", strerror(errno));
++
++	// Test case 7: time_t overflow check max
++	rawtime = LONG_MAX;
++	result = localtime_r(&rawtime, &timeinfo);
++	// Verify that the result is NULL and errno EOVERFLOW is returned
++	TEST(result == NULL && errno == EOVERFLOW, "%s\n", strerror(errno));
++
++	// Test case 8: time_t overflow check min
++	rawtime = LONG_MIN;
++	result = localtime_r(&rawtime, &timeinfo);
++	// Verify that the result is NULL and errno EOVERFLOW is returned
++	TEST(result == NULL && errno == EOVERFLOW, "%s\n", strerror(errno));
++	return;
++}
++
++int main(void)
++{
++	struct result results[NUM_THREADS];
++	test_localtime_r();
++	test_localtime_r_thread_safety_and_reentrancy(results);
++
++	return t_status;
++}
+diff --git a/src/functional/mq_close.c b/src/functional/mq_close.c
+new file mode 100644
+index 0000000..c814302
+--- /dev/null
++++ b/src/functional/mq_close.c
+@@ -0,0 +1,121 @@
++/*
++ * mq_close unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <fcntl.h>
++#include <mqueue.h>
++#include <semaphore.h>
++#include <signal.h>
++#include <string.h>
++#include <sys/wait.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TESTE(c, ...) (!(c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define MQ_NAME "/testqueue"
++#define PERMISSIONS (mode_t)0644
++
++static void test_notification_request_removed(void)
++{
++	sem_t *sem1 = sem_open("/sem1", O_CREAT, PERMISSIONS, 0);
++	TESTE(sem1 == SEM_FAILED, "sem_open() failed with errno %s\n",
++	      strerror(errno));
++
++	sem_t *sem2 = sem_open("/sem2", O_CREAT, PERMISSIONS, 0);
++	TESTE(sem2 == SEM_FAILED, "sem_open() failed with errno %s\n",
++	      strerror(errno));
++
++	if (sem1 == NULL || sem2 == NULL) {
++		return;
++	}
++
++	const struct sigevent sev = {.sigev_notify = SIGEV_NONE};
++
++	pid_t pid = fork();
++
++	if (pid == -1) {
++		t_error("fork() failed with errno %s\n", strerror(errno));
++	} else if (pid == 0) {
++		// child process
++		// create mq
++		mqd_t mqdes = mq_open(MQ_NAME, O_CREAT | O_RDWR, PERMISSIONS, 0);
++		TESTE(mqdes == (mqd_t)-1, "mq_open() failed with errno %s\n",
++		      strerror(errno));
++
++		// register child process for notification
++		TESTE(mq_notify(mqdes, &sev) == -1,
++		      "mq_notify() failed with errno %s\n", strerror(errno));
++
++		TESTE(sem_post(sem1) == -1, "sem_post() failed with errno %s\n",
++		      strerror(errno));
++
++		TESTE(sem_wait(sem2) == -1, "sem_wait() failed with errno %s\n",
++		      strerror(errno));
++
++		// close the mq in the child process. This should remove the registered
++		// notification and allow for another process to register.
++		TESTE(mq_close(mqdes) == -1, "mq_close() failed with errno %s\n",
++		      strerror(errno));
++
++		TESTE(sem_post(sem1) == -1, "sem_post() failed with errno %s\n",
++		      strerror(errno));
++
++		// wait here for parent to finish testing
++		TESTE(sem_wait(sem2) == -1, "sem_wait() failed with errno %s\n",
++		      strerror(errno));
++	} else {
++		// parent process
++		TESTE(sem_wait(sem1) == -1, "sem_wait() failed with errno %s\n",
++		      strerror(errno));
++
++		// open mq created by child process
++		mqd_t mqdes = mq_open(MQ_NAME, O_RDWR);
++		TESTE(mqdes == -1, "mq_open() failed with errno\n", strerror(errno));
++
++		// attempt to register for notification (mq can only have one process
++		// registered for notification at one time)
++		TEST(mq_notify(mqdes, &sev) == -1 && errno == EBUSY,
++		     "Expected mq_notify() to fail with errno %s, got %s\n",
++		     strerror(EBUSY), strerror(errno));
++
++		TESTE(sem_post(sem2) == -1, "sem_post() failed with errno %s\n",
++		      strerror(errno));
++
++		TESTE(sem_wait(sem1) == -1, "sem_wait() failed with errno %s\n",
++		      strerror(errno));
++
++		// This should now succeed
++		TEST(mq_notify(mqdes, &sev) == 0, "mq_notify() failed with errno %s\n",
++		     strerror(errno));
++
++		TESTE(sem_post(sem2) == -1, "sem_post() failed with errno %s\n",
++		      strerror(errno));
++
++		waitpid(pid, NULL, 0);
++		mq_close(mqdes);
++		mq_unlink(MQ_NAME);
++		sem_close(sem1);
++		sem_unlink("/sem1");
++		sem_close(sem2);
++		sem_unlink("/sem2");
++	}
++}
++
++int main(void)
++{
++	mqd_t mqdes = mq_open(MQ_NAME, O_CREAT | O_RDWR, PERMISSIONS, 0);
++
++	TEST(mq_close(mqdes) == 0, "mq_close() failed with errno %s\n",
++	     strerror(errno));
++
++	TEST(mq_close(mqdes) == -1 && errno == EBADF,
++	     "Invalid message queue descriptor test failed. Expected %s, got %s\n",
++	     strerror(EBADF), strerror(errno));
++
++	mq_unlink(MQ_NAME);
++
++	test_notification_request_removed();
++
++	return t_status;
++}
+diff --git a/src/functional/mq_getattr.c b/src/functional/mq_getattr.c
+new file mode 100644
+index 0000000..6da808e
+--- /dev/null
++++ b/src/functional/mq_getattr.c
+@@ -0,0 +1,76 @@
++/*
++ * mq_getattr unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <fcntl.h>
++#include <mqueue.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define MQ_NAME "/testqueue"
++#define PERMISSIONS (mode_t)0644
++#define MAX_MSG 10
++#define MSG_SIZE 256
++
++static void test_invalid_mq_descriptor(void)
++{
++	struct mq_attr attr = {0};
++	TEST(mq_getattr((mqd_t)-1, &attr) == -1 && errno == EBADF,
++	     "Invalid mq descriptor test failed. Expected %s, got %s\n",
++	     strerror(EBADF), strerror(errno));
++}
++
++static void test_mq_getattr(void)
++{
++	const struct mq_attr attr = {
++	    .mq_flags = 0,
++	    .mq_maxmsg = MAX_MSG,
++	    .mq_msgsize = MSG_SIZE,
++	    .mq_curmsgs = 0,
++	};
++
++	mqd_t mqdes =
++	    mq_open(MQ_NAME, O_CREAT | O_RDWR | O_NONBLOCK, PERMISSIONS, &attr);
++	if (mqdes == (mqd_t)-1) {
++		t_error("mq_open() failed with errno: %s\n", strerror(errno));
++	}
++
++	struct mq_attr result_attr = {0};
++
++	TEST(mq_getattr(mqdes, &result_attr) == 0,
++	     "mq_getattr() failed with errno %s\n", strerror(errno));
++
++	TEST(result_attr.mq_flags == O_NONBLOCK,
++	     "result_attr.mq_flags did not match the original value. Expected %ld, "
++	     "got "
++	     "%ld\n",
++	     O_NONBLOCK, result_attr.mq_flags);
++	TEST(result_attr.mq_maxmsg == MAX_MSG,
++	     "result_attr.mq_maxmsg did not match the original value. Expected "
++	     "%ld, got "
++	     "%ld\n",
++	     MAX_MSG, result_attr.mq_maxmsg);
++	TEST(result_attr.mq_msgsize == MSG_SIZE,
++	     "result_attr.mq_msgsize did not match the original value. Expected "
++	     "%ld, "
++	     "got "
++	     "%ld\n",
++	     MSG_SIZE, result_attr.mq_msgsize);
++	TEST(result_attr.mq_curmsgs == 0,
++	     "result_attr.mq_curmsgs did not match the expected value. Expected 0, "
++	     "got "
++	     "%ld\n",
++	     result_attr.mq_curmsgs);
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++}
++
++int main(void)
++{
++	test_invalid_mq_descriptor();
++	test_mq_getattr();
++	return t_status;
++}
+diff --git a/src/functional/mq_notify.c b/src/functional/mq_notify.c
+new file mode 100644
+index 0000000..b912eec
+--- /dev/null
++++ b/src/functional/mq_notify.c
+@@ -0,0 +1,137 @@
++/*
++ * mq_notify unit test function
++ *
++ * Note: Due to the non-deterministic nature of the scheduler, it is difficult
++ * to test that a thread calling mq_receive will receive the notification first
++ * instead of a thread that has registered to be notified. It is possible with
++ * a sleep call, however, this will yield unexpected failures in rare cases.
++ */
++#include "test.h"
++#include <errno.h>
++#include <fcntl.h>
++#include <mqueue.h>
++#include <pthread.h>
++#include <semaphore.h>
++#include <signal.h>
++#include <stdio.h>
++#include <string.h>
++#include <sys/types.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define MSGQ_NAME "/mq_notify_queue"
++#define PERM 0644
++
++static sem_t sem_notify;
++static int notify_flag = 0;
++
++static void notify_handler(union sigval sig)
++{
++	notify_flag = 1;
++	sem_post(&sem_notify);
++}
++
++static mqd_t create_messagequeue(int flags)
++{
++	mqd_t mqdes = mq_open(MSGQ_NAME, flags, PERM, 0);
++
++	if (mqdes == -1) {
++		t_error("Failed to create message queue with flags: %x. Error: %s\n",
++		        flags, strerror(errno));
++	}
++
++	return mqdes;
++}
++
++static mqd_t create_mq_notify(const struct sigevent *sev)
++{
++	mqd_t mqdes = create_messagequeue(O_CREAT | O_RDWR);
++
++	int status = mq_notify(mqdes, sev);
++	TEST(status == 0, "Expected success, got %d, error: %s\n", status,
++	     strerror(errno));
++
++	return mqdes;
++}
++
++static void test_multiple_registrations(void)
++{
++	const struct sigevent sev = {.sigev_notify = SIGEV_NONE};
++	mqd_t mqdes = create_mq_notify(&sev);
++
++	int status = mq_notify(mqdes, &sev);
++	TEST(status == -1, "Expected failure, got %d\n", status);
++	TEST(errno == EBUSY, "Expected EBUSY errno, got %s\n", strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MSGQ_NAME);
++}
++
++static void test_notification_removal(void)
++{
++	const struct sigevent sev = {.sigev_notify = SIGEV_NONE};
++	mqd_t mqdes = create_mq_notify(&sev);
++
++	int status = mq_notify(mqdes, NULL);
++	TEST(status == 0,
++	     "Expected success on notification removal, got %d, error: %s\n",
++	     status, strerror(errno));
++
++	// Should be able to re-register
++	status = mq_notify(mqdes, &sev);
++	TEST(status == 0, "Expected success, got %d, error: %s\n", status,
++	     strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MSGQ_NAME);
++}
++
++static void test_notification_received(void)
++{
++	const struct sigevent sev = {.sigev_notify = SIGEV_THREAD,
++	                             .sigev_notify_function = notify_handler};
++	mqd_t mqdes = create_mq_notify(&sev);
++
++	sem_init(&sem_notify, 0, 0);
++	const char message[] = "test";
++	int status = mq_send(mqdes, message, sizeof(message), 0);
++	if (status != 0) {
++		t_error("Failed sending message to queue: %d, error: %s\n", status,
++		        strerror(errno));
++	}
++	sem_wait(&sem_notify);
++	TEST(notify_flag == 1, "Expected SIGEV_THREAD function to run\n");
++
++	// Test that the process can re-register after receiving a mq notification
++	const struct sigevent sev_none = {.sigev_notify = SIGEV_NONE};
++	status = mq_notify(mqdes, &sev_none);
++	TEST(status == 0,
++	     "Expected mq_notify to allow registration, instead got status: %d\n",
++	     status);
++
++	sem_destroy(&sem_notify);
++	mq_close(mqdes);
++	mq_unlink(MSGQ_NAME);
++}
++
++static void test_bad_mqdes(void)
++{
++	const struct sigevent sev = {.sigev_signo = 0};
++	int status = mq_notify(-1, &sev);
++
++	TEST(status == -1,
++	     "Expected return value of -1 for invalid mqdes, got %d\n", status);
++
++	TEST(errno == EBADF, "Expected EBADF for invalid mqdes, got %s\n",
++	     strerror(errno));
++}
++
++int main(void)
++{
++	errno = 0;
++	test_bad_mqdes();
++	test_multiple_registrations();
++	test_notification_removal();
++	test_notification_received();
++
++	return t_status;
++}
+diff --git a/src/functional/mq_open.c b/src/functional/mq_open.c
+new file mode 100644
+index 0000000..abcfdfd
+--- /dev/null
++++ b/src/functional/mq_open.c
+@@ -0,0 +1,138 @@
++/*
++ * mq_open unit test
++ *
++ * Note: The following cases have not been tested:
++ *	* EINTR should be returned when mq_open() is interupted by a signal. Since
++ *	mq_open() does not block it would be impossible to consistently test this
++ *	result.
++ *	* EINVAL is returned when the given message queue name is not supported.
++ *	Unsupported names are unclear.
++ *	* ENFILE is returned when the number of open message queues exceed the
++ *	system limit. This is dependant of the system.
++ *	* ENOSPC is returned when there is insufficient space to create a new
++ *	message queue. This is dependant on the system state.
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <fcntl.h>
++#include <mqueue.h>
++#include <string.h>
++#include <sys/resource.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define MQ_NAME "/testqueue"
++#define PERMISSIONS (mode_t)0200
++
++static void test_max_file_descriptors(void)
++{
++	struct mq_attr attr = {
++	    .mq_flags = 0,
++	    .mq_maxmsg = 1,
++	    .mq_msgsize = 1,
++	    .mq_curmsgs = 0,
++	};
++
++	struct rlimit prev_limit = {0};
++	int retval = getrlimit(RLIMIT_NOFILE, &prev_limit);
++	if (retval != 0) {
++		t_error("getrlimit() failed with errno: %s\n", strerror(errno));
++	}
++	struct rlimit temp_limit = {
++	    .rlim_cur = 0,
++	    .rlim_max = prev_limit.rlim_max,
++	};
++
++	retval = setrlimit(RLIMIT_NOFILE, &temp_limit);
++	if (retval != 0) {
++		t_error("setrlimit() failed with errno: %s\n", strerror(errno));
++	}
++
++	TEST(mq_open(MQ_NAME, O_CREAT | O_WRONLY, PERMISSIONS, &attr) == -1 &&
++	         errno == EMFILE,
++	     "Failed to return EMFILE when file descriptor limit is reached. "
++	     "Returned %s\n",
++	     strerror(errno));
++
++	retval = setrlimit(RLIMIT_NOFILE, &prev_limit);
++	if (retval != 0) {
++		t_error("setrlimit() failed with errno: %s\n", strerror(errno));
++	}
++}
++
++static void test_mq_open(void)
++{
++	struct mq_attr attr = {
++	    .mq_flags = 0,
++	    .mq_maxmsg = 1,
++	    .mq_msgsize = 1,
++	    .mq_curmsgs = 0,
++	};
++
++	// test opening non-existant mq without setting O_CREAT
++	TEST(mq_open(MQ_NAME, O_WRONLY) == -1 && errno == ENOENT,
++	     "Failed to return ENOENT when attempting to open a non-existant mq "
++	     "without O_CREAT set. Errno: %s\n",
++	     strerror(errno));
++
++	// test successful opening of a message queue
++	mqd_t mqdes = mq_open(MQ_NAME, O_CREAT | O_WRONLY, PERMISSIONS, &attr);
++	TEST(mqdes != -1, "mq_open() failed with errno %s\n", strerror(errno));
++
++	// Attempting to open an existing mq with oflags O_CREAT and O_EXCL should
++	// fail and set errno to EEXIST
++	errno = 0;
++	TEST(mq_open(MQ_NAME, O_CREAT | O_EXCL | O_WRONLY, PERMISSIONS, &attr) ==
++	             -1 &&
++	         errno == EEXIST,
++	     "Failed to return EEXIST when both O_CREAT and O_EXCL are set and the "
++	     "named message queue already exists. Returned %s\n",
++	     strerror(errno));
++
++	// mq was created with write permissions only. Attempting to open in as both
++	// read and write should fail and set errno to EACCES.
++	errno = 0;
++	TEST(mq_open(MQ_NAME, O_RDWR) == -1 && errno == EACCES,
++	     "Failed to return EACCES when the message queue exists and the "
++	     "permission specified by oflag are denied. Returned %s\n",
++	     strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++
++	// test attempting to create mq with invalid attr
++	errno = 0;
++	attr.mq_maxmsg = 0;
++
++	int retval = mq_open(MQ_NAME, O_CREAT | O_WRONLY, PERMISSIONS, &attr);
++
++	TEST(retval == -1 && errno == EINVAL,
++	     "Failed to return EINVAL when mq_maxmsg is set to <=0. Returned %s\n",
++	     strerror(errno));
++
++	if (retval != -1) {
++		mq_close(mqdes);
++		mq_unlink(MQ_NAME);
++	}
++
++	attr.mq_maxmsg = 1;
++	attr.mq_msgsize = 0;
++
++	retval = mq_open(MQ_NAME, O_CREAT | O_WRONLY, PERMISSIONS, &attr);
++
++	TEST(retval == -1 && errno == EINVAL,
++	     "Failed to return EINVAL when mq_msgsize is set to <=0. Returned %s\n",
++	     strerror(errno));
++
++	if (retval != -1) {
++		mq_close(mqdes);
++		mq_unlink(MQ_NAME);
++	}
++}
++
++int main(void)
++{
++	test_mq_open();
++	test_max_file_descriptors();
++	return t_status;
++}
+diff --git a/src/functional/mq_receive.c b/src/functional/mq_receive.c
+new file mode 100644
+index 0000000..a471434
+--- /dev/null
++++ b/src/functional/mq_receive.c
+@@ -0,0 +1,62 @@
++/*
++ * mq_receive unit test
++ * Note: This is only a simple functionality test, as most of the functionality
++ *       has been previously tested in mq_timedreceive.c
++ */
++#include "test.h"
++#include <errno.h>
++#include <fcntl.h>
++#include <mqueue.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++#define MSGQ_NAME "/test_msgq"
++#define TEST_MESSAGE "testing"
++#define MSG_SIZE sizeof(TEST_MESSAGE)
++#define PERM 0644
++
++int main(void)
++{
++	static const struct mq_attr attr = {
++	    .mq_flags = 0,
++	    .mq_maxmsg = 1,
++	    .mq_msgsize = MSG_SIZE,
++	    .mq_curmsgs = 0,
++	};
++
++	mqd_t mqdes = mq_open(MSGQ_NAME, O_CREAT | O_RDWR, PERM, &attr);
++	if (mqdes == -1) {
++		t_error("mq_open() failed with errno: %s\n", strerror(errno));
++	}
++
++	int status = mq_send(mqdes, TEST_MESSAGE, strlen(TEST_MESSAGE), 1);
++	if (status != 0) {
++		t_error("mq_open() failed with status %d, errno: %s\n", status,
++		        strerror(errno));
++	}
++
++	char receive_buffer[MSG_SIZE] = {0};
++	unsigned priority = 0;
++
++	ssize_t len =
++	    mq_receive(mqdes, receive_buffer, sizeof(receive_buffer), &priority);
++
++	TEST(strcmp(TEST_MESSAGE, receive_buffer) == 0,
++	     "Expected sent and received message to be the same, instead got sent "
++	     "message: %s, received message: %s\n",
++	     TEST_MESSAGE, receive_buffer);
++
++	TEST(len == MSG_SIZE - 1,
++	     "Expected received length to equal %d, instead got %d, errno: %s\n",
++	     MSG_SIZE - 1, len, strerror(errno));
++
++	TEST(priority == 1,
++	     "Expected the received message priority to be 1, instead got %d\n",
++	     priority);
++
++	mq_close(mqdes);
++	mq_unlink(MSGQ_NAME);
++
++	return t_status;
++}
+diff --git a/src/functional/mq_send.c b/src/functional/mq_send.c
+new file mode 100644
+index 0000000..e6caa9a
+--- /dev/null
++++ b/src/functional/mq_send.c
+@@ -0,0 +1,60 @@
++/*
++ * mq_send unit test
++ * Note: This is only a simple functionality test, as most of the functionality
++ *       has been previously tested in mq_timedsend.c
++ */
++#include "test.h"
++#include <errno.h>
++#include <fcntl.h>
++#include <mqueue.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++#define MSGQ_NAME "/test_msgq"
++#define TEST_MESSAGE "testing"
++#define MSG_SIZE sizeof(TEST_MESSAGE)
++#define PERM 0644
++
++int main(void)
++{
++	static const struct mq_attr attr = {
++	    .mq_flags = 0,
++	    .mq_maxmsg = 1,
++	    .mq_msgsize = MSG_SIZE,
++	    .mq_curmsgs = 0,
++	};
++
++	mqd_t mqdes = mq_open(MSGQ_NAME, O_CREAT | O_RDWR, PERM, &attr);
++	if (mqdes == -1) {
++		t_error("mq_open() failed with errno: %s\n", strerror(errno));
++	}
++
++	int status = mq_send(mqdes, TEST_MESSAGE, strlen(TEST_MESSAGE), 1);
++	TEST(status == 0, "Expected mq_send to return 0, got %d, error: %s\n",
++	     status, strerror(errno));
++
++	char receive_buffer[MSG_SIZE] = {0};
++	unsigned priority = 0;
++
++	ssize_t len =
++	    mq_receive(mqdes, receive_buffer, sizeof(receive_buffer), &priority);
++
++	TEST(strcmp(TEST_MESSAGE, receive_buffer) == 0,
++	     "Expected sent and received message to be the same, instead got sent "
++	     "message: %s, received message: %s\n",
++	     TEST_MESSAGE, receive_buffer);
++
++	TEST(len == MSG_SIZE - 1,
++	     "Expected received length to equal %d, instead got %d, errno: %s\n",
++	     MSG_SIZE - 1, len, strerror(errno));
++
++	TEST(priority == 1,
++	     "Expected the received message priority to be 1, instead got %d\n",
++	     priority);
++
++	mq_close(mqdes);
++	mq_unlink(MSGQ_NAME);
++
++	return t_status;
++}
+diff --git a/src/functional/mq_setattr.c b/src/functional/mq_setattr.c
+new file mode 100644
+index 0000000..7df3144
+--- /dev/null
++++ b/src/functional/mq_setattr.c
+@@ -0,0 +1,122 @@
++/*
++ * mq_setattr unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <fcntl.h>
++#include <mqueue.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define MQ_NAME "/testqueue"
++#define PERMISSIONS (mode_t)0644
++#define IGNORED_VALUE 123
++
++static const struct mq_attr attr = {
++    .mq_flags = O_NONBLOCK,
++    .mq_maxmsg = IGNORED_VALUE,
++    .mq_msgsize = IGNORED_VALUE,
++    .mq_curmsgs = IGNORED_VALUE,
++};
++
++static void test_invalid_mq_descriptor(void)
++{
++	TEST(mq_setattr((mqd_t)-1, &attr, NULL) == -1 && errno == EBADF,
++	     "Invalid mq descriptor test failed. Expected %s, got %s\n",
++	     strerror(EBADF), strerror(errno));
++}
++
++static void test_omqstat(void)
++{
++	// open mq with default attributes
++	mqd_t mqdes = mq_open(MQ_NAME, O_CREAT | O_RDWR, PERMISSIONS, NULL);
++	if (mqdes == (mqd_t)-1) {
++		t_error("mq_open() failed with errno: %s\n", strerror(errno));
++	}
++
++	struct mq_attr old_attr = {0};
++
++	if (mq_getattr(mqdes, &old_attr) == -1) {
++		t_error("mq_getattr() failed with errno %s\n", strerror(errno));
++	}
++
++	struct mq_attr omqstat = {0};
++
++	TEST(mq_setattr(mqdes, &attr, &omqstat) != -1,
++	     "mq_setattr() failed with errno %s\n", strerror(errno));
++
++	TEST(omqstat.mq_flags == old_attr.mq_flags,
++	     "omqstat.mq_flags did not match the original value. Expected %ld, got "
++	     "%ld\n",
++	     old_attr.mq_flags, omqstat.mq_flags);
++	TEST(
++	    omqstat.mq_maxmsg == old_attr.mq_maxmsg,
++	    "omqstat.mq_maxmsg did not match the original value. Expected %ld, got "
++	    "%ld\n",
++	    old_attr.mq_maxmsg, omqstat.mq_maxmsg);
++	TEST(omqstat.mq_msgsize == old_attr.mq_msgsize,
++	     "omqstat.mq_msgsize did not match the original value. Expected %ld, "
++	     "got "
++	     "%ld\n",
++	     old_attr.mq_msgsize, omqstat.mq_msgsize);
++	TEST(omqstat.mq_curmsgs == old_attr.mq_curmsgs,
++	     "omqstat.mq_curmsgs did not match the original value. Expected %ld, "
++	     "got "
++	     "%ld\n",
++	     old_attr.mq_curmsgs, omqstat.mq_curmsgs);
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++}
++
++static void test_mq_setattr(void)
++{
++	// open mq with default attributes
++	mqd_t mqdes = mq_open(MQ_NAME, O_CREAT | O_RDWR, PERMISSIONS, NULL);
++	if (mqdes == (mqd_t)-1) {
++		t_error("mq_open() failed with errno: %s\n", strerror(errno));
++	}
++
++	// set new attributes and store previous attributes
++	struct mq_attr prev_attr = {0};
++	TEST(mq_setattr(mqdes, &attr, &prev_attr) != -1,
++	     "mq_setattr() failed with errno %s\n", strerror(errno));
++
++	// get new attributes
++	struct mq_attr new_attr = {0};
++	if (mq_getattr(mqdes, &new_attr) == -1) {
++		t_error("mq_getattr() failed with errno %s\n", strerror(errno));
++	}
++
++	// check that mq_flags was updated
++	TEST(new_attr.mq_flags == attr.mq_flags,
++	     "mq_flags was not updated correctly. Expected %ld, got %ld\n",
++	     attr.mq_flags, new_attr.mq_flags);
++
++	// check that the following members were not modified
++	TEST(new_attr.mq_maxmsg == prev_attr.mq_maxmsg,
++	     "The mq_maxmsg was modified erroneously. Expected value of %ld, got "
++	     "%ld\n",
++	     prev_attr.mq_maxmsg, new_attr.mq_maxmsg);
++	TEST(new_attr.mq_msgsize == prev_attr.mq_msgsize,
++	     "The mq_msgsize was modified erroneously. Expected value of %ld, got "
++	     "%ld\n",
++	     prev_attr.mq_msgsize, new_attr.mq_msgsize);
++
++	TEST(new_attr.mq_curmsgs == prev_attr.mq_curmsgs,
++	     "The mq_curmsgs was modified erroneously. Expected value of %ld, got "
++	     "%ld\n",
++	     prev_attr.mq_curmsgs, new_attr.mq_curmsgs);
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++}
++
++int main(void)
++{
++	test_invalid_mq_descriptor();
++	test_omqstat();
++	test_mq_setattr();
++	return t_status;
++}
+diff --git a/src/functional/mq_timedreceive.c b/src/functional/mq_timedreceive.c
+new file mode 100644
+index 0000000..419dc9c
+--- /dev/null
++++ b/src/functional/mq_timedreceive.c
+@@ -0,0 +1,287 @@
++/*
++ * mq_timedreceive unit test
++ *
++ * Note: Competing threads of different priorities have not been tested due to
++ *       sudo privileges being required to change a threads priority. The POSIX
++ *       standard states: If more than one thread is waiting to receive a
++ *       message when a message arrives at an empty queue and the Priority
++ *       Scheduling option is supported, then the thread of highest priority
++ *       that has been waiting the longest shall be selected to receive the
++ *       message.
++ */
++
++#include "stdio.h"
++#include "test.h"
++#include <errno.h>
++#include <fcntl.h>
++#include <mqueue.h>
++#include <pthread.h>
++#include <signal.h>
++#include <string.h>
++#include <time.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define SLEEP_NANO 500000
++#define MAX_NSEC 1000000000
++#define MSG_SIZE 8
++#define MQ_NAME "/testqueue"
++#define MSG "testing"
++#define PERMISSIONS (mode_t)0644
++#define PRIO_TEST_MAXMSG 2
++#define PRIO_TEST_MSGSIZE 10
++
++static void dummy_signal_handler(int signum) {}
++
++static mqd_t open_mq_helper(int oflag)
++{
++	const struct mq_attr attr = {
++	    .mq_flags = 0,
++	    .mq_maxmsg = 1,
++	    .mq_msgsize = MSG_SIZE,
++	    .mq_curmsgs = 0,
++	};
++	mqd_t mqdes = mq_open(MQ_NAME, oflag, PERMISSIONS, &attr);
++
++	if (mqdes == (mqd_t)-1) {
++		t_error("mq_open() failed with errno: %s\n", strerror(errno));
++	}
++
++	return mqdes;
++}
++
++static struct timespec abstime_helper(void)
++{
++	struct timespec ts;
++	if (clock_gettime(CLOCK_REALTIME, &ts) != 0) {
++		t_error("clock_gettime() failed with errno: %s\n", strerror(errno));
++	}
++
++	if (ts.tv_nsec + SLEEP_NANO >= MAX_NSEC) {
++		ts.tv_sec += 1;
++		ts.tv_nsec = SLEEP_NANO - (MAX_NSEC - ts.tv_nsec);
++	} else {
++		ts.tv_nsec += SLEEP_NANO;
++	}
++
++	return ts;
++}
++
++static void test_receive_message(void)
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR);
++
++	int retval = mq_send(mqdes, MSG, strlen(MSG), 1);
++	if (retval != 0) {
++		t_error("mq_send() failed with errno: %s\n", strerror(errno));
++	}
++
++	char received_msg[MSG_SIZE] = {0};
++	unsigned int msg_prio = 0;
++	struct timespec ts = abstime_helper();
++	ssize_t bytes_received = mq_timedreceive(
++	    mqdes, received_msg, sizeof(received_msg), &msg_prio, &ts);
++
++	TEST(bytes_received == MSG_SIZE - 1,
++	     "mq_timedreceive() failed to receive the expected number of bytes. "
++	     "Expected %d, got %d. Errno: %s\n",
++	     MSG_SIZE, bytes_received, strerror(errno));
++
++	TEST(strcmp(received_msg, MSG) == 0,
++	     "The message received did not match the message sent. Expected %s, "
++	     "got %s\n",
++	     MSG, received_msg);
++
++	TEST(msg_prio == 1,
++	     "Failed to correctly store msg_prio. Expected value of 1, got %d\n",
++	     msg_prio);
++
++	// test that the message was removed from the queue. A receive call should
++	// timeout due to no message being availble to read.
++	errno = 0;
++	ts = abstime_helper();
++	TEST(mq_timedreceive(mqdes, received_msg, sizeof(received_msg), 0, &ts) ==
++	             -1 &&
++	         errno == ETIMEDOUT,
++	     "mq_timedreceive() timeout test failed. Expected %s, got %s\n",
++	     strerror(ETIMEDOUT), strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++static void test_nonblock_empty_receive()
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR | O_NONBLOCK);
++
++	char received_msg[MSG_SIZE] = {0};
++	struct timespec ts = abstime_helper();
++	errno = 0;
++	ssize_t bytes_received =
++	    mq_timedreceive(mqdes, received_msg, sizeof(received_msg), 0, &ts);
++
++	TEST(bytes_received == -1 && errno == EAGAIN,
++	     "Non-block empty receive test failed. Expected %s, got %s\n",
++	     strerror(EAGAIN), strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++static void test_invalid_mqdes(void)
++{
++	errno = 0;
++
++	char received_msg[MSG_SIZE] = {0};
++	struct timespec ts = abstime_helper();
++	TEST(mq_timedreceive((mqd_t)-1, received_msg, sizeof(received_msg), 0,
++	                     &ts) == -1 &&
++	         errno == EBADF,
++	     "Invalid mqdes test failed. Expected %s, got %s\n", strerror(EBADF),
++	     strerror(errno));
++
++	return;
++}
++
++static void test_undersized_receive_buffer(void)
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR);
++
++	char received_msg[MSG_SIZE - 1] = {0};
++	errno = 0;
++	struct timespec ts = abstime_helper();
++	TEST(mq_timedreceive(mqdes, received_msg, sizeof(received_msg), 0, &ts) ==
++	             -1 &&
++	         errno == EMSGSIZE,
++	     "Undersized receive buffer test failed. Expected %s, got %s\n",
++	     strerror(EMSGSIZE), strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++static void test_signal_interupt()
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR);
++	char received_msg[MSG_SIZE] = {0};
++
++	struct sigaction sa;
++	memset(&sa, 0, sizeof(sa));
++	sa.sa_handler = dummy_signal_handler;
++	sigaction(SIGALRM, &sa, NULL);
++
++	timer_t timerid = 0;
++	if (timer_create(CLOCK_MONOTONIC, 0, &timerid) == -1) {
++		t_error("timer_create() failed with errno: %s\n", strerror(errno));
++	}
++
++	struct itimerspec its = {
++	    .it_value.tv_sec = 0,
++	    .it_value.tv_nsec = SLEEP_NANO,
++	};
++	if (timer_settime(timerid, 0, &its, 0) == -1) {
++		t_error("timer_settime() failed with errno: %s\n", strerror(errno));
++	}
++
++	// set timeout to 2 seconds in the future to avoid edge cases where the next
++	// second is sooner than the timer timeout
++	struct timespec long_ts = {time(NULL) + 2, 0};
++	errno = 0;
++	TEST(mq_timedreceive(mqdes, received_msg, sizeof(received_msg), 0,
++	                     &long_ts) == -1 &&
++	         errno == EINTR,
++	     "Signal interupt test failed. Expected %s, got %s\n", strerror(EINTR),
++	     strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	timer_delete(timerid);
++	return;
++}
++
++static void test_invalid_block_time(void)
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR);
++	char received_msg[MSG_SIZE] = {0};
++
++	errno = 0;
++	struct timespec invalid_ts = {0, -1};
++	TEST(mq_timedreceive(mqdes, received_msg, sizeof(received_msg), 0,
++	                     &invalid_ts) == -1 &&
++	         errno == EINVAL,
++	     "Invalid abstime parameter test failed (ts.tv_nsec < 0). Expected %s, "
++	     "got %s\n",
++	     strerror(EINVAL), strerror(errno));
++
++	errno = 0;
++	invalid_ts.tv_nsec = MAX_NSEC;
++	TEST(mq_timedreceive(mqdes, received_msg, sizeof(received_msg), 0,
++	                     &invalid_ts) == -1 &&
++	         errno == EINVAL,
++	     "Invalid abstime parameter test failed (ts.tv_nsec >= %d). Expected "
++	     "%s, "
++	     "got %s\n",
++	     MAX_NSEC, strerror(EINVAL), strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++static void test_priority_ordering(void)
++{
++	const struct mq_attr attr2 = {
++	    .mq_flags = 0,
++	    .mq_maxmsg = PRIO_TEST_MAXMSG,
++	    .mq_msgsize = PRIO_TEST_MSGSIZE,
++	    .mq_curmsgs = 0,
++	};
++	mqd_t mqdes = mq_open(MQ_NAME, O_CREAT | O_RDWR, PERMISSIONS, &attr2);
++
++	if (mqdes == (mqd_t)-1) {
++		t_error("mq_open() failed with errno: %s\n", strerror(errno));
++	}
++
++	// insert low priority message first
++	char *prio_msg = "Low Prio";
++	struct timespec ts = abstime_helper();
++	if (mq_timedsend(mqdes, prio_msg, strlen(prio_msg), 1, &ts) != 0) {
++		t_error("mq_timedsend() failed with errno: %s\n", strerror(errno));
++	}
++
++	prio_msg = "High Prio";
++	ts = abstime_helper();
++	if (mq_timedsend(mqdes, prio_msg, strlen(prio_msg), 2, &ts) != 0) {
++		t_error("mq_timedsend() failed with errno: %s\n", strerror(errno));
++	}
++
++	char received_msg[PRIO_TEST_MSGSIZE] = {0};
++
++	ssize_t retval = mq_receive(mqdes, received_msg, sizeof(received_msg), 0);
++	if (retval == -1) {
++		t_error("mq_receive() failed with errno: %s\n", strerror(errno));
++	}
++
++	TEST(strcmp(received_msg, prio_msg) == 0,
++	     "The higher priority message was not read first from the mq. "
++	     "Expected High Prio, "
++	     "got %s\n",
++	     received_msg);
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++int main(void)
++{
++	test_receive_message();
++	test_nonblock_empty_receive();
++	test_invalid_mqdes();
++	test_undersized_receive_buffer();
++	test_signal_interupt();
++	test_invalid_block_time();
++	test_priority_ordering();
++	return t_status;
++}
+diff --git a/src/functional/mq_timedsend.c b/src/functional/mq_timedsend.c
+new file mode 100644
+index 0000000..140dd30
+--- /dev/null
++++ b/src/functional/mq_timedsend.c
+@@ -0,0 +1,312 @@
++/*
++ * mq_timedsend unit test
++ *
++ * Note: Competing threads of different priorities have not been tested due to
++ *       sudo privileges being required to change a threads priority. The POSIX
++ *       standard states: If more than one thread is waiting to send when space
++ *       becomes available in the message queue and the Priority Scheduling
++ *       option is supported, then the thread of the highest priority that has
++ *       been waiting the longest shall be unblocked to send its message.
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <fcntl.h>
++#include <limits.h>
++#include <mqueue.h>
++#include <pthread.h>
++#include <signal.h>
++#include <string.h>
++#include <time.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define SLEEP_NANO 500000
++#define MAX_NSEC 1000000000
++#define MSG_SIZE 8
++#define MQ_NAME "/testqueue"
++#define MSG "testing"
++#define PERMISSIONS (mode_t)0644
++#define PRIO_TEST_MAXMSG 2
++#define PRIO_TEST_MSGSIZE 10
++
++static void dummy_signal_handler(int signum) {}
++
++static mqd_t open_mq_helper(int oflag)
++{
++	const struct mq_attr attr = {
++	    .mq_flags = 0,
++	    .mq_maxmsg = 1,
++	    .mq_msgsize = MSG_SIZE,
++	    .mq_curmsgs = 0,
++	};
++	mqd_t mqdes = mq_open(MQ_NAME, oflag, PERMISSIONS, &attr);
++
++	if (mqdes == (mqd_t)-1) {
++		t_error("mq_open() failed with errno: %s\n", strerror(errno));
++	}
++
++	return mqdes;
++}
++
++static struct timespec abstime_helper(void)
++{
++	struct timespec ts;
++	if (clock_gettime(CLOCK_REALTIME, &ts) != 0) {
++		t_error("clock_gettime() failed with errno %s\n", strerror(errno));
++	}
++
++	if (ts.tv_nsec + SLEEP_NANO >= MAX_NSEC) {
++		ts.tv_sec += 1;
++		ts.tv_nsec = SLEEP_NANO - (MAX_NSEC - ts.tv_nsec);
++	} else {
++		ts.tv_nsec += SLEEP_NANO;
++	}
++
++	return ts;
++}
++
++static void test_send_message(void)
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR);
++
++	struct timespec ts = abstime_helper();
++	TEST(mq_timedsend(mqdes, MSG, strlen(MSG), 0, &ts) == 0,
++	     "mq_timedsend() failed with errno: %s\n", strerror(errno));
++
++	char received_msg[MSG_SIZE] = {0};
++
++	ssize_t retval = mq_receive(mqdes, received_msg, sizeof(received_msg), 0);
++	if (retval == -1) {
++		t_error("mq_receive() failed with errno: %s\n", strerror(errno));
++	}
++
++	TEST(strcmp(received_msg, MSG) == 0,
++	     "The message received did not match the message sent. Expected %s, "
++	     "got %s\n",
++	     MSG, received_msg);
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++static void test_full_queue(void)
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR | O_NONBLOCK);
++
++	struct timespec ts = abstime_helper();
++	TEST(mq_timedsend(mqdes, MSG, strlen(MSG), 0, &ts) == 0,
++	     "mq_timedsend() failed with errno: %s\n", strerror(errno));
++
++	// mq can only hold 1 message
++	errno = 0;
++	ts = abstime_helper();
++	TEST(mq_timedsend(mqdes, MSG, strlen(MSG), 0, &ts) == -1 && errno == EAGAIN,
++	     "Full message queue test failed. Expected %s, got %s\n",
++	     strerror(EAGAIN), strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++static void test_invalid_mqdes(void)
++{
++	errno = 0;
++	struct timespec ts = abstime_helper();
++	TEST(mq_timedsend((mqd_t)-1, MSG, strlen(MSG), 0, &ts) == -1 &&
++	         errno == EBADF,
++	     "Invalid mqdes test failed. Expected %s, got %s\n", strerror(EBADF),
++	     strerror(errno));
++
++	return;
++}
++
++static void test_signal_interupt()
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR);
++
++	struct timespec ts = abstime_helper();
++	// fill up mq in order to force next mq_timedsend to block
++	TEST(mq_timedsend(mqdes, MSG, strlen(MSG), 0, &ts) == 0,
++	     "mq_timedsend() failed with errno: %s\n", strerror(errno));
++
++	struct sigaction sa;
++	memset(&sa, 0, sizeof(sa));
++	sa.sa_handler = dummy_signal_handler;
++	sigaction(SIGALRM, &sa, NULL);
++
++	timer_t timerid = 0;
++	if (timer_create(CLOCK_MONOTONIC, 0, &timerid) == -1) {
++		t_error("timer_create() failed with errno: %s\n", strerror(errno));
++	}
++
++	struct itimerspec its = {
++	    .it_value.tv_sec = 0,
++	    .it_value.tv_nsec = SLEEP_NANO,
++	};
++	if (timer_settime(timerid, 0, &its, 0) == -1) {
++		t_error("timer_settime() failed with errno: %s\n", strerror(errno));
++		timer_delete(timerid);
++	}
++
++	// set timeout to 2 seconds in the future to avoid edge cases where the next
++	// second is sooner than the timer timeout
++	struct timespec long_ts = {time(NULL) + 2, 0};
++	errno = 0;
++	TEST(mq_timedsend(mqdes, MSG, strlen(MSG), 0, &long_ts) == -1 &&
++	         errno == EINTR,
++	     "Signal interupt test failed. Expected %s, got %s\n", strerror(EINTR),
++	     strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	timer_delete(timerid);
++	return;
++}
++
++static void test_invalid_msg_prio(void)
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR);
++
++	errno = 0;
++	struct timespec ts = abstime_helper();
++	TEST(mq_timedsend(mqdes, MSG, strlen(MSG), MQ_PRIO_MAX, &ts) == -1 &&
++	         errno == EINVAL,
++	     "Msg_prio out of range test failed. Expected %s, got %s\n",
++	     strerror(EINVAL), strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++static void test_invalid_block_time(void)
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR);
++
++	struct timespec ts = abstime_helper();
++	// fill up mq in order to force next mq_timedsend to block
++	TEST(mq_timedsend(mqdes, MSG, strlen(MSG), 0, &ts) == 0,
++	     "mq_timedsend() failed with errno: %s\n", strerror(errno));
++
++	struct timespec invalid_ts = {0, -1};
++	errno = 0;
++	TEST(mq_timedsend(mqdes, MSG, strlen(MSG), 0, &invalid_ts) == -1 &&
++	         errno == EINVAL,
++	     "Invalid abstime parameter test failed (ts.tv_nsec < 0). Expected %s, "
++	     "got %s\n",
++	     strerror(EINVAL), strerror(errno));
++
++	errno = 0;
++	invalid_ts.tv_nsec = MAX_NSEC;
++	TEST(
++	    mq_timedsend(mqdes, MSG, strlen(MSG), 0, &invalid_ts) == -1 &&
++	        errno == EINVAL,
++	    "Invalid abstime parameter test failed (ts.tv_nsec > %d). Expected %s, "
++	    "got %s\n",
++	    MAX_NSEC, strerror(EINVAL), strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++static void test_oversized_msg(void)
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR);
++
++	const char *oversized_msg = "This string is oversized";
++
++	errno = 0;
++	struct timespec ts = abstime_helper();
++	TEST(mq_timedsend(mqdes, oversized_msg, strlen(oversized_msg), 0, &ts) ==
++	             -1 &&
++	         errno == EMSGSIZE,
++	     "Oversized message test failed. Expected %s, got %s\n",
++	     strerror(EMSGSIZE), strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++static void test_send_timeout(void)
++{
++	mqd_t mqdes = open_mq_helper(O_CREAT | O_RDWR);
++
++	struct timespec ts = abstime_helper();
++	// fill up mq in order to force next mq_timedsend to block
++	TEST(mq_timedsend(mqdes, MSG, strlen(MSG), 0, &ts) == 0,
++	     "mq_timedsend() failed with errno: %s\n", strerror(errno));
++
++	errno = 0;
++	ts = abstime_helper();
++	TEST(mq_timedsend(mqdes, MSG, strlen(MSG), 0, &ts) == -1 &&
++	         errno == ETIMEDOUT,
++	     "mq_timedsend() timeout test failed. Expected %s, got %s\n",
++	     strerror(ETIMEDOUT), strerror(errno));
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++static void test_priority_ordering(void)
++{
++	const struct mq_attr attr2 = {
++	    .mq_flags = 0,
++	    .mq_maxmsg = PRIO_TEST_MAXMSG,
++	    .mq_msgsize = PRIO_TEST_MSGSIZE,
++	    .mq_curmsgs = 0,
++	};
++	mqd_t mqdes = mq_open(MQ_NAME, O_CREAT | O_RDWR, PERMISSIONS, &attr2);
++
++	if (mqdes == (mqd_t)-1) {
++		t_error("mq_open() failed with errno: %s\n", strerror(errno));
++	}
++
++	// insert low priority message first
++	char *prio_msg = "Low Prio";
++	struct timespec ts = abstime_helper();
++	TEST(mq_timedsend(mqdes, prio_msg, strlen(prio_msg), 1, &ts) == 0,
++	     "mq_timedsend() failed with errno: %s\n", strerror(errno));
++
++	// insert high priority message second (should be placed in front of low
++	// priority message)
++	prio_msg = "High Prio";
++	ts = abstime_helper();
++	TEST(mq_timedsend(mqdes, prio_msg, strlen(prio_msg), 2, &ts) == 0,
++	     "mq_timedsend() failed with errno: %s\n", strerror(errno));
++
++	char received_msg[PRIO_TEST_MSGSIZE] = {0};
++
++	ssize_t retval = mq_receive(mqdes, received_msg, sizeof(received_msg), 0);
++	if (retval == -1) {
++		t_error("mq_receive() failed with errno: %s\n", strerror(errno));
++	}
++
++	TEST(strcmp(received_msg, prio_msg) == 0,
++	     "The messages were not inserted into the mq in the correct order. "
++	     "Expected High Prio, "
++	     "got %s\n",
++	     received_msg);
++
++	mq_close(mqdes);
++	mq_unlink(MQ_NAME);
++	return;
++}
++
++int main(void)
++{
++	test_send_message();
++	test_full_queue();
++	test_invalid_mqdes();
++	test_signal_interupt();
++	test_invalid_msg_prio();
++	test_invalid_block_time();
++	test_oversized_msg();
++	test_send_timeout();
++	test_priority_ordering();
++	return t_status;
++}
+diff --git a/src/functional/mq_unlink.c b/src/functional/mq_unlink.c
+new file mode 100644
+index 0000000..88e989b
+--- /dev/null
++++ b/src/functional/mq_unlink.c
+@@ -0,0 +1,73 @@
++/*
++ * mq_unlink unit test
++ *
++ * Note: EINTR will not be tested, as it requires waiting for mq_unlink to
++ *       be blocked before sending a signal.
++ *
++ * Note: EACCES will not be tested, as it requires elevated privileges.
++ */
++#include "test.h"
++#include <errno.h>
++#include <fcntl.h>
++#include <mqueue.h>
++#include <signal.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define MQ_NAME "/test_msgq"
++#define PERM 0644
++
++int test_mq_opened(void)
++{
++	mqd_t mqdes = mq_open(MQ_NAME, O_CREAT | O_RDWR, PERM, 0);
++	if (mqdes < 0) {
++		t_error("mq_open failed: %d, %s\n", mqdes, strerror(errno));
++	}
++
++	int status = mq_unlink(MQ_NAME);
++	TEST(status == 0,
++	     "Expected mq_unlink to succeed, instead got status %d, error: %s\n",
++	     status, strerror(errno));
++
++	// Unlinked: MQ should not exist on the filesystem any more
++	status = access("/dev/mqueue" MQ_NAME, F_OK);
++	TEST(status == -1 && errno == ENOENT,
++	     "Expected access to mqueue to return -1 and ENOENT, instead got %d, "
++	     "error: %s\n",
++	     status, strerror(errno));
++
++	// MQ has not been closed, so should still be able to interact with it
++	const struct sigevent sev = {.sigev_signo = SIGEV_NONE};
++	status = mq_notify(mqdes, &sev);
++	TEST(status == 0,
++	     "Expected registration to unlinked mqueue to succeed, instead got %d, "
++	     "error: %s\n",
++	     status, strerror(errno));
++
++	status = mq_close(mqdes);
++	if (status == -1) {
++		t_error("mq_close failed: %d, error: %s\n", status, strerror(errno));
++	}
++
++	// MQ now closed and unlinked, notification should fail with EBADF
++	status = mq_notify(mqdes, 0);
++	TEST(status == -1 && errno == EBADF,
++	     "Expected registration to fail with EBADF after mqueue close, instead "
++	     "got %d, error: %s",
++	     status, strerror(errno));
++
++	return 0;
++}
++
++int main(void)
++{
++	int status = mq_unlink("Nonexistent MQ");
++	TEST(status == -1, "Expected status to be -1, instead got %d\n", status);
++	TEST(errno == ENOENT, "Expected errno to be ENOENT, instead got %s\n",
++	     strerror(errno));
++
++	errno = 0;
++	test_mq_opened();
++
++	return t_status;
++}
+diff --git a/src/functional/posix_spawnattr_setflags.c b/src/functional/posix_spawnattr_setflags.c
+new file mode 100644
+index 0000000..bcbeae6
+--- /dev/null
++++ b/src/functional/posix_spawnattr_setflags.c
+@@ -0,0 +1,41 @@
++#include "test.h"
++#include <spawn.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++int main(void)
++{
++	posix_spawnattr_t attr = {0};
++	int status = posix_spawnattr_init(&attr);
++	if (status != 0) {
++		t_error("Failed to initialise spawnattr struct, status: %d\n", status);
++	}
++
++	TEST(attr.__flags == 0,
++	     "Expected default attribute value of __flags to be 0, got %d\n",
++	     attr.__flags);
++
++	static const short test_args =
++	    POSIX_SPAWN_RESETIDS | POSIX_SPAWN_SETSCHEDPARAM;
++	status = posix_spawnattr_setflags(&attr, test_args);
++
++	TEST(status == 0,
++	     "Expected posix_spawnattr_setflags to return 0, instead got %d\n",
++	     status);
++
++	TEST(attr.__flags == test_args,
++	     "Expected attribute value of __flags to be %d, got %d\n", test_args,
++	     attr.__flags);
++
++	posix_spawnattr_destroy(&attr);
++
++	posix_spawnattr_init(&attr);
++	posix_spawnattr_setflags(&attr, -1);
++
++	TEST(attr.__flags == 0, "Expected value of __flags to be 0, got %d\n",
++	     attr.__flags);
++
++	posix_spawnattr_destroy(&attr);
++
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_destroy.c b/src/functional/pthread_attr_destroy.c
+new file mode 100644
+index 0000000..83d8252
+--- /dev/null
++++ b/src/functional/pthread_attr_destroy.c
+@@ -0,0 +1,34 @@
++/*
++ * pthread_attr_destroy unit test
++ */
++#include "test.h"
++#include <pthread.h>
++#include <string.h>
++
++// if c evaluates to 0, execute t_error with the specified error message
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void test_destroy_initialized_attr(void)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("test_destroy_initialized_attr: "
++		        "pthread_attr_init() did not work correctly with Error: %s\n",
++		        strerror(retval));
++		return;
++	}
++
++	retval = pthread_attr_destroy(&attr);
++	TEST(retval == 0,
++	     "test_destroy_initialized_attr: "
++	     "pthread_attr_destroy() did not work correctly with Error: %s\n",
++	     strerror(retval));
++	return;
++}
++
++int main(void)
++{
++	test_destroy_initialized_attr();
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_getdetachstate.c b/src/functional/pthread_attr_getdetachstate.c
+new file mode 100644
+index 0000000..9736672
+--- /dev/null
++++ b/src/functional/pthread_attr_getdetachstate.c
+@@ -0,0 +1,45 @@
++/*
++ * pthread_attr_getdetachstate unit test
++ */
++
++#include "test.h"
++#include <pthread.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define INVALID_DETACHSTATE (-1)
++
++static void test_valid_detachstate(const int detachstate)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++		return;
++	}
++
++	retval = pthread_attr_setdetachstate(&attr, detachstate);
++	if (retval != 0) {
++		t_error("pthread_attr_setdetachstate failed when setting detachstate "
++		        "to %d. Returned %d\n",
++		        detachstate, retval);
++		pthread_attr_destroy(&attr);
++		return;
++	}
++
++	int detachstate_value = INVALID_DETACHSTATE;
++	retval = pthread_attr_getdetachstate(&attr, &detachstate_value);
++
++	TEST(retval == 0 && detachstate_value == detachstate,
++	     "pthread_attr_getdetachstate failed. Returned %d. Expected "
++	     "detachstate = %d, got %d\n",
++	     retval, detachstate, detachstate_value);
++
++	pthread_attr_destroy(&attr);
++}
++
++int main(void)
++{
++	test_valid_detachstate(PTHREAD_CREATE_DETACHED);
++	test_valid_detachstate(PTHREAD_CREATE_JOINABLE);
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_getguardsize.c b/src/functional/pthread_attr_getguardsize.c
+new file mode 100644
+index 0000000..26b1dd2
+--- /dev/null
++++ b/src/functional/pthread_attr_getguardsize.c
+@@ -0,0 +1,45 @@
++/*
++ * pthread_attr_getguardsize unit test
++ */
++
++#include "test.h"
++#include <pthread.h>
++
++#define INVALID_GUARD_SIZE (-1)
++#define ZERO_GUARD_SIZE (size_t)(0)
++#define DEFAULT_GUARD_SIZE (size_t)(8192)
++
++#define TEST(c, ...) ((c) || (t_error("TEST(" #c ") failed " __VA_ARGS__), 0))
++
++static void test_valid_guardsize(pthread_attr_t *pattr, const size_t guardsize)
++{
++	int retval = pthread_attr_setguardsize(pattr, guardsize);
++	if (!retval) {
++		size_t guardsize_value = INVALID_GUARD_SIZE;
++		retval = pthread_attr_getguardsize(pattr, &guardsize_value);
++		if (!retval) {
++			TEST(guardsize_value == guardsize, "[Expected %d, got %d]\n",
++			     guardsize, guardsize_value);
++		} else {
++			t_error("pthread_attr_getguardsize() failed. Returned %d\n",
++			        retval);
++		}
++	} else {
++		t_error("pthread_attr_getguardsize() failed. Returned %d\n", retval);
++	}
++	return;
++}
++
++int main(void)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (!retval) {
++		test_valid_guardsize(&attr, ZERO_GUARD_SIZE);
++		test_valid_guardsize(&attr, DEFAULT_GUARD_SIZE);
++		pthread_attr_destroy(&attr);
++	} else {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++	}
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_getinheritsched.c b/src/functional/pthread_attr_getinheritsched.c
+new file mode 100644
+index 0000000..679ca3d
+--- /dev/null
++++ b/src/functional/pthread_attr_getinheritsched.c
+@@ -0,0 +1,44 @@
++/*
++ * pthread_attr_getinherit unit test
++ */
++
++#include "test.h"
++#include <pthread.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void test_valid_inheritsched(const int inheritsched)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++		return;
++	}
++	retval = pthread_attr_setinheritsched(&attr, inheritsched);
++	if (retval != 0) {
++		t_error("pthread_attr_setinheritsched() failed. Returned %d\n", retval);
++		pthread_attr_destroy(&attr);
++		return;
++	}
++
++	int inheritsched_value = -1;
++
++	retval = pthread_attr_getinheritsched(&attr, &inheritsched_value);
++
++	TEST(retval == 0, "Failed to get inheritsched. Expected %d, got %d\n",
++	     inheritsched, retval);
++
++	TEST(inheritsched_value == inheritsched,
++	     "Failed to get correct inheritsched value. Expected %d, got %d\n",
++	     inheritsched, inheritsched_value);
++
++	pthread_attr_destroy(&attr);
++}
++
++int main(void)
++{
++	test_valid_inheritsched(PTHREAD_EXPLICIT_SCHED);
++	test_valid_inheritsched(PTHREAD_INHERIT_SCHED);
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_getschedparam.c b/src/functional/pthread_attr_getschedparam.c
+new file mode 100644
+index 0000000..529c11d
+--- /dev/null
++++ b/src/functional/pthread_attr_getschedparam.c
+@@ -0,0 +1,54 @@
++/*
++ * pthread_attr_getschedparam unit test
++ */
++#include "test.h"
++#include <pthread.h>
++#include <sched.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void test_getschedparam(const int policy)
++{
++	const int priority = sched_get_priority_max(policy);
++	if (priority < 0) {
++		t_error("Invalid priority for policy %d\n", policy);
++		return;
++	}
++
++	pthread_attr_t test_attributes;
++	int status = pthread_attr_init(&test_attributes);
++	if (status != 0) {
++		t_error("Error initialising pthread attributes\n");
++		return;
++	}
++
++	const struct sched_param test_param = {.sched_priority = priority};
++	status = pthread_attr_setschedparam(&test_attributes, &test_param);
++	if (status != 0) {
++		t_error("pthread_attr_setschedparam failed, returned %d\n", status);
++		pthread_attr_destroy(&test_attributes);
++		return;
++	}
++
++	struct sched_param get_params;
++	status = pthread_attr_getschedparam(&test_attributes, &get_params);
++
++	TEST(status == 0,
++	     "Expected pthread_attr_getschedparam with policy %d to return 0, got "
++	     "%d\n",
++	     policy, status);
++
++	TEST(get_params.sched_priority == test_param.sched_priority,
++	     "Expected scheduler parameter with policy %d to be %d, instead got "
++	     "%d\n",
++	     policy, test_param.sched_priority, get_params.sched_priority);
++
++	pthread_attr_destroy(&test_attributes);
++}
++
++int main(void)
++{
++	test_getschedparam(SCHED_FIFO);
++	test_getschedparam(SCHED_RR);
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_getschedpolicy.c b/src/functional/pthread_attr_getschedpolicy.c
+new file mode 100644
+index 0000000..e47c1d0
+--- /dev/null
++++ b/src/functional/pthread_attr_getschedpolicy.c
+@@ -0,0 +1,44 @@
++/*
++ * pthread_attr_getschedpolicy unit test
++ */
++
++#include "test.h"
++#include <pthread.h>
++
++#define SCHED_INVALID (-1)
++#define TEST(c, ...) ((c) || (t_error("TEST(" #c ") failed " __VA_ARGS__), 0))
++
++static void test_valid_schedpolicy(pthread_attr_t *pattr, const int schedpolicy)
++{
++	int retval = pthread_attr_setschedpolicy(pattr, schedpolicy);
++	if (!retval) {
++		int schedpolicy_value = SCHED_INVALID;
++		retval = pthread_attr_getschedpolicy(pattr, &schedpolicy_value);
++		if (!retval) {
++			TEST(schedpolicy_value == schedpolicy, "[Expected %d, got %d]\n",
++			     schedpolicy, schedpolicy_value);
++
++		} else {
++			t_error("pthread_attr_getschedpolicy() failed. Returned %d\n",
++			        retval);
++		}
++	} else {
++		t_error("pthread_attr_setschedpolicy() failed. Returned %d\n", retval);
++	}
++	return;
++}
++
++int main(void)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (!retval) {
++		test_valid_schedpolicy(&attr, SCHED_RR);
++		test_valid_schedpolicy(&attr, SCHED_FIFO);
++		test_valid_schedpolicy(&attr, SCHED_OTHER);
++		pthread_attr_destroy(&attr);
++	} else {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++	}
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_getscope.c b/src/functional/pthread_attr_getscope.c
+new file mode 100644
+index 0000000..2602a79
+--- /dev/null
++++ b/src/functional/pthread_attr_getscope.c
+@@ -0,0 +1,42 @@
++/*
++ * pthread_attr_getscope unit test
++ *
++ * Note: Musl does not support a contention scope with value
++ * PTHREAD_SCOPE_PROCESS
++ */
++
++#include "test.h"
++#include <pthread.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void test_valid_scope(int scope)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++		return;
++	}
++	retval = pthread_attr_setscope(&attr, scope);
++	if (retval != 0) {
++		t_error("pthread_attr_setscope failed. Returned %d\n", retval);
++		pthread_attr_destroy(&attr);
++		return;
++	}
++	int contentionscope = -1;
++	retval = pthread_attr_getscope(&attr, &contentionscope);
++
++	TEST(retval == 0 && contentionscope == scope,
++	     "pthread_attr_getscope failed with return value %d. Expected "
++	     "contentionscope was %d, got %d\n",
++	     scope, contentionscope);
++
++	pthread_attr_destroy(&attr);
++}
++
++int main(void)
++{
++	test_valid_scope(PTHREAD_SCOPE_SYSTEM);
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_getstack.c b/src/functional/pthread_attr_getstack.c
+new file mode 100644
+index 0000000..0d20fb0
+--- /dev/null
++++ b/src/functional/pthread_attr_getstack.c
+@@ -0,0 +1,102 @@
++/*
++ * pthread_attr_getstack unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#define STACK_SIZE (size_t)(1024 * 1024); // 1MB
++
++//if c evaluates to 0, execute t_error with the specified error message
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++// Test case: Valid Input - Set and Retrieve Stack Attributes
++static void test_valid_input_set_and_retrieve_stack_attributes(void)
++{
++	size_t stack_size = STACK_SIZE; // 1MB
++	void *stack_addr = calloc(stack_size, sizeof(char));
++	if (stack_addr == NULL) {
++		t_error("test_valid_input_set_and_retrieve_stack_attributes: calloc() "
++		        "did not work correctly\n");
++		return;
++	}
++
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("test_null_stack_attributes: "
++		        "pthread_attr_init() did not work correctly [errno: %d]\n",
++		        retval);
++		free(stack_addr);
++		return;
++	}
++
++	retval = pthread_attr_setstack(&attr, stack_addr, stack_size);
++	if (retval != 0) {
++		t_error("test_valid_input_set_and_retrieve_stack_attributes: "
++		        "pthread_attr_setstack() did not work correctly [errno: %d]\n",
++		        retval);
++		pthread_attr_destroy(&attr);
++		free(stack_addr);
++		return;
++	}
++
++	void *retrieved_stack_addr = NULL;
++	size_t retrieved_stack_size = 0;
++
++	retval = pthread_attr_getstack(&attr, &retrieved_stack_addr,
++	                               &retrieved_stack_size);
++	TEST(retval == 0,
++	     "test_valid_input_set_and_retrieve_stack_attributes: "
++	     "pthread_attr_getstack() failed with error: %s\n",
++	     strerror(retval));
++	TEST(retrieved_stack_addr == stack_addr,
++	     "test_valid_input_set_and_retrieve_stack_attributes: "
++	     "retrieved_stack_addr (%d) did not match the stack_addr (%d)\n",
++	     retrieved_stack_addr, stack_addr);
++	TEST(retrieved_stack_size == stack_size,
++	     "test_valid_input_set_and_retrieve_stack_attributes: "
++	     "retrieved_stack_size (%d) did not match the stack_size (%d)\n",
++	     retrieved_stack_size, stack_size);
++
++	pthread_attr_destroy(&attr); //Invalidate the attribute object
++	free(stack_addr);
++	return;
++}
++
++// Test case: Valid Attribute Object - Retrieve Stack attributes
++static void test_valid_attr_obj_and_retrieve_stack_attributes(void)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("test_valid_attr_obj_and_retrieve_stack_attributes: "
++		        "pthread_attr_init() did not work correctly [errno: %d]\n",
++		        retval);
++		return;
++	}
++
++	void *retrieved_stack_addr = NULL;
++	size_t retrieved_stack_size = 0;
++
++	retval = pthread_attr_getstack(&attr, &retrieved_stack_addr,
++	                               &retrieved_stack_size);
++	TEST(retval == EINVAL,
++	     "test_valid_attr_obj_and_retrieve_stack_attributes: "
++	     "pthread_attr_getstack() was expected to fail [errno: %d]\n",
++	     retval);
++
++	pthread_attr_destroy(&attr);
++	return;
++}
++
++int main(void)
++{
++	test_valid_input_set_and_retrieve_stack_attributes();
++	test_valid_attr_obj_and_retrieve_stack_attributes();
++
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_getstacksize.c b/src/functional/pthread_attr_getstacksize.c
+new file mode 100644
+index 0000000..2f6503c
+--- /dev/null
++++ b/src/functional/pthread_attr_getstacksize.c
+@@ -0,0 +1,56 @@
++/*
++ * pthread_attr_getstacksize test
++ */
++
++#include "test.h" // Common test header (needed for all unit tests written)
++#include "utils.h"
++#include <limits.h>
++#include <pthread.h>
++
++// if c evaluates to 0, execute t_error with the specified error message
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++#define DEFAULT_STACK_SIZE \
++	(PTHREAD_STACK_MIN * \
++	 10) // valid condition: size-PTHREAD_STACK_MIN > SIZE_MAX/4 - as per
++	     // pthread_attr_setstacksize.c
++
++void check_stacksize(void)
++{
++	static pthread_attr_t stacksize;
++	size_t test_size_value = 0;
++
++	// Note: Passing set/ get function an uninitialized attribute should return
++	// undefined behaviour
++	int attrresult = pthread_attr_init(&stacksize);
++
++	// Test case 1: Set and get an acceptable stack size
++	int setresult =
++	    pthread_attr_setstacksize(&stacksize, (size_t)DEFAULT_STACK_SIZE);
++	if (setresult != 0 || attrresult != 0) {
++		t_error("the attrresult, %i, and setresult, %i , did not succeed "
++		        "as expected\n",
++		        attrresult, setresult);
++	}
++
++	// get stack size which will return 0 if successful (errnos are handled in
++	// the set function only)
++	int getresult = pthread_attr_getstacksize(&stacksize, &test_size_value);
++	TEST(getresult == 0 && test_size_value == (size_t)DEFAULT_STACK_SIZE,
++	     "pthread_attr_getstacksize failed. Returned %ld but expected %ld with "
++	     "status %i\n",
++	     test_size_value, DEFAULT_STACK_SIZE, getresult);
++
++	// cleanup
++	int cleanupresult = pthread_attr_destroy(&stacksize);
++	if (cleanupresult != 0) {
++		t_error("the cleanupresult, %i, did not succeed as expected\n",
++		        cleanupresult);
++	}
++}
++
++int main(void)
++{
++	check_stacksize();
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_init.c b/src/functional/pthread_attr_init.c
+new file mode 100644
+index 0000000..3a89198
+--- /dev/null
++++ b/src/functional/pthread_attr_init.c
+@@ -0,0 +1,100 @@
++/*
++ * Test that pthread_attr_init()
++ * Upon successful completion, pthread_attr_init() shall return a value of 0.
++ *
++ * ENOMEM is the only error it returns, so if it doesn't return that error,
++ * the return number should be 0.
++ *
++ * Note: Testing for ENOMEM is not feasible in a controlled manner, as it
++ * depends on the system's memory state at the time of the call. This test
++ * assumes that sufficient memory is available in the environment where it is
++ * run.
++ */
++
++#include "test.h"
++#include <limits.h>
++#include <pthread.h>
++
++#define DEFAULT_STACK_SIZE (size_t)(81920)
++#define DEFAULT_GUARD_SIZE (size_t)(8192)
++
++// if c evaluates to 0, execute t_error with the specified error message
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++// Test case: Basic Initialization
++static void test_valid_initialization(void)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("test_valid_initialization: "
++		        "pthread_attr_init() did not work correctly with RETVAL: %d\n",
++		        retval);
++		return;
++	}
++	int detach_state = 0;
++	retval = pthread_attr_getdetachstate(&attr, &detach_state);
++	TEST(retval == 0 && detach_state == PTHREAD_CREATE_JOINABLE,
++	     "test_valid_initialization: "
++	     "retrieved detach_state (%d) did not match the expected detach_state "
++	     "(%d), RETVAL: %d\n",
++	     detach_state, PTHREAD_CREATE_JOINABLE, retval);
++
++	int sched_policy = 0;
++	retval = pthread_attr_getschedpolicy(&attr, &sched_policy);
++	TEST(retval == 0 && sched_policy == SCHED_OTHER,
++	     "test_valid_initialization: "
++	     "retrieved sched_policy (%d) did not match the expected detach_state "
++	     "(%d), RETVAL: %d\n",
++	     sched_policy, SCHED_OTHER, retval);
++
++	struct sched_param schedparam;
++	retval = pthread_attr_getschedparam(&attr, &schedparam);
++	TEST(retval == 0 && schedparam.sched_priority == 0,
++	     "test_valid_initialization: "
++	     "retrieved schedparam.sched_priority (%d) did not match the expected "
++	     "schedparam.sched_priority (%d), RETVAL: %d\n",
++	     schedparam.sched_priority, 0, retval);
++
++	int inherit_sched = 0;
++	retval = pthread_attr_getinheritsched(&attr, &inherit_sched);
++	TEST(retval == 0 && inherit_sched == PTHREAD_INHERIT_SCHED,
++	     "test_valid_initialization: "
++	     "retrieved inherit_sched (%d) did not match the expected "
++	     "inherit_sched (%d), RETVAL: %d\n",
++	     inherit_sched, PTHREAD_INHERIT_SCHED, retval);
++
++	int scope = 0;
++	retval = pthread_attr_getscope(&attr, &scope);
++	TEST(retval == 0 && scope == PTHREAD_SCOPE_SYSTEM,
++	     "test_valid_initialization: "
++	     "retrieved inherit_scope (%d) did not match the expected "
++	     "inherit_scope (%d), RETVAL: %d\n",
++	     scope, PTHREAD_SCOPE_SYSTEM, retval);
++
++	size_t stack_size = 0;
++	retval = pthread_attr_getstacksize(&attr, &stack_size);
++	TEST(retval == 0 && stack_size >= DEFAULT_STACK_SIZE,
++	     "test_valid_initialization: "
++	     "retrieved stack_size (%d) did not match the expected stack_size >= "
++	     "(%d), RETVAL: %d\n",
++	     stack_size, PTHREAD_STACK_MIN, retval);
++
++	size_t guard_size = 0;
++	retval = pthread_attr_getguardsize(&attr, &guard_size);
++	TEST(retval == 0 && guard_size == DEFAULT_GUARD_SIZE,
++	     "test_valid_initialization: "
++	     "retrieved guard_size (%d) did not match the expected guard_size >= "
++	     "(%d), RETVAL: %d\n",
++	     guard_size, 0, retval);
++
++	pthread_attr_destroy(&attr);
++	return;
++}
++
++int main(void)
++{
++	test_valid_initialization();
++
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_setdetachstate.c b/src/functional/pthread_attr_setdetachstate.c
+new file mode 100644
+index 0000000..a3cb96b
+--- /dev/null
++++ b/src/functional/pthread_attr_setdetachstate.c
+@@ -0,0 +1,73 @@
++/*
++ * pthread_attr_setdetachstate unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define INVALID_DETACHSTATE (-1)
++
++static void test_valid_detachstate(const int detachstate)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++		return;
++	}
++
++	retval = pthread_attr_setdetachstate(&attr, detachstate);
++
++	TEST(retval == 0,
++	     "pthread_attr_setdetachstate failed when setting detachstate to %d. "
++	     "Returned %d\n",
++	     detachstate, retval);
++
++	if (retval != 0) {
++		pthread_attr_destroy(&attr);
++		return;
++	}
++
++	int detachstate_value = INVALID_DETACHSTATE;
++	retval = pthread_attr_getdetachstate(&attr, &detachstate_value);
++	if (retval != 0) {
++		t_error("pthread_attr_getdetachstate failed. Returned %d\n", retval);
++		pthread_attr_destroy(&attr);
++		return;
++	}
++
++	TEST(detachstate_value == detachstate,
++	     "Failed to set the correct detachstate. Expected %d, got %d\n",
++	     detachstate, detachstate_value);
++
++	pthread_attr_destroy(&attr);
++}
++
++static void test_invalid_detachstate(const int detachstate)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++		return;
++	}
++
++	retval = pthread_attr_setdetachstate(&attr, detachstate);
++
++	TEST(retval == EINVAL,
++	     "Invalid detachstate test failed. Expected %s, got %s\n",
++	     strerror(EINVAL), strerror(retval));
++
++	pthread_attr_destroy(&attr);
++}
++
++int main(void)
++{
++	test_valid_detachstate(PTHREAD_CREATE_DETACHED);
++	test_valid_detachstate(PTHREAD_CREATE_JOINABLE);
++	test_invalid_detachstate(INVALID_DETACHSTATE);
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_setguardsize.c b/src/functional/pthread_attr_setguardsize.c
+new file mode 100644
+index 0000000..c41b858
+--- /dev/null
++++ b/src/functional/pthread_attr_setguardsize.c
+@@ -0,0 +1,56 @@
++/*
++ * pthread_attr_setguardsize unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++
++#define INVALID_GUARD_SIZE (-1)
++#define ZERO_GUARD_SIZE (size_t)(0)
++#define DEFAULT_GUARD_SIZE (size_t)(8192)
++#define MAX_GUARD_SIZE (size_t)(SIZE_MAX)
++
++#define TEST(c, ...) ((c) || (t_error("TEST(" #c ") failed " __VA_ARGS__), 0))
++
++static void test_valid_guardsize(pthread_attr_t *pattr, const size_t guardsize)
++{
++	int retval = pthread_attr_setguardsize(pattr, guardsize);
++	if (!retval) {
++		size_t guardsize_value = INVALID_GUARD_SIZE;
++		retval = pthread_attr_getguardsize(pattr, &guardsize_value);
++		if (!retval) {
++			TEST(guardsize_value == guardsize, "[Expected %d, got %d]\n",
++			     guardsize, guardsize_value);
++		} else {
++			t_error("pthread_attr_getguardsize() failed. Returned %d\n",
++			        retval);
++		}
++	} else {
++		t_error("pthread_attr_setguardsize() failed. Returned %d\n", retval);
++	}
++	return;
++}
++
++static void test_invalid_guardsize(pthread_attr_t *pattr,
++                                   const size_t guardsize)
++{
++	int retval = pthread_attr_setguardsize(pattr, guardsize);
++	TEST(retval == EINVAL, "[Expected %d, got %d]\n", EINVAL, retval);
++	return;
++}
++
++int main(void)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (!retval) {
++		test_valid_guardsize(&attr, ZERO_GUARD_SIZE);
++		test_valid_guardsize(&attr, DEFAULT_GUARD_SIZE);
++		test_invalid_guardsize(&attr, MAX_GUARD_SIZE);
++		pthread_attr_destroy(&attr);
++	} else {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++	}
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_setinheritsched.c b/src/functional/pthread_attr_setinheritsched.c
+new file mode 100644
+index 0000000..3fd4f33
+--- /dev/null
++++ b/src/functional/pthread_attr_setinheritsched.c
+@@ -0,0 +1,49 @@
++/*
++ * pthread_attr_setinherit unit test
++ *
++ * Note: The return of ENOTSUP when an attempt is made to set the attribute to
++ * an unsupported value has not been tested as the "unsupported" values are
++ * unclear.
++ */
++
++#include "test.h"
++#include <pthread.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void test_valid_inheritsched(const int inheritsched)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++		return;
++	}
++	retval = pthread_attr_setinheritsched(&attr, inheritsched);
++
++	TEST(retval == 0, "Failed to set inheritsched to %d. Returned %d\n",
++	     inheritsched, retval);
++
++	int inheritsched_value = -1;
++
++	retval = pthread_attr_getinheritsched(&attr, &inheritsched_value);
++
++	if (retval != 0) {
++		t_error("pthread_attr_getinheritsched() failed. Returned %d\n", retval);
++		pthread_attr_destroy(&attr);
++		return;
++	}
++
++	TEST(inheritsched_value == inheritsched,
++	     "Failed to set correct inheritsched value. Expected %d, got %d\n",
++	     inheritsched, inheritsched_value);
++
++	pthread_attr_destroy(&attr);
++}
++
++int main(void)
++{
++	test_valid_inheritsched(PTHREAD_EXPLICIT_SCHED);
++	test_valid_inheritsched(PTHREAD_INHERIT_SCHED);
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_setschedparam.c b/src/functional/pthread_attr_setschedparam.c
+new file mode 100644
+index 0000000..e8e34ed
+--- /dev/null
++++ b/src/functional/pthread_attr_setschedparam.c
+@@ -0,0 +1,64 @@
++/*
++ * pthread_attr_setschedparam unit test
++ *
++ * Note: The return of ENOTSUP when an attempt is made to set the attribute to
++ * an unsupported value has not been tested as the "unsupported" values are
++ * unclear.
++ *
++ */
++
++#include "test.h"
++#include <pthread.h>
++#include <sched.h>
++
++#define INVALID_PRIO (-1)
++#define SCHED_MAX (SCHED_RR + 1)
++
++#define TEST(c, ...) ((c) || (t_error("TEST(" #c ") failed " __VA_ARGS__), 0))
++
++static void test_valid_schedparam(pthread_attr_t *pattr,
++                                  const struct sched_param *schedparam)
++{
++	int retval = pthread_attr_setschedparam(pattr, schedparam);
++	if (!retval) {
++		struct sched_param schedparam_value;
++		schedparam_value.sched_priority = INVALID_PRIO;
++		retval = pthread_attr_getschedparam(pattr, &schedparam_value);
++		if (!retval) {
++			TEST(schedparam->sched_priority == schedparam_value.sched_priority,
++			     "[Expected %d, got %d]\n", schedparam->sched_priority,
++			     schedparam_value.sched_priority);
++		} else {
++			t_error("pthread_attr_getschedparam() failed. Returned %d\n",
++			        retval);
++		}
++	} else {
++		t_error("pthread_attr_setschedparam() failed. Returned %d\n", retval);
++	}
++	return;
++}
++
++int main(void)
++{
++	pthread_attr_t attr;
++
++	int retval = pthread_attr_init(&attr);
++	if (!retval) {
++
++		for (int policy = 0; policy < SCHED_MAX; ++policy) {
++
++			struct sched_param param;
++
++			param.sched_priority = sched_get_priority_min(policy);
++			test_valid_schedparam(&attr, &param);
++
++			param.sched_priority = sched_get_priority_max(policy);
++			test_valid_schedparam(&attr, &param);
++		}
++
++		pthread_attr_destroy(&attr);
++	} else {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++	}
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_setschedpolicy.c b/src/functional/pthread_attr_setschedpolicy.c
+new file mode 100644
+index 0000000..802da89
+--- /dev/null
++++ b/src/functional/pthread_attr_setschedpolicy.c
+@@ -0,0 +1,43 @@
++/*
++ * pthread_attr_setschedpolicy unit test
++ */
++
++#include "test.h"
++#include <pthread.h>
++
++#define SCHED_INVALID (-1)
++#define TEST(c, ...) ((c) || (t_error("TEST(" #c ") failed " __VA_ARGS__), 0))
++
++static void test_valid_schedpolicy(pthread_attr_t *pattr, const int schedpolicy)
++{
++	int retval = pthread_attr_setschedpolicy(pattr, schedpolicy);
++	if (!retval) {
++		int schedpolicy_value = SCHED_INVALID;
++		retval = pthread_attr_getschedpolicy(pattr, &schedpolicy_value);
++		if (!retval) {
++			TEST(schedpolicy_value == schedpolicy, "[Expected %d, got %d]\n",
++			     schedpolicy, schedpolicy_value);
++		} else {
++			t_error("pthread_attr_getschedpolicy() failed. Returned %d\n",
++			        retval);
++		}
++	} else {
++		t_error("pthread_attr_setschedpolicy() failed. Returned %d\n", retval);
++	}
++	return;
++}
++
++int main(void)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (!retval) {
++		test_valid_schedpolicy(&attr, SCHED_RR);
++		test_valid_schedpolicy(&attr, SCHED_FIFO);
++		test_valid_schedpolicy(&attr, SCHED_OTHER);
++		pthread_attr_destroy(&attr);
++	} else {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++	}
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_setscope.c b/src/functional/pthread_attr_setscope.c
+new file mode 100644
+index 0000000..622ff0f
+--- /dev/null
++++ b/src/functional/pthread_attr_setscope.c
+@@ -0,0 +1,69 @@
++/*
++ * pthread_attr_setscope unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void test_valid_scope(int scope)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++		return;
++	}
++
++	retval = pthread_attr_setscope(&attr, scope);
++
++	TEST(retval == 0, "pthread_attr_setscope failed. Returned %d\n", retval);
++
++	if (retval != 0) {
++		pthread_attr_destroy(&attr);
++		return;
++	}
++
++	int contentionscope = -1;
++	retval = pthread_attr_getscope(&attr, &contentionscope);
++	if (retval != 0) {
++		t_error("pthread_attr_getscope failed. Returned %d\n", retval);
++		pthread_attr_destroy(&attr);
++		return;
++	}
++
++	TEST(contentionscope == scope,
++	     "pthread_attr_setscope failed. Expected contentionscope was %d, got "
++	     "%d\n",
++	     scope, contentionscope);
++
++	pthread_attr_destroy(&attr);
++}
++
++static void test_unsupported_scope(int scope)
++{
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_attr_init() failed. Returned %d\n", retval);
++		return;
++	}
++
++	retval = pthread_attr_setscope(&attr, scope);
++
++	TEST(retval == ENOTSUP,
++	     "Unsupported contentionscope test failed. Expected %s, got %s\n",
++	     strerror(ENOTSUP), strerror(retval));
++
++	pthread_attr_destroy(&attr);
++}
++
++int main(void)
++{
++	test_valid_scope(PTHREAD_SCOPE_SYSTEM);
++	test_unsupported_scope(PTHREAD_SCOPE_PROCESS);
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_setstack.c b/src/functional/pthread_attr_setstack.c
+new file mode 100644
+index 0000000..bc2ffec
+--- /dev/null
++++ b/src/functional/pthread_attr_setstack.c
+@@ -0,0 +1,132 @@
++/*
++ * pthread_attr_setstack unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <limits.h>
++#include <pthread.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/mman.h>
++
++#define INVALID_STACK_SIZE (size_t)(0)
++#define DEFAULT_STACK_SIZE (size_t)(PTHREAD_STACK_MIN)
++#define MINIMUM_STACK_SIZE (size_t)(PTHREAD_STACK_MIN)
++#define MAXIMUM_STACK_SIZE (size_t)(SIZE_MAX / 4)
++#define UNDERSIZED_STACK_SIZE (size_t)(PTHREAD_STACK_MIN - 1)
++#define OVERSIZED_STACK_SIZE (size_t)((SIZE_MAX / 4) + PTHREAD_STACK_MIN + 1)
++
++// if c evaluates to 0, execute t_error with the specified error message
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++struct test_cases {
++	size_t stack_size;
++	int exp_retval;
++};
++
++// Test case: Valid Input - Set and Retrieve Stack Attributes
++static void test_valid_input_set_and_retrieve_stack_attributes(void)
++{
++	size_t stack_size = DEFAULT_STACK_SIZE;
++	void *stack_addr = calloc(stack_size, sizeof(char));
++	if (stack_addr == NULL) {
++		t_error("test_valid_input_set_and_retrieve_stack_attributes: calloc() "
++		        "did not work correctly, Error: %s\n",
++		        strerror(errno));
++		return;
++	}
++
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("test_valid_input_set_and_retrieve_stack_attributes: "
++		        "pthread_attr_init() did not work correctly [errno: %d]\n",
++		        retval);
++		free(stack_addr);
++		return;
++	}
++
++	retval = pthread_attr_setstack(&attr, stack_addr, stack_size);
++	if (retval != 0) {
++		t_error("test_valid_input_set_and_retrieve_stack_attributes: "
++		        "pthread_attr_setstack() did not work correctly [errno: %d]\n",
++		        retval);
++		pthread_attr_destroy(&attr);
++		free(stack_addr);
++		return;
++	}
++
++	void *retrieved_stack_addr = NULL;
++	size_t retrieved_stack_size = 0;
++
++	retval = pthread_attr_getstack(&attr, &retrieved_stack_addr,
++	                               &retrieved_stack_size);
++	TEST(retval == 0,
++	     "test_valid_input_set_and_retrieve_stack_attributes: "
++	     "pthread_attr_getstack() failed with error: %s\n",
++	     strerror(retval));
++	TEST(retrieved_stack_addr == stack_addr,
++	     "test_valid_input_set_and_retrieve_stack_attributes: "
++	     "retrieved_stack_addr (%d) did not match the stack_addr (%d)\n",
++	     retrieved_stack_addr, stack_addr);
++	TEST(retrieved_stack_size == stack_size,
++	     "test_valid_input_set_and_retrieve_stack_attributes: "
++	     "retrieved_stack_size (%d) did not match the stack_size (%d)\n",
++	     retrieved_stack_size, stack_size);
++
++	pthread_attr_destroy(&attr);
++	free(stack_addr);
++	return;
++}
++
++static void test_stack_size(struct test_cases test)
++{
++	size_t stack_size = DEFAULT_STACK_SIZE;
++	void *stack_addr = calloc(stack_size, sizeof(char));
++	if (stack_addr == NULL) {
++		t_error("test_invalid_stack_size_zero: calloc() "
++		        "did not work correctly, Error: %s\n",
++		        strerror(errno));
++		return;
++	}
++
++	pthread_attr_t attr;
++	int retval = pthread_attr_init(&attr);
++	if (retval != 0) {
++		t_error("test_invalid_stack_size_zero: "
++		        "pthread_attr_init() did not work correctly with Error: %s\n",
++		        strerror(retval));
++		free(stack_addr);
++		return;
++	}
++
++	retval = pthread_attr_setstack(&attr, stack_addr, test.stack_size);
++	TEST(retval == test.exp_retval,
++	     "test_invalid_stack_size_zero: "
++	     "pthread_attr_setstack() did not return %d as expected\n",
++	     test.exp_retval);
++
++	pthread_attr_destroy(&attr);
++	free(stack_addr);
++	return;
++}
++
++int main(void)
++{
++	test_valid_input_set_and_retrieve_stack_attributes();
++
++	struct test_cases tests[] = {
++	    {DEFAULT_STACK_SIZE, 0},         {PTHREAD_STACK_MIN, 0},
++	    {MAXIMUM_STACK_SIZE, 0},         {OVERSIZED_STACK_SIZE, EINVAL},
++	    {UNDERSIZED_STACK_SIZE, EINVAL}, {INVALID_STACK_SIZE, EINVAL},
++	};
++
++	const size_t num_tests = sizeof(tests) / sizeof(*tests);
++
++	for (int test = 0; test < num_tests; ++test) {
++		test_stack_size(tests[test]);
++	}
++
++	return t_status;
++}
+diff --git a/src/functional/pthread_attr_setstacksize.c b/src/functional/pthread_attr_setstacksize.c
+new file mode 100644
+index 0000000..55c35bc
+--- /dev/null
++++ b/src/functional/pthread_attr_setstacksize.c
+@@ -0,0 +1,101 @@
++/*
++ * pthread_attr_setstacksize test
++ */
++
++#include "test.h" // Common test header (needed for all unit tests written)
++#include <errno.h>
++#include <limits.h>
++#include <pthread.h>
++#include <stdint.h>
++#include <string.h>
++
++// if c evaluates to 0, execute t_error with the specified error message
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++#define DEFAULT_STACK_SIZE \
++	(131072) // arbitrarily same as pthread_attr_setstacksize.c
++#define DEFAULT_STACK_MAX \
++	(8 << 20) // same as pthread_attr_setstacksize.c
++	          // bitwise left shift equivalent to (8*(2.^20))
++#define UNDERSIZED_STACK_SIZE (PTHREAD_STACK_MIN - 1)
++
++void check_setstacksize(void)
++{
++	static pthread_attr_t stacksize;
++	size_t test_size_value = 0;
++	errno = 0;
++
++	// Note: Passing set/ get function an uninitialized attribute should return
++	// undefined behaviour
++	int attrresult = pthread_attr_init(&stacksize);
++	if (attrresult != 0) {
++		t_error("pthread_attr_init failed with status %i, %s\n", attrresult,
++		        strerror(errno));
++	}
++	// Test case 1: Set an acceptable stack size
++	int setresult =
++	    pthread_attr_setstacksize(&stacksize, (size_t)DEFAULT_STACK_SIZE);
++	TEST(setresult == 0, "pthread_attr_setstacksize failed with status %i\n",
++	     setresult);
++	// errnos are handled in the set function only
++	int getresult = pthread_attr_getstacksize(&stacksize, &test_size_value);
++	if (getresult != 0 || test_size_value != (size_t)DEFAULT_STACK_SIZE) {
++		t_error("pthread_attr_getstacksize failed. Returned status %i with "
++		        "test_size_value %ld expected %ld.\n",
++		        getresult, test_size_value, DEFAULT_STACK_SIZE);
++	}
++
++	// Test case 2: Boundary values for stacksize (should return EINVAL error if
++	// stacksize < specified minimum or > system-imposed limit)
++	setresult = pthread_attr_setstacksize(&stacksize, PTHREAD_STACK_MIN);
++	getresult = pthread_attr_getstacksize(&stacksize, &test_size_value);
++	TEST(setresult == 0,
++	     "pthread_attr_setstacksize failed to set minimum stack size %i, %s.\n",
++	     setresult, strerror(errno));
++	if (getresult != 0 || test_size_value != (size_t)PTHREAD_STACK_MIN) {
++		t_error("pthread_attr_getstacksize failed. Returned status %i with "
++		        "test_size_value %ld.\n",
++		        getresult, test_size_value);
++	}
++
++	setresult = pthread_attr_setstacksize(&stacksize, DEFAULT_STACK_MAX);
++	getresult = pthread_attr_getstacksize(&stacksize, &test_size_value);
++	TEST(setresult == 0,
++	     "pthread_attr_setstacksize failed to set maximum %ld stack size %i.\n",
++	     DEFAULT_STACK_MAX, setresult);
++	if (getresult != 0 || test_size_value != (size_t)DEFAULT_STACK_MAX) {
++		t_error("pthread_attr_getstacksize failed. Returned status %i with "
++		        "test_size_value %ld.\n",
++		        getresult, test_size_value);
++	}
++
++	// NOTE: There is no logic to reject a valid stack size as long as it is
++	// greater than the minimum requirement, and no requirement to impose a
++	// maximum other than the agnostic system imposed limit.
++
++	setresult = pthread_attr_setstacksize(&stacksize, UNDERSIZED_STACK_SIZE);
++	TEST(setresult == EINVAL,
++	     "pthread_attr_setstacksize failed to error EINVAL setting undersized "
++	     "stack size, returned %i.\n",
++	     setresult);
++
++	// Test case 3: Error handling for null attribute value (undersize extreme)
++	setresult = pthread_attr_setstacksize(&stacksize, (intptr_t)NULL);
++	TEST(setresult == EINVAL,
++	     "pthread_attr_setstacksize failed to error EINVAL setting NULL stack "
++	     "size, returned %i.\n",
++	     setresult);
++
++	// cleanup
++	int cleanupresult = pthread_attr_destroy(&stacksize);
++	if (cleanupresult != 0) {
++		t_error("the cleanupresult, %i, did not succeed as expected\n",
++		        cleanupresult);
++	}
++}
++
++int main(void)
++{
++	check_setstacksize();
++	return t_status;
++}
+diff --git a/src/functional/pthread_getcpuclockid.c b/src/functional/pthread_getcpuclockid.c
+new file mode 100644
+index 0000000..9f3880f
+--- /dev/null
++++ b/src/functional/pthread_getcpuclockid.c
+@@ -0,0 +1,44 @@
++/*
++ * pthread_getcpuclockid test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++#include <string.h>
++#include <time.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void *thread_function(void *arg)
++{
++	while (1) {
++		pthread_testcancel();
++	}
++
++	return 0;
++}
++
++int main(void)
++{
++	pthread_t test_thread = 0;
++	clockid_t clockid = 0;
++
++	int retval = pthread_create(&test_thread, 0, thread_function, 0);
++	if (retval != 0) {
++		t_error("pthread_create() failed. Returned %d\n", retval);
++		return t_status;
++	}
++
++	retval = pthread_getcpuclockid(test_thread, &clockid);
++	TEST(retval == 0, "pthread_getcpuclockid() failed. Returned %d\n", retval);
++
++	// test that the clockid returns a valid clock
++	struct timespec tp;
++	TEST(clock_gettime(clockid, &tp) == 0,
++	     "clock_gettime() failed with errno: %s\n", strerror(errno));
++
++	pthread_cancel(test_thread);
++	pthread_join(test_thread, 0);
++	return t_status;
++}
+diff --git a/src/functional/pthread_mutex_trylock.c b/src/functional/pthread_mutex_trylock.c
+new file mode 100644
+index 0000000..6d0bb90
+--- /dev/null
++++ b/src/functional/pthread_mutex_trylock.c
+@@ -0,0 +1,180 @@
++/*
++ * pthread_mutex_trylock unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++#include <semaphore.h>
++#include <stdio.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TESTR(f, g) \
++	do { \
++		if ((f) != 0) { \
++			t_error(#f " failed: %s in test %s\n", strerror(errno), g); \
++			return t_status; \
++		} \
++	} while (0)
++
++static void *trylock_robust(void *arg)
++{
++	void **args = arg;
++	pthread_mutex_t *lock = args[0];
++	int status = pthread_mutex_trylock(lock);
++	TEST(status == 0, "Expected trylock to succeed, instead got: %d\n", status);
++
++	pthread_barrier_t *barrier = args[3];
++	pthread_barrier_wait(barrier);
++
++	sem_t *sync = args[2];
++	sem_wait(sync);
++
++	return 0;
++}
++
++static void *trylock(void *arg)
++{
++	void **args = arg;
++	pthread_mutex_t *lock = args[0];
++	int status = pthread_mutex_trylock(lock);
++	TEST(status == 0, "Expected trylock to succeed, instead got: %d\n", status);
++
++	int type = 0;
++	pthread_mutexattr_t *attributes = args[1];
++	if (pthread_mutexattr_gettype(attributes, &type) != 0)
++		t_error("Failed to get mutex attributes\n");
++
++	if (type == PTHREAD_MUTEX_RECURSIVE) {
++		// mutex currently owned by the calling thread, should return
++		// success
++		status = pthread_mutex_trylock(lock);
++		TEST(status == 0, "Expected trylock to return 0, instead got: %d\n",
++		     status);
++
++		if (pthread_mutex_unlock(lock) != 0)
++			t_error("Couldn't unlock trylocked mutex\n");
++	}
++
++	if (pthread_mutex_unlock(lock) != 0)
++		t_error("Couldn't unlock trylocked mutex\n");
++
++	if (pthread_mutex_lock(lock) != 0)
++		t_error("Couldn't lock unlocked mutex\n");
++
++	pthread_barrier_t *barrier = args[3];
++	pthread_barrier_wait(barrier);
++
++	sem_t *sync = args[2];
++	sem_wait(sync);
++
++	return 0;
++}
++
++static int spawn_and_test_mutex(void *(*run)(void *), pthread_mutex_t *mutex,
++                                sem_t *sync, pthread_mutexattr_t *attributes)
++{
++	pthread_barrier_t barrier;
++	pthread_barrier_init(&barrier, 0, 2);
++
++	pthread_t thread_id = 0;
++	void *args[] = {mutex, attributes, sync, &barrier};
++	TESTR(pthread_create(&thread_id, 0, run, args), "pthread create trylock");
++
++	pthread_barrier_wait(&barrier);
++
++	// Mutex should be locked by thread, calling here should return EBUSY
++	int status = pthread_mutex_trylock(mutex);
++	TEST(status == EBUSY, "Trylock should return EBUSY, instead got %d\n",
++	     status);
++
++	sem_post(sync);
++	TESTR(pthread_join(thread_id, NULL), "pthread join trylock");
++
++	return 0;
++}
++
++static int spawn_and_test_robust(void *(*run)(void *), pthread_mutex_t *mutex,
++                                 sem_t *sync, pthread_mutexattr_t *attributes)
++{
++	pthread_barrier_t barrier;
++	pthread_barrier_init(&barrier, 0, 2);
++
++	pthread_t thread_id = 0;
++	void *args[] = {mutex, attributes, sync, &barrier};
++	TESTR(pthread_create(&thread_id, 0, run, args), "pthread create trylock");
++
++	pthread_barrier_wait(&barrier);
++	// While thread is still alive, trylock should return EBUSY, as it is
++	// currently owned by another thread
++	int status = pthread_mutex_trylock(mutex);
++	TEST(status == EBUSY, "Trylock should return EBUSY, instead got %d\n",
++	     status);
++
++	sem_post(sync);
++	TESTR(pthread_join(thread_id, NULL), "pthread join trylock");
++
++	// Thread terminated holding mutex, expect EOWNERDEAD
++	status = pthread_mutex_trylock(mutex);
++	TEST(status == EOWNERDEAD,
++	     "Trylock should return EOWNERDEAD, instead got %d\n", status);
++
++	status = pthread_mutex_unlock(mutex);
++	TEST(status == 0, "Unlock should succeed, instead got %d\n", status);
++
++	// Second lock after unlock should return ENOTRECOVERABLE
++	status = pthread_mutex_trylock(mutex);
++	TEST(status == ENOTRECOVERABLE,
++	     "Trylock should return ENOTRECOVERABLE, instead got %d\n", status);
++	return 0;
++}
++
++static const struct {
++	int mutex;
++	int robust;
++	char *mutex_name;
++} tests[] = {
++    {PTHREAD_MUTEX_NORMAL, PTHREAD_MUTEX_STALLED, "normal mutex"},
++    {PTHREAD_MUTEX_RECURSIVE, PTHREAD_MUTEX_STALLED, "recursive mutex"},
++    {PTHREAD_MUTEX_ERRORCHECK, PTHREAD_MUTEX_STALLED, "error checking mutex"},
++
++    {PTHREAD_MUTEX_NORMAL, PTHREAD_MUTEX_ROBUST, "robust normal mutex"},
++    {PTHREAD_MUTEX_RECURSIVE, PTHREAD_MUTEX_ROBUST, "robust recursive mutex"},
++    {PTHREAD_MUTEX_ERRORCHECK, PTHREAD_MUTEX_ROBUST,
++     "robust error checking mutex"},
++};
++
++int main(void)
++{
++	const size_t num_tests = sizeof(tests) / sizeof(*tests);
++
++	for (int test = 0; test < num_tests; ++test) {
++		pthread_mutexattr_t attributes;
++		char *current_test = tests[test].mutex_name;
++		TESTR(pthread_mutexattr_init(&attributes), current_test);
++		TESTR(pthread_mutexattr_settype(&attributes, tests[test].mutex),
++		      current_test);
++
++		TESTR(pthread_mutexattr_setrobust(&attributes, tests[test].robust),
++		      current_test);
++
++		pthread_mutex_t mutex;
++		TESTR(pthread_mutex_init(&mutex, &attributes), current_test);
++
++		sem_t sync;
++		TESTR(sem_init(&sync, 0, 0), current_test);
++		if (tests[test].robust == PTHREAD_MUTEX_STALLED)
++			TESTR(spawn_and_test_mutex(trylock, &mutex, &sync, &attributes),
++			      current_test);
++		else
++			TESTR(spawn_and_test_robust(trylock_robust, &mutex, &sync,
++			                            &attributes),
++			      current_test);
++
++		TESTR(sem_destroy(&sync), current_test);
++		TESTR(pthread_mutex_destroy(&mutex), current_test);
++		TESTR(pthread_mutexattr_destroy(&attributes), current_test);
++	}
++
++	return t_status;
++}
+diff --git a/src/functional/pthread_mutexattr_destroy.c b/src/functional/pthread_mutexattr_destroy.c
+new file mode 100644
+index 0000000..4b3aa2c
+--- /dev/null
++++ b/src/functional/pthread_mutexattr_destroy.c
+@@ -0,0 +1,25 @@
++/*
++ * pthread_mutexattr_destroy unit test
++ */
++
++#include "test.h"
++#include <pthread.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++int main(void)
++{
++	pthread_mutexattr_t attr;
++
++	int retval = pthread_mutexattr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_mutexattr_init() failed. Returned %d\n", retval);
++		return t_status;
++	}
++
++	retval = pthread_mutexattr_destroy(&attr);
++	TEST(retval == 0, "pthread_mutexattr_destroy() failed. Returned %d\n",
++	     retval);
++
++	return t_status;
++}
+diff --git a/src/functional/pthread_mutexattr_getprotocol.c b/src/functional/pthread_mutexattr_getprotocol.c
+new file mode 100644
+index 0000000..10ce13f
+--- /dev/null
++++ b/src/functional/pthread_mutexattr_getprotocol.c
+@@ -0,0 +1,45 @@
++/*
++ * pthread_mutexattr_getprotocol unit test
++ *
++ * Note: PTHREAD_PRIO_PROTECT is not supported in musl
++ */
++
++#include "test.h"
++#include <pthread.h>
++
++#define INVALID_PROTOCOL (-1)
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void test_valid_protocol(const int protocol)
++{
++	pthread_mutexattr_t attr;
++	int retval = pthread_mutexattr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_mutexattr_init() failed. Returned %d\n", retval);
++		return;
++	}
++	retval = pthread_mutexattr_setprotocol(&attr, protocol);
++	if (retval != 0) {
++		t_error("pthread_mutexattr_setprotocol() failed when setting protocol "
++		        "to %d. Returned %d\n",
++		        protocol, retval);
++		pthread_mutexattr_destroy(&attr);
++		return;
++	}
++	int protocol_value = INVALID_PROTOCOL;
++	retval = pthread_mutexattr_getprotocol(&attr, &protocol_value);
++
++	TEST(retval == 0 && protocol_value == protocol,
++	     "pthread_mutexattr_getprotocol() failed. Returned %d. Expected "
++	     "protocol value of %d, got %d\n",
++	     retval, protocol, protocol_value);
++
++	pthread_mutexattr_destroy(&attr);
++}
++
++int main(void)
++{
++	test_valid_protocol(PTHREAD_PRIO_NONE);
++	test_valid_protocol(PTHREAD_PRIO_INHERIT);
++	return t_status;
++}
+diff --git a/src/functional/pthread_mutexattr_init.c b/src/functional/pthread_mutexattr_init.c
+new file mode 100644
+index 0000000..b8e1d38
+--- /dev/null
++++ b/src/functional/pthread_mutexattr_init.c
+@@ -0,0 +1,41 @@
++/*
++ * pthread_mutexattr_init unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++int main(void)
++{
++	pthread_mutexattr_t attr;
++
++	int retval = pthread_mutexattr_init(&attr);
++
++	if (retval != 0 && retval != ENOMEM) {
++		t_error("pthread_mutexattr_init failed with unexpected return value. "
++		        "Returned %d\n",
++		        retval);
++		return t_status;
++	}
++
++	retval = pthread_mutexattr_destroy(&attr);
++	if (retval != 0) {
++		t_error("pthread_mutexattr_destroy() failed. Returned %d\n", retval);
++		return t_status;
++	}
++
++	// a destroyed attributes object can be reinitialized
++	retval = pthread_mutexattr_init(&attr);
++	TEST(retval == 0 || retval == ENOMEM,
++	     "pthread_mutexattr_init failed when initializing a destroyed "
++	     "attribute object. Returned "
++	     "%d\n",
++	     retval);
++
++	pthread_mutexattr_destroy(&attr);
++
++	return t_status;
++}
+diff --git a/src/functional/pthread_mutexattr_setprotocol.c b/src/functional/pthread_mutexattr_setprotocol.c
+new file mode 100644
+index 0000000..400e386
+--- /dev/null
++++ b/src/functional/pthread_mutexattr_setprotocol.c
+@@ -0,0 +1,50 @@
++/*
++ * pthread_mutexattr_setprotocol unit test
++ *
++ * Note: PTHREAD_PRIO_PROTECT is not supported in musl
++ */
++
++#include "test.h"
++#include <pthread.h>
++
++#define INVALID_PROTOCOL (-1)
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static void test_valid_protocol(const int protocol)
++{
++	pthread_mutexattr_t attr;
++	int retval = pthread_mutexattr_init(&attr);
++	if (retval != 0) {
++		t_error("pthread_mutexattr_init() failed. Returned %d\n", retval);
++		return;
++	}
++
++	retval = pthread_mutexattr_setprotocol(&attr, protocol);
++	if (retval != 0) {
++		t_error("pthread_mutexattr_setprotocol() failed. Returned %d\n");
++		pthread_mutexattr_destroy(&attr);
++		return;
++	}
++
++	int protocol_value = INVALID_PROTOCOL;
++
++	retval = pthread_mutexattr_getprotocol(&attr, &protocol_value);
++	if (retval != 0) {
++		t_error("pthread_mutexattr_getprotocol() failed. Returned %d\n",
++		        retval);
++		pthread_mutexattr_destroy(&attr);
++		return;
++	}
++	TEST(protocol_value == protocol,
++	     "Failed to set the correct protocol value. Expected %d, got %d\n",
++	     protocol, protocol_value);
++
++	pthread_mutexattr_destroy(&attr);
++}
++
++int main(void)
++{
++	test_valid_protocol(PTHREAD_PRIO_NONE);
++	test_valid_protocol(PTHREAD_PRIO_INHERIT);
++	return t_status;
++}
+diff --git a/src/functional/pthread_self.c b/src/functional/pthread_self.c
+new file mode 100644
+index 0000000..86e5890
+--- /dev/null
++++ b/src/functional/pthread_self.c
+@@ -0,0 +1,39 @@
++/*
++ * pthread_self unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TESTR(f, g) \
++	do { \
++		if ((f) != 0) { \
++			t_error(#f " failed: %s in test %s\n", strerror(errno), g); \
++			return t_status; \
++		} \
++	} while (0)
++
++void *save_pthread_id(void *args)
++{
++	pthread_t *thread_id = (pthread_t *)args;
++	*thread_id = pthread_self();
++	return 0;
++}
++
++int main(void)
++{
++	pthread_t thread_id = 0;
++	pthread_t expected_id = 0;
++
++	TESTR(pthread_create(&thread_id, 0, save_pthread_id, &expected_id),
++	      "creating thread");
++	TESTR(pthread_join(thread_id, NULL), "joining thread");
++
++	TEST(expected_id == thread_id,
++	     "Expected thread id %p to equal thread id %p\n", thread_id,
++	     expected_id);
++
++	return t_status;
++}
+diff --git a/src/functional/pthread_sigmask.c b/src/functional/pthread_sigmask.c
+new file mode 100644
+index 0000000..6cf9e20
+--- /dev/null
++++ b/src/functional/pthread_sigmask.c
+@@ -0,0 +1,206 @@
++/*
++ * pthread_sigmask.c unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++#include <semaphore.h>
++#include <signal.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TESTR(f, g) \
++	do { \
++		if ((f) != 0) { \
++			t_error(#f " failed: %s in test %s\n", strerror(errno), g); \
++			return t_status; \
++		} \
++	} while (0)
++#define TESTRT(f) ((f) || (t_error(#f " failed: %s", strerror(errno)), 0))
++
++static volatile sig_atomic_t unblocked_sig = 0;
++static volatile sig_atomic_t unmasked_sig = 0;
++static pthread_t unblocked_thread;
++static pthread_t unmasked_thread;
++
++static void sigusr_handler(int signum)
++{
++	if (signum == SIGUSR1) {
++		if (pthread_self() == unblocked_thread) {
++			// Expect that SIGUSR gets delivered instead of blocked and pending
++			unblocked_sig = 1;
++		}
++
++		if (pthread_self() == unmasked_thread) {
++			unmasked_sig = 1;
++		}
++	}
++}
++
++static void *inherited_sigmask(void *args)
++{
++	sigset_t sigset;
++	int status = pthread_sigmask(0, 0, &sigset);
++
++	TEST(status == 0, "Setting sigmask status: %d, expected 0\n", status);
++
++	TEST(sigismember(&sigset, SIGUSR1),
++	     "Expected SIGUSR1 in current sigmask\n");
++
++	return 0;
++}
++
++static void *unblock_signal(void *args)
++{
++	sigset_t sigmask;
++	TESTRT(sigemptyset(&sigmask) == 0);
++	TESTRT(sigaddset(&sigmask, SIGUSR1) == 0);
++	TESTRT(pthread_sigmask(SIG_UNBLOCK, &sigmask, 0) == 0);
++
++	while (!unblocked_sig) {
++		// Busy wait for signal to be delivered
++	}
++
++	return 0;
++}
++
++static void *sigmask_union(void *args)
++{
++	sigset_t thread_sigmask;
++	TESTRT(sigemptyset(&thread_sigmask) == 0);
++	TESTRT(sigaddset(&thread_sigmask, SIGUSR2) == 0);
++
++	sigset_t old_set;
++	int status = pthread_sigmask(SIG_BLOCK, &thread_sigmask, &old_set);
++
++	TEST(status == 0, "Setting sigmask status: %d, expected 0\n", status);
++
++	TEST(sigismember(&old_set, SIGUSR1),
++	     "Expected SIGUSR1 in current sigmask\n");
++
++	sigset_t union_set;
++	status = pthread_sigmask(0, 0, &union_set);
++	TEST(status == 0, "Getting current sigmask status: %d, expected 0\n",
++	     status);
++
++	TEST(sigismember(&union_set, SIGUSR1),
++	     "Expected SIGUSR1 in current sigmask\n");
++
++	TEST(sigismember(&union_set, SIGUSR2),
++	     "Expected SIGUSR2 in current sigmask\n");
++
++	return 0;
++}
++
++static void *mask_signal(void *args)
++{
++	sem_t *sync = (sem_t *)args;
++	sigset_t thread_sigmask, old_set;
++	TESTRT(sigemptyset(&thread_sigmask) == 0);
++	TESTRT(sigaddset(&thread_sigmask, SIGUSR2) == 0);
++
++	int status = pthread_sigmask(SIG_SETMASK, &thread_sigmask, &old_set);
++
++	TEST(status == 0, "Setting sigmask status: %d, expected 0\n", status);
++
++	TEST(!sigismember(&old_set, SIGUSR1),
++	     "Expected SIGUSR1 to be removed from old sigmask\n");
++
++	TESTRT(sem_post(sync) == 0);
++	int signal_caught = 0;
++	TESTRT(sigwait(&thread_sigmask, &signal_caught) == 0);
++	TEST(signal_caught == SIGUSR2,
++	     "Expected sig catch SIGUSR2, instead caught: %d\n", signal_caught);
++
++	return 0;
++}
++
++static int test_signal_deliveries(void)
++{
++	TESTR(pthread_create(&unblocked_thread, 0, unblock_signal, 0),
++	      "creating thread");
++	TESTR(pthread_kill(unblocked_thread, SIGUSR1), "sending SIGUSR1 to thread");
++
++	TESTR(pthread_join(unblocked_thread, 0), "joining thread");
++
++	TEST(unblocked_sig == 1, "Expected SIGUSR1 signal handler to execute\n",
++	     unblocked_sig);
++	return 0;
++}
++
++static int test_masked_signal(void)
++{
++	sem_t sync;
++	TESTR(sem_init(&sync, 0, 0), "initialising semaphore");
++	TESTR(pthread_create(&unmasked_thread, 0, mask_signal, &sync),
++	      "creating thread");
++	TESTR(sem_wait(&sync), "waiting for semaphore");
++	TESTR(pthread_kill(unmasked_thread, SIGUSR1), "sending SIGUSR1 to thread");
++	TESTR(pthread_kill(unmasked_thread, SIGUSR2), "sending SIGUSR2 to thread");
++	TESTR(pthread_join(unmasked_thread, 0), "joining thread");
++	TEST(unmasked_sig == 1, "Expected SIGUSR1 signal handler to execute\n");
++
++	return 0;
++}
++
++static void test_invalid_param(void)
++{
++	const int how = SIG_SETMASK + 1;
++	sigset_t sigmask;
++	int status = sigemptyset(&sigmask);
++	if (status != 0)
++		t_error("Unable to set empty set, error: %d, %s", status,
++		        strerror(status));
++
++	status = pthread_sigmask(how, &sigmask, 0);
++	TEST(status == EINVAL,
++	     "Expected EINVAL on invalid how argument, instead got: %d\n", status);
++}
++
++static void test_currently_blocked(void)
++{
++	sigset_t current_set;
++	int status = pthread_sigmask(0, 0, &current_set);
++	TEST(status == 0,
++	     "Expected pthread_sigmask to return currently blocked signals, "
++	     "instead got status: %d\n",
++	     status);
++	TEST(sigismember(&current_set, SIGUSR1),
++	     "Expected SIGUSR1 to be a member of currently blocked signals\n");
++}
++
++int main(void)
++{
++	test_invalid_param();
++
++	const struct sigaction sa = {.sa_handler = sigusr_handler};
++	struct sigaction restore;
++
++	TESTR(sigaction(SIGUSR1, &sa, &restore), "setting sigaction");
++	test_signal_deliveries();
++	test_masked_signal();
++	TESTR(sigaction(SIGUSR1, &restore, 0), "setting sigaction");
++
++	sem_t sync;
++	TESTR(sem_init(&sync, 0, 0), "initialising semaphore");
++
++	sigset_t thread_sigmask;
++	TESTR(sigemptyset(&thread_sigmask), "creating empty sigset");
++	TESTR(sigaddset(&thread_sigmask, SIGUSR1), "adding SIGUSR1 to set");
++
++	int status = pthread_sigmask(SIG_BLOCK, &thread_sigmask, 0);
++	TEST(status == 0, "Setting sigmask status: %d, expected 0\n", status);
++	test_currently_blocked();
++
++	pthread_t thread_id = 0, thread_overwrite_id = 0;
++	TESTR(pthread_create(&thread_id, 0, inherited_sigmask, &thread_sigmask),
++	      "creating thread");
++	TESTR(pthread_create(&thread_overwrite_id, 0, sigmask_union, &sync),
++	      "creating thread");
++
++	// Wait for the threads to finish
++	TESTR(pthread_join(thread_id, 0), "joining thread");
++	TESTR(pthread_join(thread_overwrite_id, 0), "joining thread");
++
++	return t_status;
++}
+diff --git a/src/functional/pthread_testcancel.c b/src/functional/pthread_testcancel.c
+new file mode 100644
+index 0000000..4aca986
+--- /dev/null
++++ b/src/functional/pthread_testcancel.c
+@@ -0,0 +1,125 @@
++/*
++ * pthread_testcancel.c unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++#include <semaphore.h>
++#include <stdio.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TESTE(f, g) \
++	do { \
++		if ((f) != 0) { \
++			t_error(#f " failed: %s in test %s\n", strerror(errno), g); \
++			break; \
++		} \
++	} while (0)
++
++#define THREAD_CANCELED 1
++#define THREAD_FINISHED 2
++
++typedef struct {
++	void *(*run)(void *);
++	const char *info;
++	sem_t sync;
++	int status;
++} test_definition;
++
++static void cleanup(void *arg) { *(int *)arg = THREAD_CANCELED; }
++
++static void *test_cancel(void *arg)
++{
++	pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, NULL);
++	test_definition *test = arg;
++	pthread_cleanup_push(cleanup, &test->status);
++	sem_wait(&test->sync);
++	pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
++	pthread_testcancel();
++	test->status = THREAD_FINISHED;
++	pthread_cleanup_pop(0);
++	return 0;
++}
++
++static void *test_cancel_disabled(void *arg)
++{
++	pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, NULL);
++	test_definition *test = arg;
++	pthread_cleanup_push(cleanup, &test->status);
++	sem_wait(&test->sync);
++
++	// Cancelability is disabled, function should do nothing
++	pthread_testcancel();
++	test->status = THREAD_FINISHED;
++	pthread_cleanup_pop(0);
++	return 0;
++}
++
++static void *test_cancel_async(void *arg)
++{
++	test_definition *test = arg;
++	pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, NULL);
++	pthread_cleanup_push(cleanup, &test->status);
++
++	sem_wait(&test->sync);
++	pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
++	pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
++	pthread_testcancel();
++	test->status = THREAD_FINISHED;
++	pthread_cleanup_pop(0);
++	return 0;
++}
++
++static void *test_cancel_loop(void *arg)
++{
++	test_definition *test = arg;
++	pthread_cleanup_push(cleanup, &test->status);
++	for (;;) {
++		pthread_testcancel();
++	}
++	pthread_cleanup_pop(0);
++	return 0;
++}
++
++int main(void)
++{
++	sem_t sync;
++	TESTE(sem_init(&sync, 0, 0), "initialising semaphore");
++
++	test_definition tests[] = {
++	    {test_cancel, "test default cancel", sync, 0},
++	    {test_cancel_disabled, "test disabled cancel", sync, 0},
++	    {test_cancel_async, "test asynchronous cancel", sync, 0},
++	    {test_cancel_loop, "test cancel loop", sync, 0}};
++
++	int expected_args[] = {THREAD_CANCELED, THREAD_FINISHED, THREAD_CANCELED,
++	                       THREAD_CANCELED};
++	const size_t num_tests = sizeof(tests) / sizeof(*tests);
++
++	for (int test = 0; test < num_tests; ++test) {
++		pthread_t test_thread = 0;
++		const char *current_info = tests[test].info;
++		TESTE(pthread_create(&test_thread, 0, tests[test].run, &tests[test]),
++		      current_info);
++
++		TESTE(pthread_cancel(test_thread), current_info);
++		TESTE(sem_post(&tests[test].sync), current_info);
++
++		void *thread_status = 0;
++		TESTE(pthread_join(test_thread, &thread_status), current_info);
++
++		if (expected_args[test] == THREAD_CANCELED) {
++			TEST(thread_status == PTHREAD_CANCELED,
++			     "Expected cancel exit status, instead got: %d\n",
++			     thread_status);
++		}
++
++		TEST(tests[test].status == expected_args[test],
++		     "Unexpected execution of thread cleanup function, "
++		     "expected thread %s to exit normally, status: %d\n",
++		     tests[test].info, tests[test].status);
++	}
++
++	return t_status;
++}
+diff --git a/src/functional/sched_get_priority_max.c b/src/functional/sched_get_priority_max.c
+new file mode 100644
+index 0000000..175e1f2
+--- /dev/null
++++ b/src/functional/sched_get_priority_max.c
+@@ -0,0 +1,40 @@
++/*
++ * sched_get_priority_max unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <sched.h>
++#include <string.h>
++
++#define RETURN_FAILURE (-1)
++#define RETURN_SUCCESS (0)
++#define INVALID_SCHED_POLICY (-1)
++
++#define TEST(c, ...) ((c) || (t_error("TEST(" #c ") failed " __VA_ARGS__), 0))
++
++static void test_valid_scheduling_policy(const int sched_policy)
++{
++	int max_priority = sched_get_priority_max(sched_policy);
++	TEST(max_priority != RETURN_FAILURE && errno == RETURN_SUCCESS,
++	     "[Returned %d with error %s]\n", max_priority, strerror(errno));
++	return;
++}
++
++static void test_invalid_scheduling_policy(const int sched_policy)
++{
++	int max_priority = sched_get_priority_max(sched_policy);
++	TEST(max_priority == RETURN_FAILURE && errno == EINVAL,
++	     "[did not return %d with error %s]\n", max_priority, strerror(errno));
++	return;
++}
++
++int main(void)
++{
++	test_valid_scheduling_policy(SCHED_FIFO);
++	test_valid_scheduling_policy(SCHED_RR);
++	test_valid_scheduling_policy(SCHED_OTHER);
++
++	test_invalid_scheduling_policy(INVALID_SCHED_POLICY);
++
++	return t_status;
++}
+diff --git a/src/functional/sched_get_priority_min.c b/src/functional/sched_get_priority_min.c
+new file mode 100644
+index 0000000..4393f45
+--- /dev/null
++++ b/src/functional/sched_get_priority_min.c
+@@ -0,0 +1,40 @@
++/*
++ * sched_get_priority_min unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <sched.h>
++#include <string.h>
++
++#define RETURN_FAILURE (-1)
++#define RETURN_SUCCESS (0)
++#define INVALID_SCHED_POLICY (-1)
++
++#define TEST(c, ...) ((c) || (t_error("TEST(" #c ") failed " __VA_ARGS__), 0))
++
++static void test_valid_scheduling_policy(const int sched_policy)
++{
++	int max_priority = sched_get_priority_min(sched_policy);
++	TEST(max_priority != RETURN_FAILURE && errno == RETURN_SUCCESS,
++	     "[Returned %d with error %s]\n", max_priority, strerror(errno));
++	return;
++}
++
++static void test_invalid_scheduling_policy(const int sched_policy)
++{
++	int max_priority = sched_get_priority_min(sched_policy);
++	TEST(max_priority == RETURN_FAILURE && errno == EINVAL,
++	     "[did not return %d with error %s]\n", max_priority, strerror(errno));
++	return;
++}
++
++int main(void)
++{
++	test_valid_scheduling_policy(SCHED_FIFO);
++	test_valid_scheduling_policy(SCHED_RR);
++	test_valid_scheduling_policy(SCHED_OTHER);
++
++	test_invalid_scheduling_policy(INVALID_SCHED_POLICY);
++
++	return t_status;
++}
+diff --git a/src/functional/sched_rr_get_interval.c b/src/functional/sched_rr_get_interval.c
+new file mode 100644
+index 0000000..47b63af
+--- /dev/null
++++ b/src/functional/sched_rr_get_interval.c
+@@ -0,0 +1,117 @@
++/*
++ * sched_rr_get_interval unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <sched.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/wait.h>
++
++#define RETURN_FAILURE (-1)
++#define RETURN_SUCCESS (0)
++#define INVALID_PID (-1)
++#define MAX_NSEC (1000000000)
++#define ZERO_PID (0)
++#define CURRENT_PID (1)
++#define MAX_PID (2)
++
++#define TEST(c, ...) ((c) || (t_error("TEST(" #c ") failed " __VA_ARGS__), 0))
++
++static void test_sched_rr_get_interval_success(void)
++{
++	struct timespec sched_interval = {-1, -1};
++	int valid_pid = getpid();
++
++	errno = 0;
++	int retval = sched_rr_get_interval(valid_pid, &sched_interval);
++	if (!retval) {
++		// Check if returned time values are correct.
++		TEST(sched_interval.tv_sec >= 0,
++		     "Failed to get correct timespec.tv_sec values. expected [tv_sec "
++		     ">=0 ], got [%ld]\n",
++		     sched_interval.tv_sec);
++		TEST(sched_interval.tv_nsec >= 0 && sched_interval.tv_nsec < MAX_NSEC,
++		     "Failed to get correct timespec.tv_nsec values. expected [0 =< "
++		     "tv_nsec < %d], got [%ld]\n",
++		     MAX_NSEC, sched_interval.tv_nsec);
++	} else {
++		t_error("test_sched_rr_get_interval_success: "
++		        "sched_rr_get_interval() did not work correctly for PID: %d "
++		        "Error: %s\n",
++		        valid_pid, strerror(errno));
++	}
++	return;
++}
++
++static void test_sched_rr_get_interval_failure(void)
++{
++	// Create a child process which exit immediately
++	pid_t child_pid = fork();
++	if (child_pid == -1) {
++		t_error("test_sched_rr_get_interval_failure fork failed\n");
++	} else {
++		if (child_pid == 0) {
++			exit(0);
++		} else {
++			int status = 0;
++			// Wait for the child process to exit
++			waitpid(child_pid, &status, 0);
++
++			// Assume the pid is not yet given to another process
++			struct timespec sched_interval;
++			errno = 0;
++			int retval = sched_rr_get_interval(child_pid, &sched_interval);
++			TEST(retval == RETURN_FAILURE && errno == ESRCH,
++			     "sched_rr_get_interval() did not fail with invalid PID: %d. "
++			     "expected "
++			     "return: -1, got: %d. expected error: ESRCH, got: %d\n",
++			     child_pid, retval, errno);
++		}
++	}
++	return;
++}
++
++static void test_sched_rr_get_interval_pid_zero(void)
++{
++	struct timespec sched_interval[MAX_PID] = {{-1, -1}, {-1, -1}};
++	int pid_zero = 0;
++	errno = 0;
++
++	int retval = sched_rr_get_interval(pid_zero, &sched_interval[ZERO_PID]);
++	if (!retval) {
++		int pid_current = getpid();
++		retval =
++		    sched_rr_get_interval(pid_current, &sched_interval[CURRENT_PID]);
++		if (!retval) {
++			TEST(sched_interval[ZERO_PID].tv_sec ==
++			             sched_interval[CURRENT_PID].tv_sec &&
++			         sched_interval[ZERO_PID].tv_nsec ==
++			             sched_interval[CURRENT_PID].tv_nsec,
++			     "Expected pid_zero interval tv_sec:%d, tv_nsec:%d and "
++			     "pid_current interval tv_sec:%d, tv_nsec:%d to match\n",
++			     sched_interval[ZERO_PID].tv_sec,
++			     sched_interval[ZERO_PID].tv_nsec,
++			     sched_interval[CURRENT_PID].tv_sec,
++			     sched_interval[CURRENT_PID].tv_nsec);
++		} else {
++			t_error("test_sched_rr_get_interval_pid_zero sched_rr_get_interval "
++			        "failed for PID: %d and returned: %d with error: %s\n",
++			        pid_current, retval, strerror(errno));
++		}
++	} else {
++		t_error("test_sched_rr_get_interval_pid_zero sched_rr_get_interval "
++		        "failed for PID: %d and returned: %d with error: %s\n",
++		        pid_zero, retval, strerror(errno));
++	}
++	return;
++}
++
++int main(void)
++{
++	test_sched_rr_get_interval_success();
++	test_sched_rr_get_interval_failure();
++	test_sched_rr_get_interval_pid_zero();
++	return t_status;
++}
+diff --git a/src/functional/sched_yield.c b/src/functional/sched_yield.c
+new file mode 100644
+index 0000000..2692c16
+--- /dev/null
++++ b/src/functional/sched_yield.c
+@@ -0,0 +1,28 @@
++/*
++ * sched_yield unit test
++ *
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <sched.h>
++#include <string.h>
++
++#define TEST(c, ...) ((c) || (t_error("TEST(" #c ") failed " __VA_ARGS__), 0))
++
++static void test_sched_yield_return(void)
++{
++	int retval = sched_yield();
++
++	TEST(retval == 0,
++	     "test_sched_yield_return: sched_yield() failed with error: %s\n",
++	     strerror(errno));
++
++	return;
++}
++
++int main(void)
++{
++	test_sched_yield_return();
++	return t_status;
++}
+diff --git a/src/functional/timer_create.c b/src/functional/timer_create.c
+new file mode 100644
+index 0000000..f22c1f0
+--- /dev/null
++++ b/src/functional/timer_create.c
+@@ -0,0 +1,217 @@
++/*
++ * timer_create test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <pthread.h>
++#include <signal.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/resource.h>
++#include <time.h>
++#include <unistd.h>
++
++// if c evaluates to 0, execute t_error with the specified error message
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define NOT_A_REAL_CLOCK 99
++
++volatile static int thread_cpu_timer_flag = 0;
++
++static void alarm_handler(int signal) { thread_cpu_timer_flag = 1; }
++
++static void test_timer_creation(void)
++{
++	clockid_t clock_ids[] = {
++	    CLOCK_REALTIME,
++#if defined _POSIX_CPUTIME
++	    CLOCK_PROCESS_CPUTIME_ID,
++#endif
++#if defined _POSIX_THREAD_CPUTIME
++	    CLOCK_THREAD_CPUTIME_ID,
++#endif
++	};
++
++	// setup mapping to execute alarm_handler when SIGALRM signal is received
++	struct sigaction timer_sigaction = {
++	    .sa_handler = alarm_handler,
++	};
++
++	sigemptyset(&timer_sigaction.sa_mask); // initialise an empty a signal
++	                                       // sigaction bitmask set
++	int sigaction_status = sigaction(SIGALRM, &timer_sigaction, NULL);
++
++	if (sigaction_status != 0) {
++		t_error("Sigaction for signal alarm could not be created, %s.\n",
++		        strerror(errno));
++		return;
++	}
++
++	const struct itimerspec timer_run = {
++	    .it_value = {0, 500000},
++	    .it_interval = {0, 0}}; // setup timer to expire after 0.0005 sec
++
++	const size_t size_of_clock_ids = sizeof(clock_ids) / sizeof(clock_ids[0]);
++
++	for (int i = 0; i < size_of_clock_ids; i++) {
++		timer_t timer_id = 0;
++		int status = timer_create(clock_ids[i], NULL, &timer_id);
++
++		TEST(status == 0 && errno == 0,
++		     "Timer %i couldn't be created with status code %i, %s.\n",
++		     clock_ids[i], status, strerror(errno));
++		TEST(timer_id >= 0, "Timer %i returned negative timer id, %s.\n",
++		     clock_ids[i], strerror(errno));
++		timer_settime(timer_id, 0, &timer_run,
++		              NULL); // apply the expiration increment to the timer
++
++		while (1) {
++			if (thread_cpu_timer_flag == 1) {
++				TEST(thread_cpu_timer_flag == 1,
++				     "SIGALARM signal not caught: %i.\n",
++				     thread_cpu_timer_flag);
++				break;
++			}
++		}
++
++		thread_cpu_timer_flag = 0; // reset flag
++		errno = 0;                 // reset errno
++		timer_delete(timer_id);
++	}
++	return;
++}
++
++static void test_signal_pending_resource_exhaustion(void)
++{
++#if defined RLIMIT_SIGPENDING
++	struct rlimit rlim = {0, 0};
++	errno = 0; // reset errno
++	struct rlimit original_limit = {0, 0};
++
++	// Test case 3: trigger return of EAGAIN from lack of queuing resources
++	int get_status = getrlimit(RLIMIT_SIGPENDING, &original_limit);
++	rlim.rlim_cur = 0;
++	rlim.rlim_max = original_limit.rlim_max;
++
++	int set_status =
++	    setrlimit(RLIMIT_SIGPENDING,
++	              &rlim); // set resource limit from RLIMIT_SIGPENDING to 0
++
++	if (set_status != 0 || get_status != 0) {
++		t_error("RLIMIT_SIGPENDING was not altered as expected.\n");
++	}
++
++	timer_t timer_id = 0;
++	int status = timer_create(CLOCK_REALTIME, NULL, &timer_id);
++
++	TEST(status == -1 && errno == EAGAIN,
++	     "Timer resource limit test did not trigger %i errno EAGAIN as "
++	     "expected, %s.\n",
++	     status, strerror(errno));
++
++	if (status == 0) {
++		timer_delete(timer_id);
++	}
++	errno = 0;
++
++	int revert_set_status = setrlimit(RLIMIT_SIGPENDING,
++	                                  &original_limit); // reset resource limit
++	if (revert_set_status != 0) {
++		t_error("RLIMIT_SIGPENDING was not reverted as expected, %i.\n",
++		        strerror(errno));
++	}
++#endif
++	return;
++}
++
++static void test_allowed_timer_clocks(void)
++{
++	errno = 0; // reset errno
++
++	// NOTE: The driver implementing CLOCK_SGI_CYCLE (10) got removed. The clock
++	// ID is kept as a place holder but is not to be used.
++
++	clockid_t clock_ids[] = {CLOCK_REALTIME,
++	                         CLOCK_MONOTONIC,
++#if defined _POSIX_CPUTIME
++	                         CLOCK_PROCESS_CPUTIME_ID,
++#endif
++#if defined _POSIX_THREAD_CPUTIME
++	                         CLOCK_THREAD_CPUTIME_ID,
++#endif
++	                         CLOCK_MONOTONIC_RAW,
++	                         CLOCK_REALTIME_COARSE,
++	                         CLOCK_MONOTONIC_COARSE,
++	                         CLOCK_BOOTTIME,
++	                         /* CLOCK_REALTIME_ALARM,
++	                         CLOCK_BOOTTIME_ALARM, */ // Require CAP_WAKE_ALARM permissions for ENOTSUP else EPERM
++	                         CLOCK_TAI,
++	                         NOT_A_REAL_CLOCK};
++
++	const size_t size_of_clock_ids = sizeof(clock_ids) / sizeof(clock_ids[0]);
++
++	// Test case 2: trigger return of errnos (all possible clock ids +1)
++	for (int i = 0; i < size_of_clock_ids; i++) {
++		timer_t timer_id = 0;
++		int status = timer_create(clock_ids[i], NULL, &timer_id);
++
++		switch (clock_ids[i]) {
++		// allowed
++		case CLOCK_REALTIME:
++		case CLOCK_MONOTONIC:
++#if defined _POSIX_CPUTIME
++		case CLOCK_PROCESS_CPUTIME_ID:
++#endif
++#if defined _POSIX_THREAD_CPUTIME
++		case CLOCK_THREAD_CPUTIME_ID:
++#endif
++		case CLOCK_BOOTTIME:
++		case CLOCK_TAI:
++			TEST(
++			    status == 0,
++			    "Allowed timer %i could not be successfully created, %i: %s.\n",
++			    clock_ids[i], errno, strerror(errno));
++			break;
++		// not allowed
++		case CLOCK_MONOTONIC_RAW:
++		case CLOCK_REALTIME_COARSE:
++		case CLOCK_MONOTONIC_COARSE:
++			TEST(status == -1 && errno == ENOTSUP,
++			     "Unsupported timer %i expected failure as ENOTSUP.\n",
++			     clock_ids[i]);
++			break;
++		// invalid
++		case NOT_A_REAL_CLOCK:
++			TEST(status == -1 && errno == EINVAL,
++			     "Invalid timer %i expected failure as EINVAL.\n",
++			     clock_ids[i]);
++			break;
++		}
++		int deleted = timer_delete(timer_id);
++		// delete timers that successfully get made
++		if (status == 0 && deleted != 0) {
++			t_error("Timer could not be deleted, %s.\n", strerror(errno));
++		}
++		errno = 0; // reset errno
++	};
++	return;
++}
++
++int main(void)
++{
++	// Test case 1: Nominal creation of timer for minimally supported clocks
++	test_timer_creation();
++
++	test_allowed_timer_clocks();
++
++	test_signal_pending_resource_exhaustion();
++
++	// NOTE: ENOTSUP error based on implementation defined permission for an
++	// alternate thread to use another thread's clock_id for its own timer is
++	// not tested based on mutually exclusive nature of how clock_id enums are
++	// processed which is also not functionality directly related to
++	// timer_create.
++
++	return t_status;
++}
+diff --git a/src/functional/timer_delete.c b/src/functional/timer_delete.c
+new file mode 100644
+index 0000000..810a4d1
+--- /dev/null
++++ b/src/functional/timer_delete.c
+@@ -0,0 +1,123 @@
++/*
++ * timer_delete.c unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <signal.h>
++#include <stdio.h>
++#include <string.h>
++#include <time.h>
++#include <unistd.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++#define SLEEP_NANO 500000
++#define TIMER_SPEC \
++	(struct itimerspec) \
++	{ \
++		.it_value = {0, SLEEP_NANO}, .it_interval = { 0, 0 } \
++	}
++
++typedef struct {
++	clockid_t clock;
++	int armed;
++} timer_params;
++
++static void dummy_signal_handler(int signum) {}
++
++static void delete_timer(const timer_params *timer)
++{
++	timer_t timer_id = 0;
++	if (timer_create(timer->clock, NULL, &timer_id) < 0) {
++		t_error("Failed to created SIGEV_SIGNAL timer: %s\n", strerror(errno));
++		return;
++	}
++
++	if (timer->armed) {
++		if (timer_settime(timer_id, 0, &TIMER_SPEC, NULL) < 0) {
++			t_error("Failed to arm SIGEV_SIGNAL timer: %s\n", strerror(errno));
++		}
++	}
++
++	TEST(timer_delete(timer_id) == 0,
++	     "Failed to delete SIGEV_SIGNAL timer: %d\n", timer_id);
++}
++
++static void delete_thread_timer(const timer_params *timer)
++{
++	timer_t timer_id = 0;
++	struct sigevent sigev = {.sigev_signo = SIGRTMIN,
++	                         .sigev_notify = SIGEV_THREAD};
++
++	if (timer_create(timer->clock, &sigev, &timer_id) < 0) {
++		t_error("Failed to create SIGEV_THREAD timer: %s\n", strerror(errno));
++		return;
++	}
++
++	if (timer->armed) {
++		if (timer_settime(timer_id, 0, &TIMER_SPEC, NULL) < 0) {
++			t_error("Failed to arm SIGEV_THREAD timer: %s\n", strerror(errno));
++		}
++	}
++
++	TEST(timer_delete(timer_id) == 0,
++	     "Failed to delete SIGEV_THREAD timer: %d\n", timer_id);
++}
++
++static void delete_completed_timer(timer_t timer_id, clockid_t clock)
++{
++	struct sigaction sa = {.sa_handler = dummy_signal_handler};
++
++	sigemptyset(&sa.sa_mask);
++	if (sigaction(SIGALRM, &sa, NULL) == -1) {
++		t_error("Error setting up signal handler: %s\n", strerror(errno));
++		return;
++	}
++
++	if (timer_create(clock, NULL, &timer_id) < 0) {
++		t_error("Failed to created SIGEV_SIGNAL timer: %s\n", strerror(errno));
++		return;
++	}
++
++	if (timer_settime(timer_id, 0, &TIMER_SPEC, NULL) < 0) {
++		t_error("Failed to arm SIGEV_SIGNAL timer: %s\n", strerror(errno));
++	}
++
++	// Wait for SIGARLM
++	pause();
++
++	TEST(timer_delete(timer_id) == 0,
++	     "Failed to delete SIGEV_SIGNAL timer: %d\n", timer_id);
++}
++
++int main(void)
++{
++	static const clockid_t clocks_to_test[] = {CLOCK_REALTIME, CLOCK_MONOTONIC};
++	static const size_t num_clocks =
++	    sizeof(clocks_to_test) / sizeof(*clocks_to_test);
++
++	for (int clock = 0; clock < num_clocks; ++clock) {
++		const timer_params unarmed_timer = {0, clocks_to_test[clock]};
++		const timer_params armed_timer = {1, clocks_to_test[clock]};
++		// Delete an unarmed timer
++		delete_timer(&unarmed_timer);
++
++		// Delete an armed timer
++		delete_timer(&armed_timer);
++
++		// Delete a thread unarmed timer
++		delete_thread_timer(&unarmed_timer);
++
++		// Delete a thread armed timer
++		delete_thread_timer(&armed_timer);
++
++		// Let the timer run out, and delete
++		timer_t timer_id = 0;
++		delete_completed_timer(timer_id, clocks_to_test[clock]);
++
++		// Retry the same operation with the same timer_id (should succeed)
++		delete_completed_timer(timer_id, clocks_to_test[clock]);
++	}
++
++	return t_status;
++}
+diff --git a/src/functional/timer_getoverrun.c b/src/functional/timer_getoverrun.c
+new file mode 100644
+index 0000000..c9d5494
+--- /dev/null
++++ b/src/functional/timer_getoverrun.c
+@@ -0,0 +1,190 @@
++/*
++ * timer_getoverrun.c test
++ */
++#include "test.h"
++#include <errno.h>
++#include <signal.h>
++#include <stdio.h>
++#include <string.h>
++#include <time.h>
++#include <unistd.h>
++
++#define TIMER_EXPIRY 100000
++#define SIG_BLOCKTIME 1000000
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++static inline void dummy_signal_handler(int signum) {}
++static void sigev_thread_cb(union sigval sig)
++{
++	timer_t *timer_id = sig.sival_ptr;
++	if (*timer_id) {
++		int overrun = timer_getoverrun(*timer_id);
++		TEST(overrun >= 0,
++		     "Expected timer SIGEV_THREAD timer to overrun zero or "
++		     "more times, got %d, %p\n",
++		     overrun, *timer_id);
++	}
++}
++
++static void sigev_signal_cb(int sig, siginfo_t *si, void *uc)
++{
++	timer_t *timer_id = si->si_value.sival_ptr;
++	int overrun = timer_getoverrun(*timer_id);
++	TEST(overrun > 0,
++	     "Expected timer to overrun at least %d times, instead got %d\n",
++	     SIG_BLOCKTIME / TIMER_EXPIRY, overrun);
++	struct sigaction sa = {.sa_handler = SIG_IGN};
++	sigaction(SIGRTMIN, &sa, NULL);
++}
++
++static void test_timer_getoverrun(clockid_t clock_id, struct sigevent *sev)
++{
++	timer_t *timer_id = sev->sigev_value.sival_ptr;
++	struct sigaction sa = {.sa_flags = SA_SIGINFO,
++	                       .sa_sigaction = sigev_signal_cb};
++	sigemptyset(&sa.sa_mask);
++	if (sigaction(SIGRTMIN, &sa, NULL) != 0) {
++		t_error("Failed to set signal action SIGRTMIN\n");
++		return;
++	}
++
++	// Temporarily block signal to generate timer overrun
++	sigset_t mask_sigalrm;
++	sigemptyset(&mask_sigalrm);
++	sigaddset(&mask_sigalrm, SIGRTMIN);
++
++	if (sigprocmask(SIG_SETMASK, &mask_sigalrm, NULL) != 0) {
++		t_error("Failed to mask SIGRTMIN\n");
++		return;
++	}
++
++	if (timer_create(clock_id, sev, timer_id) != 0) {
++		t_error("Failed to create timer\n");
++		return;
++	}
++
++	const struct itimerspec timer_spec = {.it_value.tv_sec = 0,
++	                                      .it_value.tv_nsec = TIMER_EXPIRY,
++	                                      .it_interval.tv_sec = 0,
++	                                      .it_interval.tv_nsec = TIMER_EXPIRY};
++
++	if (timer_settime(*timer_id, 0, &timer_spec, NULL) != 0) {
++		t_error("Error setting timer\n");
++		timer_delete(*timer_id);
++		return;
++	}
++
++	clock_nanosleep(clock_id, 0, &(struct timespec){0, SIG_BLOCKTIME}, NULL);
++
++	if (sigprocmask(SIG_UNBLOCK, &mask_sigalrm, NULL) != 0) {
++		t_error("Failed to unblock SIGRTMIN signal\n");
++	}
++
++	// Clean up timer
++	TEST(timer_delete(*timer_id) == 0, "hello\n");
++}
++
++static void test_expired_timer(clockid_t clock_id, struct sigevent *sev)
++{
++	timer_t timer_id = 0;
++	if (timer_create(clock_id, sev, &timer_id) != 0) {
++		t_error("Failed to create timer\n");
++		return;
++	}
++
++	const struct itimerspec timer_spec = {.it_value = {0, 0},
++	                                      .it_interval = {0, 0}};
++
++	if (timer_settime(timer_id, 0, &timer_spec, NULL) != 0) {
++		t_error("Error setting timer\n");
++		timer_delete(timer_id);
++		return;
++	}
++
++	int overrun = timer_getoverrun(timer_id);
++	TEST(overrun == 0,
++	     "Expected timer to produce no overruns, instead got %d\n", overrun);
++
++	timer_delete(timer_id);
++}
++
++static void test_created_timer(clockid_t clock_id, struct sigevent *sev)
++{
++	timer_t timer_id = 0;
++	if (timer_create(clock_id, sev, &timer_id) != 0) {
++		t_error("Failed to create timer\n");
++		return;
++	}
++
++	int overrun = timer_getoverrun(timer_id);
++	TEST(overrun == 0,
++	     "Expected timer to produce no overruns, instead got %d\n", overrun);
++
++	timer_delete(timer_id);
++}
++
++static void test_completed_timer(clockid_t clock_id, struct sigevent *sev)
++{
++	struct sigaction sa = {.sa_handler = dummy_signal_handler};
++	sigemptyset(&sa.sa_mask);
++	if (sigaction(SIGRTMIN, &sa, NULL) != 0) {
++		t_error("Error setting up signal handler: %s\n", strerror(errno));
++		return;
++	}
++
++	timer_t timer_id = 0;
++	if (timer_create(clock_id, sev, &timer_id) < 0) {
++		t_error("Failed to created SIGEV_SIGNAL timer: %s\n", strerror(errno));
++		return;
++	}
++
++	if (timer_settime(
++	        timer_id, 0,
++	        &(struct itimerspec){{0, TIMER_EXPIRY}, {0, TIMER_EXPIRY}},
++	        NULL) < 0) {
++		t_error("Failed to arm SIGEV_SIGNAL timer: %s\n", strerror(errno));
++	}
++
++	// Wait for SIGRTMIN
++	pause();
++
++	int overrun = timer_getoverrun(timer_id);
++	TEST(overrun >= 0,
++	     "Expected that the timer may produce overruns, instead got %d\n",
++	     overrun);
++
++	timer_delete(timer_id);
++}
++
++static void test_timer_states(clockid_t clock_id, struct sigevent *sev)
++{
++	test_timer_getoverrun(clock_id, sev);
++	test_expired_timer(clock_id, sev);
++	test_created_timer(clock_id, sev);
++}
++
++int main(void)
++{
++	static const clockid_t clocks_to_test[] = {CLOCK_REALTIME, CLOCK_MONOTONIC};
++	const size_t number_of_tests =
++	    sizeof(clocks_to_test) / sizeof(*clocks_to_test);
++
++	for (int clock = 0; clock < number_of_tests; ++clock) {
++		timer_t timer_id = 0;
++		struct sigevent sev = {.sigev_notify = SIGEV_SIGNAL,
++		                       .sigev_signo = SIGRTMIN,
++		                       .sigev_value.sival_ptr = &timer_id};
++
++		// Test a SIGEV_SIGNAL timer
++		test_completed_timer(clocks_to_test[clock], &sev);
++		test_timer_states(clocks_to_test[clock], &sev);
++
++		sev.sigev_notify = SIGEV_THREAD;
++		sev.sigev_notify_function = sigev_thread_cb;
++
++		// Test a SIGEV_THREAD timer
++		test_timer_states(clocks_to_test[clock], &sev);
++	}
++
++	return t_status;
++}
+diff --git a/src/functional/timer_gettime.c b/src/functional/timer_gettime.c
+new file mode 100644
+index 0000000..af5f6f9
+--- /dev/null
++++ b/src/functional/timer_gettime.c
+@@ -0,0 +1,115 @@
++/*
++ * timer_gettime unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <signal.h>
++#include <stdio.h>
++#include <string.h>
++#include <time.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++
++#define IT_INTERVAL_SEC 123
++#define IT_INTERVAL_NSEC 456
++
++static void dummy_timer_notify_function(union sigval value) {};
++
++static void test_gettime(struct itimerspec its)
++{
++	// setup sigevent struct
++	struct sigevent sev = {
++	    .sigev_notify = SIGEV_NONE,
++	};
++
++	timer_t timerid = NULL;
++	struct itimerspec res;
++
++	// create new timer
++	if (timer_create(CLOCK_REALTIME, &sev, &timerid) == -1) {
++		t_error("Failed to create timer: %s\n", strerror(errno));
++		return;
++	}
++
++	// check timer_gettime succeeds with valid timerid
++	// check it_value=0 when timer is disarmed
++	TEST(timer_gettime(timerid, &res) == 0 && res.it_value.tv_sec == 0 &&
++	         res.it_value.tv_nsec == 0,
++	     "Failed disarmed timer test. Errno: %s\n", strerror(errno));
++
++	// arm timer
++	if (timer_settime(timerid, 0, &its, NULL) == -1) {
++		t_error("Failed to set timer: %s\n", strerror(errno));
++		timer_delete(timerid);
++		return;
++	}
++
++	// check timer_gettime correctly sets values within itimerspec struct
++	TEST(timer_gettime(timerid, &res) == 0 && res.it_value.tv_sec == 0 &&
++	         res.it_value.tv_nsec != 0 &&
++	         res.it_interval.tv_sec == IT_INTERVAL_SEC &&
++	         res.it_interval.tv_nsec == IT_INTERVAL_NSEC,
++	     "Failed armed timer test. Errno : %s\n", strerror(errno));
++
++	// delete timer
++	timer_delete(timerid);
++}
++
++/*
++ *	When the sigevent struct attribute sigev_notify is set to SIGEV_THREAD,
++ *	timer_create() passes a pthread id value into the timerid field. This test
++ *	checks that the timer_gettime() function performs correctly in this
++ *	circumstance.
++ */
++static void test_sigev_thread(struct itimerspec its)
++{
++	// setup sigevent struct
++	struct sigevent sev = {
++	    .sigev_notify = SIGEV_THREAD,
++	    .sigev_notify_function = dummy_timer_notify_function,
++	    .sigev_notify_attributes = NULL,
++	};
++
++	// create timer
++	timer_t timerid = NULL;
++	if (timer_create(CLOCK_REALTIME, &sev, &timerid) == -1) {
++		t_error("Failed to create timer: %s\n", strerror(errno));
++		return;
++	}
++
++	// arm timer
++	if (timer_settime(timerid, 0, &its, NULL) == -1) {
++		t_error("Failed to set timer: %s\n", strerror(errno));
++		timer_delete(timerid);
++		return;
++	}
++
++	struct itimerspec res;
++
++	// check timer_gettime correctly sets values within itimerspec struct
++	TEST(timer_gettime(timerid, &res) == 0 && res.it_value.tv_sec == 0 &&
++	         res.it_value.tv_nsec != 0 &&
++	         res.it_interval.tv_sec == IT_INTERVAL_SEC &&
++	         res.it_interval.tv_nsec == IT_INTERVAL_NSEC,
++	     "Failed SIGEV_THREAD armed timer test. Errno: %s\n", strerror(errno));
++
++	// delete timer
++	timer_delete(timerid);
++}
++
++int main(void)
++{
++	// setup itimerspec struct
++	struct itimerspec its = {
++	    .it_value.tv_sec = 1,
++	    .it_value.tv_nsec = 0,
++	    .it_interval.tv_sec = IT_INTERVAL_SEC,
++	    .it_interval.tv_nsec = IT_INTERVAL_NSEC,
++	};
++
++	test_gettime(its);
++	test_sigev_thread(its);
++
++	return t_status;
++}
+diff --git a/src/functional/timer_settime.c b/src/functional/timer_settime.c
+new file mode 100644
+index 0000000..d5597fb
+--- /dev/null
++++ b/src/functional/timer_settime.c
+@@ -0,0 +1,212 @@
++/*
++ * timer_settime unit test
++ */
++
++#include "test.h"
++#include <errno.h>
++#include <signal.h>
++#include <string.h>
++#include <time.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TIME_NANO 500000
++#define OVERSIZED_NANOSECONDS 1000000001
++#define NUM_REPEATS 5
++
++volatile int timeout_count = 0;
++static void timeout_signal_counter(int signum) { timeout_count++; }
++
++static void test_settime(void)
++{
++	timer_t timerid = NULL;
++	if (timer_create(CLOCK_REALTIME, NULL, &timerid) == -1) {
++		t_error("Failed to create timer. Errno: %s\n", strerror(errno));
++		return;
++	}
++
++	struct itimerspec its = {
++	    .it_value = {1, TIME_NANO},
++	    .it_interval = {1, TIME_NANO},
++	};
++
++	// test timer_settime() returns 0 when successful
++	TEST(timer_settime(timerid, 0, &its, NULL) == 0,
++	     "Failed to set timer. Errno: %s\n", strerror(errno));
++
++	struct itimerspec res;
++	if (timer_gettime(timerid, &res) == -1) {
++		t_error("Failed to get timer time. Errno: %s\n", strerror(errno));
++		timer_delete(timerid);
++		return;
++	}
++
++	// test values from timer_settime() are set properly
++	TEST(res.it_value.tv_sec == 1 && res.it_value.tv_nsec != 0 &&
++	         res.it_interval.tv_sec == 1 &&
++	         res.it_interval.tv_nsec == TIME_NANO,
++	     "Failed to set correct timer values\n");
++
++	timer_delete(timerid);
++}
++
++static void test_periodic_timer(void)
++{
++	// setup signal handler
++	struct sigaction sa;
++	memset(&sa, 0, sizeof(sa));
++	sa.sa_handler = timeout_signal_counter;
++	sigaction(SIGALRM, &sa, NULL);
++
++	timer_t timerid = NULL;
++	if (timer_create(CLOCK_REALTIME, NULL, &timerid) == -1) {
++		t_error("Failed to create timer. Errno: %s\n", strerror(errno));
++		return;
++	}
++
++	struct itimerspec its = {
++	    .it_value = {0, TIME_NANO},
++	    .it_interval = {0, TIME_NANO},
++	};
++
++	TEST(timer_settime(timerid, 0, &its, NULL) == 0,
++	     "Failed to set timer. Errno: %s\n", strerror(errno));
++
++	struct timespec sleep_time = {
++	    .tv_sec = 1,
++	    .tv_nsec = 0,
++	};
++
++	// sleep for 1 second or until 5 timer timeouts have occured
++	while (
++	    clock_nanosleep(CLOCK_REALTIME, 0, &sleep_time, &sleep_time) == EINTR &&
++	    timeout_count < NUM_REPEATS) {
++		continue;
++	};
++
++	// test that the timer repeats after timeout
++	TEST(timeout_count >= NUM_REPEATS,
++	     "Failed periodic timer test. Expected timeout_count value >= 5, got "
++	     "%d\n",
++	     timeout_count);
++
++	timer_delete(timerid);
++}
++
++static void test_invalid_inputs(void)
++{
++	timer_t timerid = NULL;
++	if (timer_create(CLOCK_REALTIME, NULL, &timerid) == -1) {
++		t_error("Failed to create timer. Errno: %s\n", strerror(errno));
++		return;
++	}
++
++	struct itimerspec its = {
++	    .it_value = {0, OVERSIZED_NANOSECONDS},
++	    .it_interval = {0, 0},
++	};
++
++	TEST(timer_settime(timerid, 0, &its, NULL) == -1 && errno == EINVAL,
++	     "Oversized nanoseconds test failed, expected %s,got %s\n",
++	     strerror(EINVAL), strerror(errno));
++
++	errno = 0;
++	its.it_value.tv_nsec = -1;
++
++	TEST(timer_settime(timerid, 0, &its, NULL) == -1 && errno == EINVAL,
++	     "Undersized nanoseconds test failed, expected %s,got %s\n",
++	     strerror(EINVAL), strerror(errno));
++
++	timer_delete(timerid);
++}
++
++static void test_timer_resets(void)
++{
++	timer_t timerid = NULL;
++	if (timer_create(CLOCK_REALTIME, NULL, &timerid) == -1) {
++		t_error("Failed to create timer. Errno: %s\n", strerror(errno));
++		return;
++	}
++
++	struct itimerspec its = {
++	    .it_value = {0, TIME_NANO},
++	    .it_interval = {0, 0},
++	};
++
++	TEST(timer_settime(timerid, 0, &its, NULL) == 0,
++	     "Failed to set time. Errno: %s\n", strerror(errno));
++
++	its.it_value.tv_sec = 1;
++	its.it_value.tv_nsec = 0;
++
++	struct itimerspec ovalue = {.it_value.tv_nsec = 0};
++
++	TEST(timer_settime(timerid, 0, &its, &ovalue) == 0,
++	     "Failed to set time. Errno: %s\n", strerror(errno));
++
++	struct itimerspec res;
++	if (timer_gettime(timerid, &res) == -1) {
++		t_error("Failed to get timer time. Errno: %s\n", strerror(errno));
++		timer_delete(timerid);
++		return;
++	}
++
++	// check that it_value has been overwritten
++	TEST(res.it_value.tv_nsec > TIME_NANO,
++	     "Timer reset test failed, expected time until expiry > %d, got %ld\n",
++	     TIME_NANO, res.it_value.tv_nsec);
++
++	// check ovalue is set correctly
++	TEST(ovalue.it_value.tv_nsec != 0,
++	     "timer_settime() failed to set ovalue correctly\n");
++
++	timer_delete(timerid);
++}
++
++static void test_disarm_timer(void)
++{
++	timer_t timerid = NULL;
++	if (timer_create(CLOCK_REALTIME, NULL, &timerid) == -1) {
++		t_error("Failed to create timer. Errno: %s\n", strerror(errno));
++		return;
++	}
++
++	struct itimerspec its = {
++	    .it_value = {0, TIME_NANO},
++	    .it_interval = {0, 0},
++	};
++
++	TEST(timer_settime(timerid, 0, &its, NULL) == 0,
++	     "Failed to set time. Errno: %s\n", strerror(errno));
++
++	its.it_value.tv_nsec = 0;
++
++	TEST(timer_settime(timerid, 0, &its, NULL) == 0,
++	     "Failed to set time. Errno: %s\n", strerror(errno));
++
++	struct itimerspec res;
++
++	if (timer_gettime(timerid, &res) == -1) {
++		t_error("Failed to get timer time. Errno: %s\n", strerror(errno));
++		timer_delete(timerid);
++		return;
++	}
++
++	// setting the it_value of an armed timer to 0 should result in the timer
++	// being disarmed
++	TEST(res.it_value.tv_sec == 0 && res.it_value.tv_nsec == 0,
++	     "Disarm timer test failed, expected it_value.tv_sec = 0, got %ld, "
++	     "expected it_value.tv_nsec = 0, got %ld\n",
++	     res.it_value.tv_sec, res.it_value.tv_nsec);
++
++	timer_delete(timerid);
++}
++
++int main(void)
++{
++	test_settime();
++	test_periodic_timer();
++	test_invalid_inputs();
++	test_timer_resets();
++	test_disarm_timer();
++	return t_status;
++}
+diff --git a/src/functional/times.c b/src/functional/times.c
+new file mode 100644
+index 0000000..53416e3
+--- /dev/null
++++ b/src/functional/times.c
+@@ -0,0 +1,166 @@
++/*
++ * test_times unit test
++ */
++#include "test.h"
++#include <errno.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/times.h>
++#include <sys/wait.h>
++#include <time.h>
++#include <unistd.h>
++
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define TEST_FOR_VALID_TIME(a) ((a) >= 0 ? 1 : 0)
++#define TEST_FOR_INCREASE_IN_TIME(a, b) ((a) >= (b) ? 1 : 0)
++#define TEST_FOR_CHANGE_IN_TIME(a, b) ((a) > (b) ? 1 : 0)
++#define CPU_CYCLES_TICKS 1000000L
++
++static void busy_loop_to_consume_cpu_time(const long int ticks)
++{
++	for (long int i = 0; i < ticks; ++i) {
++		getpid(); // sytem call that forces kernel interaction
++	}
++}
++
++static void test_time_valid_data(struct tms sample)
++{
++	TEST(TEST_FOR_VALID_TIME(sample.tms_utime),
++	     "time_sample.tms_utime is negative\n");
++	TEST(TEST_FOR_VALID_TIME(sample.tms_stime),
++	     "time_sample.tms_stime is negative\n");
++	TEST(TEST_FOR_VALID_TIME(sample.tms_cutime),
++	     "time_sample.tms_cutime is negative\n");
++	TEST(TEST_FOR_VALID_TIME(sample.tms_cstime),
++	     "time_sample.tms_cstime is negative\n");
++	return;
++}
++
++static void test_time_increase(struct tms time1, struct tms time2)
++{
++	TEST(TEST_FOR_INCREASE_IN_TIME(time1.tms_utime, time2.tms_utime),
++	     "time_sample2.tms_stime did not increase as expected\n");
++	TEST(TEST_FOR_INCREASE_IN_TIME(time1.tms_stime, time2.tms_stime),
++	     "time_sample2.tms_stime did not increase as expected\n");
++
++	TEST(TEST_FOR_INCREASE_IN_TIME(time1.tms_cutime, time2.tms_cutime),
++	     "time_sample2.tms_stime did not increase as expected\n");
++	TEST(TEST_FOR_INCREASE_IN_TIME(time1.tms_cstime, time2.tms_cstime),
++	     "time_sample2.tms_stime did not increase as expected\n");
++	return;
++}
++
++static void test_parent_time_increase(struct tms time1, struct tms time2)
++{
++	test_time_valid_data(time1);
++
++	test_time_valid_data(time2);
++
++	TEST(TEST_FOR_CHANGE_IN_TIME(time1.tms_utime, time2.tms_utime),
++	     "time_sample2.tms_stime did not increase as expected\n");
++	TEST(TEST_FOR_CHANGE_IN_TIME(time1.tms_stime, time2.tms_stime),
++	     "time_sample2.tms_stime did not increase as expected\n");
++	return;
++}
++
++static void test_child_time_increase(struct tms time1, struct tms time2)
++{
++	test_time_valid_data(time1);
++
++	test_time_valid_data(time2);
++
++	TEST(TEST_FOR_CHANGE_IN_TIME(time1.tms_cutime, time2.tms_cutime),
++	     "time_sample2.tms_stime did not increase as expected\n");
++	TEST(TEST_FOR_CHANGE_IN_TIME(time1.tms_cstime, time2.tms_cstime),
++	     "time_sample2.tms_stime did not increase as expected\n");
++	return;
++}
++
++static void test_times(void)
++{
++	struct tms time_sample;
++
++	// Test case 1: Basic functionality
++	clock_t result = times(&time_sample);
++	TEST(result != (clock_t)-1 && errno == 0, "%s\n",
++	     strerror(errno)); // Should not return an error
++
++	test_time_valid_data(time_sample);
++
++	// Test case 2: Handling NULL pointer
++	// FIXME: the times function currently does not return an error no when
++	// attempting to write to a NULL pointer. This is an area that could be
++	// reworked in the future to handle NULL parameters with error no.
++	result = times(NULL);
++	TEST(result != (time_t)-1 && errno == 0, "%s\n",
++	     strerror(errno)); // Should not return an error, even if the argument
++	                       // is NULL
++
++	// Test case 3: Multiple invocations consistency
++	// Capture initial times
++	result = times(&time_sample);
++	TEST(result != (time_t)-1 && errno == 0, "%s\n",
++	     strerror(errno)); // Should not return an error
++
++	// Introduce CPU load
++	busy_loop_to_consume_cpu_time(
++	    CPU_CYCLES_TICKS); // Simple busy loop to consume some CPU time
++
++	struct tms time_sample2;
++	clock_t result2 = times(&time_sample2);
++	TEST(result2 != (time_t)-1 && errno == 0, "%s\n", strerror(errno));
++
++	TEST(result2 > result && errno == 0, "times did not progress. Error: %s\n",
++	     strerror(errno));
++
++	// Validate that times are recorded
++	test_time_increase(time_sample2, time_sample);
++
++	// Validate that the parent process times are recorded
++	test_parent_time_increase(time_sample2, time_sample);
++
++	// Test case 4: Handling child processes
++	struct tms parent_time_before;
++
++	clock_t result_before = times(&parent_time_before);
++	TEST(result_before != (time_t)-1 && errno == 0, "%s\n",
++	     strerror(errno)); // Should not return an error
++
++	// Create a child process
++	pid_t pid = fork();
++	if (pid == -1) {
++		t_error("Fork failed\n");
++	}
++	if (pid == 0) {
++		// Child process: simulate some work
++		busy_loop_to_consume_cpu_time(
++		    CPU_CYCLES_TICKS); // Simple busy loop to consume some CPU time
++		exit(0);
++	} else {
++		// Parent process: wait for the child process to terminate
++		wait(NULL);
++
++		struct tms parent_time_after;
++		// Capture times after child process has terminated
++		clock_t result_after = times(&parent_time_after);
++		TEST(result_after != (time_t)-1 && errno == 0, "%s\n",
++		     strerror(errno)); // Should not return an error
++
++		TEST(result_after > result_before && errno == 0,
++		     "times did not progress. Error: %s\n", strerror(errno));
++
++		// Validate that times are recorded
++		test_time_increase(parent_time_after, parent_time_before);
++
++		// Validate that the child process times are recorded
++		test_child_time_increase(parent_time_after, parent_time_before);
++	}
++	return;
++}
++
++int main(void)
++{
++	test_times();
++	return t_status;
++}
+diff --git a/src/functional/tzset.c b/src/functional/tzset.c
+new file mode 100644
+index 0000000..c6612dc
+--- /dev/null
++++ b/src/functional/tzset.c
+@@ -0,0 +1,264 @@
++/*
++ * tzset test
++ */
++
++#define _GNU_SOURCE
++#include "test.h"
++#include "utils.h"
++#include <errno.h>
++#include <limits.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/mman.h>
++#include <time.h>
++#include <unistd.h>
++
++// if c evaluates to 0, execute t_error with the specified error message
++#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))
++#define HOURS_IN_A_DAY 24
++
++struct test_cases {
++	char *name; // readable timezone name
++	int daylight;
++	long timezone;      // offset from UTC in seconds
++	long base_timezone; // record of absolute TZ offset from UTC without DST in
++	                    // seconds
++	char *tzname[2]; // timezone abbreviation ([1] is linux known abbreviations)
++};
++
++static struct test_cases test_timezones[] = {
++    // {name, daylight saving amount, timezone, tzname}
++    {"Universal", 0, 0, 0, {"UTC", ""}},
++    {"Australia/Queensland", 0, 10, 36000, {"AEST", ""}},
++    {"Europe/Amsterdam", 1, 1, 3600, {"CET", "CEST"}},
++    {"Europe/Belfast", 1, 0, 0, {"GMT", "BST"}},
++    {"America/Chicago", 1, -6, -21600, {"CST", "CDT"}},
++    {"America/Indianapolis", 1, -5, -18000, {"EST", "EDT"}},
++    {"America/Los_Angeles", 1, -8, -28800, {"PST", "PDT"}},
++    // Approaching largest leading UTC limit
++    {"Pacific/Auckland", 1, 12, 43200, {"NZST", "NZDT"}},
++    // Approaching largest lagging UTC limits (NOTE Samoa change from UTC+13 to
++    // UTC-11 in 2011)
++    {"Pacific/Samoa", 0, -11, -39600, {"SST", ""}},
++    {NULL, 0, 0, 0, {"", ""}}};
++
++static int test_overflow_timezone_string(void)
++{
++	char str[PATH_MAX + 1];
++	char long_buffer[PATH_MAX + 1];
++	const char ascii_A = 0x41;
++	memset(long_buffer, ascii_A, (PATH_MAX + 1) * sizeof(char));
++
++	int result = setenv("TZ", str, 1);
++
++	return result == 0 ? -1 : 0;
++}
++
++static void generate_current_tzs(void)
++{
++	time_t check_time = 0;
++	struct test_cases *case_pt = {0};
++
++	for (case_pt = test_timezones; case_pt->name != NULL; case_pt++) {
++		// get tm_isdst of each timezone
++		if (setenv("TZ", case_pt->name, 1) != 0) {
++			t_error("Unable to setenv `TZ` as %s error %s\n",
++			        case_pt->tzname[1], strerror(errno));
++		}
++		tzset();
++
++		check_time = time(NULL);
++		struct tm dst_check;
++		localtime_r(&check_time, &dst_check);
++		if (dst_check.tm_zone == NULL) {
++			t_error("Could not check current time.\n");
++		}
++
++		// timezone entires contingent on daylight savings logic
++		if (dst_check.tm_isdst > 0) { // positive value if dst is in effect
++			case_pt->timezone += case_pt->daylight;
++		}
++		// 0 if dst not set, -1 if no information
++	}
++}
++
++void set_confirmed_timezone(char *timezone_name, struct tm *time_result)
++{
++	if (setenv("TZ", timezone_name, 1) != 0 ||
++	    setenv("TZ", timezone_name, 0) != 0) {
++		t_error("Unable to setenv `TZ` as %s error %s\n", timezone_name,
++		        strerror(errno));
++	}
++
++	char *check_settz = getenv("TZ");
++	if (check_settz == NULL) {
++		check_settz = "Universal"; // default
++	}
++
++	TEST(strcmp(check_settz, timezone_name) == 0,
++	     "Getenv `TZ` returned an unexpected result of %s when expecting %s.\n",
++	     check_settz, timezone_name);
++	tzset();
++
++	time_t result_unix_time = time(NULL);
++	if (result_unix_time == -1) {
++		t_error("time was not set as expected, %s.\n", strerror(errno));
++	}
++
++	struct tm *time_check = localtime_r(&result_unix_time, time_result);
++	TEST(time_check != NULL,
++	     "timezone struct was not set as expected using localtime_r, %s.\n",
++	     strerror(errno));
++
++	struct test_cases *case_pt = {0};
++	for (case_pt = test_timezones; case_pt->name != NULL; case_pt++) {
++		if (case_pt->name == timezone_name) {
++			TEST(daylight == case_pt->daylight,
++			     "The existence of daylight savings for this TZ is "
++			     "incorrect.\n");
++			TEST((-1 * timezone) == case_pt->base_timezone,
++			     "The %i vs %i timezone seconds difference were not as "
++			     "expected.\n",
++			     (-1 * timezone), case_pt->base_timezone);
++			TEST(strcmp(tzname[0], case_pt->tzname[0]) == 0,
++			     "The actual %s vs expected %s timezone standard strings were "
++			     "not as "
++			     "expected.\n",
++			     tzname[0], case_pt->tzname[0]);
++			TEST(strcmp(tzname[1], case_pt->tzname[1]) == 0,
++			     "The actual %s vs expected %s timezone standard strings were "
++			     "not as "
++			     "expected.\n",
++			     tzname[1], case_pt->tzname[1]);
++		}
++	}
++
++	return;
++}
++
++static void valid_timezone_compare(const struct test_cases *case_pt)
++{
++	int hours_difference = 0;
++
++	// check that the timezone - UTC equals the expected number of seconds
++	// difference
++	struct tm utc_check;
++	set_confirmed_timezone("Universal", &utc_check);
++
++	// get Unix timezone time to compare
++	struct tm local_check;
++	set_confirmed_timezone(case_pt->name, &local_check);
++
++	if (local_check.tm_mday == utc_check.tm_mday) {
++		hours_difference = local_check.tm_hour - utc_check.tm_hour;
++	} else {
++		hours_difference =
++		    local_check.tm_hour < utc_check.tm_hour
++		        ? HOURS_IN_A_DAY + local_check.tm_hour - utc_check.tm_hour
++		        : -1 * (utc_check.tm_hour - local_check.tm_hour +
++		                HOURS_IN_A_DAY);
++	}
++
++	int impossible_time =
++	    ((mktime(&local_check) > 0) && (mktime(&utc_check) > 0)) ? 0 : 1;
++
++	int hours_alignment = (hours_difference == case_pt->timezone) ? 0 : 1;
++
++	int minutes_alignment = local_check.tm_min - utc_check.tm_min;
++
++	TEST(hours_alignment == 0 && minutes_alignment == 0 && impossible_time == 0,
++	     "Timezone %s expected diff %i was %i difference, error %s\n",
++	     case_pt->name, (case_pt->timezone + case_pt->daylight),
++	     hours_difference, strerror(errno));
++
++	return;
++}
++
++static void invalid_timezone_compare(void)
++{
++	// default state
++	struct tm utc_check;
++	set_confirmed_timezone("Universal", &utc_check);
++
++	// Test case 2: setting timezone using invalid string
++	struct tm neverland_check;
++	set_confirmed_timezone("Neverland/Time", &neverland_check);
++
++	// ensure time set is actually still UTC for invalid timezone string
++	time_t utc_seconds = mktime(&utc_check);
++	time_t neverland_seconds = mktime(&neverland_check);
++	if (utc_seconds == -1 || neverland_seconds == -1) {
++		t_error("mktime function did not return normally, %s.\n",
++		        strerror(errno));
++	}
++
++	// 1 second tolerance to mitigate edge case on second tick-over
++	TEST(utc_seconds == neverland_seconds ||
++	         utc_seconds == (neverland_seconds - 1),
++	     "Expected UTC time upon invalid timezone string use was not achieved. "
++	     "Expected %i, got %i, %s.\n",
++	     utc_seconds, neverland_seconds, strerror(errno));
++
++	// Test case 3: setting timezone using empty string (also proxy for testing
++	// timzone reset to default UTC) reset to UTC time in case undefined
++	// behaviour has occured in test 2
++	set_confirmed_timezone("Universal", &utc_check);
++
++	int success = setenv("TZ", "", 1);
++	tzset();
++
++	time_t result_empty_tz = time(NULL);
++	if (result_empty_tz == -1) {
++		t_error("time function did not return normally, %s.\n",
++		        strerror(errno));
++	}
++	struct tm emptytz_check;
++	struct tm *result = localtime_r(&result_empty_tz, &emptytz_check);
++	if (result == NULL) {
++		t_error("localtime_r function did not return normally, %s.\n",
++		        strerror(errno));
++	}
++	utc_seconds = mktime(&utc_check);
++	time_t test_seconds = mktime(result);
++	if (utc_seconds == -1 || test_seconds == -1) {
++		t_error("mktime function did not return normally, %s.\n",
++		        strerror(errno));
++	}
++
++	TEST(success == 0,
++	     "Expected UTC time upon invalid timezone string use was not achieved. "
++	     "Expected %i, got %i, %s.\n",
++	     utc_seconds, test_seconds, strerror(errno));
++
++	// Test case 4: setting timezone to a random string of size PATH_MAX+1 that
++	// causes string buffer overflow
++	test_buffer_overflow(test_overflow_timezone_string);
++
++	// reset errno
++	errno = 0;
++	return;
++}
++
++int main(void)
++{
++	const struct test_cases *pt = {0};
++
++	// start from a known UTC state
++	struct tm utc_check;
++	set_confirmed_timezone("Universal", &utc_check);
++
++	generate_current_tzs();
++
++	// Test case 1: valid inputs nominal behaviour
++	for (pt = test_timezones; pt->name != NULL; pt++) {
++		valid_timezone_compare(pt);
++	};
++
++	// Test case 2 - 4: invalid inputs and edge cases
++	invalid_timezone_compare();
++
++	// NOTE: tzset() as per the POSIX standard is not thread safe
++
++	return t_status;
++}
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
