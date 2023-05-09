Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BFBC77B75
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 20:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91D154094A;
	Tue,  9 May 2023 20:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91D154094A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwI2BfX5imMZ; Tue,  9 May 2023 20:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48D1340952;
	Tue,  9 May 2023 20:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48D1340952
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F61E1BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 559906166D
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 559906166D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqOp3Lwrgjf0 for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:12:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 931BC61674
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 931BC61674
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:12:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc0ced1d9so9662434a12.0
 for <buildroot@buildroot.org>; Tue, 09 May 2023 13:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683663155; x=1686255155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D9W0EhyAKNvzEhWG+8ohM9gRSAbn5cJEbMru7Bio6BI=;
 b=O0CyzhllovkD0i0pQzJue81ZTuUYpyNTQ5rM7WvP9OCwJWo3UTMawbZcUt6OztDyhs
 d/1R6XQJ6gJD74uDXjn6YG6c4PUfUITSlrsnbLYAnxRDLf5TcEuqOrtIV5GukAOf+MKz
 lNCNpnicTm5NxN8crSdDdTSwKx4VlU744p9oQ/IEU7rnMlYx2bv25OaxPHzc+szGpATK
 bcg0X8uGLjuyL0K7/AfXrGapEhuNu9UchefKYwOl5rAhl1lH3zV+pYVMuwWliwG+YlCk
 UFai1aWN2CSLxsPO7/xTi2eR58J9E1V7H3onLlPEyZkkR/Ri0zSRghWLdm5gSd5f3VAL
 kubQ==
X-Gm-Message-State: AC+VfDwtFeuZBYE/abqySUnVwJuOaxu3+hLYgZGssdw5W6/zV5n8TjbR
 H5ByCbTNFrXbLeES0Kyp/0ntI2wxFksMza+FMN2nWw==
X-Google-Smtp-Source: ACHHUZ4PZhvx++H33fFv1Chu55bQo+dJhHDe11aA1VBZwlmcOWa5FXUvLFwUckPLljmb/Z5qfJ8Nnw==
X-Received: by 2002:a05:6402:1116:b0:50b:cb85:f938 with SMTP id
 u22-20020a056402111600b0050bcb85f938mr12064553edv.27.1683663155325; 
 Tue, 09 May 2023 13:12:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-40-97-5.business.telecomitalia.it. [79.40.97.5])
 by smtp.gmail.com with ESMTPSA id
 r23-20020aa7da17000000b00506987c5c71sm1157936eds.70.2023.05.09.13.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 13:12:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  9 May 2023 22:11:52 +0200
Message-Id: <20230509201153.2413972-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
References: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1683663155; x=1686255155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D9W0EhyAKNvzEhWG+8ohM9gRSAbn5cJEbMru7Bio6BI=;
 b=DKMoEQ7MsBXNDGGDB/FZRfpflWDszcdm9EgdfHAjWz4W/Rh3zqZVcl1uDm8NH+5nao
 9wBo1eWBDpmrsqCVQSAWbu9ZCw7qciDis0nYld3wKDeWLMx+MCtCiUCpbNDh9UrHG5iP
 3/fm8YRNDNfGTzcmVZfzdnKlTyNLqpxRSD1h4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DKMoEQ7M
Subject: [Buildroot] [PATCH 3/4] package/libmnl: add rtnl-link-can example
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The iproute2 package requires MMU support, and the BusyBox "ip link"
command does not handle CAN interfaces. The rtnl-link-can application,
added by applying the upstream patch, allows for the use of CAN devices
even on such systems.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0001-examples-add-rtnl-link-can.patch     | 504 ++++++++++++++++++
 package/libmnl/libmnl.mk                      |   4 +-
 2 files changed, 507 insertions(+), 1 deletion(-)
 create mode 100644 package/libmnl/0001-examples-add-rtnl-link-can.patch

diff --git a/package/libmnl/0001-examples-add-rtnl-link-can.patch b/package/libmnl/0001-examples-add-rtnl-link-can.patch
new file mode 100644
index 000000000000..6196cb5a32cf
--- /dev/null
+++ b/package/libmnl/0001-examples-add-rtnl-link-can.patch
@@ -0,0 +1,504 @@
+From 80442c4e32cde0b27b471c5c9688ee8488f14bec Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Thu, 20 Apr 2023 21:21:15 +0200
+Subject: [PATCH] examples: add rtnl-link-can
+
+I developed this application to test the Linux kernel series referenced below.
+I could not use the iproute2 package since the microcontroller is without MMU.
+
+On suggestion of the Linux CAN subsystem maintainer I decided to upstream it.
+
+Cc: Marc Kleine-Budde <mkl@pengutronix.de>
+Link: https://marc.info/?l=linux-netdev&m=167999323611710&w=2
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+Upstream: 80442c4e32cde0b27b471c5c9688ee8488f14bec
+---
+ examples/rtnl/Makefile.am     |   4 +
+ examples/rtnl/rtnl-link-can.c | 452 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 456 insertions(+)
+ create mode 100644 examples/rtnl/rtnl-link-can.c
+
+diff --git a/examples/rtnl/Makefile.am b/examples/rtnl/Makefile.am
+index dd8a77d914b6..5a28e0965926 100644
+--- a/examples/rtnl/Makefile.am
++++ b/examples/rtnl/Makefile.am
+@@ -2,6 +2,7 @@ include $(top_srcdir)/Make_global.am
+ 
+ check_PROGRAMS = rtnl-addr-add \
+ 		 rtnl-addr-dump \
++		 rtnl-link-can \
+ 		 rtnl-link-dump rtnl-link-dump2 rtnl-link-dump3 \
+ 		 rtnl-link-event \
+ 		 rtnl-link-set \
+@@ -13,6 +14,9 @@ check_PROGRAMS = rtnl-addr-add \
+ rtnl_addr_add_SOURCES = rtnl-addr-add.c
+ rtnl_addr_add_LDADD = ../../src/libmnl.la
+ 
++rtnl_link_can_SOURCES = rtnl-link-can.c
++rtnl_link_can_LDADD = ../../src/libmnl.la
++
+ rtnl_addr_dump_SOURCES = rtnl-addr-dump.c
+ rtnl_addr_dump_LDADD = ../../src/libmnl.la
+ 
+diff --git a/examples/rtnl/rtnl-link-can.c b/examples/rtnl/rtnl-link-can.c
+new file mode 100644
+index 000000000000..8ed70d141475
+--- /dev/null
++++ b/examples/rtnl/rtnl-link-can.c
+@@ -0,0 +1,452 @@
++/* This example is placed in the public domain. */
++#include <errno.h>
++#include <limits.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <unistd.h>
++#include <time.h>
++
++#include <libmnl/libmnl.h>
++#include <linux/can/netlink.h>
++#include <linux/if.h>
++#include <linux/if_link.h>
++#include <linux/rtnetlink.h>
++
++static void incomplete_command(void) __attribute__((noreturn));
++
++#define NEXT_ARG()				\
++	do { \
++		if (argc <= 0) incomplete_command();	\
++		argv++; \
++		argc--; \
++	} while (0)
++
++static void duparg2(const char *key, const char *arg)
++{
++	fprintf(stderr,
++		"Error: either \"%s\" is duplicate, or \"%s\" is a garbage.\n",
++		key, arg);
++	exit(-1);
++}
++
++static void incomplete_command(void)
++{
++	fprintf(stderr, "Command line is not complete. Try option \"help\"\n");
++	exit(EXIT_FAILURE);
++}
++
++/* Returns false if 'prefix' is a not empty prefix of 'string'.
++ */
++static bool matches(const char *prefix, const char *string)
++{
++	if (!*prefix)
++		return true;
++
++	while (*string && *prefix == *string) {
++		prefix++;
++		string++;
++	}
++
++	return !!*prefix;
++}
++
++static int get_u16(__u16 *val, const char *arg, int base)
++{
++	unsigned long res;
++	char *ptr;
++
++	if (!arg || !*arg)
++		return -1;
++
++	res = strtoul(arg, &ptr, base);
++
++	/* empty string or trailing non-digits */
++	if (!ptr || ptr == arg || *ptr)
++		return -1;
++
++	/* overflow */
++	if (res == ULONG_MAX && errno == ERANGE)
++		return -1;
++
++	if (res > 0xFFFFUL)
++		return -1;
++
++	*val = res;
++	return 0;
++}
++
++static int get_u32(__u32 *val, const char *arg, int base)
++{
++	unsigned long res;
++	char *ptr;
++
++	if (!arg || !*arg)
++		return -1;
++
++	res = strtoul(arg, &ptr, base);
++
++	/* empty string or trailing non-digits */
++	if (!ptr || ptr == arg || *ptr)
++		return -1;
++
++	/* overflow */
++	if (res == ULONG_MAX && errno == ERANGE)
++		return -1;
++
++	/* in case UL > 32 bits */
++	if (res > 0xFFFFFFFFUL)
++		return -1;
++
++	*val = res;
++	return 0;
++}
++
++static int get_float(float *val, const char *arg)
++{
++	float res;
++	char *ptr;
++
++	if (!arg || !*arg)
++		return -1;
++
++	res = strtof(arg, &ptr);
++	if (!ptr || ptr == arg || *ptr)
++		return -1;
++
++	*val = res;
++	return 0;
++}
++
++static void set_ctrlmode(char *name, char *arg,
++			 struct can_ctrlmode *cm, __u32 flags)
++{
++	if (strcmp(arg, "on") == 0) {
++		cm->flags |= flags;
++	} else if (strcmp(arg, "off") != 0) {
++		fprintf(stderr,
++			"Error: argument of \"%s\" must be \"on\" or \"off\", not \"%s\"\n",
++			name, arg);
++		exit(EXIT_FAILURE);
++	}
++
++	cm->mask |= flags;
++}
++
++static void invarg(const char *msg, const char *arg)
++{
++	fprintf(stderr, "Error: argument \"%s\" is wrong: %s\n", arg, msg);
++	exit(-1);
++}
++
++static void print_usage(FILE *f)
++{
++	fprintf(f,
++		"Usage: ip link set DEVICE type can\n"
++		"\t[ bitrate BITRATE [ sample-point SAMPLE-POINT] ] |\n"
++		"\t[ tq TQ prop-seg PROP_SEG phase-seg1 PHASE-SEG1\n \t  phase-seg2 PHASE-SEG2 [ sjw SJW ] ]\n"
++		"\n"
++		"\t[ dbitrate BITRATE [ dsample-point SAMPLE-POINT] ] |\n"
++		"\t[ dtq TQ dprop-seg PROP_SEG dphase-seg1 PHASE-SEG1\n \t  dphase-seg2 PHASE-SEG2 [ dsjw SJW ] ]\n"
++		"\n"
++		"\t[ loopback { on | off } ]\n"
++		"\t[ listen-only { on | off } ]\n"
++		"\t[ triple-sampling { on | off } ]\n"
++		"\t[ one-shot { on | off } ]\n"
++		"\t[ berr-reporting { on | off } ]\n"
++		"\t[ fd { on | off } ]\n"
++		"\t[ fd-non-iso { on | off } ]\n"
++		"\t[ presume-ack { on | off } ]\n"
++		"\t[ cc-len8-dlc { on | off } ]\n"
++		"\n"
++		"\t[ restart-ms TIME-MS ]\n"
++		"\t[ restart ]\n"
++		"\n"
++		"\t[ termination { 0..65535 } ]\n"
++		"\n"
++		"\tWhere: BITRATE	:= { 1..1000000 }\n"
++		"\t	  SAMPLE-POINT	:= { 0.000..0.999 }\n"
++		"\t	  TQ		:= { NUMBER }\n"
++		"\t	  PROP-SEG	:= { 1..8 }\n"
++		"\t	  PHASE-SEG1	:= { 1..8 }\n"
++		"\t	  PHASE-SEG2	:= { 1..8 }\n"
++		"\t	  SJW		:= { 1..4 }\n"
++		"\t	  RESTART-MS	:= { 0 | NUMBER }\n"
++		);
++}
++
++static void usage(void)
++{
++	print_usage(stderr);
++}
++
++static int iplink_set_can_parse(int argc, char **argv, struct nlmsghdr *nlh)
++{
++	struct can_bittiming bt = {}, dbt = {};
++	struct can_ctrlmode cm = {};
++
++	while (argc > 0) {
++		if (matches(*argv, "bitrate") == 0) {
++			NEXT_ARG();
++			if (get_u32(&bt.bitrate, *argv, 0))
++				invarg("invalid \"bitrate\" value\n", *argv);
++		} else if (matches(*argv, "sample-point") == 0) {
++			float sp;
++
++			NEXT_ARG();
++			if (get_float(&sp, *argv))
++				invarg("invalid \"sample-point\" value\n",
++				       *argv);
++
++			bt.sample_point = (__u32)(sp * 1000);
++		} else if (matches(*argv, "tq") == 0) {
++			NEXT_ARG();
++			if (get_u32(&bt.tq, *argv, 0))
++				invarg("invalid \"tq\" value\n", *argv);
++		} else if (matches(*argv, "prop-seg") == 0) {
++			NEXT_ARG();
++			if (get_u32(&bt.prop_seg, *argv, 0))
++				invarg("invalid \"prop-seg\" value\n", *argv);
++		} else if (matches(*argv, "phase-seg1") == 0) {
++			NEXT_ARG();
++			if (get_u32(&bt.phase_seg1, *argv, 0))
++				invarg("invalid \"phase-seg1\" value\n", *argv);
++		} else if (matches(*argv, "phase-seg2") == 0) {
++			NEXT_ARG();
++			if (get_u32(&bt.phase_seg2, *argv, 0))
++				invarg("invalid \"phase-seg2\" value\n", *argv);
++		} else if (matches(*argv, "sjw") == 0) {
++			NEXT_ARG();
++			if (get_u32(&bt.sjw, *argv, 0))
++				invarg("invalid \"sjw\" value\n", *argv);
++		} else if (matches(*argv, "dbitrate") == 0) {
++			NEXT_ARG();
++			if (get_u32(&dbt.bitrate, *argv, 0))
++				invarg("invalid \"dbitrate\" value\n", *argv);
++		} else if (matches(*argv, "dsample-point") == 0) {
++			float sp;
++
++			NEXT_ARG();
++			if (get_float(&sp, *argv))
++				invarg("invalid \"dsample-point\" value\n", *argv);
++			dbt.sample_point = (__u32)(sp * 1000);
++		} else if (matches(*argv, "dtq") == 0) {
++			NEXT_ARG();
++			if (get_u32(&dbt.tq, *argv, 0))
++				invarg("invalid \"dtq\" value\n", *argv);
++		} else if (matches(*argv, "dprop-seg") == 0) {
++			NEXT_ARG();
++			if (get_u32(&dbt.prop_seg, *argv, 0))
++				invarg("invalid \"dprop-seg\" value\n", *argv);
++		} else if (matches(*argv, "dphase-seg1") == 0) {
++			NEXT_ARG();
++			if (get_u32(&dbt.phase_seg1, *argv, 0))
++				invarg("invalid \"dphase-seg1\" value\n", *argv);
++		} else if (matches(*argv, "dphase-seg2") == 0) {
++			NEXT_ARG();
++			if (get_u32(&dbt.phase_seg2, *argv, 0))
++				invarg("invalid \"dphase-seg2\" value\n", *argv);
++		} else if (matches(*argv, "dsjw") == 0) {
++			NEXT_ARG();
++			if (get_u32(&dbt.sjw, *argv, 0))
++				invarg("invalid \"dsjw\" value\n", *argv);
++		} else if (matches(*argv, "loopback") == 0) {
++			NEXT_ARG();
++			set_ctrlmode("loopback", *argv, &cm,
++				     CAN_CTRLMODE_LOOPBACK);
++		} else if (matches(*argv, "listen-only") == 0) {
++			NEXT_ARG();
++			set_ctrlmode("listen-only", *argv, &cm,
++				     CAN_CTRLMODE_LISTENONLY);
++		} else if (matches(*argv, "triple-sampling") == 0) {
++			NEXT_ARG();
++			set_ctrlmode("triple-sampling", *argv, &cm,
++				     CAN_CTRLMODE_3_SAMPLES);
++		} else if (matches(*argv, "one-shot") == 0) {
++			NEXT_ARG();
++			set_ctrlmode("one-shot", *argv, &cm,
++				     CAN_CTRLMODE_ONE_SHOT);
++		} else if (matches(*argv, "berr-reporting") == 0) {
++			NEXT_ARG();
++			set_ctrlmode("berr-reporting", *argv, &cm,
++				     CAN_CTRLMODE_BERR_REPORTING);
++		} else if (matches(*argv, "fd") == 0) {
++			NEXT_ARG();
++			set_ctrlmode("fd", *argv, &cm,
++				     CAN_CTRLMODE_FD);
++		} else if (matches(*argv, "fd-non-iso") == 0) {
++			NEXT_ARG();
++			set_ctrlmode("fd-non-iso", *argv, &cm,
++				     CAN_CTRLMODE_FD_NON_ISO);
++		} else if (matches(*argv, "presume-ack") == 0) {
++			NEXT_ARG();
++			set_ctrlmode("presume-ack", *argv, &cm,
++				     CAN_CTRLMODE_PRESUME_ACK);
++#if defined(CAN_CTRLMODE_CC_LEN8_DLC)
++		} else if (matches(*argv, "cc-len8-dlc") == 0) {
++			NEXT_ARG();
++			set_ctrlmode("cc-len8-dlc", *argv, &cm,
++				     CAN_CTRLMODE_CC_LEN8_DLC);
++#endif
++		} else if (matches(*argv, "restart") == 0) {
++			__u32 val = 1;
++
++			mnl_attr_put(nlh, IFLA_CAN_RESTART, sizeof(val), &val);
++		} else if (matches(*argv, "restart-ms") == 0) {
++			__u32 val;
++
++			NEXT_ARG();
++			if (get_u32(&val, *argv, 0))
++				invarg("invalid \"restart-ms\" value\n", *argv);
++
++			mnl_attr_put(nlh, IFLA_CAN_RESTART_MS, sizeof(val), &val);
++		} else if (matches(*argv, "termination") == 0) {
++			__u16 val;
++
++			NEXT_ARG();
++			if (get_u16(&val, *argv, 0))
++				invarg("invalid \"termination\" value\n",
++				       *argv);
++
++			mnl_attr_put(nlh, IFLA_CAN_TERMINATION, sizeof(val), &val);
++		} else {
++			fprintf(stderr, "unknown option \"%s\"\n", *argv);
++			usage();
++			return -1;
++		}
++
++		NEXT_ARG();
++	}
++
++	if (bt.bitrate || bt.tq)
++		mnl_attr_put(nlh, IFLA_CAN_BITTIMING, sizeof(bt), &bt);
++
++	if (cm.mask)
++		mnl_attr_put(nlh, IFLA_CAN_CTRLMODE, sizeof(cm), &cm);
++
++	return 0;
++}
++
++int main(int argc, char *argv[])
++{
++	char buf[MNL_SOCKET_BUFFER_SIZE];
++	struct mnl_socket *nl;
++	struct nlmsghdr *nlh;
++	struct ifinfomsg *ifm;
++	int ret;
++	unsigned int seq, portid;
++	struct nlattr *linkinfo, *data;
++	const char *signatures[] = {
++		"ip", "link", "set", ""
++	};
++	char *type = NULL;
++	char *dev = NULL;
++	int i;
++
++	NEXT_ARG();
++	for (i = 0; argc > 0 && signatures[i][0];) {
++		if (matches(*argv, signatures[i]))
++			incomplete_command();
++
++		NEXT_ARG();
++		i++;
++	}
++
++	if (argc == 0)
++		incomplete_command();
++
++	nlh = mnl_nlmsg_put_header(buf);
++	nlh->nlmsg_type	= RTM_NEWLINK;
++	nlh->nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK;
++	nlh->nlmsg_seq = seq = time(NULL);
++	ifm = mnl_nlmsg_put_extra_header(nlh, sizeof(*ifm));
++	ifm->ifi_family = AF_UNSPEC;
++	ifm->ifi_change = 0;
++	ifm->ifi_flags = 0;
++
++	while (argc > 0) {
++		if (matches(*argv, "up") == 0) {
++			ifm->ifi_change |= IFF_UP;
++			ifm->ifi_flags |= IFF_UP;
++		} else if (matches(*argv, "down") == 0) {
++			ifm->ifi_change |= IFF_UP;
++			ifm->ifi_flags &= ~IFF_UP;
++		} else if (matches(*argv, "type") == 0) {
++			NEXT_ARG();
++			type = *argv;
++			NEXT_ARG();
++			break;
++		} else if (matches(*argv, "help") == 0) {
++			usage();
++			exit(EXIT_FAILURE);
++		} else {
++			if (matches(*argv, "dev") == 0)
++				NEXT_ARG();
++
++			if (dev)
++				duparg2("dev", *argv);
++
++			dev = *argv;
++		}
++
++		NEXT_ARG();
++	}
++
++	if (dev)
++		mnl_attr_put_str(nlh, IFLA_IFNAME, dev);
++
++	if (type) {
++		if (matches(type, "can")) {
++			fprintf(stderr, "unknown type \"%s\"\n", type);
++			usage();
++			exit(EXIT_FAILURE);
++		}
++
++		linkinfo = mnl_attr_nest_start(nlh, IFLA_LINKINFO);
++		mnl_attr_put_str(nlh, IFLA_INFO_KIND, "can");
++		data = mnl_attr_nest_start(nlh, IFLA_INFO_DATA);
++
++		if (iplink_set_can_parse(argc, argv, nlh))
++			return -1;
++
++		mnl_attr_nest_end(nlh, data);
++		mnl_attr_nest_end(nlh, linkinfo);
++	}
++
++	nl = mnl_socket_open(NETLINK_ROUTE);
++	if (nl == NULL) {
++		perror("mnl_socket_open");
++		exit(EXIT_FAILURE);
++	}
++
++	if (mnl_socket_bind(nl, 0, MNL_SOCKET_AUTOPID) < 0) {
++		perror("mnl_socket_bind");
++		exit(EXIT_FAILURE);
++	}
++
++	portid = mnl_socket_get_portid(nl);
++
++	mnl_nlmsg_fprintf(stdout, nlh, nlh->nlmsg_len,
++			  sizeof(struct ifinfomsg));
++
++	if (mnl_socket_sendto(nl, nlh, nlh->nlmsg_len) < 0) {
++		perror("mnl_socket_sendto");
++		exit(EXIT_FAILURE);
++	}
++
++	ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
++	if (ret == -1) {
++		perror("mnl_socket_recvfrom");
++		exit(EXIT_FAILURE);
++	}
++
++	ret = mnl_cb_run(buf, ret, seq, portid, NULL, NULL);
++	if (ret == -1) {
++		perror("mnl_cb_run");
++		exit(EXIT_FAILURE);
++	}
++
++	mnl_socket_close(nl);
++
++	return 0;
++}
+-- 
+2.32.0
+
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index d9b1fbabe703..7c48196d7529 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -11,6 +11,8 @@ LIBMNL_INSTALL_STAGING = YES
 LIBMNL_LICENSE = LGPL-2.1+
 LIBMNL_LICENSE_FILES = COPYING
 LIBMNL_CPE_ID_VENDOR = netfilter
+# 0001-examples-add-rtnl-link-can.patch patches Makefile.am
+LIBMNL_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES),y)
 define LIBMNL_EXAMPLES_BUILD_CMDS
@@ -28,7 +30,7 @@ LIBMNL_EXAMPLES_INSTALL_TARGETS += \
 		nf-queue)
 LIBMNL_EXAMPLES_INSTALL_TARGETS += \
 	$(addprefix examples/rtnl/, rtnl-addr-add rtnl-addr-dump \
-		rtnl-link-dump rtnl-link-dump2 rtnl-link-dump3 \
+		rtnl-link-can rtnl-link-dump rtnl-link-dump2 rtnl-link-dump3 \
 		rtnl-link-event rtnl-link-set rtnl-neigh-dump \
 		rtnl-route-add rtnl-route-dump rtnl-route-event)
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
