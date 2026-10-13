Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17473CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D06DD80CEA;
	Tue, 13 Oct 2026 08:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nnwq_ANK1kUI; Tue, 13 Oct 2026 08:14:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7279F80C9F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879282;
	b=HuaAJV1WekILOp/S0r1ivjVEztBI8j8JUD74fUfRLC1EHHeeAdcQ8YsE3sGPqx9WDgXW
	 6okS0ipkwJWkhcUbkGUUuHI2/A/z530Z0uBoaRk7x2vS4xRNku3dRQcn8sLy5lQzyfCMm
	 FwF2L6kiUjYH4T5zoDS1II7k7IiJaapDjtp8uPC4sKASC5PBC++o2S53PbbHZ5E6fFxE/
	 nTpn3FGjCxUV8wdJxVrA6ajMJRCWneQdZEn6JAsxjdm6liCJTIIbMiJRuDEObOVCZtI/2
	 zG30VMBrvzrx7N4PeNrL5O4ydNo0xdWhR59GwpatQEL74+LpleCUvGYWFp2bEYbVgdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f0zLCPbdvJWRUASTY2Is3LQ+aMq9dBRLs5gtwPnNgPY=;
	b=KNFsRUURrt2AAQvo3L5UjabzQTlsrx0Vm2YLumEg/KOIlthNyM6FcWo/anIf9I4D/aa5
	 2XI26Fgug/qG4gHE4p6NkYppjx7nEcI5qW2cV02CBirVeBBKSlW9WyljRLuIZT9sE5Omc
	 YRi042iTaoUu0uf2vGtOlFUWbLYRQwttYNTx8LgvuA2HUANgVHfKWAlkH3TK0mvG89M89
	 mEhrIsBiibjUS5m2lQhET20Zc+WStEQIierfyeS/AYUdvLiY8QaBtkPc+cVz92cHQiy9k
	 DJB1RZHKlbjVSg5rmmhwWU8n7aE+lLd8/ghVa5SnhBSwhZJbAw3JJN5kp4HFg5ffTww==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879282;
	bh=f0zLCPbdvJWRUASTY2Is3LQ+aMq9dBRLs5gtwPnNgPY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aNLUaeKxM4s0472bI+zfcYhzkTPTW80m1WqLJNKbRQ4EF5I8vwq9R44Eu8SIEe6qE
	 3kIngHatMAEagEEPCG2bJ+AxDZYAX83w8I6tIQOhXRNWLZ20j07raQ6wmHiNsMjOdd
	 PVHYbUyNV+hMOvjn6L4HdCNSCfmHkooYxHYEBejjbzcZqqyTo/Wx68lfRKikpCOrTD
	 O6CJnjva1d49OZ4HIcXXEIlccSZcw206qR4f2gChksSW8H/EB82mwOSu2c409lIgBa
	 dLezCjX4kryLKkxeJC2aBJuu5r4bcq5r1fX2lfKK2VkRfJ1okPn5FVt4s2SKBj8Xi+
	 lkL7P3WZOUKBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7279F80C9F;
	Tue, 13 Oct 2026 08:14:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AC0D1E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F1C340627
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pZtMYFtXNCc for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B97E04065B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879278;
 b=tOiy/+A4Q6kRl7jndy+09/meNQrHUHXSA0NBVZZ6bP7tpDk8VGhRB0D84pU9AfRFhiwb
 xz6cx27am0mb0yvNnTF480j/aAi/ud8EoH3Xr9+AU05XUfk7O927R5+Eq0Lyq9g7NGnXz
 0vHpnQWIkzLgtL8FDgyR1ARPc0kszGLueiQyztAacvCgu39tNYtHx4hbVFABQfG1T/A7c
 5sOvF1gkwbRiFJoZ+JTensoKVv1UQf7DxcV08Be8knfo/QZc45hQeaEqvPS374K3I32JJ
 EkTJSt/QvhJS0glCisFSUHMpum4zieklW0b5nFmWHuRziYjvA1ZbfFUeI2aYAMYRkmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879278;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UZiY8Rx/+WhigxqGwjomD/Bfc0oQKZBpMJnsdCepoD8=;
 b=sNMQ6xj8lYm0uLEeNPYy6F7UB1YCH2OMBYdxj3yBJe94wGavXie1ug/KWtTjYYnIsmn5
 MqJfNoYz/a1w/eky8XWJyH+dVYFo9S4ExDdwqTQZVDtIKP9KHI8GpdaO8ai3CQjzE9myg
 6aViFZnbDNUF4+t5TpBHsTScN4c72a/344a7kJZYYej9ZlUFsdV4THjKq3BGpxC2G5Ge0
 87jPv7vL4HYS5ENCQL5sW1y4ijZN9UlrJeAGgLdh4MUu6L3LGACq0Dj9QHOoze9H0ZhmH
 uVnkYEHXOTph7X7hVGGjQtcit+87QR+tGnrSSVlY1USnN7ysrrT7Wn+4JiCCS2G7plA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B97E04065B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:14:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1ADCF95484; Tue, 13 Oct 2026 08:13:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:13:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 107e7f54ae047cfed1aa844680f17cbc5e645f7e
X-Git-Newrev: 471feacb2d9c13190d635721208b9d31e995d04e
X-Patchwork-Hint: ignore
Message-Id: <20261013081319.1ADCF95484@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: add missing sys/auxv.h for
 static builds
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/471feacb2d9c13190d635721208b9d31e995d04e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

getauxval() works fine for static builds. This was already fixed
a while ago, see the commit message of the patch for more details.

Fixes:
 - https://autobuild.buildroot.net/results/f03/f03380ef48cea232e4958084eae419d5516f4ef4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nstall-sys-auxv.h-for-static-builds-again.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch b/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
new file mode 100644
index 0000000000..74d14b5501
--- /dev/null
+++ b/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
@@ -0,0 +1,57 @@
+From 6dc9f06a0330f11171f76f4b831724c02642f11f Mon Sep 17 00:00:00 2001
+From: ramin <lordrasmus@gmail.com>
+Date: Mon, 12 Oct 2026 16:30:56 +0200
+Subject: [PATCH] buildsys: install sys/auxv.h for static builds again
+
+getauxval() has not needed ld.so since 227b7c825 and 737a0edf4 ("Make
+getauxval work with static linking", "Support non-cached entries in
+getauxval", v1.0.52): _dl_auxvt and _dl_auxv_start are defined in
+libc/misc/elf/dl-support.c for the static libc, and __uClibc_main calls
+_dl_aux_init() on that path too.  The static libc.a carries getauxval,
+__getauxval, _dl_aux_init, _dl_auxvt and _dl_auxv_start.
+
+Its header is still withheld, though.  df81bd1e2 ("getauxval: remove
+header for static builds") put sys/auxv.h next to dlfcn.h in the
+HEADERS_RM line that applies when HAVE_SHARED is unset, as a way around
+the link error of the day -- a package that probed for getauxval would
+not find a declaration and would take its fallback path.  That error is
+gone and the workaround outlived it: a static sysroot installs 70 of the
+71 headers in include/sys, and the one missing is auxv.h.
+
+So a static configuration of, say, openssl fails with "sys/auxv.h: No
+such file or directory", which reads like a missing feature rather than
+a withheld declaration.
+
+Measured on riscv64 with a static configuration and gcc 10.5.0: with the
+header installed, a
+statically linked program answers AT_PAGESZ as 4096, matching
+sysconf(_SC_PAGESIZE), returns every entry of /proc/self/auxv unchanged,
+and reports ENOENT for a type that was not passed -- both for a type
+inside the cached range and for one above it, which takes the search
+over the whole vector.
+
+dlfcn.h and bits/dlfcn.h stay removed.
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/6dc9f06a0330f11171f76f4b831724c02642f11f
+Signed-off-by: Ramin Moussavi <lordrasmus@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 3b28fbf60..72865863d 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -257,7 +257,7 @@ HEADERS_RM- := \
+ ifeq ($(UCLIBC_STRICT_HEADERS),y)
+ HEADERS_RM- += sgtty.h
+ endif
+-HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h sys/auxv.h
++HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h
+ HEADERS_RM-$(PTHREADS_DEBUG_SUPPORT)         += thread_db.h
+ HEADERS_RM-$(UCLIBC_HAS_ARGP)                += argp.h
+ HEADERS_RM-$(UCLIBC_HAS_BSD_ERR)             += err.h
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
