Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5D7C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 719D1608E9;
	Wed, 14 Aug 2024 21:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjXXMdkNIgjw; Wed, 14 Aug 2024 21:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938D2608EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 938D2608EA;
	Wed, 14 Aug 2024 21:16:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7430D1BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6242E8106A
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQxZUoEO7eht for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:16:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD15281036
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD15281036
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD15281036
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:16:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EB32FF803;
 Wed, 14 Aug 2024 21:16:18 +0000 (UTC)
Date: Wed, 14 Aug 2024 23:16:17 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20240814231617.48c69688@windsurf>
In-Reply-To: <20240814204912.7116-2-zgyarmati@zgyarmati.de>
References: <20240814204912.7116-1-zgyarmati@zgyarmati.de>
 <20240814204912.7116-2-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723670178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Vuo7uY+Kpkz+bjwF9WcaXyclvZtppBoh7M63a7AvFc=;
 b=VJA3OlX818vZo5R6xPDuHv5ZXHP3ZF21gjutroh5gLwN+W4ktd0O2J775TFZVazGg+Qkmq
 /8VHjsh8lvoNQyqzJJgly/bOesGQvhcL9wzOUO/1k2i5cFFRvbduoHDD1uRPG/kqNWAXkn
 hG9bZ35eii8XcN6DA+HdG+OnU56CGJHyjJQvn47eIuoFyKiPn6TLcvfWQIvskpeMVwbz3+
 fObTSBsg17KVXwLtRkFfkIj25g3zoNC/YZ52KLDYVOWJlk94EUldjetqF7227ejRAAZ4Xg
 cW1ac0RAu8NzzLueQaL8Oe5ADg9h9vX7yRSaYJ9XYeDXLe2jxMlrqly2J0g5jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VJA3OlX8
Subject: Re: [Buildroot] [RFC 1/1] package/libusb: set dependency on
 BR2_ARC_ATOMIC_EXT
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Zoltan,

Alexey, Yuriy, there is a potentially ARC-specific issue below.

On Wed, 14 Aug 2024 22:49:11 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> diff --git a/package/libusb/Config.in b/package/libusb/Config.in
> index 5a04ac128b..637a0c7d4d 100644
> --- a/package/libusb/Config.in
> +++ b/package/libusb/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBUSB
>  	bool "libusb"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Thread_local
> +	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)

Thanks a lot for looking into this issue!

However, this is not the right fix. First, because other architecture
can be affected: sparcv8 most likely would suffer from the same issue.

Second because the proper solution is to ensure that libusb links
against libatomic, which contains the implementation of
__atomic_fetch_add_4 for architectures for which it is not a compiler
built-in.

There is already some provision for this in configure.ac:

        dnl Check for new-style atomic builtins. We first check without linking to -latomic.
        AC_MSG_CHECKING(whether __atomic_load_n is supported)
        AC_LINK_IFELSE([AC_LANG_SOURCE([[
        #include <stdint.h>
        int main() {
                struct {
                        uint64_t *v;
                } x;
                return (int)__atomic_load_n(x.v, __ATOMIC_ACQUIRE) &
                       (int)__atomic_add_fetch(x.v, (uint64_t)1, __ATOMIC_ACQ_REL);
        }]])], GCC_ATOMIC_BUILTINS_SUPPORTED=yes, GCC_ATOMIC_BUILTINS_SUPPORTED=no)
        AC_MSG_RESULT($GCC_ATOMIC_BUILTINS_SUPPORTED)
        if test "x$GCC_ATOMIC_BUILTINS_SUPPORTED" != xyes; then
                AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
        fi

But it doesn't seem to work in this case:

checking whether __atomic_load_n is supported... no
checking for library containing __atomic_fetch_add_4... no

The configure test fails like this:

configure:17559: /home/autobuild/autobuild/instance-13/output-1/per-package/libusb/host/bin/arc-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -latomic   >&5
conftest.c:33:6: warning: conflicting types for built-in function '__atomic_fetch_add_4'; expected 'unsigned int(volatile void *, unsigned int,  int)' [-Wbuiltin-declaration-mismatch]
   33 | char __atomic_fetch_add_4 ();
      |      ^~~~~~~~~~~~~~~~~~~~
/home/autobuild/autobuild/instance-13/output-1/per-package/libusb/host/bin/../lib/gcc/arc-buildroot-linux-uclibc/14.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-13/output-1/per-package/libusb/host/bin/../lib/gcc/arc-buildroot-linux-uclibc/14.2.0/../../../../arc-buildroot-linux-uclibc/lib/libatomic.so: undefined reference to `__atomic_test_and_set'
collect2: error: ld returned 1 exit status

This is rather odd. Is there a bug in ARC's libatomic implementation?
Alexey, Yuriy, what do you think?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
