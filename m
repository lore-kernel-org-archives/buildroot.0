Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21807CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8372A4083C;
	Sat, 10 Oct 2026 12:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQuaMER69so1; Sat, 10 Oct 2026 12:03:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8C6F44081A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791633806;
	b=rW1clNsP7ROAJvTPMK/kVVvlaaQ8jpjOH6IzwHtOOC/N+g/108SrXhXMHwc9UCUYEBp7
	 7iJMeW1R1TegC4/7U7J0At5FO25cFQJ3uE43R/GRMG3kFH/IAxqkFPfE8ETX6Mp/UASPb
	 EpTTUUuItUGomSchr1GjE2S5eonR56Zw+OHzU/q91A7S5TC3QykNvlHSTSq4HrOaNaxaN
	 mIvpBwTlPnorTIxgo75z1FNgvSOzKqcfX4Kh0n6RFL2UJ2/QsV78zUP319MW12glYHPCq
	 S97iY6QTOYpyE13/L0FP/vqjI05WdrT0HGliDDMocmR89Ro0FreWc3LS+hVTs8fB1aw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791633806;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3S0SlA0G6VVIQb+DKNpw85OivsQcaQhY5XaLDgqBFsA=;
	b=gxvbb57YugKa3ahf6Okj3KKblDE0ofUq6JxQoaK4mTuf1URWpXzTPqZ3BDEPhXIbTlYP
	 lz04wCXgOU/M2efJoOUQq2gA9EDydYaw/eB4cdQNFokq4BTNR1IOH3eAWbcfV2fv9FE1f
	 iUljiswH6J1fswaHoMQGyljQDecc1dk/ScQLP7HvHwconfsA5HglVlSU9TI71DUySjHlR
	 /QReQt0QYu0nf9oIeNm/fKwLgu3Z8/GmK0n5A7PmrW4ijFk+9CtSk0h0L92sb74P7vqLn
	 Irm0yHC47Vtr0AomRpjx1Ail4tK7dFIpCE5o20K5v6fYY2ZCjZrD0SNKcyDqiyXZ9hA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791633806;
	bh=3S0SlA0G6VVIQb+DKNpw85OivsQcaQhY5XaLDgqBFsA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ATMckOlM1G+hZvtGiupDdI6CLWpO/IFCa2oUBWVd17ydrJrgy0ZOx8PvbMAvXwh8u
	 SnLfb3PBDj7JsHDwu7PdG+KfTZqDo+Yqoy8BBjnZSFyo2vFAglk6evKHZSR5YofaiE
	 TfPY3zJWiQg54IwAub2hymW0dqC80p7SU9fH7nuahOn+5C/ZoI3PwEhBq2kTcFFuV0
	 ReioEncpwIJqnm2jhMQ/Uh0b4Qb9Z706Mkhsh66FH9G7dZ4nM03U23LhMxGOpIAYPd
	 ahAkN1TH7P3nq2jyKDLo7MqlKAVRN60q/aH6kPQvG2J75jtdQZrNpG2Jb8vVi3+M1n
	 gxDUqanid3K9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C6F44081A;
	Sat, 10 Oct 2026 12:03:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54E6F235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4693381283
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFPy7Hbh5cTz for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:03:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 318DD81271
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791633804;
 b=JMcR+hJhunQy7JIJmF4xF05qwSeWWl6UsQ3y8udUUzpK2AhTZcGV8S+eyig08JdNomwM
 NYoUa3zY+q71wVfwQZpv7p/mlQiMlan1o3JGyFdH+XIxspdGjCdUFNfLAcAZUGk0vIicz
 u7f3KEkBoRdxyNxvxbCyiF7j+agaP4tlmqF6Jpa749MocjvMymajVLXrZFfSogoQOCpZn
 ihUc8Wv3rX2yXl6dUlK+vflMzYxY6KjTe69J+ChnXz3r4bJy32fT0aSA2MGMoS5OPNUZr
 mGANahRrND5Mh3nb/7ZV+uIXum2GrHc2qkY5ukE2WIge+7b28OEpssIhzw6+h/2xxkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791633804;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=m7bk/oNHHZukjPZNIfMLSja7i3ZuSTOytmos2WCI/v0=;
 b=oUt4KKJqnIVrwOWt1nxBHwEjJBs8URqq7Dcq8eD/FWFMtt9fiux81bsOIUOf9NWceoq7
 Q9GpZf5mXCFnBOiLib709pUDgvsaDP/f5qMy4Tb8IB0dOEh7R3VVPFHBlIruvaWGlwRei
 NxYis7ENxvP5KLOkNYk82ozmqo5G2GcDm5vWhGfzgaGQNKPtTkD0reGJRrQtCiXKVh+RJ
 JnQu+/rm4K/T5jMYZKlqC2HWRRW9WoTKZmRk9N/fqqXRh5IZKmjzZccqPE8tCF88E0toS
 cneJD7FG76v2YEHUuoP/EcmPIXA5dbi8+J/bF1NbH0FD0zMlYBVgWSE7lYRgMA0MC3g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 318DD81271
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:03:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0C3C90BAC; Sat, 10 Oct 2026 12:02:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:03:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4648ea938b5be3c14134d051c785ed654908ce4
X-Git-Newrev: 77faecb13afa7255bb04a6260201fd535e88887c
X-Patchwork-Hint: ignore
Message-Id: <20261010120205.F0C3C90BAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: pass
 --no-print-directory
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/77faecb13afa7255bb04a6260201fd535e88887c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since commit 5fc10e76fa2a9 in linux v6.5-rc1, the kernel does a
recursive make call to add the --no-print-directory flag if it is not
set.

Buildroot sets MAKEOVERRIDES empty, which causes none of the
command-line overrides to be propagated to sub-makes. This only goes one
level deep, so it is not a problem. However, if the user sets
MAKEOVERRIDES in their environment, the environment _does_ get
propagated down to sub-makes. Therefore, the recursive call from within
the kernel will not get any of the command-line overrides we give it.
As a result, INSTALL_HDR_PATH will not get passed down to the kernel's
sub-make, thereby breaking the installation to staging.

Note that if Buildroot itself does a sub-make call (e.g. because O= is
set, or umask is different), --no-print-directory is already added so
the issue doesn't occur.

Set --no-print-directory explicitly, which avoids the kernel's sub-make
call, which preserves INSTALL_HDR_PATH. It is only really needed for the
staging install, since the local install in _CONFIGURE_CMDS just sets it
to the default value. For consistency though, set it there as well.

Setting --no-print-directory when it is not needed doesn't hurt.

Signed-off-by: Francesco Mancino <francesco.mancino@tutus.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/linux-headers/linux-headers.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 15724090ce..ed37410ea6 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -135,6 +135,7 @@ LINUX_HEADERS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
 define LINUX_HEADERS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
+			--no-print-directory \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
@@ -146,6 +147,7 @@ endef
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
+			--no-print-directory \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
