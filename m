Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F314C369D7
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 20:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9BAA81F47;
	Fri, 25 Apr 2025 20:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ok0D0ErPzTqp; Fri, 25 Apr 2025 20:18:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 099A481EB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 099A481EB3;
	Fri, 25 Apr 2025 20:18:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C2B1127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 20:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E29B80C4E
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 20:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ew7vMnkbKIQV for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 20:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4583781E77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4583781E77
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4583781E77
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 20:18:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2ECCF43423;
 Fri, 25 Apr 2025 20:18:26 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Apr 2025 22:18:14 +0200
Message-ID: <20250425201824.141234-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheefvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeivdfhveeitefgtefhgfeihfejveefffdthfdtvdffueeileduheefgeeugfenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745612306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=V/s0ET+VbyyKFn3n1GIHJhP/DV6qhzT6qi4UtLOfC9w=;
 b=pYwGRd09+daNzr6MaRCAdluuaTIWRssBlrUEpyC6mMFRfRGEvuYm+u7qQDB3JXM0aac/MS
 J4X+3thdMx8HVEJvRuV33BmZOyIRCygUuJMwFblp20ViYu2b0pgH2W6++zcJu5QvhRRhE1
 0v1VWgB3QHb0X0E6l9noQk7i5/HhrgQkCknb3yfpHmZHUf7rCjpLUNEkeNmXEzFvQz+tgz
 CVOXdNXCoIf0mRJK2NTj4Eevi/Plae5OrvbY4fx1wX0N8RfmdDZk7C6+Z37AlY0Ek7xe6o
 yipmvLETt9Jb5OH+E+ka+ntKgLGC7z25qa1AVOQnp167fuYJ+gICKsJTvAFxmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pYwGRd09
Subject: [Buildroot] [PATCH 0/7] Add support for building toolchains with
 GCC 15.x
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

Hello,

GCC 15.1.0 has been released earlier today, so it's about time for
Buildroot to support it!

This series goes through the usual dance, plus brings a few additional
cleanup commits, related to issues spotted while looking at the gcc
package code.

This was built tested by building:

 - A Buildroot config for AArch64, glibc, GCC 15.x
 - A Buildroot config for ARM, musl, GCC 15.x
 - A Buildroot config for x86-64, uclibc-ng, GCC 15.x

Thomas Petazzoni (7):
  toolchain/Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_15 blind option
  package/gcc: add support for GCC 15.x
  package/gcc: switch to GCC 14.x as the default
  package/gcc: drop support for GCC 12.x
  package/gcc: drop stale hash
  package/gcc: drop dead code related to BR2_GCC_SUPPORTS_LIBCILKRTS
  package/gcc: drop useless condition on BR2_GCC_ENABLE_GRAPHITE

 .checkpackageignore                           |   2 +-
 Config.in.legacy                              |   7 +
 ...ine-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch |  48 ------
 ...add-.note.GNU-stack-section-on-linux.patch | 105 -------------
 ...emove-crypt-and-crypt_r-interceptors.patch | 140 ------------------
 ...-along-with-_FILE_OFFSET_BITS-on-Lin.patch |  44 ------
 ...o-undef-_TIME_BITS-in-sanitizer_proc.patch |  53 -------
 ...le-split-stack-for-non-thread-builds.patch |   4 +-
 package/gcc/Config.in.host                    |  38 ++---
 package/gcc/gcc-final/gcc-final.mk            |  19 ---
 package/gcc/gcc.hash                          |   6 +-
 toolchain/Config.in                           |   5 +
 12 files changed, 31 insertions(+), 440 deletions(-)
 delete mode 100644 package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
 delete mode 100644 package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
 delete mode 100644 package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
 delete mode 100644 package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
 delete mode 100644 package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
 rename package/gcc/{12.4.0 => 15.1.0}/0001-disable-split-stack-for-non-thread-builds.patch (91%)

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
