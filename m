Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAF8CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB62C846B8;
	Fri, 29 May 2026 18:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4nEtRjhD1mw; Fri, 29 May 2026 18:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89392846B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780081129;
	bh=FsI20AjL98DHr12JKtUhKWUc/JpmHk8fwd6TCu39v0E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NRZVYGZfR+nGLxu/yZXqgQBlzI7IcD4Q9wYJ9wj/8OHjSQrgGC6M3zq7YszsU15YG
	 u/3JZBNQ3Edlh3h6Xvq/twMpIP01Q+WdCoERhO6gofHFDKbkD+sqc4U8BDBnPf465E
	 IJsU3LTmd+HuErvKAkDVuXzE5ZsPO9/2e4KJ+IwTKC2IEsxg3WxFxXHK8ZyMVfzh7V
	 26AK00fPI+d6Z7AUVZoZDpR8b/Pbq27DuMs4ip/xTyB0gOGnpHB94eFtiYGiUa1Ehu
	 6TZZvAsBb+QMH3K1/HKi9KgdCVRSDF1tbfBC4oqFHo7WSHkYQwI9cMhvxRWQoSzK2L
	 4qDMPSAeX8n3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89392846B0;
	Fri, 29 May 2026 18:58:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE6A7288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D8654223B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AE60Br1bqpO for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C17F140449
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C17F140449
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29D4387452; Fri, 29 May 2026 18:58:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:57:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: da278ba1dab7e29369879c8a29cbd1b42dbe9ce0
X-Git-Newrev: e5c7b43494c4d6aa57c6ef314bd4e636aacc14fc
X-Patchwork-Hint: ignore
Message-Id: <20260529185834.29D4387452@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/m68k: add 68000 nommu
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e5c7b43494c4d6aa57c6ef314bd4e636aacc14fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Everyone thinks they like ARM but secretly they want to run
Linux on their Megadrive[0].

Building a working toolchain/userland for nommu m68k is a bit
difficult because of the bitrotten tools all over the place and
one big issue is GCC generates code that uses unaligned
accesses that will cause an exception on 68000 machines if you
aren't careful.

Buildroot can easily create a working toolchain and userland
for nommu m68k so why not?

0 - This isn't a joke, I'm working on this. I have u-boot working
    on the Megadrive, Linux is already working on a bunch of 68000
    machines and I just need to get everything a little bit smaller
    to get into 4MB of RAM.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.m68k | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 235cafacf5..74a197934f 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -23,6 +23,11 @@ choice
 	help
 	  Specific CPU variant to use
 
+config BR2_m68k_68000
+	bool "68000"
+	select BR2_m68k_m68k
+	select BR2_SOFT_FLOAT
+
 config BR2_m68k_68030
 	bool "68030"
 	select BR2_m68k_m68k
@@ -41,6 +46,7 @@ config BR2_m68k_cf5208
 endchoice
 
 config BR2_GCC_TARGET_CPU
+	default "68000"		if BR2_m68k_68000
 	default "68030"		if BR2_m68k_68030
 	default "68040"		if BR2_m68k_68040
 	default "5208"		if BR2_m68k_cf5208
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
