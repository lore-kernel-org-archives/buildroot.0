Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428FECDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF7D78056F;
	Tue, 22 Oct 2024 21:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhA6982hd7Ir; Tue, 22 Oct 2024 21:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8AF3805B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8AF3805B7;
	Tue, 22 Oct 2024 21:02:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 941752072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D45280573
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcdl-J_oSfJe for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E7F280530
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E7F280530
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E7F280530
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:02:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4277F20007;
 Tue, 22 Oct 2024 21:02:45 +0000 (UTC)
Date: Tue, 22 Oct 2024 23:02:43 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Philippe
 Proulx <eeppeliteloop@gmail.com>
Message-ID: <20241022230243.1e661af2@windsurf>
In-Reply-To: <20241014171506.2197624-1-dario.binacchi@amarulasolutions.com>
References: <20241014171506.2197624-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729630965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdT+OaK8uPeWNDK+FgF8GJO1+Fc8F4XFsZ4MlodsVZQ=;
 b=eDMsnDOyaarBzdzNhDVGCNtuV1hpz+jPD8FJPZjAlG3ZaqupDqNw9h8PftcG6tJsJ/Msf0
 MmjLUdcCH6QqY0ksVSm+YM3XggX1gak+KLNfnBfXJz0Syef7Z9PXzUnRoHxIqByWAPZBy7
 dnfF/OFHPxty9g4lfVOOmzj6NTh8dPdJxGFY5ebXnlkXARPIHcYJKx5y/WD2UMpJ9cpzE5
 sqhz82WItYADto7m4oLAboHwj+xP80bTgvXOirtPKSc4fhqRh0hRIPBGKjtevKOmKfwOgK
 szpxaudxR1cM3zdLE6qby0rNwi6vT2fdpx0HJcCvHjVs/nt1uVpXTl1Bog9ZTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eDMsnDOy
Subject: Re: [Buildroot] [PATCH 1/1] package/babeltrace2: bump to version
 2.0.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 14 Oct 2024 19:15:06 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> 2024-03-28 Babeltrace 2.0.6 (Respect Your Cat Day)
> 	* bt2: disable some warnings for `native_bt.c`
> 	* bt2: compile `native_bt.c` with `-Wno-undef`
> 	* Fix: src.ctf.lttng-live: expect NEW_STREAM/METADATA for inactive streams
> 	* Fix: `babeltrace2 convert`: don't consider the `--plugin-path` opt.
> 	* include/babeltrace2/plugin/plugin-dev.h: "define" -> "definition
> 	* Fix: doc: escape double quote in bt_p alias
> 	* Fix: bt2: pass _TraceClassConst to destruction listeners
> 	* fix: 'load_module()' deprecated in Python 3.12
> 	* tests: retry os.rename on PermissionError failure in lttng_live_server.py
> 	* doc: fix uptream -> upstream typos
> 	* fix: test_message_iterator.py hangs on Python 3.12
> 	* plugin-dev: mark symbols meant to be public with __attribute__((visibility("default")))
> 	* Silence -Wunused-but-set-variable error with clang
> 	* Fix: Windows DLL path lookup with Python >= 3.8
> 	* doc/man: make default values of boolean init. params. clearer
> 	* RFC: docs: fix: Match stated automake requirement
> 	* fix: make flake8 6.x happy
> 	* fix: running black on python 3.11
> 	* bt_query_executor_create_with_method_data(): fix docs note
> 	* Fix: ctf-writer: null dereference in bt_ctf_trace_common_add_stream_class
> 	* Update working version to Babeltrace v2.0.6
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...onfigure-simplify-warning-flags-detection.patch | 14 ++++++++------
>  package/babeltrace2/babeltrace2.hash               |  2 +-
>  package/babeltrace2/babeltrace2.mk                 |  2 +-
>  3 files changed, 10 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
