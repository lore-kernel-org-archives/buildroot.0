Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A03E7DEF5
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37D17407CC;
	Mon,  2 Feb 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqOoMt5qths5; Mon,  2 Feb 2026 15:54:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D341408A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770047647;
	bh=QrPDQZxMi8QeTZSWAro7QFY7HD1+dWIIIi0rXPkFy1Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QEJYFIYuDWxxWP+4ERPHnXhZLk0TjGrLXrNrhFAb3pnhMOpES/f6DUiT+cweT45MD
	 0DfzCikIkewwIRoe0PqVninwNQISzZwL/ICL93O8qLbW6f7mRiJvOZ25LehlGH8+00
	 oliP/NumEvVZXN1pGvTjzbuECHsm/2EZq9fFch6r+7bzfgUsCp5EhGH0BIQxZ8mY0W
	 l+mJpHPvUEztcc4BmsXSHBNKIAyxEjUi1H5d+nnjXS8v49mQmLjOkXBaIgHO5Tcvvh
	 RwImJL9J2dv8xhj3usc6MPNcVbL3+LVApYv3DBH1L75FjIZaYKiZM8r89N9Ow7mZyE
	 08NcU+HFMrMyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D341408A5;
	Mon,  2 Feb 2026 15:54:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7091B1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FA7E407CC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XridzZGWWygM for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:54:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.50;
 helo=esa3.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90276408A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90276408A5
Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com
 [207.54.77.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90276408A5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:54:03 +0000 (UTC)
X-CSE-ConnectionGUID: 6T4B8GdvQ8Or48mxVYxxxw==
X-CSE-MsgGUID: QZBWQELPR1mxvt9QZe6+Uw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
 by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 17:54:00 +0200
X-CSE-ConnectionGUID: O/HZFOpAQFGJ0opMReKaQw==
X-CSE-MsgGUID: X6Y7EXo0TR+5LTHYisbzRg==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.6])
 by ces02_data.me-corp.lan with SMTP; 02 Feb 2026 17:56:15 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 02 Feb 2026 17:53:59 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon,  2 Feb 2026 17:53:56 +0200
Message-ID: <20260202155356.3330179-1-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260202154536.2910688-1-jimmy.wesolowski@mobileye.com>
References: <20260202154536.2910688-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1770047643; x=1801583643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=srEJ0XPuh2bAsGrVdjjc7x3HVxgndHlxhNSAYaFgdMU=;
 b=sHQhK8/IVOZKmVQckwR07k6pxvZQ6W0H71V6mSSjHfeiZ1RezmZs9Doz
 FLWOpc/Zb6Ck/p6ar1b8rDSZKUwP+XGOJb3z+uTWYLusi3WljMGEcxKor
 Lb9itfijfy2SHDccPZPItUV02IS7BaQEhIAB/YhWvwuiCCDJbO0lLlDle
 Ao0Lq+xvNvj9RQTtC6BqBvZsa1116Ial6dpuFsTugLGXJBFjfGq7NOA8/
 neMdvDsfefKthm1lTY9KIuOLv8llfGx6E3Oz3GO5lket3pTgpfu+/PGK1
 naM0RML+jxalhieO99AHPIttQagBjFqFHnc2EDFB+3qpq8CjP6dkE9mJu
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH] package/coremark: port for mips-i6500
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>

Compile for MIPS I6500 CPU 64-bit, with all compiler flags as
recommended by MIPS

One missing flag -s "-Tmsym32.ld" since linker script
"msym32.ld" does not exist in the MIPS toolchain

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Acked-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 .../0001-skeleton-for-mips-i6500.patch        | 804 ++++++++++++++++++
 ...iler-flags-customized-for-mips-i6500.patch |  35 +
 2 files changed, 839 insertions(+)
 create mode 100644 package/coremark/0001-skeleton-for-mips-i6500.patch
 create mode 100644 package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch

diff --git a/package/coremark/0001-skeleton-for-mips-i6500.patch b/package/coremark/0001-skeleton-for-mips-i6500.patch
new file mode 100644
index 0000000000..e71dc980c8
--- /dev/null
+++ b/package/coremark/0001-skeleton-for-mips-i6500.patch
@@ -0,0 +1,804 @@
+From c8f187ca290e65f9d6b14ef5ad57fa61f7f8b95f Mon Sep 17 00:00:00 2001
+From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
+Date: Wed, 27 Feb 2019 09:55:55 +0200
+Subject: [PATCH 1/2] skeleton for mips i6500
+
+port for mips-i6500 created, copied from linux64
+
+Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
+---
+ mips-i6500/core_portme.c   | 336 +++++++++++++++++++++++++++++++++++++
+ mips-i6500/core_portme.h   | 291 ++++++++++++++++++++++++++++++++
+ mips-i6500/core_portme.mak | 140 ++++++++++++++++
+ 3 files changed, 767 insertions(+)
+ create mode 100755 mips-i6500/core_portme.c
+ create mode 100755 mips-i6500/core_portme.h
+ create mode 100755 mips-i6500/core_portme.mak
+
+diff --git a/mips-i6500/core_portme.c b/mips-i6500/core_portme.c
+new file mode 100755
+index 000000000000..fe8d2998397e
+--- /dev/null
++++ b/mips-i6500/core_portme.c
+@@ -0,0 +1,336 @@
++/*
++Copyright 2018 Embedded Microprocessor Benchmark Consortium (EEMBC)
++
++Licensed under the Apache License, Version 2.0 (the "License");
++you may not use this file except in compliance with the License.
++You may obtain a copy of the License at
++
++    http://www.apache.org/licenses/LICENSE-2.0
++
++Unless required by applicable law or agreed to in writing, software
++distributed under the License is distributed on an "AS IS" BASIS,
++WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++See the License for the specific language governing permissions and
++limitations under the License.
++
++Original Author: Shay Gal-on
++*/
++
++#include <stdio.h>
++#include <stdlib.h>
++#include "coremark.h"
++#if CALLGRIND_RUN
++#include <valgrind/callgrind.h>
++#endif
++
++#if (MEM_METHOD==MEM_MALLOC)
++#include <malloc.h>
++/* Function: portable_malloc
++	Provide malloc() functionality in a platform specific way.
++*/
++void *portable_malloc(size_t size) {
++	return malloc(size);
++}
++/* Function: portable_free
++	Provide free() functionality in a platform specific way.
++*/
++void portable_free(void *p) {
++	free(p);
++}
++#else
++void *portable_malloc(size_t size) {
++	return NULL;
++}
++void portable_free(void *p) {
++	p=NULL;
++}
++#endif
++
++#if (SEED_METHOD==SEED_VOLATILE)
++#if VALIDATION_RUN
++	volatile ee_s32 seed1_volatile=0x3415;
++	volatile ee_s32 seed2_volatile=0x3415;
++	volatile ee_s32 seed3_volatile=0x66;
++#endif
++#if PERFORMANCE_RUN
++	volatile ee_s32 seed1_volatile=0x0;
++	volatile ee_s32 seed2_volatile=0x0;
++	volatile ee_s32 seed3_volatile=0x66;
++#endif
++#if PROFILE_RUN
++	volatile ee_s32 seed1_volatile=0x8;
++	volatile ee_s32 seed2_volatile=0x8;
++	volatile ee_s32 seed3_volatile=0x8;
++#endif
++	volatile ee_s32 seed4_volatile=ITERATIONS;
++	volatile ee_s32 seed5_volatile=0;
++#endif
++/* Porting: Timing functions
++	How to capture time and convert to seconds must be ported to whatever is supported by the platform.
++	e.g. Read value from on board RTC, read value from cpu clock cycles performance counter etc.
++	Sample implementation for standard time.h and windows.h definitions included.
++*/
++/* Define: TIMER_RES_DIVIDER
++	Divider to trade off timer resolution and total time that can be measured.
++
++	Use lower values to increase resolution, but make sure that overflow does not occur.
++	If there are issues with the return value overflowing, increase this value.
++	*/
++#if USE_CLOCK
++	#define NSECS_PER_SEC CLOCKS_PER_SEC
++	#define EE_TIMER_TICKER_RATE 1000
++	#define CORETIMETYPE clock_t
++	#define GETMYTIME(_t) (*_t=clock())
++	#define MYTIMEDIFF(fin,ini) ((fin)-(ini))
++	#define TIMER_RES_DIVIDER 1
++	#define SAMPLE_TIME_IMPLEMENTATION 1
++#elif defined(_MSC_VER)
++	#define NSECS_PER_SEC 10000000
++	#define EE_TIMER_TICKER_RATE 1000
++	#define CORETIMETYPE FILETIME
++	#define GETMYTIME(_t) GetSystemTimeAsFileTime(_t)
++	#define MYTIMEDIFF(fin,ini) (((*(__int64*)&fin)-(*(__int64*)&ini))/TIMER_RES_DIVIDER)
++	/* setting to millisces resolution by default with MSDEV */
++	#ifndef TIMER_RES_DIVIDER
++	#define TIMER_RES_DIVIDER 1000
++	#endif
++	#define SAMPLE_TIME_IMPLEMENTATION 1
++#elif HAS_TIME_H
++	#define NSECS_PER_SEC 1000000000
++	#define EE_TIMER_TICKER_RATE 1000
++	#define CORETIMETYPE struct timespec
++	#define GETMYTIME(_t) clock_gettime(CLOCK_REALTIME,_t)
++	#define MYTIMEDIFF(fin,ini) ((fin.tv_sec-ini.tv_sec)*(NSECS_PER_SEC/TIMER_RES_DIVIDER)+(fin.tv_nsec-ini.tv_nsec)/TIMER_RES_DIVIDER)
++	/* setting to 1/1000 of a second resolution by default with linux */
++	#ifndef TIMER_RES_DIVIDER
++	#define TIMER_RES_DIVIDER 1000000
++	#endif
++	#define SAMPLE_TIME_IMPLEMENTATION 1
++#else
++	#define SAMPLE_TIME_IMPLEMENTATION 0
++#endif
++#define EE_TICKS_PER_SEC (NSECS_PER_SEC / TIMER_RES_DIVIDER)
++
++#if SAMPLE_TIME_IMPLEMENTATION
++/** Define Host specific (POSIX), or target specific global time variables. */
++static CORETIMETYPE start_time_val, stop_time_val;
++
++/* Function: start_time
++	This function will be called right before starting the timed portion of the benchmark.
++
++	Implementation may be capturing a system timer (as implemented in the example code)
++	or zeroing some system parameters - e.g. setting the cpu clocks cycles to 0.
++*/
++void start_time(void) {
++	GETMYTIME(&start_time_val );
++#if CALLGRIND_RUN
++	CALLGRIND_START_INSTRUMENTATION
++#endif
++#if MICA
++    asm volatile("int3");/*1 */
++#endif
++}
++/* Function: stop_time
++	This function will be called right after ending the timed portion of the benchmark.
++
++	Implementation may be capturing a system timer (as implemented in the example code)
++	or other system parameters - e.g. reading the current value of cpu cycles counter.
++*/
++void stop_time(void) {
++#if CALLGRIND_RUN
++	 CALLGRIND_STOP_INSTRUMENTATION
++#endif
++#if MICA
++    asm volatile("int3");/*1 */
++#endif
++	GETMYTIME(&stop_time_val );
++}
++/* Function: get_time
++	Return an abstract "ticks" number that signifies time on the system.
++
++	Actual value returned may be cpu cycles, milliseconds or any other value,
++	as long as it can be converted to seconds by <time_in_secs>.
++	This methodology is taken to accomodate any hardware or simulated platform.
++	The sample implementation returns millisecs by default,
++	and the resolution is controlled by <TIMER_RES_DIVIDER>
++*/
++CORE_TICKS get_time(void) {
++	CORE_TICKS elapsed=(CORE_TICKS)(MYTIMEDIFF(stop_time_val, start_time_val));
++	return elapsed;
++}
++/* Function: time_in_secs
++	Convert the value returned by get_time to seconds.
++
++	The <secs_ret> type is used to accomodate systems with no support for floating point.
++	Default implementation implemented by the EE_TICKS_PER_SEC macro above.
++*/
++secs_ret time_in_secs(CORE_TICKS ticks) {
++	secs_ret retval=((secs_ret)ticks) / (secs_ret)EE_TICKS_PER_SEC;
++	return retval;
++}
++#else
++#error "Please implement timing functionality in core_portme.c"
++#endif /* SAMPLE_TIME_IMPLEMENTATION */
++
++ee_u32 default_num_contexts=MULTITHREAD;
++
++/* Function: portable_init
++	Target specific initialization code
++	Test for some common mistakes.
++*/
++void portable_init(core_portable *p, int *argc, char *argv[])
++{
++#if PRINT_ARGS
++	int i;
++	for (i=0; i<*argc; i++) {
++		ee_printf("Arg[%d]=%s\n",i,argv[i]);
++	}
++#endif
++	if (sizeof(ee_ptr_int) != sizeof(ee_u8 *)) {
++		ee_printf("ERROR! Please define ee_ptr_int to a type that holds a pointer!\n");
++	}
++	if (sizeof(ee_u32) != 4) {
++		ee_printf("ERROR! Please define ee_u32 to a 32b unsigned type!\n");
++	}
++#if (MAIN_HAS_NOARGC && (SEED_METHOD==SEED_ARG))
++	ee_printf("ERROR! Main has no argc, but SEED_METHOD defined to SEED_ARG!\n");
++#endif
++
++#if (MULTITHREAD>1) && (SEED_METHOD==SEED_ARG)
++	int nargs=*argc,i;
++	if ((nargs>1) && (*argv[1]=='M')) {
++		default_num_contexts=parseval(argv[1]+1);
++		if (default_num_contexts>MULTITHREAD)
++			default_num_contexts=MULTITHREAD;
++		/* Shift args since first arg is directed to the portable part and not to coremark main */
++		--nargs;
++		for (i=1; i<nargs; i++)
++			argv[i]=argv[i+1];
++		*argc=nargs;
++	}
++#endif /* sample of potential platform specific init via command line, reset the number of contexts being used if first argument is M<n>*/
++	p->portable_id=1;
++}
++/* Function: portable_fini
++	Target specific final code
++*/
++void portable_fini(core_portable *p)
++{
++	p->portable_id=0;
++}
++
++#if (MULTITHREAD>1)
++
++/* Function: core_start_parallel
++	Start benchmarking in a parallel context.
++
++	Three implementations are provided, one using pthreads, one using fork and shared mem, and one using fork and sockets.
++	Other implementations using MCAPI or other standards can easily be devised.
++*/
++/* Function: core_stop_parallel
++	Stop a parallel context execution of coremark, and gather the results.
++
++	Three implementations are provided, one using pthreads, one using fork and shared mem, and one using fork and sockets.
++	Other implementations using MCAPI or other standards can easily be devised.
++*/
++#if USE_PTHREAD
++ee_u8 core_start_parallel(core_results *res) {
++	return (ee_u8)pthread_create(&(res->port.thread),NULL,iterate,(void *)res);
++}
++ee_u8 core_stop_parallel(core_results *res) {
++	void *retval;
++	return (ee_u8)pthread_join(res->port.thread,&retval);
++}
++#elif USE_FORK
++static int key_id=0;
++ee_u8 core_start_parallel(core_results *res) {
++	key_t key=4321+key_id;
++	key_id++;
++	res->port.pid=fork();
++	res->port.shmid=shmget(key, 8, IPC_CREAT | 0666);
++	if (res->port.shmid<0) {
++		ee_printf("ERROR in shmget!\n");
++	}
++	if (res->port.pid==0) {
++		iterate(res);
++		res->port.shm=shmat(res->port.shmid, NULL, 0);
++		/* copy the validation values to the shared memory area  and quit*/
++		if (res->port.shm == (char *) -1) {
++			ee_printf("ERROR in child shmat!\n");
++		} else {
++			memcpy(res->port.shm,&(res->crc),8);
++			shmdt(res->port.shm);
++		}
++		exit(0);
++	}
++	return 1;
++}
++ee_u8 core_stop_parallel(core_results *res) {
++	int status;
++	pid_t wpid = waitpid(res->port.pid,&status,WUNTRACED);
++	if (wpid != res->port.pid) {
++		ee_printf("ERROR waiting for child.\n");
++		if (errno == ECHILD) ee_printf("errno=No such child %d\n",res->port.pid);
++		if (errno == EINTR) ee_printf("errno=Interrupted\n");
++		return 0;
++	}
++	/* after process is done, get the values from the shared memory area */
++	res->port.shm=shmat(res->port.shmid, NULL, 0);
++	if (res->port.shm == (char *) -1) {
++		ee_printf("ERROR in parent shmat!\n");
++		return 0;
++	}
++	memcpy(&(res->crc),res->port.shm,8);
++	shmdt(res->port.shm);
++	return 1;
++}
++#elif USE_SOCKET
++static int key_id=0;
++ee_u8 core_start_parallel(core_results *res) {
++	int bound, buffer_length=8;
++	res->port.sa.sin_family = AF_INET;
++	res->port.sa.sin_addr.s_addr = htonl(0x7F000001);
++	res->port.sa.sin_port = htons(7654+key_id);
++	key_id++;
++	res->port.pid=fork();
++	if (res->port.pid==0) { /* benchmark child */
++		iterate(res);
++		res->port.sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
++		if (-1 == res->port.sock) /* if socket failed to initialize, exit */   {
++			ee_printf("Error Creating Socket");
++		} else {
++			int bytes_sent = sendto(res->port.sock, &(res->crc), buffer_length, 0,(struct sockaddr*)&(res->port.sa), sizeof (struct sockaddr_in));
++			if (bytes_sent < 0)
++				ee_printf("Error sending packet: %s\n", strerror(errno));
++			close(res->port.sock); /* close the socket */
++		}
++		exit(0);
++	}
++	/* parent process, open the socket */
++	res->port.sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
++	bound = bind(res->port.sock,(struct sockaddr*)&(res->port.sa), sizeof(struct sockaddr));
++	if (bound < 0)
++		ee_printf("bind(): %s\n",strerror(errno));
++	return 1;
++}
++ee_u8 core_stop_parallel(core_results *res) {
++	int status;
++	int fromlen=sizeof(struct sockaddr);
++	int recsize = recvfrom(res->port.sock, &(res->crc), 8, 0, (struct sockaddr*)&(res->port.sa), &fromlen);
++	if (recsize < 0) {
++		ee_printf("Error in receive: %s\n", strerror(errno));
++		return 0;
++	}
++	pid_t wpid = waitpid(res->port.pid,&status,WUNTRACED);
++	if (wpid != res->port.pid) {
++		ee_printf("ERROR waiting for child.\n");
++		if (errno == ECHILD) ee_printf("errno=No such child %d\n",res->port.pid);
++		if (errno == EINTR) ee_printf("errno=Interrupted\n");
++		return 0;
++	}
++	return 1;
++}
++#else /* no standard multicore implementation */
++#error "Please implement multicore functionality in core_portme.c to use multiple contexts."
++#endif /* multithread implementations */
++#endif
+diff --git a/mips-i6500/core_portme.h b/mips-i6500/core_portme.h
+new file mode 100755
+index 000000000000..1228a679bcc4
+--- /dev/null
++++ b/mips-i6500/core_portme.h
+@@ -0,0 +1,291 @@
++/*
++Copyright 2018 Embedded Microprocessor Benchmark Consortium (EEMBC)
++
++Licensed under the Apache License, Version 2.0 (the "License");
++you may not use this file except in compliance with the License.
++You may obtain a copy of the License at
++
++    http://www.apache.org/licenses/LICENSE-2.0
++
++Unless required by applicable law or agreed to in writing, software
++distributed under the License is distributed on an "AS IS" BASIS,
++WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++See the License for the specific language governing permissions and
++limitations under the License.
++
++Original Author: Shay Gal-on
++*/
++
++/* Topic: Description
++	This file contains configuration constants required to execute on different platforms
++*/
++#ifndef CORE_PORTME_H
++#define CORE_PORTME_H
++/************************/
++/* Data types and settings */
++/************************/
++/* Configuration: HAS_FLOAT
++	Define to 1 if the platform supports floating point.
++*/
++#ifndef HAS_FLOAT
++#define HAS_FLOAT 1
++#endif
++/* Configuration: HAS_TIME_H
++	Define to 1 if platform has the time.h header file,
++	and implementation of functions thereof.
++*/
++#ifndef HAS_TIME_H
++#define HAS_TIME_H 1
++#endif
++/* Configuration: USE_CLOCK
++	Define to 1 if platform has the time.h header file,
++	and implementation of functions thereof.
++*/
++#ifndef USE_CLOCK
++#define USE_CLOCK 0
++#endif
++/* Configuration: HAS_STDIO
++	Define to 1 if the platform has stdio.h.
++*/
++#ifndef HAS_STDIO
++#define HAS_STDIO 1
++#endif
++/* Configuration: HAS_PRINTF
++	Define to 1 if the platform has stdio.h and implements the printf function.
++*/
++#ifndef HAS_PRINTF
++#define HAS_PRINTF 1
++#endif
++
++/* Configuration: CORE_TICKS
++	Define type of return from the timing functions.
++ */
++#if defined(_MSC_VER)
++#include <windows.h>
++typedef size_t CORE_TICKS;
++#elif HAS_TIME_H
++#include <time.h>
++typedef clock_t CORE_TICKS;
++#else
++#error "Please define type of CORE_TICKS and implement start_time, end_time get_time and time_in_secs functions!"
++#endif
++
++/* Definitions: COMPILER_VERSION, COMPILER_FLAGS, MEM_LOCATION
++	Initialize these strings per platform
++*/
++#ifndef COMPILER_VERSION
++ #ifdef __GNUC__
++ #define COMPILER_VERSION "GCC"__VERSION__
++ #else
++ #define COMPILER_VERSION "Please put compiler version here (e.g. gcc 4.1)"
++ #endif
++#endif
++#ifndef COMPILER_FLAGS
++ #define COMPILER_FLAGS FLAGS_STR /* "Please put compiler flags here (e.g. -o3)" */
++#endif
++#ifndef MEM_LOCATION
++ #define MEM_LOCATION "Please put data memory location here\n\t\t\t(e.g. code in flash, data on heap etc)"
++ #define MEM_LOCATION_UNSPEC 1
++#endif
++
++/* Data Types:
++	To avoid compiler issues, define the data types that need ot be used for 8b, 16b and 32b in <core_portme.h>.
++
++	*Imprtant*:
++	ee_ptr_int needs to be the data type used to hold pointers, otherwise coremark may fail!!!
++*/
++typedef signed short ee_s16;
++typedef unsigned short ee_u16;
++typedef signed int ee_s32;
++typedef double ee_f32;
++typedef unsigned char ee_u8;
++typedef unsigned int ee_u32;
++typedef unsigned long long ee_ptr_int;
++typedef size_t ee_size_t;
++/* align an offset to point to a 32b value */
++#define align_mem(x) (void *)(4 + (((ee_ptr_int)(x) - 1) & ~3))
++
++/* Configuration: SEED_METHOD
++	Defines method to get seed values that cannot be computed at compile time.
++
++	Valid values:
++	SEED_ARG - from command line.
++	SEED_FUNC - from a system function.
++	SEED_VOLATILE - from volatile variables.
++*/
++#ifndef SEED_METHOD
++#define SEED_METHOD SEED_ARG
++#endif
++
++/* Configuration: MEM_METHOD
++	Defines method to get a block of memry.
++
++	Valid values:
++	MEM_MALLOC - for platforms that implement malloc and have malloc.h.
++	MEM_STATIC - to use a static memory array.
++	MEM_STACK - to allocate the data block on the stack (NYI).
++*/
++#ifndef MEM_METHOD
++#define MEM_METHOD MEM_MALLOC
++#endif
++
++/* Configuration: MULTITHREAD
++	Define for parallel execution
++
++	Valid values:
++	1 - only one context (default).
++	N>1 - will execute N copies in parallel.
++
++	Note:
++	If this flag is defined to more then 1, an implementation for launching parallel contexts must be defined.
++
++	Two sample implementations are provided. Use <USE_PTHREAD> or <USE_FORK> to enable them.
++
++	It is valid to have a different implementation of <core_start_parallel> and <core_end_parallel> in <core_portme.c>,
++	to fit a particular architecture.
++*/
++#ifndef MULTITHREAD
++#define MULTITHREAD 1
++#endif
++
++/* Configuration: USE_PTHREAD
++	Sample implementation for launching parallel contexts
++	This implementation uses pthread_thread_create and pthread_join.
++
++	Valid values:
++	0 - Do not use pthreads API.
++	1 - Use pthreads API
++
++	Note:
++	This flag only matters if MULTITHREAD has been defined to a value greater then 1.
++*/
++#ifndef USE_PTHREAD
++#define USE_PTHREAD 0
++#endif
++
++/* Configuration: USE_FORK
++	Sample implementation for launching parallel contexts
++	This implementation uses fork, waitpid, shmget,shmat and shmdt.
++
++	Valid values:
++	0 - Do not use fork API.
++	1 - Use fork API
++
++	Note:
++	This flag only matters if MULTITHREAD has been defined to a value greater then 1.
++*/
++#ifndef USE_FORK
++#define USE_FORK 0
++#endif
++
++/* Configuration: USE_SOCKET
++	Sample implementation for launching parallel contexts
++	This implementation uses fork, socket, sendto and recvfrom
++
++	Valid values:
++	0 - Do not use fork and sockets API.
++	1 - Use fork and sockets API
++
++	Note:
++	This flag only matters if MULTITHREAD has been defined to a value greater then 1.
++*/
++#ifndef USE_SOCKET
++#define USE_SOCKET 0
++#endif
++
++/* Configuration: MAIN_HAS_NOARGC
++	Needed if platform does not support getting arguments to main.
++
++	Valid values:
++	0 - argc/argv to main is supported
++	1 - argc/argv to main is not supported
++*/
++#ifndef MAIN_HAS_NOARGC
++#define MAIN_HAS_NOARGC 0
++#endif
++
++/* Configuration: MAIN_HAS_NORETURN
++	Needed if platform does not support returning a value from main.
++
++	Valid values:
++	0 - main returns an int, and return value will be 0.
++	1 - platform does not support returning a value from main
++*/
++#ifndef MAIN_HAS_NORETURN
++#define MAIN_HAS_NORETURN 0
++#endif
++
++/* Variable: default_num_contexts
++	Number of contexts to spawn in multicore context.
++	Override this global value to change number of contexts used.
++
++	Note:
++	This value may not be set higher then the <MULTITHREAD> define.
++
++	To experiment, you can set the <MULTITHREAD> define to the highest value expected, and use argc/argv in the <portable_init> to set this value from the command line.
++*/
++extern ee_u32 default_num_contexts;
++
++#if (MULTITHREAD>1)
++#if USE_PTHREAD
++	#include <pthread.h>
++	#define PARALLEL_METHOD "PThreads"
++#elif USE_FORK
++	#include <unistd.h>
++	#include <errno.h>
++	#include <sys/wait.h>
++	#include <sys/shm.h>
++	#include <string.h> /* for memcpy */
++	#define PARALLEL_METHOD "Fork"
++#elif USE_SOCKET
++	#include <sys/types.h>
++	#include <sys/socket.h>
++	#include <netinet/in.h>
++	#include <arpa/inet.h>
++	#include <sys/wait.h>
++	#include <stdio.h>
++	#include <stdlib.h>
++	#include <string.h>
++	#include <unistd.h>
++	#include <errno.h>
++	#define PARALLEL_METHOD "Sockets"
++#else
++	#define PARALLEL_METHOD "Proprietary"
++	#error "Please implement multicore functionality in core_portme.c to use multiple contexts."
++#endif /* Method for multithreading */
++#endif /* MULTITHREAD > 1 */
++
++typedef struct CORE_PORTABLE_S {
++#if (MULTITHREAD>1)
++	#if USE_PTHREAD
++	pthread_t thread;
++	#elif USE_FORK
++	pid_t pid;
++	int shmid;
++	void *shm;
++	#elif USE_SOCKET
++	pid_t pid;
++	int sock;
++	struct sockaddr_in sa;
++	#endif /* Method for multithreading */
++#endif /* MULTITHREAD>1 */
++	ee_u8	portable_id;
++} core_portable;
++
++/* target specific init/fini */
++void portable_init(core_portable *p, int *argc, char *argv[]);
++void portable_fini(core_portable *p);
++
++#if (SEED_METHOD==SEED_VOLATILE)
++ #if (VALIDATION_RUN || PERFORMANCE_RUN || PROFILE_RUN)
++  #define RUN_TYPE_FLAG 1
++ #else
++  #if (TOTAL_DATA_SIZE==1200)
++   #define PROFILE_RUN 1
++  #else
++   #define PERFORMANCE_RUN 1
++  #endif
++ #endif
++#endif /* SEED_METHOD==SEED_VOLATILE */
++
++#endif /* CORE_PORTME_H */
+diff --git a/mips-i6500/core_portme.mak b/mips-i6500/core_portme.mak
+new file mode 100755
+index 000000000000..5cfabee32658
+--- /dev/null
++++ b/mips-i6500/core_portme.mak
+@@ -0,0 +1,140 @@
++# Copyright 2018 Embedded Microprocessor Benchmark Consortium (EEMBC)
++#
++# Licensed under the Apache License, Version 2.0 (the "License");
++# you may not use this file except in compliance with the License.
++# You may obtain a copy of the License at
++#
++#    http://www.apache.org/licenses/LICENSE-2.0
++#
++# Unless required by applicable law or agreed to in writing, software
++# distributed under the License is distributed on an "AS IS" BASIS,
++# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++# See the License for the specific language governing permissions and
++# limitations under the License.
++#
++# Original Author: Shay Gal-on
++
++#File: core_portme.mak
++
++# Flag: OUTFLAG
++#	Use this flag to define how to to get an executable (e.g -o)
++OUTFLAG= -o
++# Flag: CC
++#	Use this flag to define compiler to use
++CC = gcc
++# Flag: CFLAGS
++#	Use this flag to define compiler options. Note, you can add compiler options from the command line using XCFLAGS="other flags"
++PORT_CFLAGS = -O2
++FLAGS_STR = "$(PORT_CFLAGS) $(XCFLAGS) $(XLFLAGS) $(LFLAGS_END)"
++CFLAGS = $(PORT_CFLAGS) -I$(PORT_DIR) -I. -DFLAGS_STR=\"$(FLAGS_STR)\"
++#Flag: LFLAGS_END
++#	Define any libraries needed for linking or other flags that should come at the end of the link line (e.g. linker scripts).
++#	Note: On certain platforms, the default clock_gettime implementation is supported but requires linking of librt.
++LFLAGS_END += -lrt
++# Flag: PORT_SRCS
++# Port specific source files can be added here
++PORT_SRCS = $(PORT_DIR)/core_portme.c
++# Flag: LOAD
++#	Define this flag if you need to load to a target, as in a cross compile environment.
++
++# Flag: RUN
++#	Define this flag if running does not consist of simple invocation of the binary.
++#	In a cross compile environment, you need to define this.
++
++#For flashing and using a tera term macro, you could use
++#LOAD = flash ADDR
++#RUN =  ttpmacro coremark.ttl
++
++#For copying to target and executing via SSH connection, you could use
++#LOAD = scp $(OUTFILE)  user@target:~
++#RUN = ssh user@target -c
++
++#For native compilation and execution
++LOAD = echo Loading done
++RUN =
++
++OEXT = .o
++EXE = .exe
++
++# Flag: SEPARATE_COMPILE
++# Define if you need to separate compilation from link stage.
++# In this case, you also need to define below how to create an object file, and how to link.
++ifdef SEPARATE_COMPILE
++
++LD		= gcc
++OBJOUT 	= -o
++LFLAGS 	=
++OFLAG 	= -o
++COUT 	= -c
++# Flag: PORT_OBJS
++# Port specific object files can be added here
++PORT_OBJS = $(PORT_DIR)/core_portme$(OEXT)
++PORT_CLEAN = *$(OEXT)
++
++$(OPATH)%$(OEXT) : %.c
++	$(CC) $(CFLAGS) $(XCFLAGS) $(COUT) $< $(OBJOUT) $@
++
++endif
++
++# Target: port_prebuild
++# Generate any files that are needed before actual build starts.
++# E.g. generate profile guidance files. Sample PGO generation for gcc enabled with PGO=1
++#  - First, check if PGO was defined on the command line, if so, need to add -fprofile-use to compile line.
++#  - Second, if PGO reference has not yet been generated, add a step to the prebuild that will build a profile-generate version and run it.
++#  Note - Using REBUILD=1
++#
++# Use make PGO=1 to invoke this sample processing.
++
++ifdef PGO
++ ifeq (,$(findstring $(PGO),gen))
++  PGO_STAGE=build_pgo_gcc
++  CFLAGS+=-fprofile-use
++ endif
++ PORT_CLEAN+=*.gcda *.gcno gmon.out
++endif
++
++.PHONY: port_prebuild
++port_prebuild: $(PGO_STAGE)
++
++.PHONY: build_pgo_gcc
++build_pgo_gcc:
++	$(MAKE) PGO=gen XCFLAGS="$(XCFLAGS) -fprofile-generate -DTOTAL_DATA_SIZE=1200" ITERATIONS=10 gen_pgo_data REBUILD=1
++
++# Target: port_postbuild
++# Generate any files that are needed after actual build end.
++# E.g. change format to srec, bin, zip in order to be able to load into flash
++.PHONY: port_postbuild
++port_postbuild:
++
++# Target: port_postrun
++# 	Do platform specific after run stuff.
++#	E.g. reset the board, backup the logfiles etc.
++.PHONY: port_postrun
++port_postrun:
++
++# Target: port_prerun
++# 	Do platform specific after run stuff.
++#	E.g. reset the board, backup the logfiles etc.
++.PHONY: port_prerun
++port_prerun:
++
++# Target: port_postload
++# 	Do platform specific after load stuff.
++#	E.g. reset the reset power to the flash eraser
++.PHONY: port_postload
++port_postload:
++
++# Target: port_preload
++# 	Do platform specific before load stuff.
++#	E.g. reset the reset power to the flash eraser
++.PHONY: port_preload
++port_preload:
++
++# FLAG: OPATH
++# Path to the output folder. Default - current folder.
++OPATH = ./
++MKDIR = mkdir -p
++
++# FLAG: PERL
++# Define perl executable to calculate the geomean if running separate.
++PERL=/usr/bin/perl
+-- 
+2.19.1
diff --git a/package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch b/package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch
new file mode 100644
index 0000000000..1fdef1f300
--- /dev/null
+++ b/package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch
@@ -0,0 +1,35 @@
+From 59542343c82a936326345455036d33ba30a646c5 Mon Sep 17 00:00:00 2001
+From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
+Date: Wed, 27 Feb 2019 10:05:52 +0200
+Subject: [PATCH 2/2] Compiler flags customized for mips-i6500
+
+Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
+---
+ mips-i6500/core_portme.mak | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/mips-i6500/core_portme.mak b/mips-i6500/core_portme.mak
+index 5cfabee32658..8e0ac11d7854 100755
+--- a/mips-i6500/core_portme.mak
++++ b/mips-i6500/core_portme.mak
+@@ -24,13 +24,16 @@ OUTFLAG= -o
+ CC = gcc
+ # Flag: CFLAGS
+ #	Use this flag to define compiler options. Note, you can add compiler options from the command line using XCFLAGS="other flags"
+-PORT_CFLAGS = -O2
++PORT_CFLAGS := -DRTELinux -DITERATIONS=0 -DUSE_PTHREAD  -DMULTITHREAD=4
++PORT_CFLAGS += -O3 -funroll-all-loops -falign-jumps=16 -falign-loops=16 -falign-functions=16 -finline-functions -finline-limit=1000
++PORT_CFLAGS += -fgcse-sm -fgcse-las -EL -mtune=i6500 -mabi=64 -mmsa
+ FLAGS_STR = "$(PORT_CFLAGS) $(XCFLAGS) $(XLFLAGS) $(LFLAGS_END)"
+ CFLAGS = $(PORT_CFLAGS) -I$(PORT_DIR) -I. -DFLAGS_STR=\"$(FLAGS_STR)\"
+ #Flag: LFLAGS_END
+ #	Define any libraries needed for linking or other flags that should come at the end of the link line (e.g. linker scripts).
+ #	Note: On certain platforms, the default clock_gettime implementation is supported but requires linking of librt.
+-LFLAGS_END += -lrt
++LFLAGS_END += -lrt -lpthread -static
++#-Tmsym32.ld
+ # Flag: PORT_SRCS
+ # Port specific source files can be added here
+ PORT_SRCS = $(PORT_DIR)/core_portme.c
+-- 
+2.19.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
