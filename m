Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C268BCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BAF1611FB;
	Fri, 16 Oct 2026 13:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKgPkiQ-dnYW; Fri, 16 Oct 2026 13:12:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A9F1661210
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156337;
	b=XaHtJEwSzedlf5ggB7mP1kheZ4QM+yF2njI2Tqqxl4XYUWHBdFr5RZN812sNXLRxPZbq
	 N/n5186xWZl/0HsYlFG3jadRA4oWx9GWn7cSocvrC9raT2QyuiriAWxd8czHpLVTllr/K
	 7nZFPZv7L0CLuh+xYkLczNOx9N0LJXQCIsmmoz3Mts/a9sio5Hd9Xiju8ecEXwfT2/B8Q
	 qlruhI+6e94zRp8pZ/jyzwQMpbz1VnsuH6x+Ut/645gILfCa/fx4t71ZrhfikNgQltHtH
	 gAOI4VjF9DaKBx26zU73lZl4pewPLACb2sC55biEsovTj8AxgMzqTlyuM54cC77iIWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156337;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YQWiue1lbQpxlxTEdbz2LCuL8wGjDRDVzVAZT4Gdc8w=;
	b=QxOyVpQEXTFaX0Z2WIl6cSuylrQK9qbZveC4G0n0f9PdU3j1XjzTa0eUsuDKUeDoefj4
	 xP7uHUo6IhdgzO+HUQkx7X4c10AdEZ0RqIbAshHFfLFWu59Zv2XazeWQhdAeNMKTDpY+v
	 OX7Bu5Memt7fDafZ1cTXM4oas2FKfgvsSbV18KO20LrB+b3LvJJ8JHJqwVywjpQmxORhy
	 bVnSC/EzXYHjRKUEitz3SF0+pV4a6AqpXPS5PRjEMgMJ75fuzmkKv7toS081gGgE+ntKJ
	 +7mItTnZOVVwOcx1lcJnt8vCXu9c/YcxqiHzGQ/0JSpBhDz9Y2HjeZs0iCpLCi9f4vQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156337;
	bh=YQWiue1lbQpxlxTEdbz2LCuL8wGjDRDVzVAZT4Gdc8w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WkKYFwxUJB/JVBukt4KXLHNtlI7O/ExjOwswEOyWLk0erNJAX2g3vhx7o1mkI5YLh
	 /am3FBniiwhv369VcYGm/9qb58lj+xl1Z7ce1DN2b51mXy6Z3GZH721O4aM8m2h81w
	 2PH3X5lzp/czlzX8unh4DiOuR0xFz3OQLQWenNekHA1bv8ZZZauCtMHlJvH0zUXoEG
	 xjpWg4+J9GnuBVcUrqcjlHK73Af6pAE9UF4M7TIk3VbW6hw6D4EbY3V9u0LQYdd3s2
	 6yRKck82x7WkiAxMjzTV39depiXs1UK2nv8Ms9XfpWC8lqJZoGN2ym2w6VdlDJGd5P
	 j/auVV3gXjZHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9F1661210;
	Fri, 16 Oct 2026 13:12:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38A24920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A38F60EF9
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62q6V5H3poik for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 270F760F1B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=mcRhYL8sNvaBN3iEa/cRZous4ssgd77G7iVrAAE/nnczV3q/9ieY7Mf7T8HxWz9/k9cn
 3UrE+/2m1mWERjeuHiUbwcxjXuN5OpuwisJoRYkuZS9VMYIGot1Q1UPn+IG/dgLM2RUqQ
 yza+kpqi9nsVzB6ckirQjjpXQbw4KNBmwzguZZZxuJbtZV5ileq1lJYJFBMLl3VM66OKw
 bGgmPx6eco8+gdCn4FYib2rhO4RJRFbC8HolZTRJppNtW5UJS8KEi4lOXrSQ+5ztnmW1I
 mtiwg27n1CCudBO6wddiLF5NvTo0Hn0/0X2Fc4cPL/bgVARfw2nWIq/Ix0sNM+8DruQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eVwjBwQN0UjNoz2kL0dKYXWlxZkkLGDaOhtCq/xA3pA=;
 b=iwauxBXPhZIH3UxdgmEZOSZUbfDO4zbnTU6Zj9u+bLTWUSakFNmLys9ze9FttYEkPZVk
 YM5dfafrBY+F7m3wD/GqmSRIY+tUyUUm1CTQyX0TnEDJ/4pankSMBmYi8KUjY8EItrBet
 Bckcb/pwqxyzAomKXYR/qEcNyTagZOBbhRi45ye8EKWRCc/FEiMuIpmCxIE1jTpXSSst8
 KhpYHL3CH5c9DqMiEuzBV6CEbRXG8iKPWZfJJvyEP+KZHQySX58i6PowGaBI8/g4X8qkb
 UIgSStYiaC+XLDqbnKFA/zSrO2+wn3c1MfTxhZFJ2jG/1W9lqe7LwkENaKg+K+lkfZw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 270F760F1B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 172C9960D9; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:21:00 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6d90c8f535cfa383a9f1cd1354f5d89d564be18b
X-Git-Newrev: ce829cad92125cd1b6aed012e339da4035be5356
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.172C9960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/linux-tools:
 selftests: use KHDR_INCLUDES to locate the headers
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4090210135524519354=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4090210135524519354==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce829cad92125cd1b6aed012e339da4035be5356
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since v6.7 [1], the KHDR_DIR variable isn't used anymore by the kernel
selftest Makefiles to locate the kernel headers. Instead, KHDR_INCLUDES
is used to specify their location. It was only available between v6.5
and v6.7.

Keep KHDR_DIR for compatibility with v6.5 to v6.7 kernels, while
KHDR_INCLUDES is used by both pre 6.5 and post 6.7 kernels.

Let's pass it with the "-isystem" flag, as is done in the default values
used in the selftest makefiles.

[1]: 43e8832fed08 ("Revert "selftests: error out if kernel header files are not yet built"")

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 716a71553911e0c812c3eeca74974064844e79aa)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/linux-tools/linux-tool-selftests.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index db7e4fa1a3..032a71e320 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -24,7 +24,8 @@ SELFTESTS_DEPENDENCIES = \
 SELFTESTS_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
 	ARCH=$(SELFTESTS_ARCH) \
-	KHDR_DIR=$(LINUX_DIR)/usr/include
+	KHDR_DIR=$(LINUX_DIR)/usr/include \
+	KHDR_INCLUDES="-isystem $(LINUX_DIR)/usr/include"
 
 LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
 	/usr/lib/kselftests/tc-testing/

--===============4090210135524519354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4090210135524519354==--
