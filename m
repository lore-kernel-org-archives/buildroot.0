Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBD7C021A9
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B20081E81;
	Sat, 14 Sep 2024 18:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55pp-Sj4dBqr; Sat, 14 Sep 2024 18:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2751484147
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2751484147;
	Sat, 14 Sep 2024 18:19:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24E811BF283
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1414184147
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqAN_D1IF73L for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:19:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.150.162;
 helo=dd33218.kasserver.com; envelope-from=brpi@duering-andreas.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2397381E81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2397381E81
Received: from dd33218.kasserver.com (dd33218.kasserver.com [85.13.150.162])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2397381E81
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:19:41 +0000 (UTC)
Received: from devuanPc.fritz.box (muedsl-82-207-203-099.citykom.de
 [82.207.203.99])
 by dd33218.kasserver.com (Postfix) with ESMTPSA id E427F200098B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:19:38 +0200 (CEST)
Date: Sat, 14 Sep 2024 20:19:37 +0200
To: buildroot@buildroot.org
Message-ID: <20240914201937.567067fd@devuanPc.fritz.box>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=duering-andreas.de; 
 s=kas201911161523; t=1726337978;
 bh=o3zhPd3HLkwRtSv/0wLv4i9Btm3SsO07OtShFC9W20g=;
 h=Date:From:To:Subject:From;
 b=fbGJHzLed8kJhrtQlPLHCjQj67UoR0omLOffoWl2EKqUKQ68ipf1srOFAAEEwbNl+
 yrXhzm6GLnJuEeOa4JyWu0rBjep9ii7fvdSERGK8HHFcDSfexgHkEnFkPxW0ZDUhvX
 djkK9aBgCh4HrAON5dDPibqMEwDy6rj7LvW55DLJSkJfjpmbF3SZINivxwNoYFD1uD
 6YKsLAZN1ZWvafh8Khc770corgenSjVvQIhe8EIL2YyC9emO8opLvb7RbXBtWSEfBm
 LZWlMgGzRDY+5tXEvIy5kB8L/C8j1OL+Ea0CjogVWKn5/f/owi64OU5/OEc7VxLbvN
 4ZlxSaIUrlKQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=duering-andreas.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=duering-andreas.de header.i=@duering-andreas.de
 header.a=rsa-sha256 header.s=kas201911161523 header.b=fbGJHzLe
Subject: [Buildroot] Buildroot does not use ccache for compiling Linux
 kernel?
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
From: =?utf-8?q?Andreas_D=C3=BCring_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Andreas =?UTF-8?B?RMO8cmluZw==?= <brpi@duering-andreas.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I am currently experimenting with building a minimal image for my
Raspberry Pi.

During this process, I realized that ccache, although enabled, is not
used for compiling the Linux kernel. I think this is because of the
recipe in linux/linux.mk:

LINUX_MAKE_FLAGS = \
        HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \
        ARCH=$(KERNEL_ARCH) \
        INSTALL_MOD_PATH=$(TARGET_DIR) \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        WERROR=0 \
        REGENERATE_PARSERS=1 \
        DEPMOD=$(HOST_DIR)/sbin/depmod


The linux kernel seems to assemble the compiler using TARGET_CROSS,
e.g.
CC = $(TARGET_CROSS)gcc

As a very crude solution, I changed the corresponding line to
        CROSS_COMPILE="ccache $(TARGET_CROSS)"
but this is probably not the optimal solution. (I didn't carefully
check where else CROSS_COMPILE is used).

If this is a known limitation? Should this be added to the
documentation?
https://buildroot.org/downloads/manual/manual.html#ccache
("This will automatically build ccache and use it for every host and
target compilation.")

With best regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
